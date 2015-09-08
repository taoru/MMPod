
//
//  FileHelper.m
//  MangaBook
//
//  Created by Ryou Zhang on 7/17/12.
//  Copyright (c) 2012  All rights reserved.
//

#import "FileHelper.h"
#import "FileKit.h"
//#import "SignatureHelper.h"
//#import "../LibThirdparty/zip/Objective-Zip/FileInZipInfo.h"
//#import "../LibThirdparty/zip/Objective-Zip/ZipReadStream.h"

@implementation FileHelper
+ (NSString *)getTempDirectory {
    NSString *baseDir = [[FileKit getInstance] getAppDirectory:NSCachesDirectory];
    baseDir = [baseDir stringByAppendingPathComponent:@"temp"];
    if (NO == [[FileKit getInstance] isDirectoryExist:baseDir])
        [[FileKit getInstance] createDirectory:baseDir];
    return baseDir;
}

+ (NSString *)getTempPath:(NSString *)url {
    NSString *baseDir = [[FileKit getInstance] getAppDirectory:NSCachesDirectory];
    baseDir = [baseDir stringByAppendingPathComponent:@"temp"];
    if (NO == [[FileKit getInstance] isDirectoryExist:baseDir])
        [[FileKit getInstance] createDirectory:baseDir];
    
    return [NSString stringWithFormat:@"%@/%@",baseDir,url];
}

+ (NSString *)getCacheDirectory {
    NSString *baseDir = [[FileKit getInstance] getAppDirectory:NSCachesDirectory];
    baseDir = [baseDir stringByAppendingPathComponent:@"cache"];
    if (NO == [[FileKit getInstance] isDirectoryExist:baseDir])
        [[FileKit getInstance] createDirectory:baseDir];
    return baseDir;
}

+ (NSString *)getCachePath:(NSString *)url {
    NSString *baseDir = [[FileKit getInstance] getAppDirectory:NSCachesDirectory];
    baseDir = [baseDir stringByAppendingPathComponent:@"cache"];
    if (NO == [[FileKit getInstance] isDirectoryExist:baseDir])
        [[FileKit getInstance] createDirectory:baseDir];
    
    return [NSString stringWithFormat:@"%@/%@",baseDir,url];
}

+ (NSString *)getAppDataDirectory {
    NSString *baseDir = [[FileKit getInstance] getAppDirectory:NSLibraryDirectory];
    baseDir = [baseDir stringByAppendingPathComponent:@"data"];
    if (NO == [[FileKit getInstance] isDirectoryExist:baseDir]) {
        [[FileKit getInstance] createDirectory:baseDir];
        [[FileKit getInstance] disableFileBackup:baseDir];
    }
    return baseDir;
}

+ (NSString *)getAppLogDirectory {
    NSString *baseDir = [[FileKit getInstance] getAppDirectory:NSLibraryDirectory];
    baseDir = [baseDir stringByAppendingPathComponent:@"log"];
    if (NO == [[FileKit getInstance] isDirectoryExist:baseDir]) {
        [[FileKit getInstance] createDirectory:baseDir];
        [[FileKit getInstance] disableFileBackup:baseDir];
    }
    return baseDir;
}

+ (NSString *)getCoreDirectory:(id)coreVer {
    NSString *directory = [NSString stringWithFormat:@"core_%@",coreVer];
    NSString *path = [NSString stringWithFormat:@"%@/%@", [FileHelper getAppDataDirectory],directory];
    if (NO == [[FileKit getInstance] isDirectoryExist:path])
        [[FileKit getInstance] createDirectory:path];
    return path;
}

+ (NSString *)getCoreDirectory {
    NSString *directory = [NSString stringWithFormat:@"core_%@",
                           [NSUserDefaults tripObjectForKey:@"core"]];
    NSString *path = [NSString stringWithFormat:@"%@/%@", [FileHelper getAppDataDirectory],directory];
    if (NO == [[FileKit getInstance] isDirectoryExist:path])
        [[FileKit getInstance] createDirectory:path];
    return path;
}

+ (NSString *)getConfigFilePath {
    NSString *path = [NSString stringWithFormat:@"%@/config.zip", [FileHelper getCoreDirectory]];
    if (NO == [[FileKit getInstance] isFileExist:path]) {
        [NSUserDefaults tripSetObject:[NSNumber numberWithInt:0]
                               forKey:@"core"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        path = [NSString stringWithFormat:@"%@/config.zip", [FileHelper getCoreDirectory]];
        [[FileKit getInstance] copyItemFrom:[[NSBundle mainBundle] pathForResource:@"config" ofType:@"zip"]
                                         to:path];
    }
    return path;
}

+ (NSString *)getDatabasePath {
#if TRIPRELEASE || TRIPRELEASETEST || TRIPRELESASEPREPARE
    NSString *path = [NSString stringWithFormat:@"%@/alitrip.db", [FileHelper getAppDataDirectory]];
    if (NO == [[FileKit getInstance] isFileExist:path]) {
        [NSUserDefaults tripSetObject:[NSNumber numberWithInt:0]
                               forKey:@"data"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [[FileKit getInstance] copyItemFrom:[[NSBundle mainBundle] pathForResource:@"alitrip" ofType:@"db"]
                                         to:path];
    }
    return path;
#else
    NSString *path = [NSString stringWithFormat:@"%@/trip.db", [FileHelper getAppDataDirectory]];
    if (NO == [[FileKit getInstance] isFileExist:path]) {
        [NSUserDefaults tripSetObject:[NSNumber numberWithInt:0]
                               forKey:@"data"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [[FileKit getInstance] copyItemFrom:[[NSBundle mainBundle] pathForResource:@"trip" ofType:@"db"]
                                         to:path];
    }
    return path;
#endif
}

+ (NSString *)getAppResourceDirectory {
    NSString *path = [NSString stringWithFormat:@"%@/resource",[FileHelper getAppDataDirectory]];
    if (NO == [[FileKit getInstance] isDirectoryExist:path])
        [[FileKit getInstance] createDirectory:path];
    return path;
}

+ (NSString *)loadDataFromZip:(NSString *)zipPath FileName:(NSString *)fileName {
    if(![[NSFileManager defaultManager]fileExistsAtPath:zipPath])
        return  nil;
        
//    ZipFile *zip = [[ZipFile alloc] initWithFileName:zipPath mode:ZipFileModeUnzip];
//    [zip goToFirstFileInZip];
//    for(NSUInteger index=0; index<[zip numFilesInZip]; index++) {
//        FileInZipInfo *info = [zip getCurrentFileInZipInfo];
//        if ([[info name] isEqualToString:fileName])
//            break;
//        [zip goToNextFileInZip];
//    }
//    
//    NSMutableData *data = [NSMutableData new];
//    ZipReadStream *stream = [zip readCurrentFileInZipWithPassword:@"16ffcddaf14247ba931812977edd2d52"];
//    NSMutableData *buffer = [[NSMutableData alloc] initWithLength:1024];
//    while (YES) {
//        NSUInteger count = [stream readDataWithBuffer:buffer];
//        [data appendBytes:[buffer bytes]
//                   length:count];
//        if (count < 1024)
//            break;
//    }
//    SafeRelease(buffer);
//    [stream finishedReading];
//    [zip close];
//    SafeRelease(zip);
//    
//    NSString *result = [[NSString alloc] initWithData:data
//                                             encoding:NSUTF8StringEncoding];
//    SafeRelease(data);
    return SafeAutoRelease(fileName);
}


+ (BOOL)unzipFile:(NSString *)zipPath ToDirectory:(NSString *)directoryPath Password:(NSString*)password {
//    ZipFile *unzip = nil;
//    @try {
//        unzip = [[ZipFile alloc] initWithFileName:zipPath mode:ZipFileModeUnzip];
//    }
//    @catch (NSException *exception) {
//        SafeRelease(unzip);
//        return NO;
//    }
//    
    BOOL result = YES;
//    
//    [unzip goToFirstFileInZip];
//    
//    NSMutableData *buffer = [[NSMutableData alloc] initWithLength:1024];
//    for(NSUInteger index=0; index<[unzip numFilesInZip]; index++) {
//        FileInZipInfo *info = [unzip getCurrentFileInZipInfo];
//        NSString *path = [NSString stringWithFormat:@"%@/%@",directoryPath,info.name];
//        if (info.size == 0) {
//            [[FileKit getInstance] createDirectory:path];
//        } else {
//            if ([[FileKit getInstance] isFileExist:path])
//                [[FileKit getInstance] deleteFile:path];
//            
//            CFWriteStreamRef outstream = CFWriteStreamCreateWithFile(kCFAllocatorDefault, (CFURLRef)[NSURL fileURLWithPath:path]);
//            CFWriteStreamOpen(outstream);
//            
//            ZipReadStream *instream = nil;
//            if (password == nil || [password length] == 0) {
//                instream = [unzip readCurrentFileInZip];
//            } else {
//                instream = [unzip readCurrentFileInZipWithPassword:password];
//            }
//            while (YES) {
//                @try {
//                    NSInteger count = [instream readDataWithBuffer:buffer];
//                    if (count == 0)
//                        break;
//                    CFWriteStreamWrite(outstream, [buffer bytes], count);
//                }
//                @catch (NSException *exception) {
//                    result = NO;
//                    break;
//                }
//            }
//            [instream finishedReading];
//            
//            CFWriteStreamClose(outstream);
//            CFRelease(outstream);
//        }
//        
//        if (NO == result)
//            break;
//        [unzip goToNextFileInZip];
//    };
//    [unzip close];
//    SafeRelease(unzip);
    return result;
}

+ (BOOL)unzipFile:(NSString *)zipPath ToDirectory:(NSString *)directoryPath {
    return [FileHelper unzipFile:zipPath ToDirectory:directoryPath Password:nil];
}

//for resource file
+ (NSString*)smartGetResourceFilePath:(NSString*)fileName {
    //优先检查资源文件和core文件目录
    NSString *temp = [NSString stringWithFormat:@"%@/%@",
                      [FileHelper getAppResourceDirectory],
                      fileName];
    if ([[FileKit getInstance] isFileExist:temp]) {
        return temp;
    }
    
    NSString *filePath = [fileName lastPathComponent];
    if (filePath == nil) {
        filePath = fileName;
    }
    
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *fullPath = [resourcePath stringByAppendingPathComponent:filePath];
    if ([[FileKit getInstance] isFileExist:fullPath]) {
        return fullPath;
    }
    return nil;
}
@end

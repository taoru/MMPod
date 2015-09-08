//
//  FastCacheHelper.m
//  Trip2013
//
//  Created by Ryou Zhang on 12/15/13.
//  Copyright (c) 2013 alibaba. All rights reserved.
//

#import "FastCacheHelper.h"
#import "FileKit.h"
#import <objc/runtime.h>

@implementation FastCacheHelper
@synthesize cacheDir = _cacheDir;

static FastCacheHelper *_FastCacheHelper_Instance = nil;
+ (FastCacheHelper*)getInstance {
    @synchronized(self) {
        if (_FastCacheHelper_Instance == nil)
            _FastCacheHelper_Instance = [FastCacheHelper new];
        return _FastCacheHelper_Instance;
    }
}

- (id)init {
    self = [super init];
    if (self) {
        _cacheDic = [NSCache new];
        [_cacheDic setTotalCostLimit:1024 * 1024 * 16];
        [_cacheDic setDelegate:self];
    }
    return self;
}

- (id)getImageFormCacheBy:(NSString*)filePath {
    id target = [_cacheDic valueForKey:filePath];
    return target;
}

- (void)setImage:(id)image toCacheBy:(NSString *)filePath {
    if (image == nil) {
        return;
    }
    [_cacheDic setObject:image forKey:filePath cost:[image length]];
}

- (NSString *)getBundleRecourceFullPathWith:(NSString *)fileName {
    return [self generateSmartFilePathFrom:[[NSBundle mainBundle] bundlePath]
                                  fileName:fileName];
}

- (NSString *)generateSmartFileName:(NSString *)fileName {
    
    NSString *ext = [fileName pathExtension];
    if (ext == nil || [ext length] == 0) {
        return fileName;
    }
    fileName = [[fileName stringByDeletingPathExtension] lastPathComponent];
    NSString *targetFileName = nil;
    if(iPad) {
        if(isRetina) {
            targetFileName = [NSString stringWithFormat:@"%@@2x~ipad.%@",fileName,ext];
        } else {
            targetFileName = [NSString stringWithFormat:@"%@~ipad.%@",fileName, ext];
        }
    } 
    //for iPhone
    if (iPhone5) {
        targetFileName = [NSString stringWithFormat:@"%@-568h@2x.%@",fileName, ext];
    } else if (isRetina) {
        targetFileName = [NSString stringWithFormat:@"%@@2x.%@",fileName, ext];
    } else {
        targetFileName = [NSString stringWithFormat:@"%@.%@",fileName, ext];
    }
    return targetFileName;
}

- (NSString *)generateSmartFilePathFrom:(NSString *)baseDir fileName:(NSString *)fileName {
    NSString *ext = [fileName pathExtension];
    if([ext length] == 0)
        ext = nil;
    NSArray *files = [[FileKit getInstance] getFilesInDirectory:baseDir
                                                         byType:ext];
    NSMutableDictionary *temp = SafeAutoRelease([NSMutableDictionary new]);
    NSString *originName = [fileName stringByDeletingPathExtension];
    for (NSString *file in files) {
        if (iPad) {
            if (isRetina) {
                if ([file hasPrefix:[NSString stringWithFormat:@"%@@2x~ipad", originName]]) {
                    [temp setObject:file forKey:@"ipad@2x"];
                    continue;
                }
            }
            if ([file hasPrefix:[NSString stringWithFormat:@"%@~ipad", originName]]) {
                [temp setObject:file forKey:@"ipad@1x"];
                continue;
            }
        }
        if (iPhone5) {
            if ([file hasPrefix:[NSString stringWithFormat:@"%@-568h@2x", originName]]) {
                [temp setObject:file forKey:@"568h@2x"];
                continue;
            }
        }
        if ([file hasPrefix:[NSString stringWithFormat:@"%@@2x", originName]]) {
            [temp setObject:file forKey:@"@2x"];
            continue;
        }
        if ([file hasPrefix:originName]) {
            [temp setObject:file forKey:@"@1x"];
            continue;
        }
    }
    
    if (iPad) {
        if (isRetina) {
            if ([temp objectForKey:@"ipad@2x"]) {
                return [NSString stringWithFormat:@"%@/%@",
                        baseDir,
                        [temp objectForKey:@"ipad@2x"]];
            }
        } else {
            if ([temp objectForKey:@"ipad@1x"]) {
                return [NSString stringWithFormat:@"%@/%@",
                        baseDir,
                        [temp objectForKey:@"ipad@1x"]];
            }
        }
    }
    if (iPhone5) {
        if ([temp objectForKey:@"568h@2x"]) {
            return [NSString stringWithFormat:@"%@/%@",
                    baseDir,
                    [temp objectForKey:@"568h@2x"]];
        }
    }
    if ([temp objectForKey:@"@2x"]) {
        return [NSString stringWithFormat:@"%@/%@",
                baseDir,
                [temp objectForKey:@"@2x"]];
    }
    if ([temp objectForKey:@"@1x"]) {
        return [NSString stringWithFormat:@"%@/%@",
                baseDir,
                [temp objectForKey:@"@1x"]];
    }
    return nil;
}

- (NSString *)generateSmartLocalFilePath:(NSString *)filePath {
    return [self generateSmartFilePathFrom:[filePath stringByDeletingLastPathComponent]
                                  fileName:[filePath lastPathComponent]];
}

- (void)cache:(NSCache *)cache willEvictObject:(id)obj {
    //do nothing
}

- (BaseRender *)getRenderWithFileName:(NSString *)fileName {
    
    NSString *ext = [fileName pathExtension];
    if ([ext isEqualToString:@"webp"]) {
        return SafeAutoRelease([NSClassFromString(@"WebpRender") new]);
    } else if([fileName hasSuffix:[NSString stringWithFormat:@".9.%@",ext]]) {
        return SafeAutoRelease([NSClassFromString(@"NinePathRender") new]);
    } else {
        return SafeAutoRelease([NSClassFromString(@"BaseRender") new]);
    }
}

- (void)dealloc {
    SafeRelease(_cacheDic);
    SafeSuperDealloc(super);
}
@end

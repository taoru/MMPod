//
//  FileHelper.h
//  MangaBook
//
//  Created by Ryou Zhang on 7/17/12.
//  Copyright (c) 2012  All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileHelper : NSObject
+ (NSString *)getTempDirectory;
+ (NSString *)getTempPath:(NSString *)url;

+ (NSString *)getCacheDirectory;
+ (NSString *)getCachePath:(NSString *)url;

+ (NSString *)getAppDataDirectory;

+ (NSString *)getAppLogDirectory;

//for zip
+ (NSString *)loadDataFromZip:(NSString *)zipPath FileName:(NSString *)fileName;

+ (BOOL)unzipFile:(NSString *)zipPath ToDirectory:(NSString *)directoryPath;

+ (BOOL)unzipFile:(NSString *)zipPath ToDirectory:(NSString *)directoryPath Password:(NSString*)password;

+ (NSString *)getConfigFilePath;

+ (NSString *)getCoreDirectory;

+ (NSString *)getCoreDirectory:(id)coreVer;

//for database
+ (NSString *)getDatabasePath;

+ (NSString *)getAppResourceDirectory;

//for file
+ (NSString*)smartGetResourceFilePath:(NSString*)fileName;
@end

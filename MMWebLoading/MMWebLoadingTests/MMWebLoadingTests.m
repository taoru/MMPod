//
//  MMWebLoadingTests.m
//  MMWebLoadingTests
//
//  Created by Alan on 15/8/8.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface MMWebLoadingTests : XCTestCase

@end

@implementation MMWebLoadingTests
- (void)testStrings {
    
//    NSString *string1= @"a string";
//    
//    GHTestLog(@"I can log to the GHUnit test console: %@",string1);
//    
//    // Assert string1is not NULL, with no custom error description
//    
//    GHAssertNotNULL(string1, nil);
//    
//    // Assert equalobjects, add custom error description
//    
//    NSString *string2= @"a string";
//    
//    GHAssertEqualObjects(string1,string2, @"A custom error message. string1 should be equal to: %@.",string2);
//    
}
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

//
//  CustomButton.h
//  MMWebLoading
//
//  Created by iMac on 15/9/2.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ActionBlock)();
@interface CustomButton : UIButton{
   ActionBlock _actionBlock;
}


@end

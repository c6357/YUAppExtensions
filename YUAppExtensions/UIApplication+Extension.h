//
//  UIApplication+Extension.h
//  YUAppExtensions
//
//  Created by yuzhx on 15/4/26.
//  Copyright (c) 2015年 BruceYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Extension)

+(BOOL) isAppExtension;

+ (UIApplication *)yu_sharedApplication;

@end

//
//  UIApplication+Extension.m
//  YUAppExtensions
//
//  Created by yuzhx on 15/4/26.
//  Copyright (c) 2015年 BruceYu. All rights reserved.
//

#import "UIApplication+Extension.h"
#import <objc/runtime.h>

@implementation UIApplication (Extension)

+(BOOL) isAppExtension
{
    return [[[NSBundle mainBundle] executablePath] containsString:@".appex/"];
    //或者使用下面的方法
    return [[[NSBundle mainBundle] bundlePath] hasSuffix:@".appex"];
}


+ (void)load
{
    // When you build an extension based on an Xcode template, you get an extension bundle that ends in .appex.
    // https://developer.apple.com/library/ios/documentation/General/Conceptual/ExtensibilityPG/ExtensionCreation.html
    if (![[[NSBundle mainBundle] bundlePath] hasSuffix:@".appex"]) {
        Method sharedApplicationMethod = class_getClassMethod([UIApplication class], @selector(sharedApplication));
        if (sharedApplicationMethod != NULL) {
            IMP sharedApplicationMethodImplementation = method_getImplementation(sharedApplicationMethod);
            Method rsk_sharedApplicationMethod = class_getClassMethod([UIApplication class], @selector(rsk_sharedApplication));
            method_setImplementation(yu_sharedApplication, sharedApplicationMethodImplementation);
        }
    }
}

+ (UIApplication *)yu_sharedApplication
{
    return nil;
}



@end

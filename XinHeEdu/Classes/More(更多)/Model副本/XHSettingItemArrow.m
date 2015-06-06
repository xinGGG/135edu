//
//  XHSettingItemArrow.m
//  XinHeEdu
//
//  Created by xing on 15/6/4.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "XHSettingItemArrow.h"

@implementation XHSettingItemArrow
+ (instancetype)settingArrowWithTitle:(NSString *)title withIcon:(NSString *)icon desVc:(Class)desVC{
    XHSettingItemArrow *item = [self settingItemWithTitle:title withIcon:icon ];
    item.desVC = desVC;
    return item;
}
+ (instancetype)settingArrowWithTitle:(NSString *)title desVc:(Class)desVC{
    return  [self settingArrowWithTitle:title withIcon:nil desVc:desVC];
}

+ (instancetype)settingArrowWithTitle:(NSString *)title{
    XHSettingItemArrow *item = [self settingArrowWithTitle:title desVc:nil];
    return item;
}
@end

//
//  XHSettingItem.m
//  XinHeEdu
//
//  Created by xing on 15/6/4.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "XHSettingItem.h"

@implementation XHSettingItem
+ (instancetype)settingItemWithTitle:(NSString *)title withIcon:(NSString *)icon{
    XHSettingItem *item =[[self alloc]init];
    item.title = title;
    item.icon = icon;
    return item;
}
+ (instancetype)settingItemWithTitle:(NSString *)title withSubText:(NSString *)subText{
    XHSettingItem *item = [self settingItemWithTitle:title withIcon:nil];
    item.subText =subText;
    return item;
}
+ (instancetype)settingItemWithTitle:(NSString *)title{
    return  [self settingItemWithTitle:title withIcon:nil];;
}
@end

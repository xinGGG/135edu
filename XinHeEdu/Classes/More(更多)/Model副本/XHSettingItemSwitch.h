//
//  XHSettingItemSwitch.h
//  XinHeEdu
//
//  Created by xing on 15/6/4.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XHSettingItem.h"

@interface XHSettingItemSwitch : XHSettingItem
@property (nonatomic,assign)BOOL on;
+ (instancetype)settingSwicthWithTitle:(NSString *)title withSubText:(NSString *)subText;
@end

//
//  XHSettingItemArrow.h
//  XinHeEdu
//
//  Created by xing on 15/6/4.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XHSettingItem.h"

@interface XHSettingItemArrow : XHSettingItem
@property (nonatomic,assign)  Class desVC;

+ (instancetype)settingArrowWithTitle:(NSString *)title withIcon:(NSString *)icon desVc:(Class)desVC;
+ (instancetype)settingArrowWithTitle:(NSString *)title desVc:(Class)desVC;
+ (instancetype)settingArrowWithTitle:(NSString *)title;
@end

//
//  XHSettingItem.h
//  XinHeEdu
//
//  Created by xing on 15/6/4.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^operationBlock)();

@interface XHSettingItem : NSObject

@property(nonatomic,copy)operationBlock operationBlock;
//标题
@property (nonatomic,strong)NSString *title;
//图片
@property(nonatomic,strong)NSString *icon;
@property (nonatomic,strong)NSString *subText;

+ (instancetype)settingItemWithTitle:(NSString *)title withIcon:(NSString *)icon;
+ (instancetype)settingItemWithTitle:(NSString *)title withSubText:(NSString *)subText;
+ (instancetype)settingItemWithTitle:(NSString *)title ;

@end

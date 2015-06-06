//
//  XHMine.h
//  XinHeEdu
//
//  Created by xing on 15/6/5.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum  {
    sexOfMale,
    sexOfFamle
}sexType;

@interface XHMine : NSObject
///名字
@property (nonatomic,copy)NSString *name;
///身份
@property (nonatomic,copy)NSString *identity;
///头像
@property (nonatomic,copy)NSString *icon;
///地区
@property (nonatomic,copy)NSString *city;
///性别
@property (nonatomic,assign)sexType sex;

- (instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)mineWithDict:(NSDictionary *)dict;
+ (instancetype)mineWithName:(NSString *)name Identity:(NSString *)identity icon:(NSString *)icon city:(NSString *)city sex:(sexType)sex;
@end

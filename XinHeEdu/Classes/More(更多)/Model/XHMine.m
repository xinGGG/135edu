//
//  XHMine.m
//  XinHeEdu
//
//  Created by xing on 15/6/5.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "XHMine.h"

@implementation XHMine
- (instancetype)initWithDict:(NSDictionary *)dict{

    if (self  = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)mineWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];

}

+ (instancetype)mineWithName:(NSString *)name Identity:(NSString *)identity icon:(NSString *)icon city:(NSString *)city sex:(sexType)sex{
    XHMine *mine = [[ XHMine  alloc]init];
    mine.name = name;
    mine.identity = identity;
    mine.icon = icon;
    mine.city = city;
    mine.sex = sex;
    return mine;
}
@end

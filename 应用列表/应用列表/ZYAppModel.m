//
//  ZYAppModel.m
//  应用列表
//
//  Created by 章芝源 on 15/12/19.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ZYAppModel.h"

@implementation ZYAppModel

- (instancetype)appWithDict:(NSDictionary *)Dict
{
    [self setValuesForKeysWithDictionary:Dict];
    return self;
}

+ (instancetype)appWithDict:(NSDictionary *)Dict
{
    return [[[ZYAppModel alloc] init] appWithDict:Dict];
}
@end

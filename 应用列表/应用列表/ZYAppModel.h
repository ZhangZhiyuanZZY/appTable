//
//  ZYAppModel.h
//  应用列表
//
//  Created by 章芝源 on 15/12/19.
//  Copyright © 2015年 ZZY. All rights reserved.
//

//app模型
#import <Foundation/Foundation.h>

@interface ZYAppModel : NSObject
///app图片
@property(copy, nonatomic)NSString *icon;
///app名字
@property(copy, nonatomic)NSString *name;
//字典转模型
+ (instancetype)appWithDict:(NSDictionary *)Dict;
- (instancetype)appWithDict:(NSDictionary *)Dict;
@end

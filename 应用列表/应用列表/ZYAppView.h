//
//  ZYAppView.h
//  应用列表
//
//  Created by 章芝源 on 15/12/20.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZYAppModel;
@interface ZYAppView : UIView
@property(nonatomic, strong)ZYAppModel *appModel;

//创建app
+ (instancetype)creatAppView:(ZYAppModel *)app;
@end

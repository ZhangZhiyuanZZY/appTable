//
//  ViewController.m
//  应用列表
//
//  Created by 章芝源 on 15/12/19.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ViewController.h"
#import "ZYAppModel.h"
#import "ZYAppView.h"
@interface ViewController ()
@property(nonatomic, strong)NSArray *apps;
@end
@implementation ViewController

#pragma mark - 懒加载
//拿到模型
- (NSArray *)apps
{
    if (_apps == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            ZYAppModel *app = [ZYAppModel appWithDict:dict];
            [arrayM addObject:app];
        }
        _apps = arrayM;
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置UI布局
    [self setupApp];
}

- (void)setupApp
{
    CGFloat appW = 75;
    CGFloat appH = 90;
    //距离顶部距离
    CGFloat marginTop = 30;
    //每行app的个数
    CGFloat appCount = 3;
    //app之间的水平间距
    CGFloat marginX = (self.view.bounds.size.width - appCount * appW) / (appCount + 1);
    //app之间的垂直间距
    CGFloat marginY = marginX;
    
    //计算每一个app的位置
    for (int i = 0; i < self.apps.count; i++ ) {
        //计算列
        NSInteger col = i % 3;
        //计算行
        NSInteger row = i / 3;
        CGFloat appX = marginX + appW * col + marginX * col;
        CGFloat appY = marginTop + appH * row + marginY * row;
        
//        //app的frame
        ZYAppView *appView = [ZYAppView creatAppView:self.apps[i]];
        appView.frame = CGRectMake(appX, appY, appW, appH);

        [self.view addSubview:appView];
      
    }

 
}

@end

//
//  ZYAppView.m
//  应用列表
//
//  Created by 章芝源 on 15/12/20.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ZYAppView.h"
#import "ZYAppModel.h"
@interface ZYAppView()
//app图像
@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;
//app名字
@property (weak, nonatomic) IBOutlet UIButton *appName;
@property (weak, nonatomic) IBOutlet UIButton *DownLoadBtn;
@end
@implementation ZYAppView

- (void)setAppModel:(ZYAppModel *)appModel
{
    _appModel = appModel;
    self.iconImgView.image = [UIImage imageNamed:self.appModel.icon];
    [self.appName setTitle:self.appModel.name forState:UIControlStateNormal];
    [self.appName setTitle:self.appModel.name forState:UIControlStateDisabled];
    [self.iconImgView setBackgroundColor:[UIColor redColor]];
    
}
- (void)awakeFromNib
{
    NSLog(@"awakeFromNib");
    
}

+ (instancetype)creatAppView:(ZYAppModel *)app
{
    ZYAppView *appView = [[NSBundle mainBundle] loadNibNamed:@"ZYAppView" owner:nil options:nil].firstObject;
    appView.appModel = app;
    return appView;
}

//点击下载
- (IBAction)clickDownLoad:(UIButton *)sender {
    
   
    //显示提示框
    UILabel *msgLbl = [[UILabel alloc]init];
    
    
    msgLbl.text = @"下载完成";
    msgLbl.alpha = 0;
    CGFloat msgH = 25;
    CGFloat msghW = 200;
    CGFloat msgX = (self.superview.bounds.size.width - msghW) * 0.5;
    CGFloat msgY = (self.superview.bounds.size.height - msgH) * 0.5;
    msgLbl.backgroundColor = [UIColor grayColor];
    msgLbl.textAlignment = NSTextAlignmentCenter;
    msgLbl.textColor = [UIColor redColor];
    msgLbl.frame = CGRectMake(msgX, msgY, msghW, msgH);
    [self.superview addSubview:msgLbl];
    //设置圆角
    msgLbl.layer.cornerRadius = 15;
    msgLbl.clipsToBounds = YES;
    [UIView animateWithDuration:2.0 animations:^{
        msgLbl.alpha = 1.0;
    } completion:^(BOOL finished) {
       [UIView animateWithDuration:2.0 animations:^{
           msgLbl.alpha = 0;
       } completion:^(BOOL finished) {
           [msgLbl removeFromSuperview];
           sender.enabled = NO;
       }];
    }];
}





//- (instancetype)initWithCoder:(NSCoder *)coder
//{
//    if (self = [super initWithCoder:coder]) {
//        self = [[[NSBundle mainBundle]loadNibNamed:@"ZYAppView" owner:nil options:nil]firstObject];
//        self.iconImgView.image = [UIImage imageNamed:@""];
//    }
//    return self;
//}

//
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    if (self = [super initWithFrame:frame]) {
//        
//    }
//    return self;
//}
@end

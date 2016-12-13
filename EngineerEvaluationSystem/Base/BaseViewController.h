//
//  BaseViewController.h
//  SohuByObject_C
//
//  Created by lixu on 16/11/8.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

//状态栏，导航栏，标签栏，高度
@property (nonatomic,assign) CGFloat statusHeight;
@property (nonatomic,assign) CGFloat navHeight;
@property (nonatomic,assign) CGFloat tabBarHeight;

//屏幕高度，宽度
@property (nonatomic,assign) CGFloat screenHeight;
@property (nonatomic,assign) CGFloat screenWidth;

//是否显示帮助中心按钮
@property (nonatomic ,setter=isDisplayHelpCenter:,assign) BOOL displayHelpCenter;

-(void)addNavTitle:(NSString *)title;

//导航按钮
-(UIButton *)addNavBtn:(NSString *)imageName target:(id)target action:(SEL)action isLeft:(BOOL)isLeft;
-(void)addBackBtn:(NSString *)imageName target:(id)target action:(SEL)action;
@end

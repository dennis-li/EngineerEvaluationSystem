//
//  BaseViewController.m
//  SohuByObject_C
//
//  Created by lixu on 16/11/8.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import "BaseViewController.h"
#import "MyUtil.h"
#import "AppDelegate.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //获取当前状态栏的高度
    self.statusHeight = [[UIApplication sharedApplication]statusBarFrame].size.height;
    //获取导航栏的高度
    self.navHeight = self.navigationController.navigationBar.frame.size.height;
    //标签栏高度
    self.tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    self.screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.screenHeight = [UIScreen mainScreen].bounds.size.height;
    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:250/255.0 green:0 blue:150/255.0 alpha:1.0];
    
}

//是否显示帮助中心按钮
- (void)isDisplayHelpCenter:(BOOL)displayHelpCenter
{
    if (displayHelpCenter) {
        [self addNavBtn:@"document" target:self action:@selector(helpDetail) isLeft:NO];
    }
    _displayHelpCenter = displayHelpCenter;
}

//帮助中心
- (void)helpDetail
{
    NSString *alertTitle = NSLocalizedString(@"帮组中心", @"Basic Alert Style");
    NSString *alertMessage = NSLocalizedString(@"请专家依次对每组中各项指标的重要性进行比较，依据比较结果在相应空白框内填入数字1-9(1表示该指标在本组中重要性最低，9表示在本组中重要性最高)", @"Basic Alert With Buttons");
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle
                                                                             message:alertMessage
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", @"Cancel action")
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel action");
                                   }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"确定", @"OK action")
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action)
                               {
                                   NSLog(@"OK action");
                               }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

//添加标题
-(void)addNavTitle:(NSString *)title
{
    UILabel *label = [MyUtil createLabelFrame:CGRectMake(_screenWidth/3, 0, _screenWidth/3, self.navHeight) title:title];//label占屏幕宽度1/3
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:self.navHeight/2];
    label.textColor = [UIColor grayColor];
    self.navigationItem.titleView = label;
}

//添加导航按钮
-(UIButton *)addNavBtn:(NSString *)imageName target:(id)target action:(SEL)action isLeft:(BOOL)isLeft
{
    UIButton *btn = [MyUtil createBtnFrame:CGRectMake(0, 8, 30, 28) type:UIButtonTypeCustom bgImageName:imageName title:nil target:target action:action];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    if (isLeft) {
        self.navigationItem.leftBarButtonItem = item;
    } else {
        self.navigationItem.rightBarButtonItem = item;
    }
    return btn;
}

//添加返回按钮
-(void)addBackBtn:(NSString *)imageName target:(id)target action:(SEL)action
{
    [self addNavBtn:imageName target:target action:action isLeft:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

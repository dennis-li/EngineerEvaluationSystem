//
//  LoginViewController.m
//  Future
//
//  Created by lixu on 16/11/16.
//  Copyright © 2016年 lixu. All rights reserved.
//
#import "LoginViewController.h"
#import "AppDelegate.h"


@interface LoginViewController ()<UIGestureRecognizerDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //    [self createBackButton];
    
    //点击隐藏键盘
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    tap.delegate = self;
    
    //设置密码显示格式
    self.passwordTF.secureTextEntry = YES;
    
}



//隐藏键盘
-(void)dismissKeyboard {
    [self.view endEditing:YES];
    [self.passwordTF resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//登录
- (IBAction)Login:(id)sender
{
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [app changeRootCtroller:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    if ([segue.identifier isEqualToString:@"Analyze Text"]) {
//        if ([segue.destinationViewController isKindOfClass:[RegisterViewController class]]) {
//            RegisterViewController *tsvc = (RegisterViewController *)segue.destinationViewController;
//        }
//    }
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

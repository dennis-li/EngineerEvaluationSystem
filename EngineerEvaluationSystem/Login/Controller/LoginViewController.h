//
//  LoginViewController.h
//  Future
//
//  Created by lixu on 16/11/16.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController

//用户名
@property (strong, nonatomic) IBOutlet UITextField *usernameTF;

//密码
@property (strong, nonatomic) IBOutlet UITextField *passwordTF;

//登录按钮
@property (strong, nonatomic) IBOutlet UIButton *loginBtn;

- (IBAction)Login:(id)sender;



@end

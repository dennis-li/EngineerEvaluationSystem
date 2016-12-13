//
//  DirectoryC_VCTL.m
//  EngineerEvaluationSystem
//
//  Created by lixu on 16/12/3.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import "DirectoryC_VCTL.h"
#import "EvaluateViewController.h"

@interface DirectoryC_VCTL ()<UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic ,copy) NSArray *titleArray;

@property (nonatomic ,copy) NSArray *detailTitleArray;

@property (nonatomic ,strong) UITableView *tableView;

@end

@implementation DirectoryC_VCTL

- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"决策的科学",@"决策结果合理性",@"战略目标实现程度"];
    }
    return _titleArray;
}

- (NSArray *)detailTitleArray
{
    if (!_detailTitleArray) {
        _detailTitleArray = @[@"完成",@"未完成",@"完成"];
    }
    return _detailTitleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 8, 30, 28)];
//    btn.titleLabel.text = @"下一步";
//    [btn addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
//    self.navigationItem.rightBarButtonItem = item;
    [self createTableView];
}

- (void)nextStep
{
    
}

-(void)createTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UITableView *tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.statusHeight+self.navHeight, self.screenWidth, self.screenHeight-self.statusHeight-self.navHeight) style:UITableViewStylePlain];
    tbView.delegate = self;
    tbView.dataSource = self;
    self.tableView = tbView;
    [self.view addSubview:tbView];
}

#pragma mark - UITableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.imageView.image = [UIImage imageNamed:@"exam"];
    cell.textLabel.text = self.titleArray[indexPath.row];
    cell.detailTextLabel.text = self.detailTitleArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *alertTitle = NSLocalizedString(cell.textLabel.text, @"Text Input Alert");
    NSString *alertMessage = NSLocalizedString(@"请专家依次对每组中各项指标的重要性进行比较，依据比较结果在相应空白框内填入数字1-9(1表示该指标在本组中重要性最低，9表示在本组中重要性最高)", @"Plain and secure text input");
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle
                                                                             message:alertMessage
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"请专家打分", @"Login");
         [textField addTarget:self
                       action:@selector(alertTextFieldDidChange:)
             forControlEvents:UIControlEventEditingChanged];
     }];
    
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", @"Cancel action")
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel action");
                                   }];
    
    __weak typeof(self) weakSelf = self;
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"确定", @"OK action")
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action)
                               {
                                  
                               }];
    
    okAction.enabled = NO;
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

//检查输入是否符合要求
- (void)alertTextFieldDidChange:(UITextField *)sender
{
    UIAlertController *alertController = (UIAlertController *)self.presentedViewController;
    if (alertController)
    {
        UITextField *login = alertController.textFields.firstObject;
        UIAlertAction *okAction = alertController.actions.lastObject;
        NSString *inputString = @"123456789";
        inputString = [login.text stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
        BOOL isEnabled = inputString.length == 0 && login.text.length == 1;
        okAction.enabled = isEnabled;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EvaluateViewController *nextVCTL = segue.destinationViewController;
    nextVCTL.title = self.title;
}

@end

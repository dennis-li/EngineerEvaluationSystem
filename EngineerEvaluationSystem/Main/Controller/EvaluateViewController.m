//
//  EvaluateViewController.m
//  EngineerEvaluationSystem
//
//  Created by lixu on 16/12/3.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import "EvaluateViewController.h"
#import "EvaluateTableViewCell.h"

@interface EvaluateViewController ()<UITableViewDelegate ,UITableViewDataSource,EvaluateTableViewCellDelegate>

@property (nonatomic ,copy) NSArray *titleArray;

@property (nonatomic ,copy) NSArray *scoreIndicatorArray;

@property (nonatomic ,strong) UITableView *tableView;

@end

@implementation EvaluateViewController

- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"决策过程合规性",@"决策的科学性",@"决策结果合理性"];
    }
    return _titleArray;
}

- (NSArray *)scoreIndicatorArray
{
    if (!_scoreIndicatorArray) {
        _scoreIndicatorArray = @[@"1.地址选择是否合理,征地是否能够顺利开展2.环境方面是否能落实环评要求3.电力市场是否稳定,是否存在电网需求",@"1.地址选择是否合理,征地是否能够顺利开展2.环境方面是否能落实环评要求3.电力市场是否稳定,是否存在电网需求",@"1.地址选择是否合理,征地是否能够顺利开展2.环境方面是否能落实环评要求3.电力市场是否稳定,是否存在电网需求"];
    }
    return _scoreIndicatorArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createTableView];
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"EvaluateCellId";
    
    EvaluateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"EvaluateTableViewCell" owner:nil options:nil] firstObject];
    }
    [cell cellConfigWithTitle:self.titleArray[indexPath.row] index:indexPath.row];
    cell.delegate = self;
    
    //取消cell选中效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - EvaluateTableViewCellDelegate
//点击cell的打分依据，在主界面显示打分的详情
- (void)displayScoreIndicatorAtIndex:(NSInteger)index
{
    NSString *alertTitle = NSLocalizedString(self.titleArray[index], @"Basic Alert Style");
    NSString *alertMessage = NSLocalizedString(self.scoreIndicatorArray[index], @"Basic Alert With Buttons");
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle
                                                                             message:alertMessage
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", @"Cancel action")
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel action");
                                   }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"确认", @"OK action")
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action)
                               {
                                   NSLog(@"OK action");
                               }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end

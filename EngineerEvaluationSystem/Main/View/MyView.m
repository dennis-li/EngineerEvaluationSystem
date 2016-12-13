//
//  MyView.m
//  DeleteMe
//
//  Created by lixu on 16/12/8.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import "MyView.h"
#import "MyViewModel.h"

@interface MyView ()

//评分完成情况
@property (weak, nonatomic) IBOutlet UILabel *completion;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

//是否展开
@property (assign, getter=isOpend, nonatomic) BOOL opend;

@end

@implementation MyView

- (void) configHeaderView: (id)model
{
    MyViewModel *myViewmodel = model;
    self.completion.text = myViewmodel.completeStatus;
    self.titleLabel.text = myViewmodel.title;
}

//显示详情按钮
- (IBAction)displayDetail:(id)sender
{
    self.imageView.translatesAutoresizingMaskIntoConstraints = YES;
    self.opend = !self.isOpend;
    if (self.isOpend) {
        self.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else {
        self.imageView.transform = CGAffineTransformMakeRotation(0);
    }
    [self.delegate displayDetailData:self];
    
}

//进入打分界面
- (IBAction)grading:(id)sender
{
    
    
}

@end

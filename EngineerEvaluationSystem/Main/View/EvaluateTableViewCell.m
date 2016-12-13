//
//  EvaluateTableViewCell.m
//  EngineerEvaluationSystem
//
//  Created by lixu on 16/12/3.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import "EvaluateTableViewCell.h"

@interface EvaluateTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

//第几个cell
@property (nonatomic ,assign) NSInteger index;

//选中的按钮
@property (nonatomic ,assign) NSInteger selectButtonTag;

@end

@implementation EvaluateTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    //默认选中优的按钮
    self.selectButtonTag = 100;
}

- (void)cellConfigWithTitle:(NSString *)title index:(NSInteger)index
{
    self.titleLabel.text = title;
    self.index = index;
}

- (IBAction)selectButton:(UIButton *)sender
{
    if (sender.tag != self.selectButtonTag) {
        UIButton *oldButton = [self viewWithTag:self.selectButtonTag];
        [oldButton setBackgroundImage:[UIImage imageNamed:@"no"] forState:UIControlStateNormal];
        [sender setBackgroundImage:[UIImage imageNamed:@"yes"] forState:UIControlStateNormal];
        self.selectButtonTag = sender.tag;
    }
}

//打分依据
- (IBAction)ScoreIndicator:(id)sender
{
    [self.delegate displayScoreIndicatorAtIndex:self.index];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

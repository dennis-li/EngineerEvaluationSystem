//
//  EvaluateTableViewCell.h
//  EngineerEvaluationSystem
//
//  Created by lixu on 16/12/3.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EvaluateTableViewCellDelegate <NSObject>

//显示打分的依据
- (void)displayScoreIndicatorAtIndex:(NSInteger) index;

@end

@interface EvaluateTableViewCell : UITableViewCell

@property (nonatomic, assign, readwrite) id<EvaluateTableViewCellDelegate> delegate;

//设置cell的标题，以及这是第几个cell
- (void)cellConfigWithTitle:(NSString *)title index:(NSInteger)index;

@end

//
//  MyView.h
//  DeleteMe
//
//  Created by lixu on 16/12/8.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyView;
@protocol MyViewDelegate <NSObject>

//进入打分界面
- (void)displayScoreView:(MyView *)headerView;

//显示详情数据
- (void)displayDetailData:(MyView *)headerView;

@end

@interface MyView : UIView

@property (nonatomic, assign, readwrite) id<MyViewDelegate> delegate;

- (void) configHeaderView: (id)model;

@end

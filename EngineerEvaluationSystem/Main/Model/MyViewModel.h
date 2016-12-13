//
//  MyViewModel.h
//  DeleteMe
//
//  Created by lixu on 16/12/11.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyViewModel : NSObject

@property (nonatomic ,readonly ,copy) NSString *title;

//打分完成状态，程度
@property (nonatomic ,readonly ,copy) NSString *completeStatus;

//展开详情的数据源
@property (nonatomic ,readonly ,copy) NSArray *detailArray;

//是否显示当前目录的详情页
@property (nonatomic ,getter=isOpend,assign) BOOL opend;

- (instancetype ) initWithTitle:(NSString *)title
                 completeStatus:(NSString *)complete
                    detailArray:(NSArray *)array;

@end

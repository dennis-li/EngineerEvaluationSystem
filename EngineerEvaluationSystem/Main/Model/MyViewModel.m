//
//  MyViewModel.m
//  DeleteMe
//
//  Created by lixu on 16/12/11.
//  Copyright © 2016年 lixu. All rights reserved.
//

#import "MyViewModel.h"

@implementation MyViewModel

- (instancetype ) initWithTitle:(NSString *)title
                 completeStatus:(NSString *)complete
                      detailArray:(NSArray *)array
{
    self = [super init];
    _title = [title copy];
    _completeStatus = [complete copy];
    _detailArray = [array copy];
    return self;
}

@end


//
//  DGHWithdrawButton.m
//  Interface
//
//  Created by HHIOS on 16/6/27.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "DGHWithdrawButton.h"

@implementation DGHWithdrawButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setTitle:@"提现" forState:UIControlStateNormal];
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
    }
    return self;
}



@end

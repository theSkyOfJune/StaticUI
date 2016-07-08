//
//  DGHDetailHeaderCell.m
//  Interface
//
//  Created by HHIOS on 16/6/28.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "DGHDetailHeaderCell.h"
#import "DGHConst.h"
#import "DGHWithdrawButton.h"

@implementation DGHDetailHeaderCell

- (void)buildUpSubViews {
    [super buildUpSubViews];
    self.backgroundColor = DGHRGBColor(41, 146, 209, 1);
    
    // 1. 门店余额(元)
    CGFloat leftMargin = 14;
    UILabel *desc = [[UILabel alloc]init];
    desc.textColor = [UIColor whiteColor];
    desc.x = leftMargin;
    desc.y = leftMargin;
    desc.text = @"门店余额(元)";
    desc.font = [UIFont fontWithName:DGHLightFont size:13];
    [desc sizeToFit];
    [self.contentView addSubview:desc];
    
    // 2. 余额
    CGFloat startX = 30;
    CGFloat startY = CGRectGetMaxY(desc.frame) + startX;
    UILabel *cash = [[UILabel alloc]init];
    cash.x = startX;
    cash.y = startY;
    cash.textColor = [UIColor whiteColor];
    cash.font = [UIFont fontWithName:DGHRegularFont size:36];
    cash.text = @"5,000.00";
    [cash sizeToFit];
    [self.contentView addSubview:cash];
    
    // 3. 提现按钮
    DGHWithdrawButton *btn = [DGHWithdrawButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitleColor:self.backgroundColor forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont fontWithName:DGHRegularFont size:16];
    btn.height = cash.height - 10;
    btn.width = 60;
    btn.x = [UIScreen mainScreen].bounds.size.width - btn.width - leftMargin;
    btn.centerY = cash.centerY;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
    
}

- (void)btnClick:(UIButton *)button {
    if (_withdrawHandle) {
        _withdrawHandle(button);
    }
}

@end

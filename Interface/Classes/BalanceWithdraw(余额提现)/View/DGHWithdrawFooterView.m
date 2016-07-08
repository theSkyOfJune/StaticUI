//
//  DGHWithdrawFooterView.m
//  Interface
//
//  Created by HHIOS on 16/6/28.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "DGHWithdrawFooterView.h"
#import "DGHConst.h"
#import "DGHWithdrawButton.h"

@implementation DGHWithdrawFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        //初始化
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUp];
}
/** 初始化 */
- (void)setUp {
    UILabel *title = [[UILabel alloc]init];
    title.font = [UIFont fontWithName:@"PingFangSC-Medium" size:13];
    title.textColor = DGHRGBColor(77, 77, 77, 1);
    title.text = @"预计1~2个工作日到账";
    title.textAlignment = NSTextAlignmentCenter;
    [self addSubview:title];
    
    
    DGHWithdrawButton *btn = [[DGHWithdrawButton alloc]init];
    
    btn.backgroundColor = [UIColor colorWithRed:0.212 green:0.494 blue:0.776 alpha:1.000];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
}

- (void)btnClick:(UIButton *)button {
    if (_withdrawHandle) {
        _withdrawHandle(button);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UILabel *title = self.subviews[0];
    title.frame = CGRectMake(0, 0, self.width, 40);
    
    CGFloat btnY = CGRectGetMaxY(title.frame);
    CGFloat startX = 35;
    CGFloat btnW = self.width - 2 * startX;
    DGHWithdrawButton *button = self.subviews[1];
    button.frame = CGRectMake(startX, btnY, btnW, 40);
    
    self.height = CGRectGetMaxY(button.frame) + 10;
}

@end

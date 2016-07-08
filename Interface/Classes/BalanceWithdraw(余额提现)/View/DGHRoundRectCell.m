//
//  DGHRoundRectCell.m
//  Interface
//
//  Created by HHIOS on 16/6/27.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "DGHRoundRectCell.h"
#import "DGHConst.h"

@implementation DGHRoundRectCell
static CGFloat leftMargin = 15;
- (void)buildUpSubViews {
    [super buildUpSubViews];
    self.layer.cornerRadius = 10.0;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    
    
    CGFloat startY = 20;
    CGFloat const DGHUpPartH = 100;
    CGFloat const DGHLeftMargin = 20;
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 2 * (DGHLeftMargin + leftMargin);
//    NSLog( @"%f", self.width);
    // 1. 提现金额
    UILabel *withdraw = [[UILabel alloc]initWithFrame:CGRectMake(DGHLeftMargin, startY, width, DGHUpPartH * 0.3)];
    withdraw.textColor = DGHRGBColor(0, 0, 0, 1);
    withdraw.text = @"提现金额";
    withdraw.font = [UIFont fontWithName:DGHMediumFont size:15];
    [self.contentView addSubview:withdraw];
    
    // 2. ¥
    CGFloat indicateY = CGRectGetMaxY(withdraw.frame);
    CGFloat indicateW = 20;
    CGFloat indicateH = DGHUpPartH * 0.5;
    UILabel *indicate = [[UILabel alloc]initWithFrame:CGRectMake(DGHLeftMargin, indicateY, indicateW, indicateH)];
    indicate.textColor = DGHRGBColor(0, 0, 0, 1);
    indicate.text = @"¥";
    indicate.font = [UIFont fontWithName:DGHMediumFont size:25];
    [self.contentView addSubview:indicate];
    
    // 2.1 余额
    CGFloat balanceX = CGRectGetMaxX(indicate.frame);
    CGFloat balanceW = width - indicateW;
    UILabel *balance = [[UILabel alloc]initWithFrame:CGRectMake(balanceX, indicateY, balanceW, indicateH)];
    balance.textColor = DGHRGBColor(168, 168, 168, 1);
    balance.text = @"0.00";
    balance.font = [UIFont fontWithName:DGHMediumFont size:25];
    [self.contentView addSubview:balance];
    
    //3. 分割线
    CGFloat lineY = CGRectGetMaxY(balance.frame);
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(DGHLeftMargin, lineY, width, 1)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:line];
    
    // 4. 门店余额
    CGFloat bottomStartY = CGRectGetMaxY(line.frame);
    CGFloat bottomH = DGHRoundRectCellHeight - bottomStartY;
    UILabel *shopCash = [[UILabel alloc]init];
    shopCash.x = DGHLeftMargin;
    shopCash.y = bottomStartY;
    shopCash.text = @"门店余额¥5,000.00,";
    shopCash.font = [UIFont fontWithName:DGHRegularFont size:15];
    shopCash.textColor = DGHRGBColor(168, 168, 168, 1);
    [shopCash sizeToFit];
    shopCash.height = bottomH;
    [self.contentView addSubview:shopCash];
    
    CGFloat btnX = CGRectGetMaxX(shopCash.frame);
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.x = btnX;
    btn.y = bottomStartY;
    [btn setTitle:@"全部提现" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:0.196 green:0.447 blue:0.761 alpha:1.000] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont fontWithName:DGHMediumFont size:15];
    [btn sizeToFit];
    btn.height = bottomH;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
    
}

- (void)btnClick:(UIButton *)button {
    if (_withdrawCashHandle) {
        _withdrawCashHandle(self, button);
    }
}

- (void)setFrame:(CGRect)frame {
    frame.origin.x = leftMargin;
    frame.size.width -= 2 * leftMargin;
    [super setFrame:frame];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

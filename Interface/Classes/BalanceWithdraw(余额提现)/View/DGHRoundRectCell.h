//
//  DGHRoundRectCell.h
//  Interface
//
//  Created by HHIOS on 16/6/27.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "DGHBalanceBaseCell.h"

@interface DGHRoundRectCell : DGHBalanceBaseCell

/** 提现金额 */
@property (nonatomic, copy)NSString *balance;

/** 点击全部提现的回调 */
@property (nonatomic, copy)void(^withdrawCashHandle)(DGHBalanceBaseCell *cell, UIButton *button);

@end

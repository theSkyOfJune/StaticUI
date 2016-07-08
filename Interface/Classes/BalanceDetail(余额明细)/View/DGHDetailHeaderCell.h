//
//  DGHDetailHeaderCell.h
//  Interface
//
//  Created by HHIOS on 16/6/28.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "DGHBalanceBaseCell.h"

@interface DGHDetailHeaderCell : DGHBalanceBaseCell

/** 点击全部提现的回调 */
@property (nonatomic, copy)void(^withdrawHandle)(UIButton *button);

@end

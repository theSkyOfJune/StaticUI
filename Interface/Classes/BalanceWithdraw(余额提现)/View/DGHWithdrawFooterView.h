//
//  DGHWithdrawFooterView.h
//  Interface
//
//  Created by HHIOS on 16/6/28.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DGHWithdrawFooterView : UIView
/** 点击全部提现的回调 */
@property (nonatomic, copy)void(^withdrawHandle)(UIButton *button);
@end

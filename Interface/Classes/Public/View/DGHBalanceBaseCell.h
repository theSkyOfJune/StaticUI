//
//  DGHBalanceBaseCell.h
//  Interface
//
//  Created by HHIOS on 16/6/27.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DGHBalanceBaseCell : UITableViewCell

+ (instancetype)cellForReuseWithTableView:(UITableView *)tableView;

- (void)buildUpSubViews;

@end

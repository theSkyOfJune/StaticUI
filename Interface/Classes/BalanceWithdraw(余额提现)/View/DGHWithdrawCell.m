//
//  DGHWithdrawCell.m
//  Interface
//
//  Created by HHIOS on 16/6/27.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "DGHWithdrawCell.h"
#import "DGHConst.h"

@implementation DGHWithdrawCell

- (void)buildUpSubViews {
    [super buildUpSubViews];
    
    self.textLabel.font = [UIFont fontWithName:DGHMediumFont size:17];
    self.textLabel.textColor = DGHRGBColor(0, 0, 0, 1);
    self.detailTextLabel.font = [UIFont fontWithName:DGHRegularFont size:15];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.imageView.image) {
        self.imageView.x = DGHWithdrawCellImageLeftMargin;
        self.imageView.y = DGHWithdrawCellImageUpMargin;
        self.imageView.width = DGHWithdrawCellImageWH;
        self.imageView.height = DGHWithdrawCellImageWH;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

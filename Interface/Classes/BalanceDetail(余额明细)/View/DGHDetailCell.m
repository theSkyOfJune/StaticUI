//
//  DGHDetailCell.m
//  Interface
//
//  Created by HHIOS on 16/6/27.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "DGHDetailCell.h"
#import "DGHConst.h"

@interface DGHDetailCell ()

/** rightLabel */
@property (nonatomic, weak)UILabel *rightLabel;

@end

@implementation DGHDetailCell

- (UILabel *)rightLabel {
    if (!_rightLabel) {
        UILabel *rightLabel = [[UILabel alloc] init];
        rightLabel.textAlignment = NSTextAlignmentRight;
        rightLabel.font = [UIFont fontWithName:DGHRegularFont size:18];
        _rightLabel = rightLabel;
        [self.contentView addSubview:rightLabel];
    }
    return _rightLabel;
}

- (void)setRightText:(NSString *)rightText {
    _rightText = [rightText copy];
    self.rightLabel.text = _rightText;
    [self.rightLabel sizeToFit];
    if ([rightText hasPrefix:@"+"]) {
        self.rightLabel.textColor = DGHRGBColor(0, 185, 0, 1);
    } else if ([rightText hasPrefix:@"-"]) {
        self.rightLabel.textColor = DGHRGBColor(255, 18, 18, 1);
    } else {
        self.rightLabel.textColor = [UIColor lightGrayColor];
    }
}

- (void)buildUpSubViews {
    [super buildUpSubViews];
    
    self.textLabel.font = [UIFont fontWithName:DGHMediumFont size:16];
    self.textLabel.textColor = DGHRGBColor(77, 77, 77, 1);
    self.detailTextLabel.font = [UIFont fontWithName:DGHRegularFont size:13];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat leftMargin = 14;
    self.textLabel.x = leftMargin;
    self.textLabel.y -= 2;
    
    self.detailTextLabel.x = leftMargin;
    self.detailTextLabel.y += 2;
    
    self.rightLabel.x = self.width - self.rightLabel.width - leftMargin;
    self.rightLabel.centerY = self.contentView.centerY;
//    self.rightLabel.y = (self.height - self.rightLabel.height) * 0.5;
}

@end

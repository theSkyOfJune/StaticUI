//
//  DGHTestCell.m
//  Interface
//
//  Created by HHIOS on 16/7/8.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "DGHTestCell.h"
#import "DGHConst.h"

@interface DGHTestCell ()

/** 右边视图 */
@property (nonatomic, weak)UIImageView *rightImageView;

@end

@implementation DGHTestCell

- (UIImageView *)rightImageView {
    if (!_rightImageView) {
        UIImageView *rightImageView = [[UIImageView alloc] init];
        rightImageView.image = [UIImage imageNamed:@"ico_aliplay"];
        [rightImageView sizeToFit];
        [self.contentView addSubview:rightImageView];
        _rightImageView = rightImageView;
    }
    return _rightImageView;
}

- (void)buildUpSubViews {
    [super buildUpSubViews];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeRightImage:) name:DGHImagePickerDidFinishKey object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)changeRightImage:(NSNotification *)notify {
    self.rightImageView.image = notify.userInfo[DGHImagePickerOriginalImageKey];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.rightImageView.x = self.width - self.rightImageView.width - 40;
    self.rightImageView.y = (self.height - self.rightImageView.height) * 0.5;
}

@end

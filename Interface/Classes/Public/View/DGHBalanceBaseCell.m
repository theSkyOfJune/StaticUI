//
//  DGHBalanceBaseCell.m
//  Interface
//
//  Created by HHIOS on 16/6/27.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "DGHBalanceBaseCell.h"
#import "DGHConst.h"

@implementation DGHBalanceBaseCell

+ (instancetype)cellForReuseWithTableView:(UITableView *)tableView {
    id cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (!cell) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:NSStringFromClass([self class])];
        
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUpSubViews];
    }
    return self;
}

- (void)buildUpSubViews {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.detailTextLabel.textColor = DGHRGBColor(168, 168, 168, 1);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

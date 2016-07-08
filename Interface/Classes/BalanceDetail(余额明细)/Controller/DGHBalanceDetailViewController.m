//
//  DGHBalanceDetailViewController.m
//  Interface
//
//  Created by HHIOS on 16/6/27.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "DGHBalanceDetailViewController.h"
#import "DGHConst.h"
#import "DGHDetailCell.h"
#import "DGHDetailHeaderCell.h"
#import "UIBarButtonItem+Item.h"

@interface DGHBalanceDetailViewController ()

/** 数据 */
@property (nonatomic, strong)NSArray *data;
/** 副数据 */
@property (nonatomic, strong)NSArray *subdata;
/** footerView */
@property (nonatomic, strong)UIView *footerView;

@end

@implementation DGHBalanceDetailViewController
- (UIView *)footerView {
    if (!_footerView) {
        UIView *footerView = [[UIView alloc]init];
        
        UILabel *title = [[UILabel alloc] init];
        title.textColor = DGHRGBColor(168, 168, 168, 1);
        title.font = [UIFont fontWithName:DGHRegularFont size:16];
        title.text = @"余额明细";
        [title sizeToFit];
        title.x = 14;
        title.centerY = 14;
        [footerView addSubview:title];
        
        _footerView = footerView;
    }
    return _footerView;
}

- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _data = @[@"保养服务", @"预约保养服务", @"储值卡充值", @"维修", @"提现"];
    _subdata = @[@"+220.00", @"+20.00", @"+1500.00", @"+460.00", @"-4000"];
    [self setUpNav];
    [self setUpTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setUpNav {
    self.title = @"余额明细";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_more"] highImage:[UIImage imageNamed:@"navigationbar_more_highlighted"] target:self action:@selector(rightBarButtonItemClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)rightBarButtonItemClick {
    NSLog(@"%s", __func__);
}

- (void)setUpTableView {
    self.tableView.backgroundColor = DGHGlobalColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    CGFloat sectionFooterHeight = 28.0;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = sectionFooterHeight;
    self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        DGHDetailHeaderCell *cell = [DGHDetailHeaderCell cellForReuseWithTableView:tableView   ];
        [cell setWithdrawHandle:^(UIButton *button) {
            NSLog(@"%@", button.titleLabel.text);
        }];
        return cell;
    } else {
        
        DGHDetailCell *cell = [DGHDetailCell cellForReuseWithTableView:tableView];
        
        cell.textLabel.text = self.data[indexPath.row];
        cell.detailTextLabel.text = @"2016-05-27 10:08";
        cell.rightText = self.subdata[indexPath.row];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 140;
    } else {
        return DGHDetailCellHeight;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return self.footerView;
    }
    return nil;
}
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//    if (section == 0) {
//        return @"余额明细";
//    }
//    return nil;
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

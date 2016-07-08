//
//  DGHBalanceWithdrawViewController.m
//  Interface
//
//  Created by HHIOS on 16/6/27.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "DGHBalanceWithdrawViewController.h"
#import "DGHConst.h"
#import "DGHWithdrawCell.h"
#import "DGHRoundRectCell.h"
#import "DGHTestCell.h"
#import "DGHWithdrawFooterView.h"
#import "UIBarButtonItem+Item.h"
#import "DGHBalanceDetailViewController.h"

@interface DGHBalanceWithdrawViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
/** tooterView */
@property (nonatomic, weak)DGHWithdrawFooterView *footerView;
@end

@implementation DGHBalanceWithdrawViewController

- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (self.footerView.height) {
        self.tableView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.footerView.frame));
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNav];
    [self setUpTableView];
    
}

- (void)setUpNav {
    self.title = @"余额提现";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"ic_help_outline"] highImage:nil target:self action:@selector(rightBarButtonItemClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)rightBarButtonItemClick {
    NSLog(@"%s", __func__);
}

- (void)setUpTableView {
    self.tableView.backgroundColor = DGHGlobalColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    CGFloat sectionHeaderH = 15;
    self.tableView.sectionHeaderHeight = sectionHeaderH;
    self.tableView.sectionFooterHeight = 0;
    self.tableView.contentInset = UIEdgeInsetsMake(sectionHeaderH - 35, 0, 0, 0);
    
    DGHWithdrawFooterView *footerView = [[DGHWithdrawFooterView alloc]init];
    [footerView setWithdrawHandle:^(UIButton *button) {
        NSLog(@"%@", button.titleLabel.text);
        DGHBalanceDetailViewController *detail = [[DGHBalanceDetailViewController alloc]init];
        [self.navigationController pushViewController:detail animated:YES];
    }];
    _footerView = footerView;
    self.tableView.tableFooterView = footerView;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return section == 0 ? 1 : 2;
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        DGHWithdrawCell *cell = [DGHWithdrawCell cellForReuseWithTableView:tableView];
        cell.imageView.image = [UIImage imageNamed:@"ico_aliplay"];
        cell.textLabel.text = @"支付宝账户";
        cell.detailTextLabel.text = @"151****1234";
        return cell;
    } else if (indexPath.section == 1) {
        DGHTestCell *cell = [DGHTestCell cellForReuseWithTableView:tableView];
        cell.textLabel.text = @"个人信息";
        return cell;
    } else {
        DGHRoundRectCell *cell = [DGHRoundRectCell cellForReuseWithTableView:tableView];
        
        [cell setWithdrawCashHandle:^(DGHBalanceBaseCell *cell, UIButton *button) {
            NSLog(@"%@", button.titleLabel.text);
        }];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        return DGHRoundRectCellHeight;
    } else {
        return DGHWithdrawCellHeight;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}


#pragma mark - 选择图片完成的时候调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    NSDictionary *userInfo = @{DGHImagePickerOriginalImageKey : image};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DGHImagePickerDidFinishKey object:nil userInfo:userInfo];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
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

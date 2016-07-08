//
//  DGHNavigationController.m
//  Interface
//
//  Created by HHIOS on 16/6/27.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "DGHNavigationController.h"
#import "DGHBalanceWithdrawViewController.h"

@interface DGHNavigationController ()

@end

@implementation DGHNavigationController

+ (void)initialize {
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    NSMutableDictionary *titleAttrs = [@{} mutableCopy];
    titleAttrs[NSForegroundColorAttributeName] = [UIColor colorWithWhite:0.192 alpha:1.000];
    titleAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [bar setTitleTextAttributes:titleAttrs];
    
}

- (instancetype)init {
    return [self initWithRootViewController:[[DGHBalanceWithdrawViewController alloc]init]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.interactivePopGestureRecognizer.delegate = nil;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    
    btn.bounds = CGRectMake(0, 0, 30, 40);
//    btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [super pushViewController:viewController animated:animated];
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

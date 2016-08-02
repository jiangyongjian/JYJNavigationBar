//
//  HomeViewController.m
//  IrregularTabBar
//
//  Created by JYJ on 16/5/3.
//  Copyright © 2016年 baobeikeji. All rights reserved.
//

#import "HomeViewController.h"
#import "MoreViewController.h"
#import "UIImage+Extension.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton *topView = [[UIButton alloc] init];
    topView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    topView.backgroundColor = BXColor(253, 171, 47);
    [topView setTitle:@"点击黄色区域进入下一个控制器" forState:UIControlStateNormal];
    [topView addTarget:self action:@selector(topViewClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topView];
    
}

- (void)topViewClick {
    MoreViewController *moreVc = [[MoreViewController alloc] init];
    moreVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:moreVc animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.navigationController.childViewControllers.count > 1) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
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

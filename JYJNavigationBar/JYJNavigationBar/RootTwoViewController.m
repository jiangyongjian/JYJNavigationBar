//
//  RootTwoViewController.m
//  JYJNavigationBar
//
//  Created by JYJ on 16/8/1.
//  Copyright © 2016年 baobeikeji. All rights reserved.
//

#import "RootTwoViewController.h"
#import "UIImage+Extension.h"

@interface RootTwoViewController () <UITableViewDataSource, UITableViewDelegate>
/** tableView */
@property (nonatomic, weak) UITableView *tableView;

/** 导航条View */
@property (nonatomic, weak) UIView *navBarView;
@end

@implementation RootTwoViewController

- (UIView *)navBarView {
    if (!_navBarView) {
        UIView *navBarView = [[UIView alloc] init];
        navBarView.backgroundColor = BXColor(253, 171, 47);
        navBarView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
        [self.view addSubview:navBarView];
        self.navBarView = navBarView;
    }
    return _navBarView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//    tableView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
    tableView.delegate = self;
    tableView.dataSource = self;
//    tableView.scrollIndicatorInsets = tableView.contentInset;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    [self.view addSubview:self.navBarView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //去掉分割线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"twoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"two -- %zd", indexPath.row];
    
    return cell;
}

@end

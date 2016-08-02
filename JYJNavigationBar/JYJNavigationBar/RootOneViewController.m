//
//  RootOneViewController.m
//  JYJNavigationBar
//
//  Created by JYJ on 16/8/1.
//  Copyright © 2016年 baobeikeji. All rights reserved.
//

#import "RootOneViewController.h"
#import "UIImage+Extension.h"

/** 滚动到多少高度开始出现 */
static CGFloat const startH = 0;

@interface RootOneViewController () <UITableViewDataSource, UITableViewDelegate>

/** 导航条View */
@property (nonatomic, weak) UIView *navBarView;
@end

@implementation RootOneViewController

- (UIView *)navBarView {
    if (!_navBarView) {
        UIView *navBarView = [[UIView alloc] init];
        navBarView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
        [self.view addSubview:navBarView];
        self.navBarView = navBarView;
    }
    return _navBarView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    tableView.contentInset = UIEdgeInsetsMake(imageH, 0, 49, 0);
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 49, 0);
    [self.view addSubview:tableView];
    self.tableView = tableView;
    UIImageView *headerImage = [[UIImageView alloc] init];
    headerImage.frame = CGRectMake(0, -imageH, [UIScreen mainScreen].bounds.size.width, imageH);
    headerImage.contentMode = UIViewContentModeScaleAspectFill;
    [tableView insertSubview:headerImage atIndex:0];
    self.headerImage = headerImage;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //去掉分割线
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.titleName) {
        self.navigationItem.title = @"";
    }
    CGFloat offsetY = scrollView.contentOffset.y;

    if (offsetY > -imageH + startH) {
        CGFloat alpha = MIN(1, 1 - ((-imageH + startH + 64 - offsetY) / 64));
 
        self.navBarView.backgroundColor = BXAlphaColor(253, 171, 47, alpha);
        if (offsetY >= (-imageH + startH + 64)){
            if (self.titleName) {
                self.navigationItem.title = self.titleName;
            }
        }  
    } else {
        self.navBarView.backgroundColor = BXAlphaColor(253, 171, 47, 0);
    }
    
// ------------------------------华丽的分割线------------------------------------
    // 设置头部放大
    // 向下拽了多少距离
    CGFloat down = - imageH - scrollView.contentOffset.y;
    if (down < 0) return;
    
    CGRect frame = self.headerImage.frame;
    frame.origin.y = - imageH - down;
    frame.size.height = imageH + down;
    self.headerImage.frame = frame;
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"oneCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zd", indexPath.row];
    
    return cell;
}

@end

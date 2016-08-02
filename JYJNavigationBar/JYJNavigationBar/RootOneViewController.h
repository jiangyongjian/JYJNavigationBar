//
//  RootOneViewController.h
//  JYJNavigationBar
//
//  Created by JYJ on 16/8/1.
//  Copyright © 2016年 baobeikeji. All rights reserved.
//

#import <UIKit/UIKit.h>

/** BXImageH */
#define imageH [UIScreen mainScreen].bounds.size.width

@interface RootOneViewController : UIViewController
/** tableView */
@property (nonatomic, strong) UITableView *tableView;

/** 头部图片 */
@property (nonatomic, strong) UIImageView *headerImage;

/** 标题 */
@property (nonatomic, copy) NSString *titleName;

@end

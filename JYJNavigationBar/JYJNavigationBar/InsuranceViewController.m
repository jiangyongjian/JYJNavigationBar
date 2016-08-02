//
//  InsuranceViewController.m
//  IrregularTabBar
//
//  Created by JYJ on 16/5/3.
//  Copyright © 2016年 baobeikeji. All rights reserved.
//

#import "InsuranceViewController.h"
#import "SettingViewController.h"

@interface InsuranceViewController ()

@end

@implementation InsuranceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    self.titleName = @"保险保险";
    self.headerImage.image = [UIImage imageNamed:@"dzq"];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"insuranceCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"insurance -- %zd", indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingViewController *setVc = [[SettingViewController alloc] init];
    setVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setVc animated:YES];
}


@end

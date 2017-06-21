//
//  CRMainTabViewController.m
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "CRMainTabViewController.h"
#import "CRCardListViewController.h"
#import "CRUserTabViewController.h"


@interface CRMainTabViewController ()


@end

@implementation CRMainTabViewController


+ (instancetype)initMainTab{
    
    
    CRMainTabViewController *mtvc = [[CRMainTabViewController alloc] init];
    
    return mtvc;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CRCardListViewController *fVC= [[CRCardListViewController alloc] init];
    fVC.navigationItem.title = @"卡片";
    UINavigationController *nFVC = [[UINavigationController alloc] initWithRootViewController:fVC];
    fVC.tabBarItem.title = @"看看";
    fVC.tabBarItem.image = [UIImage imageNamed:@"fst"];
    
    CRUserTabViewController *secVC =[[CRUserTabViewController alloc] init];
    secVC.navigationItem.title = @"用户";
    UINavigationController *nSVC = [[UINavigationController alloc] initWithRootViewController:secVC];
    nSVC.tabBarItem.title = @"用户";
    nSVC.tabBarItem.image = [UIImage imageNamed:@"sec"];
    
//    self.tabBar.tintColor = [UIColor blackColor];
    
    self.tabBar.backgroundColor=[UIColor grayColor];
    
    
    
    self.viewControllers = @[nFVC,nSVC];
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

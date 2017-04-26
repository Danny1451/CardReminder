//
//  CRMainTabViewController.m
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "CRMainTabViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"


@interface CRMainTabViewController ()



@end

@implementation CRMainTabViewController


+ (instancetype)initMainTab{
    CRMainTabViewController *mtvc = [[CRMainTabViewController alloc] init];
    
    FirstViewController *fVC= [[FirstViewController alloc] init];
    SecondViewController *secVC =[[SecondViewController alloc] init];
    
    
    UITabBar *tabBar = mtvc.tabBar;
    mtvc.tabBar.backgroundColor=[UIColor whiteColor];
//    mtvc.tabBar.tintColor=YiBlue;
    
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    tabBarItem1.title=@"Users";
    tabBarItem2.title=@"Repositories";
    
    
    
    mtvc.viewControllers = @[fVC,secVC];
    
    
    
    
    
    
    return mtvc;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
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

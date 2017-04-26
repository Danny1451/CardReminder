//
//  AppDelegate.m
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "AppDelegate.h"
#import <AVOSCloud/AVOSCloud.h>
#import "CRUserMananger.h"
#import "CRCardMananger.h"
#import "CRMainTabViewController.h"

#import "UIViewController+CRVCAop.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [self initLeadCloud];
    
    [[CRUserMananger sharedInstance] initUserInfo];
    
    [[CRCardMananger sharedInstance] initCards];
    
//    [self showMainTab];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) transToMainTab {
 
    CRMainTabViewController *tabVc = [CRMainTabViewController initMainTab];
    
    
    self.window.rootViewController = tabVc;
    
    [self.window makeKeyAndVisible];
    
}

#pragma mark - private methods

- (void)initLeadCloud{
    
    
    [AVOSCloud setApplicationId:LEANCLOUD_AID clientKey:LEANCLOUD_CID];
    
    [AVOSCloud setAllLogsEnabled:NO];
    
    
}



@end

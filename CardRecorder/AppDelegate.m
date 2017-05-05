//
//  AppDelegate.m
//  CardRecorder
//
//  Created by 刘旦 on 02/05/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "AppDelegate.h"
#import <AVOSCloud/AVOSCloud.h>

#define LEANCLOUD_AID  @"TvUuec7Hjhe9Prz5Pm1Y1GW2-gzGzoHsz"
#define LEANCLOUD_CID  @"Wc9bWi3sJg2JiyiFwRI8iUHL"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)initLeadCloud{
    
    
    [AVOSCloud setApplicationId:LEANCLOUD_AID clientKey:LEANCLOUD_CID];
    
    [AVOSCloud setAllLogsEnabled:NO];
    
    
}

@end

//
//  CRUserMananger.m
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "CRUserMananger.h"
#import <AVUser.h>

@implementation CRUserMananger




+(instancetype)sharedInstance{
    static CRUserMananger *sInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sInstance = [[CRUserMananger alloc] init];
        
    });
    
    return sInstance;
}

- (void)initUserInfo{
    
    CRUserMananger *sm = [CRUserMananger sharedInstance];
    
    AVUser * user = [AVUser currentUser];
    
    if (user == nil) {
        sm.currentUser = nil;
    }else{
        sm.currentUser = [CRUser parseFromAVUser:user];
    }
}

@end

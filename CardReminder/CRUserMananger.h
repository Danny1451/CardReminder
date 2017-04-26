//
//  CRUserMananger.h
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRUser.h"


@interface CRUserMananger : NSObject

@property (nonatomic,strong) CRUser *currentUser;

+ (instancetype)sharedInstance;

- (void)initUserInfo;
@end

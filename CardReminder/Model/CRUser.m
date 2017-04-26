//
//  CRUser.m
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "CRUser.h"
#import <AVUser.h>
@implementation CRUser

+ (instancetype)parseFromAVUser:(AVUser *)user{
    CRUser *cr = [[CRUser alloc] init];
    
    cr.nickName = user.username;
    cr.cardsNum = [[user objectForKey:@"cardNum"] integerValue];
    cr.headUrl = [user objectForKey:@"headurl"];
    
    return cr;
}

@end

//
//  CRUser.h
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AVUser;

@interface CRUser : NSObject

@property (nonatomic,strong) NSString* nickName;
@property (nonatomic,assign) NSInteger cardsNum;
@property (nonatomic,strong) NSString* headUrl;

+ (instancetype)parseFromAVUser:(AVUser*) user;


@end

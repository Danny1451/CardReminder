//
//  CRCardMananger.h
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CRCardModel;

typedef void(^CardAddCompletionHandler)(BOOL success);

@interface CRCardMananger : NSObject

+ (instancetype)sharedInstance;

- (void)addCard:(CRCardModel*) crad withHandler:(CardAddCompletionHandler) comletion;

- (void)initCards;

- (void)updateFromServer;

- (BOOL)checkHasNewCard;

- (NSArray*)getCardsFrom:(long long) time; // get cards from exact time

- (NSArray*)getCardsFromNow; // get cards from now

- (NSArray*)getCardsFromMonday; // get cards from monday

- (NSArray*)getCardsFromFirst; // get cards from first day of month
@end

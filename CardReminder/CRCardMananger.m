//
//  CRCardMananger.m
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "CRCardMananger.h"
#import <AVObject.h>
#import <AVQuery.h>
#import "CRCardModel.h"

@interface CRCardMananger()

@property (nonatomic,strong) NSMutableArray *cardsArrays;

@end

@implementation CRCardMananger


+ (instancetype)sharedInstance {
    static CRCardMananger *_sharedCRCardMananger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedCRCardMananger = [[CRCardMananger alloc] init];
    });
    
    return _sharedCRCardMananger;
}

- (void)addCard:(CRCardModel *)crad withHandler:(CardAddCompletionHandler)comletion{
    
    
  
    AVObject *obj = [crad praseToAVObject];
    
    [obj saveEventually:^(BOOL succeeded, NSError * _Nullable error) {
       
        //update model info
        crad.objectId = obj.objectId;
        crad.lastTime = [obj.updatedAt timeIntervalSince1970];
        crad.insertTime = [obj.createdAt timeIntervalSince1970];
        
        comletion(succeeded);
    }];
    
    
}

- (void)updateFromServer{
    
}


- (void)initCards{
    
    
}

- (BOOL)checkHasNewCard{
    return YES;
}

- (NSArray*)getCardsFrom:(long long)time {
    NSMutableArray* array = [NSMutableArray array];
    
    
    AVQuery *query = [AVQuery queryWithClassName:NSStringFromClass([CRCardModel class])];
    
    [query whereKey:@"createdAt" lessThanOrEqualTo:[NSDate date]];
    
    [[query findObjects] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
      
        AVObject *object = obj;
        
        CRCardModel *model = [CRCardModel parseFromAVObjec:object];
        
        [array addObject:model];
        
    }];
    
    return array;
}


- (NSArray*)getCardsFromNow{
    
    return [self getCardsFrom:0];
}

- (NSArray*)getCardsFromMonday{
    return [self getCardsFrom:0];
}

- (NSArray*)getCardsFromFirst{
    return [self getCardsFrom:0];
}

@end

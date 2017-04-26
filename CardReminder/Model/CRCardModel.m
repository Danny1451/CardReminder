//
//  CRCard.m
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "CRCardModel.h"
#import <AVObject.h>

@interface CRCardModel()

@end

@implementation CRCardModel

+ (instancetype) parseFromAVObjec:(AVObject *)obj{
    CRCardModel *model = [[CRCardModel alloc] init];
    
    model.title = [obj valueForKey:@"title"];
    model.content = [obj valueForKey:@"content"];
    model.type = [[obj valueForKey:@"type"] integerValue];
    model.lastTime = [[obj valueForKey:@"updatedAt"] timeIntervalSince1970];
    model.insertTime = [[obj valueForKey:@"createdAt"] timeIntervalSince1970];
    model.images = [obj valueForKey:@"images"];
    model.tags = [obj valueForKey:@"tags"];
    model.viewTimes = [[obj valueForKey:@"viewTimes"] integerValue];
    
    model.objectId = obj.objectId;
    
    return model;
}

- (AVObject*) praseToAVObject{
    
    AVObject *object = [AVObject objectWithClassName:NSStringFromClass([self class])];
    
    [object setObject:self.title forKey:@"title"];
    [object setObject:self.content forKey:@"content"];
    [object setObject:[NSNumber numberWithInteger:self.type] forKey:@"type"];
//    [object setObject:[NSNumber numberWithLongLong:self.lastTime] forKey:@"lastTime"];
    [object setObject:self.images forKey:@"images"];
    [object setObject:self.tags forKey:@"tags"];
    [object setObject:[NSNumber numberWithInteger:self.viewTimes] forKey:@"viewTimes"];
    
    return object;
}

@end

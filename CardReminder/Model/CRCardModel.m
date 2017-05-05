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

+ (instancetype) fastBuild:(NSString *)title content:(NSString *)content type:(CRCardType)type{
    CRCardModel *model = [[CRCardModel alloc] init];
    
    model.title = title;
    model.content = content;
    model.type = type;
    model.insertTime = [NSDate date];
    model.lastTime = [NSDate date];
    
    model.viewTimes = [[NSMutableArray alloc] init];
    model.images = [[NSMutableArray alloc] init];
    model.tags = [[NSMutableArray alloc] init];
    
    return model;
}

+ (instancetype) parseFromAVObjec:(AVObject *)obj{
    CRCardModel *model = [[CRCardModel alloc] init];
    
    model.title = [obj valueForKey:@"title"];
    model.content = [obj valueForKey:@"content"];
    model.type = [[obj valueForKey:@"type"] integerValue];
    model.lastTime = [obj valueForKey:@"updatedAt"] ;
    model.insertTime = [obj valueForKey:@"createdAt"];
    model.images = [obj valueForKey:@"images"];
    model.tags = [obj valueForKey:@"tags"];
    model.viewTimes = [obj valueForKey:@"viewTimes"];
    
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
    [object setObject:self.viewTimes forKey:@"viewTimes"];
    
    return object;
}

- (void)addViewTimesObject:(NSDictionary *)object withCompleteHandler:(OnCompleteHandler)handler{
    
    AVObject *avobject = [AVObject objectWithClassName:NSStringFromClass([self class]) objectId:self.objectId];
    
    //更新数据
    [avobject addObject:object forKey:@"viewTimes"];
    
    //回调结果
    [avobject saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
       
        if (succeeded) {
            [self.viewTimes addObject:object];
        }
        handler(succeeded);
    }];
    
}
@end

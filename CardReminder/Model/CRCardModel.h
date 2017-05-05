//
//  CRCard.h
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum CRCardType:NSInteger  CRCardType;
enum CRCardType:NSInteger {
    kCRCardTypeText = 0,
    kCRCardTypeWeb = 1,
    kCRCardTypePic = 2,
    kCRCardTypeTextPic = 3
};

@class AVObject;

typedef void(^OnCompleteHandler)(BOOL isSuccess);// auto update model after request
@interface CRCardModel : NSObject


@property (nonatomic,strong) NSString* title;
@property (nonatomic,strong) NSString *content; // text content
@property (nonatomic,assign) CRCardType type;
@property (nonatomic,strong) NSString* url; //web card url
@property (nonatomic,strong) NSDate *insertTime; // insert time
@property (nonatomic,assign) NSDate *lastTime; // last read time
@property (nonatomic,strong) NSMutableArray *images; // images card url
@property (nonatomic,strong) NSMutableArray *tags; // tags
@property (nonatomic,strong) NSMutableArray *viewTimes; //every read time [ dic[time:readtime, length: readtime ] ... ]
//@property (nonatomic,assign) NSInteger viewTimes;

@property (nonatomic,strong) NSString* objectId;

+ (instancetype) fastBuild:(NSString*) title content:(NSString*) content type:(CRCardType) type;
+ (instancetype) parseFromAVObjec:(AVObject*) obj;
- (AVObject*) praseToAVObject;

- (void)addViewTimesObject:(NSDictionary*) object withCompleteHandler:(OnCompleteHandler) handler;
@end

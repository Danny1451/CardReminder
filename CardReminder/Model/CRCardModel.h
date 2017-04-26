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

@interface CRCardModel : NSObject


@property (nonatomic,strong) NSString* title;
@property (nonatomic,strong) NSString *content; // text content
@property (nonatomic,assign) CRCardType type;
@property (nonatomic,strong) NSString* url; //web card url
@property (nonatomic,assign) NSTimeInterval insertTime; // insert time
@property (nonatomic,assign) NSTimeInterval lastTime; // last read time
@property (nonatomic,strong) NSArray *images; // images card url
@property (nonatomic,strong) NSArray *tags; // tags
@property (nonatomic,assign) NSInteger viewTimes;

@property (nonatomic,strong) NSString* objectId;

+ (instancetype) parseFromAVObjec:(AVObject*) obj;
- (AVObject*) praseToAVObject;
@end

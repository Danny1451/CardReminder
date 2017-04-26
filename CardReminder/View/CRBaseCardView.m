//
//  CRBaseCard.m
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "CRBaseCardView.h"
#import "CRCardModel.h"
#import "CRTextCardView.h"
#import "CRWebCardView.h"

@implementation CRBaseCardView

+ (instancetype)cardViewWithCard:(CRCardModel *)card{
    
    CRBaseCardView *cv;
    switch (card.type) {
        case kCRCardTypeText:
            cv = [[CRTextCardView alloc] init];
            break;
        case kCRCardTypeWeb:
            cv = [[CRWebCardView alloc] init];
            break;
        default:
            cv = [[CRBaseCardView alloc] init];
            break;
            
    }
    cv.card = card;
    
    return cv;
}

- (instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    

//    self.layer.shadowOffset = 5;
    self.layer.borderColor = [[UIColor blackColor] CGColor];
    self.layer.borderWidth = 5;
    
    [self initView];
    
    
    
    return self;
}


- (void)watchValue{
    
}

- (void)showView{
    
}

- (void)initView{
    
}

- (void)viewWillShow{
    
}

- (void)reloadView:(CRCardModel*) card{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

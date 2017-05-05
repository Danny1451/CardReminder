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

@interface CRBaseCardView()


@property (nonatomic,strong) NSTimer* animationTimer;

@end


@implementation CRBaseCardView

+ (instancetype)cardViewWithCard:(CRCardModel *)card{
    
    CRBaseCardView *cv;
    switch (card.type) {
        case kCRCardTypeText:
            cv = [[CRTextCardView alloc] initWithCard:card];
            break;
        case kCRCardTypeWeb:
            cv = [[CRWebCardView alloc] initWithCard:card];
            break;
        default:
            cv = [[CRBaseCardView alloc] initWithCard:card];
            break;
            
    }
   
    
    return cv;
}


- (instancetype)initWithCard:(CRCardModel*) card{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.card = card;
    
    //背景设置为黑色
//    self.backgroundColor = [UIColor blackColor];
    
    //增加阴影
    self.layer.shadowColor = [[UIColor grayColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(5, 5);
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.5;
    
    [self initView];
    
    
    
    return self;
}


- (void)showView{
    

    CABasicAnimation *rotateAnima = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    rotateAnima.duration = 2;
    rotateAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    rotateAnima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 1, 0)];
    
    [self.layer addAnimation:rotateAnima forKey:@"B"];
    
    
    CABasicAnimation *opacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    opacity.duration = 1;
    opacity.fromValue = @1.0f;
    opacity.toValue = @0.2f;
    
    
    [self.layer addAnimation:opacity forKey:@"A"];
    
    
    
    
//    [UIView transitionWithView:self duration:5.0f options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
//    
//        _animationTimer = [NSTimer timerWithTimeInterval:0.02 target:self selector:@selector(watchValue) userInfo:nil repeats:YES];
//        
//        [[NSRunLoop currentRunLoop] addTimer:_animationTimer forMode:NSRunLoopCommonModes];
////        self.cardView.tag++;
//        
////        self.cardView.backgroundColor = (0 == self.cardView.tag % 2) ? [UIColor greenColor] : [UIColor blueColor];
//        
//        
//    } completion:^(BOOL finished) {
//        
//        if (_animationTimer) {
//            [_animationTimer invalidate];
//            _animationTimer = nil;
//        }
//        
//    }];
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

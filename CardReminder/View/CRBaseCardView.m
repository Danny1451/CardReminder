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
@property (nonatomic,assign) BOOL isShow;
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
    self.backgroundColor = [UIColor grayColor];
    
    //增加阴影
    self.layer.shadowColor = [[UIColor grayColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(5, 5);
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.5;
    
    
    self.isShow = false;
    
    [self addSubview:self.backView];
    
    
    [self initView];
    [self initBackGround];
    
    
    [self bringSubviewToFront:self.backView];
    //初始化为反的
    self.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    
    return self;
}

- (void)updateConstraints{
    [super updateConstraints];
    
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(self);
        make.height.equalTo(self);
        make.width.equalTo(self);
        
    }];
}

- (void)showView{
    
    int rotateTime = 1;
    
    if (!self.isShow) {
        CABasicAnimation *rotateAnima = [CABasicAnimation animationWithKeyPath:@"transform"];
        
        rotateAnima.duration = rotateTime;
        rotateAnima.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 1, 0)];
        rotateAnima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0, 0, 0)];
        rotateAnima.removedOnCompletion = NO;
        rotateAnima.fillMode = kCAFillModeForwards;
        [self.layer addAnimation:rotateAnima forKey:@"rotate"];
        
        
        CABasicAnimation *opacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
        opacity.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        opacity.beginTime = CACurrentMediaTime() + rotateTime * 0.5;
        opacity.duration = rotateTime * 0.5;
        opacity.fromValue = @1.0f;
        opacity.toValue = @0.0f;
        opacity.removedOnCompletion = NO;
        opacity.fillMode = kCAFillModeBoth;
        [self.backView.layer addAnimation:opacity forKey:@"opacity"];
        
    }else{
        
        
        CABasicAnimation *rotateAnima = [CABasicAnimation animationWithKeyPath:@"transform"];
        rotateAnima.duration = rotateTime;
        rotateAnima.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0, 0, 0)];
        rotateAnima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 1, 0)];
        rotateAnima.removedOnCompletion = NO;
        rotateAnima.fillMode = kCAFillModeForwards;
        [self.layer addAnimation:rotateAnima forKey:@"rotate"];
        
        
        CABasicAnimation *opacity = [CABasicAnimation animationWithKeyPath:@"opacity"];
        
        opacity.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        opacity.duration = rotateTime * 0.5;
        opacity.fromValue = @0.0f;
        opacity.toValue = @1.0f;
        opacity.removedOnCompletion = NO;
        opacity.fillMode = kCAFillModeBoth;
        [self.backView.layer addAnimation:opacity forKey:@"opacity"];
    }
  
    self.isShow = !self.isShow;
    

//    self.layer.transform = CATransform3DMakeRotation(0, 0, 0, 0);
}

- (void)initView{
    
}

- (void)initBackGround{
    
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

- (UIView*)backView{
    
    if (!_backView) {
        _backView = [[UIView alloc] init];
        [_backView setBackgroundColor:[UIColor blackColor]];
    }
    
    return _backView;
}

@end

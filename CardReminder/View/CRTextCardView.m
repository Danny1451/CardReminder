//
//  CRTextCard.m
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "CRTextCardView.h"
#import "CRCardModel.h"


@interface CRTextCardView()

@property (nonatomic,strong) UITextView *contentTV;

@end

@implementation CRTextCardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)initBackGround{
    
}

- (void)initView{
    
    [self setBackgroundColor:[UIColor blueColor]];
    [self addSubview:self.contentTV];
    
    
}

- (void)showView{
    [super showView];
    

}

- (void)updateConstraints{
    [super updateConstraints];
    
    
    [self.contentTV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(self);
        make.height.greaterThanOrEqualTo(@100);
        make.left.greaterThanOrEqualTo(self).offset(30);
        make.right.greaterThanOrEqualTo(self).offset(-30);

    }];
}

- (void)viewWillShow{
    [self setBackgroundColor:[UIColor greenColor]];
}

- (void)reloadView:(CRCardModel*) card{
    
}


- (UITextView*)contentTV{
    if (!_contentTV) {
        
        _contentTV = [[UITextView alloc] init];
        
        [_contentTV setTextAlignment:NSTextAlignmentCenter];
        [_contentTV setText:[self.card content]];
        [_contentTV setTextColor:[UIColor blackColor]];
        [_contentTV setFont:[UIFont systemFontOfSize:17]];
        
    }
    return _contentTV;
}
@end

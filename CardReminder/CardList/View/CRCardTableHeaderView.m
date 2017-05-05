//
//  CRCardTableHeaderView.m
//  CardReminder
//
//  Created by 刘旦 on 02/05/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "CRCardTableHeaderView.h"

@interface CRCardTableHeaderView()
@property (nonatomic,copy) OnHeaderClickCallback callback;
@property (nonatomic,strong) UIButton *downBtn;
@property (nonatomic,assign) BOOL hasExpend;

@end

@implementation CRCardTableHeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
        
    }
    TRACE(@" initWithReuseIdentifier here");
    self.hasExpend = NO;
    [self initView];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
      TRACE(@"initWithFrame here");
    return self;
}

- (instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    TRACE(@" init here");
    return self;
}

- (void)dealloc{
    
    TRACE(@" dealloc head");
}
- (void)clickAction:(UIButton*) btn{
    TRACE(@" click header");
    
    _hasExpend = !_hasExpend;
    
    if (self.callback != nil) {
        self.callback(_hasExpend);
    }
}
- (void)initView{
    
//    self.contentView.backgroundColor = [UIColor yellowColor];
    self.downBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.downBtn.backgroundColor = [UIColor blueColor];
    self.downBtn.titleLabel.text = @"btn";
    [self.downBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:self.downBtn];
    [self.downBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(@30);
        make.right.equalTo(self.contentView).offset(-10);
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
        
    }];
//    [self setNeedsUpdateConstraints];
}

//-(void)updateConstraints{
//    [super updateConstraints];
//    TRACE(@" updateConstraints");
//    
//    [self.downBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//       
//        make.width.equalTo(@30);
//        make.right.equalTo(self.contentView).offset(-10);
//        make.top.equalTo(self.contentView).offset(10);
//        make.bottom.equalTo(self.contentView).offset(-10);
//        
//    }];
//}
//-(void)layoutSubviews{
//    TRACE(@"layout here");
//}

- (void)updateView{
    
}


-(void)setHeaderClickCallback:(OnHeaderClickCallback)callback{
    _callback  = callback;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

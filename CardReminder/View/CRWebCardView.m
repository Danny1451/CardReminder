//
//  CRWebCard.m
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "CRWebCardView.h"
#import "CRCardModel.h"

@interface CRWebCardView()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *webView;

@end

@implementation CRWebCardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)initView{
    [self setBackgroundColor:[UIColor blueColor]];
    
    
    [self addSubview:self.webView];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.card.url]]];
}


- (void)updateConstraints{
    [super updateConstraints];
    
    UIEdgeInsets inset = UIEdgeInsetsMake(15, 15, 15, 15);
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(inset);
    }];
}


- (void)reloadCard:(id)data{
    [self setBackgroundColor:[UIColor greenColor]];
}

- (void)reloadView:(CRCardModel*) card{
    [self setBackgroundColor:[UIColor greenColor]];
}
- (void)showCard{
    
}


-(void)webViewDidStartLoad:(UIWebView *)webView{
    TRACE(@" load started");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    TRACE(@" load finished");
}

- (UIWebView*)webView{
    
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.delegate = self;
//        [_webView setPaginationMode:UIWebPaginationModeTopToBottom];
        
        
    }
    
    return _webView;
}

@end

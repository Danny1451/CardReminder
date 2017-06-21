//
//  CRBaseCard.h
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CRBaseCardDelegate <NSObject>

- (void)onCardLoadSuccess:(id) card;
- (void)onCardLoadFailed:(id) card;

@end

@class CRCardModel;

@interface CRBaseCardView : UIView

@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) CRCardModel *card;
@property (nonatomic,weak) id<CRBaseCardDelegate> delegate;

+ (instancetype)cardViewWithCard:(CRCardModel*) card;

- (void)initBackGround;

- (void)initView;
- (void)showView;

- (void)viewWillShow;

- (void)reloadView:(CRCardModel*) card;

@end

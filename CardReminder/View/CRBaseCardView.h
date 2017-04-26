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


@interface CRBaseCardView : UIView

@property (nonatomic,weak) id<CRBaseCardDelegate> delegate;


@end

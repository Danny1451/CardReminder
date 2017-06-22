//
//  CRCardViewController.h
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRCardViewController : CRBaseViewController


- (instancetype)initWithCards:(NSArray *) array andIndex:(NSInteger) index;
- (instancetype)initWithCards:(NSArray *) array;


@end

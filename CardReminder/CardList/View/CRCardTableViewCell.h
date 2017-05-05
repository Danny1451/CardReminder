//
//  CRCardTableViewCell.h
//  CardReminder
//
//  Created by 刘旦 on 28/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CRCardModel;

@interface CRCardTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cardIcon;
@property (weak, nonatomic) IBOutlet UILabel *cardTitle;
@property (weak, nonatomic) IBOutlet UILabel *cardInfo;
@property (weak, nonatomic) IBOutlet UILabel *cardReadTime;


- (void)updateWith:(CRCardModel*) card;
@end

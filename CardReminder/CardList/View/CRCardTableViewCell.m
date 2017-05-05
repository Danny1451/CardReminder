//
//  CRCardTableViewCell.m
//  CardReminder
//
//  Created by 刘旦 on 28/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "CRCardTableViewCell.h"

#import "CRCardModel.h"

@implementation CRCardTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)dealloc{
    TRACE(@"cell dealloc ");
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateWith:(CRCardModel *)card{
    
    if (card.type == kCRCardTypeText) {
       [self.cardIcon setImage:[UIImage imageNamed:@"card1"]];
    }else if(card.type == kCRCardTypeWeb){
        [self.cardIcon setImage:[UIImage imageNamed:@"card2"]];
    }else{
        [self.cardIcon setImage:[UIImage imageNamed:@"card3"]];
    }
    
    self.cardTitle.text = card.title;
    self.cardInfo.text = @"这里是信息学信息";
    self.cardReadTime.text = card.insertTime.description;
    
}

@end

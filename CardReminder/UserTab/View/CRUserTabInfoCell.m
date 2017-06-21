//
//  CRUseTabInfoCell.m
//  CardReminder
//
//  Created by 刘旦 on 21/06/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "CRUserTabInfoCell.h"
@interface CRUserTabInfoCell()
@property (weak, nonatomic) IBOutlet UIImageView *headIV;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *countLab;

@end

@implementation CRUserTabInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateWithUserInfo:(CRUser *)user{
    
    [self.headIV setImage:[UIImage imageNamed:@"card1"]];
    [self.nameLab setText:user.nickName];
    [self.countLab setText:[NSString stringWithFormat:@"%ld张",user.cardsNum]];
    
}

@end

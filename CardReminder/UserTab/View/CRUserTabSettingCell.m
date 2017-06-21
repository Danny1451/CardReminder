//
//  CRUserTabSettingCell.m
//  CardReminder
//
//  Created by 刘旦 on 21/06/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "CRUserTabSettingCell.h"

@interface CRUserTabSettingCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UISwitch *statusSwitch;
@property (weak, nonatomic) IBOutlet UILabel *infoLab;

@property (nonatomic,weak) CRUserTabSettingDelegate *delegate;


@end

@implementation CRUserTabSettingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateSwitchCell:(NSString *)title
                  status:(BOOL)status
             andDeledate:(CRUserTabSettingDelegate *)delegate{
    
    [self.titleLab setText:title];
    [self.infoLab setHidden:YES];
    [self.statusSwitch setHidden:NO];
    [self.statusSwitch setOn:status];
    
    self.delegate = delegate;
    
}

- (void)updateInfoCell:(NSString *)title
               andInfo:(NSString *)info{
    [self.titleLab setText:title];
    [self.infoLab setHidden:NO];
    [self.statusSwitch setHidden:YES];
    
    [self.infoLab setText:info];
}
@end

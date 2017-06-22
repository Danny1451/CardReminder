//
//  CRUserTabSettingCell.h
//  CardReminder
//
//  Created by 刘旦 on 21/06/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CRUserTabSettingDelegate;

@interface CRUserTabSettingCell : UITableViewCell

- (void)updateInfoCell:(NSString*) title andInfo:(NSString*) info;
- (void)updateSwitchCell:(NSString*) title status:(BOOL) status
             andDeledate:(id<CRUserTabSettingDelegate>)  delegate;

@end


@protocol CRUserTabSettingDelegate <NSObject>

@optional
- (void)onSettingSwitch:(BOOL) status andTitle:(NSString*) title;

@end

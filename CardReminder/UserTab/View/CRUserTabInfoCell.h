//
//  CRUseTabInfoCell.h
//  CardReminder
//
//  Created by 刘旦 on 21/06/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CRUser.h"
@interface CRUserTabInfoCell : UITableViewCell

- (void)updateWithUserInfo:(CRUser *) user;
@end


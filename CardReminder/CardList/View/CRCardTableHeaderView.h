//
//  CRCardTableHeaderView.h
//  CardReminder
//
//  Created by 刘旦 on 02/05/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^OnHeaderClickCallback)(BOOL isExpend);
@interface CRCardTableHeaderView : UITableViewHeaderFooterView

- (void)updateView;

- (void)setHeaderClickCallback:(OnHeaderClickCallback) callback;
@end

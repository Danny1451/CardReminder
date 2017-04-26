//
//  CRCardViewController.m
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "CRCardViewController.h"
#import "CRBaseCardView.h"
#import "CRWebCardView.h"
#import "CRUserMananger.h"
#import "CRCardModel.h"
#import "CRCardMananger.h"

@interface CRCardViewController ()


//@property (nonatomic,strong) CRBaseCardView *baseCard;

@end

@implementation CRCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    TRACE("%")[CRUserMananger sharedInstance].currentUser
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - event response
- (IBAction)readAction:(id)sender {
    
}

- (IBAction)laterAction:(id)sender {
    
    CRCardModel *model = [[CRCardModel alloc] init];
    
    model.title = @"tes12";
    model.content = @"this is content dsdad";
    model.type = kCRCardTypeText;
    
    
    [[CRCardMananger sharedInstance] addCard:model withHandler:^(BOOL success) {
      
        if (success) {
            TRACE(@"add card success");
        }else{
            TRACE(@"add card failed");
        }
    }];
    
}

- (IBAction)passAction:(id)sender {
    
    NSArray* cards = [[CRCardMananger sharedInstance] getCardsFrom:0];
}

#pragma mark - private methods

- (void)initCardContent{
//    self.baseCard = [[CRWebCardView alloc] init];
    
    
}

#pragma mark - getter / setter
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

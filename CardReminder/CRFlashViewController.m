//
//  CRFlashViewController.m
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "CRFlashViewController.h"
#import "CRUserMananger.h"
#import "CRCardMananger.h"
#import "CRLoginViewController.h"
#import "CRMainTabViewController.h"
#import "CRCardViewController.h"
#import "AppDelegate.h"
@interface CRFlashViewController ()
@property (nonatomic,assign) NSString *test;

@end


@implementation CRFlashViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _test = @"aaaa";
    // Do any additional setup after loading the view.
//
//    [self.view setBackgroundColor:[UIColor redColor]];
    
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                                 (int64_t)(2 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
        if (![self hasLogin]) {
            
            [self transToLoginVC];
            
            
        }else{
            
            //check today has new cards
            
            
            if (![[CRCardMananger sharedInstance] checkHasNewCard]) {
                
                [self transToCardVC];
                
            }else{
                
                [self transToMainTabVC];
            }
            
        }
    });
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)dealloc{
    
    TRACE(@"flash dealloc");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - event response
#pragma mark - private methods

- (BOOL)hasLogin {
    
    if ([CRUserMananger sharedInstance].currentUser == nil) {
        return NO;
    }
    
    return YES;
    
}



- (void)transToLoginVC{
    
    [self performSegueWithIdentifier:@"showLogin" sender:self];
    
    
}

- (void)transToMainTabVC{
    AppDelegate* del = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [del transToMainTab];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    CRCardViewController *vc = segue.destinationViewController;
    
}

- (void)transToCardVC{
    
     NSArray* cards = [[CRCardMananger sharedInstance] getCardsFrom:0];
    CRCardViewController *vc = [[CRCardViewController alloc] initWithCards:cards];
    
//    UIStoryboardSegue *su = [[UIStoryboardSegue alloc] initWithIdentifier:@"showCard" source:self destination:vc];
    
//    CRCardViewController *vc = [CRCardViewController alloc] init
//    [self presentViewController:[[CRCardViewController alloc] init] animated:YES completion:^{
    
//    }];
//    [self segu]
//     [self performSegueWithIdentifier:@"showCard" sender:self];
    
    [self presentViewController:vc animated:YES completion:^{
        
    }];
    
    
//    [self transToMainTabVC];

   
    
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

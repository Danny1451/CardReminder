//
//  ViewController.m
//  CardRecorder
//
//  Created by 刘旦 on 02/05/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "ViewController.h"
#import <AVUser.h>

@interface ViewController()


@property (weak) IBOutlet NSTextField *accountStatus;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.accountStatus setEditable:NO];
    
    
    [AVUser logInWithUsernameInBackground:@"wangle" password:@"123456" block:^(AVUser * _Nullable user, NSError * _Nullable error) {
        
        if (error) {
            
            NSLog(@"login failed");
        }else{
            //login sucess
            
            NSLog(@"%@",[user description]);
//            [self transToMainTab];
        }
        
        
    }];
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end

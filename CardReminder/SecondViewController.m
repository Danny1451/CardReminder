//
//  SecondViewController.m
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "SecondViewController.h"
#import "CRCardMananger.h"
#import "CRCardModel.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(100, 100, 100, 100)];
    [btn setBackgroundColor:[UIColor yellowColor]];
    [btn addTarget:self action:@selector(addMsg:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)addMsg:(id) sender{

    NSDate *date = [NSDate date];
    NSString *title = [date description];
    NSString *content = @"我是内容 内容 内";
    CRCardType type = kCRCardTypeText;
    
    CRCardModel *card = [CRCardModel fastBuild:title content:content type:type];
    
    
    [[CRCardMananger sharedInstance] addCard:card withHandler:^(BOOL success) {
        
        TRACE(@" add success");
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

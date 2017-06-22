//
//  CRUserTabViewController.m
//  CardReminder
//
//  Created by 刘旦 on 21/06/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "CRUserTabViewController.h"
#import "CRUser.h"
#import "CRUserTabInfoCell.h"
#import "CRUserTabSettingCell.h"

@interface CRUserTabViewController ()<UITableViewDelegate,UITableViewDataSource,CRUserTabSettingDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) CRUser *user;

@end

@implementation CRUserTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initView];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
 
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([CRUserTabInfoCell class]) bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:NSStringFromClass([CRUserTabInfoCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([CRUserTabSettingCell class]) bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:NSStringFromClass([CRUserTabSettingCell class])];
    
    [self.tableView reloadData];
    
}

- (void)initData{
    CRUser *user = [[CRUser alloc] init];
    user.nickName = @"狗神";
    user.cardsNum = 12;
    user.headUrl = @"https://raw.githubusercontent.com/Danny1451/BlogPic/master/face/1.jpg";
    
    self.user = user;
    
    [self.user addObserver:self forKeyPath:@"cardsNum" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context{
    
    
    
}

- (void)setTestPP:(NSString *)testPP{
    
}
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    [self tableView:tableView didDeselectRowAtIndexPath:indexPath];
}


#pragma mark - UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 120;
    }
    return 60;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CRUserTabInfoCell class])];
        [(CRUserTabInfoCell*)cell updateWithUserInfo:self.user];
        
    }else if(indexPath.row == 1){
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CRUserTabSettingCell class])];
        [(CRUserTabSettingCell*)cell updateInfoCell:@"连续阅读"
                                            andInfo:@"1天"];
    }else {
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CRUserTabSettingCell class])];
        [(CRUserTabSettingCell*)cell updateSwitchCell:@"自动提醒"
                                               status:YES
                                          andDeledate:self];
    }
    
    return cell;
}


@end

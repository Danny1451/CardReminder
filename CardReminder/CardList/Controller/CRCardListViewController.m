//
//  CRCardListViewController.m
//  CardReminder
//
//  Created by 刘旦 on 28/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "CRCardListViewController.h"
#import "CRCardViewController.h"
#import "CRCardTableViewCell.h"
#import "CRCardTableHeaderView.h"
#import "CRCardModel.h"


#define kCardCellIdentifier @"kCRCardCell"
#define kCardHeadIdentifier @"kCRCardHead"


@interface CRCardListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSArray *dataTitleArray;

@property (nonatomic,strong) NSMutableDictionary *headViewDic;

@end

@implementation CRCardListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initData];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CRCardTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kCardCellIdentifier];
    [self.tableView registerClass:[CRCardTableHeaderView class] forHeaderFooterViewReuseIdentifier:kCardHeadIdentifier];

    [self.tableView setEstimatedSectionHeaderHeight:30];
    [self.tableView setEstimatedRowHeight:60];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
}
- (void)initData{
    
    CRCardModel *model1 = [CRCardModel fastBuild:@"第一个卡" content:@"卡片谁打的谁打的" type:kCRCardTypeText];
    CRCardModel *model2 = [CRCardModel fastBuild:@"第二个卡" content:@"卡片的谁打的" type:kCRCardTypeText];
    CRCardModel *model3 = [CRCardModel fastBuild:@"第32个卡" content:@"颠三倒四打的" type:kCRCardTypeText];
    
    NSArray *a1 = @[model1,model2,model3];
    
    CRCardModel *model7 = [CRCardModel fastBuild:@"个卡" content:@"卡片谁打的谁打的" type:kCRCardTypeWeb];
    CRCardModel *model4 = [CRCardModel fastBuild:@"第二卡" content:@"卡片的谁打的" type:kCRCardTypeText];
    CRCardModel *model5 = [CRCardModel fastBuild:@"第3个卡" content:@"颠三倒四打的" type:kCRCardTypeText];
    
    NSArray *a2 = @[model7,model4,model5];
    
    CRCardModel *model6 = [CRCardModel fastBuild:@"个卡" content:@"卡片谁打的谁打的" type:kCRCardTypeWeb];
    CRCardModel *model8 = [CRCardModel fastBuild:@"第二卡" content:@"卡片的谁打的" type:kCRCardTypeText];
    CRCardModel *model9 = [CRCardModel fastBuild:@"第3个卡" content:@"颠三倒四打的" type:kCRCardTypeText];
    
    NSArray *a3 = @[model6,model8,model9];
    
    self.dataArray = @[a1,a2,a3];
    
    self.dataTitleArray =@[@"今天的",@"明天的",@"后天的"];
    
    self.headViewDic = [[NSMutableDictionary alloc] init];
    
//    [self.headViewDic setValue:@YES forKey:@"1"];
    
   
}

#pragma mark - UITableViewDelegate


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TRACE(@"click here");
    NSArray* cards = self.dataArray[indexPath.section];
    
    CRCardViewController *vc = [[CRCardViewController alloc] initWithCards:cards andIndex:indexPath.row];
    
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}




#pragma mark - UITableViewDataSource

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    CRCardTableHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kCardHeadIdentifier];
    
    
    [self configureHeader:header forSectionAtIndexPath:section];
    
    return header;
    
}

- (void)clickbtn:(UIButton*) btn{
    
    
}

- (void)updateTableViewSection:(NSInteger) section isExpend:(BOOL) isExpend{
    
    id source = [self.headViewDic objectForKey:[NSNumber numberWithInteger:section]];
    
    if (source) {
        [self.headViewDic setObject:[NSNumber numberWithBool:![source boolValue]]
                             forKey:[NSNumber numberWithInteger:section]];
    }else{
        [self.headViewDic setObject:[NSNumber numberWithBool:YES]
                             forKey:[NSNumber numberWithInteger:section]];

    }
    

    [self.tableView reloadData];


}



- (void)configureHeader:(CRCardTableHeaderView *)header
    forSectionAtIndexPath:(NSInteger)section{
    
    
    header.textLabel.text = self.dataTitleArray[section];
    header.tintColor = [UIColor yellowColor];
    
    
    WS(ws)
    [header setHeaderClickCallback:^(BOOL isExpend) {
    
        [ws updateTableViewSection:section isExpend:isExpend];
        //update table
        
    }];
    

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    
    NSArray* cards = self.dataArray[section];
    
    id showDetail = [self.headViewDic objectForKey:[NSNumber numberWithInteger:section]];
    if(showDetail && [showDetail boolValue]){
        return cards.count;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CRCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCardCellIdentifier forIndexPath:indexPath];
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(CRCardTableViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [cell updateWith:(self.dataArray[indexPath.section])[indexPath.row]];
}

#pragma mark - CustomDelegate
#pragma mark - event response
#pragma mark - private methods
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

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

@property (weak, nonatomic) IBOutlet UILabel *cardTitle;
@property (nonatomic,strong) NSArray *datas;
@property (nonatomic,strong) CRCardModel* currentCard;
@property (nonatomic,assign) NSInteger currentIndex;
@property (nonatomic,strong) CRBaseCardView *cardView;
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,assign) NSInteger coatTime;

@end

@implementation CRCardViewController

#pragma mark - life cycle

- (instancetype)initWithCards:(NSArray *)array{
    
    return [self initWithCards:array andIndex:0];
}

- (instancetype)initWithCards:(NSArray *)array andIndex:(NSInteger)index{
    NSParameterAssert(array);
    
    self = [self init];
    
    if (self) {
        
        self.datas = array;
        self.currentIndex = index;
        
        
        
    }
    
    return self;
}

- (void)initData{
    dispatch_queue_t queue = dispatch_queue_create("myquute", DISPATCH_QUEUE_CONCURRENT);
    
    
    queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        
    });
    self.currentCard = self.datas[self.currentIndex];
    self.currentCard.url = @"https://juejin.im";
//    self.currentCard.type = kCRCardTypeWeb;
    self.coatTime = 0;
}

- (void)initView{
 
    //设置名称
    [self.cardTitle setText:self.currentCard.title];
    

    self.cardView = [CRBaseCardView cardViewWithCard:self.currentCard];
    [self.view addSubview:self.cardView];
    
    UIEdgeInsets padding = UIEdgeInsetsMake(150, 20, 100, 20);
    
    [self.cardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(padding);
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    
    [self initView];
    
    
  
    [self startRecordTime];
}


- (void)dealloc{
    
   
    TRACE(@"dealloc cardview");
}

//初始化卡片
- (void)initCard{
    
    @synchronized (self) {
        //do something
    }
    
    NSArray *array = [NSArray array];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
    }];

}

- (void)layoutPageSubviews{
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startRecordTime{
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        TRACE(@"spend %ld s" , self.coatTime);
        self.coatTime += 1;
    }];
    
    [self.timer setFireDate:[NSDate distantPast]];
    [self.timer fire];
}

- (void)stopRecordAndReport{
    
    TRACE(@" finally spend %ld s" , self.coatTime);
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - event response
- (IBAction)readAction:(id)sender {
    
    [self.cardView showView];
    
    [self stopRecordAndReport];

}
- (IBAction)exitAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        [self stopRecordAndReport];
        
    }];
//    [self performSegueWithIdentifier:@"showTab" sender:self];
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
    
   
    [self.currentCard addViewTimesObject:@{@"time":@123,@"length":@10} withCompleteHandler:^(BOOL isSuccess) {
        
        if (isSuccess) {
            TRACE(@"更新成功");
        }
    }];
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

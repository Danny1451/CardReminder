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
    
    self.currentCard = self.datas[self.currentIndex];
    
}

- (void)initView{
 
    //设置名称
    [self.cardTitle setText:self.currentCard.title];
    
    self.currentCard.type = kCRCardTypeWeb;
    self.cardView = [CRBaseCardView cardViewWithCard:self.currentCard];
//    [self.cardView setFrame:CGRectMake(0, 0, 100, 100)];
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
    
    
  
    
}


- (void)dealloc{
    
    TRACE(@"dealloc view");
}

//初始化卡片
- (void)initCard{
    
}

- (void)layoutPageSubviews{
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - event response
- (IBAction)readAction:(id)sender {
    

    CABasicAnimation *rotateAnima = [CABasicAnimation animationWithKeyPath:@"transform"];
    rotateAnima.duration = 1.5;
    
//    rotateAnima.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    // 绕着(0, 0, 1)这个向量轴 Z 轴，顺时针旋转45°(M_PI_4)
    rotateAnima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 1, 0)];

    [self.cardView.layer addAnimation:rotateAnima forKey:@"B"];

    
    
    
//    [UIView transitionWithView:self.cardView duration:2.0f options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
//        self.cardView.tag++;
//        
//        self.cardView.backgroundColor = (0 == self.cardView.tag % 2) ? [UIColor greenColor] : [UIColor blueColor];
//        
//        
//    } completion:^(BOOL finished) {
//        
//    }];
}
- (IBAction)exitAction:(id)sender {
    
    [self performSegueWithIdentifier:@"showTab" sender:self];
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

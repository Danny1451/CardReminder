//
//  CRLoginViewController.m
//  CardReminder
//
//  Created by 刘旦 on 25/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "CRLoginViewController.h"
#import <SVProgressHUD.h>
#import <AVOSCloud.h>

@interface CRLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;



@end

@implementation CRLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginAction:(id)sender {
    
    TRACE(@" I'm %@, my pwd is %@",_nameTF.text,_pwdTF.text);
    
    [self loginWithName:_nameTF.text andPwd:_pwdTF.text];
}


- (IBAction)registerAction:(id)sender {
    
    TRACE(@"start to register");
    [self registerWithName:_nameTF.text andPwd:_pwdTF.text];
}


- (void)loginWithName:(NSString*) name andPwd:(NSString *) pwd{
    
    
    if (strIsEmpty(name) || strIsEmpty(pwd)) {
        return;
    }
    
    [SVProgressHUD showWithStatus:@"登录中..."];
    [AVUser logInWithUsernameInBackground:name password:pwd block:^(AVUser * _Nullable user, NSError * _Nullable error) {
        
        if (error) {
            TRACE(@"login failed");
            [SVProgressHUD showErrorWithStatus:@"登录失败"];
        }else{
            //login sucess
            [SVProgressHUD showInfoWithStatus:@"登录成功"];
            TRACE(@"%@",[user description]);
            [self transToMainTab];
        }
        
        
    }];
    

}

- (void)registerWithName:(NSString*) name andPwd:(NSString *) pwd{
    if (strIsEmpty(name) || strIsEmpty(pwd)) {
        return;
    }
    
    AVUser *user = [AVUser user];
    user.username = name;
    user.password = pwd;
    
    [SVProgressHUD showWithStatus:@"注册中..."];
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
       
        if (!succeeded) {
            TRACE(@"register success");
            [SVProgressHUD showErrorWithStatus:@"注册失败"];
        }else{
            
            [SVProgressHUD showInfoWithStatus:@"注册成功"];
            [self loginWithName:name andPwd:pwd];
        }
    }];
}

- (void)transToMainTab{
    [self performSegueWithIdentifier:@"showTab" sender:self];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

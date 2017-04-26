//
//  UIViewController+CRVCAop.m
//  CardReminder
//
//  Created by 刘旦 on 26/04/2017.
//  Copyright © 2017 danny. All rights reserved.
//

#import "UIViewController+CRVCAop.h"
#import <objc/runtime.h>

@implementation UIViewController (CRVCAop)




-(void)aop_viewDidLoad{
    
    TRACE(@"%@ viewDidLoad",NSStringFromClass([self class]));
    [self aop_viewDidLoad];
}


+(void)load{
    TRACE(@"Load UC here");
    
    
    Method target = class_getInstanceMethod([UIViewController class], @selector(viewDidLoad));
    Method myMethod = class_getInstanceMethod([UIViewController class], @selector(aop_viewDidLoad));
 
    method_exchangeImplementations(target, myMethod);
    
}
@end

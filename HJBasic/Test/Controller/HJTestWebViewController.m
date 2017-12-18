//
//  HJTestWebViewController.m
//  HJBasic
//
//  Created by a-375 on 2017/12/18.
//  Copyright © 2017年 a-375. All rights reserved.
//

#import "HJTestWebViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface HJTestWebViewController ()

@property (nonatomic,strong) JSContext *context;
@end



@implementation HJTestWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    

    [self JavaScriptExecuteOC];
}

- (void)OCExecuteJavaScript {
    self.context = [[JSContext alloc] init];
    
    NSString *js = @"function add(a,b) {return a+b}";
    
    [self.context evaluateScript:js];
    
    JSValue *n = [self.context[@"add"] callWithArguments:@[@2, @3]];
    
    NSLog(@"---%@", @([n toInt32]));
}

- (void)JavaScriptExecuteOC {
    self.context = [[JSContext alloc] init];
    
    self.context[@"add"] = ^(NSInteger a, NSInteger b) {
        NSLog(@"---%@", @(a + b));
    };
    
    [self.context evaluateScript:@"add(2,3)"];
}

@end






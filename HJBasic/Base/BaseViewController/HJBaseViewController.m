//
//  HJBaseViewController.m
//  HJBasic
//
//  Created by a-375 on 2017/11/29.
//  Copyright © 2017年 a-375. All rights reserved.
//

#import "HJBaseViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <objc/runtime.h>

@interface HJBaseViewController ()

@end

@implementation HJBaseViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.hidesBottomBarWhenPushed = YES;
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIBarButtonItem *)customBackItemWithTarget:(id)target action:(SEL)action
{
    return [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"white_back"]
                                            style:UIBarButtonItemStylePlain
                                           target:target
                                           action:action];
}

@end

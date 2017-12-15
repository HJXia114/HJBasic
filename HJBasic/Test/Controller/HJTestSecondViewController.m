//
//  HJTestSecondViewController.m
//  HJBasic
//
//  Created by a-375 on 2017/12/7.
//  Copyright © 2017年 a-375. All rights reserved.
//

#import "HJTestSecondViewController.h"
#import "HJHUD.h"

@interface HJTestSecondViewController ()

@end

@implementation HJTestSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    [HJHUD showToView:self.view title:@"haha" hideAfter:2 animationViewModel:HJHUDAnimationViewModelDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  HJBaseTabBarController.m
//  HJBasic
//
//  Created by a-375 on 2017/11/29.
//  Copyright © 2017年 a-375. All rights reserved.
//

#import "HJBaseTabBarController.h"
#import "NSArray+Safe.h"
#import "HJRootNavigationController.h"
#import "HJBaseViewController.h"
#import "HJTestFirstViewController.h"
#import "HJTestSecondViewController.h"
#import "HJTestThirdViewController.h"

@interface HJBaseTabBarController ()

@end

@implementation HJBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabBarViewControllers];
}

- (void)setupTabBarViewControllers {
    HJTestFirstViewController *hjVC1 = [[HJTestFirstViewController alloc] init];
    HJTestSecondViewController *hjVC2 = [[HJTestSecondViewController alloc] init];
    HJTestThirdViewController *hjVC3 = [[HJTestThirdViewController alloc]init];
    
    NSArray *vcs = nil;
    NSArray *names = nil;
    
    vcs = @[hjVC1, hjVC2,hjVC3];
    names = @[@"测试1", @"测试2",@"测试4"];
 
    
    [self setupTabBarWithViewControllers:vcs titles:names images:nil selecetedImages:nil];
}

///初始化TabBar.viewControllers
- (void)setupTabBarWithViewControllers:(NSArray <HJBaseViewController *>*)viewControllers titles:(NSArray <NSString *>*)titles images:(NSArray <NSString *>*)images selecetedImages:(NSArray <NSString *>*)selecetedImages {
    
    NSMutableArray *navs = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < viewControllers.count; i++) {
        UIViewController *vc = [viewControllers safeObjectAtIndex:i];
        vc.hidesBottomBarWhenPushed = NO;
        
        HJRootNavigationController *nav = [[HJRootNavigationController alloc] initWithRootViewController:vc];
        
        NSString *title = [titles safeObjectAtIndex:i];
        UIImage *image = [UIImage imageNamed:[images safeObjectAtIndex:i]] ;
        UIImage *selectedImage = [UIImage imageNamed:[selecetedImages safeObjectAtIndex:i]];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectedImage];
        [tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10],
                                             NSForegroundColorAttributeName : [UIColor orangeColor]}
                                  forState:UIControlStateNormal];
        
        [tabBarItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:10],
                                             NSForegroundColorAttributeName : [UIColor blueColor]}
                                  forState:UIControlStateSelected];
        
        nav.tabBarItem = tabBarItem;
        [navs safeAddObject:nav];
    }
    
    self.viewControllers = navs;
}

@end

//
//  AppDelegate+Config.m
//  HJBasic
//
//  Created by a-375 on 2017/12/7.
//  Copyright © 2017年 a-375. All rights reserved.
//

#import "AppDelegate+Config.h"
#import "HJBaseTabBarController.h"

@implementation AppDelegate (Config)

- (void)enterRootTabBarController {
    HJBaseTabBarController *tabVC = [[HJBaseTabBarController alloc] init];
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible];
}


@end

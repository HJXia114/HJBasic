//
//  HJBaseTabBarController.h
//  HJBasic
//
//  Created by a-375 on 2017/11/29.
//  Copyright © 2017年 a-375. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HJBaseViewController;
@interface HJBaseTabBarController : UITabBarController

/**
 初始化TabBar.viewControllers
 
 @param viewControllers rootVCs
 @param titles tabName
 @param images    未选中图片
 @param selecetedImages 选中图片
 */
- (void)setupTabBarWithViewControllers:(NSArray <HJBaseViewController *>*)viewControllers titles:(NSArray <NSString *>*)titles images:(NSArray <NSString *>*)images selecetedImages:(NSArray <NSString *>*)selecetedImages;

@end

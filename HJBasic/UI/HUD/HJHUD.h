//
//  HJHUD.h
//  HJBasic
//
//  Created by a-375 on 2017/12/11.
//  Copyright © 2017年 a-375. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,HJHUDState) {
    HJHUDStateSuccessful,
    HJHUDStateError,
    HJHUDStateInfo,
    HJHUDStateWarning
};

typedef NS_ENUM(NSUInteger,HJHUDAnimationViewModel) {
    HJHUDAnimationViewModelDefault,
    HJHUDAnimationViewModelCircle,
    HJHUDAnimationViewModelFish
};

@interface HJHUD : NSObject

+ (HJHUD *)showToView:(UIView *)view;

+ (HJHUD *)showToView:(UIView *)view
            hideAfrer:(NSTimeInterval)delay;

+ (HJHUD *)showToView:(UIView *)view
                title:(NSString *)title;

+ (HJHUD *)showToView:(UIView *)view
                title:(NSString *)title
            hideAfter:(NSTimeInterval)delay;
+ (HJHUD *)showToView:(UIView *)view
                title:(NSString *)title
            hideAfter:(NSTimeInterval)delay
   animationViewModel:(HJHUDAnimationViewModel)animationModel;

+ (void)hideHUDForView:(UIView *)view;

- (void)show;
- (void)hide;
- (void)hideHUDAfterDelay:(NSTimeInterval)delay;
- (void)hideHUDWithTitle:(NSString *)title
              afterDelay:(NSTimeInterval)delay;

/*****************************Toast*****************************/

/**
 显示Toast 默认1.5S后消失
 */
+ (HJHUD *)showToastToView:(UIView *)view
                      title:(NSString *)title;

+ (HJHUD *)showToastToView:(UIView *)view
                      title:(NSString *)title
                  hideAfter:(NSTimeInterval)delay;

/*****************************HJHUDState*****************************/

/**
 显示特定样式HUD
 
 @param state 成功、错误、消息、警告样式
 */
+ (HJHUD *)showToView:(UIView *)view
                 title:(NSString *)title
             hideAfter:(NSTimeInterval)delay
                 state:(HJHUDState)state;

- (void)hideWithTitle:(NSString *)title
            hideAfter:(NSTimeInterval)delay
                state:(HJHUDState)state;
@end

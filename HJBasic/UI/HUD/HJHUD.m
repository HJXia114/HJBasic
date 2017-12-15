//
//  HJHUD.m
//  HJBasic
//
//  Created by a-375 on 2017/12/11.
//  Copyright © 2017年 a-375. All rights reserved.
//

#import "HJHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "UIColor+Additions.h"
#import "HJLoadingHUDView.h"

#define IMAGE_NAMED(_pointer) [UIImage imageNamed:_pointer]
@interface HJHUD ()

@property (nonatomic,strong) MBProgressHUD *mbHud;

@end

@implementation HJHUD

+ (HJHUD *)showToView:(UIView *)view {
    return [HJHUD showToView:view title:nil hideAfter:0];
}

+ (HJHUD *)showToView:(UIView *)view
            hideAfrer:(NSTimeInterval)delay {
    return [HJHUD showToView:view title:nil hideAfter:delay];
}

+ (HJHUD *)showToView:(UIView *)view
                title:(NSString *)title {
    return [HJHUD showToView:view title:title hideAfter:0];
}

+ (HJHUD *)showToView:(UIView *)view
                title:(NSString *)title
            hideAfter:(NSTimeInterval)delay {
    return [HJHUD hj_showToView:view title:title hideAfter:delay animationModel:HJHUDAnimationViewModelDefault];
}

+ (HJHUD *)showToView:(UIView *)view
                title:(NSString *)title
            hideAfter:(NSTimeInterval)delay
   animationViewModel:(HJHUDAnimationViewModel)animationModel {
    
    HJHUD *hjHud = [HJHUD hj_showToView:view title:title hideAfter:delay animationModel:animationModel];
    if (delay > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hjHud hide];
        });
    }
    
    return hjHud;
}


+ (void)hideHUDForView:(UIView *)view {
    [MBProgressHUD hideHUDForView:view animated:YES];
}

- (void)show {
    [self.mbHud showAnimated:YES];
}
- (void)hide {
    [self.mbHud hideAnimated:YES];
}
- (void)hideHUDAfterDelay:(NSTimeInterval)delay {
    [self.mbHud hideAnimated:YES afterDelay:delay];
}
- (void)hideHUDWithTitle:(NSString *)title
              afterDelay:(NSTimeInterval)delay {
    self.mbHud.label.text = title;
    [self.mbHud hideAnimated:YES afterDelay:delay];
}


+ (HJHUD *)showToastToView:(UIView *)view
                     title:(NSString *)title {
    return [HJHUD showToView:view title:title hideAfter:1.5];
}

+ (HJHUD *)showToastToView:(UIView *)view
                     title:(NSString *)title
                 hideAfter:(NSTimeInterval)delay {
    if (!view) return nil;
    
    HJHUD *hjHud = [HJHUD hjDefault_showToView:view title:title hideAfter:delay];
    hjHud.mbHud.mode = MBProgressHUDModeText;
    hjHud.mbHud.offset = CGPointMake(0, 120.0 / 568.0 * [UIScreen mainScreen].bounds.size.height);
    hjHud.mbHud.userInteractionEnabled = NO;
    hjHud.mbHud.margin = 10.0;
    
    return hjHud;
}


+ (HJHUD *)showToView:(UIView *)view
                title:(NSString *)title
            hideAfter:(NSTimeInterval)delay
                state:(HJHUDState)state {
    HJHUD *hjHud = [HJHUD hjDefault_showToView:view title:title hideAfter:delay];
    hjHud.mbHud.mode = MBProgressHUDModeCustomView;
    hjHud.mbHud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[HJHUD hj_imageNamedWithState:state]]];
    
    return hjHud;
}

- (void)hideWithTitle:(NSString *)title
            hideAfter:(NSTimeInterval)delay
                state:(HJHUDState)state {
    
}



+ (HJHUD *)hj_showToView:(UIView *)view title:(NSString *)title hideAfter:(NSTimeInterval)delay animationModel:(HJHUDAnimationViewModel)animationModel {
    if (!view) return nil;
    
    switch (animationModel) {
        case HJHUDAnimationViewModelDefault: {
           return [self hjDefault_showToView:view title:title hideAfter:delay];
        }
            break;
        case HJHUDAnimationViewModelCircle: {
           return [self hjCircle_showToView:view title:title hideAfter:delay];
        }
            break;
        case HJHUDAnimationViewModelFish: {
           return [self hjFish_showToView:view title:title hideAfter:delay];
        }
            break;
        default:
            break;
    }
    return nil;
}

+ (HJHUD *)hjDefault_showToView:(UIView *)view title:(NSString *)title hideAfter:(NSTimeInterval)delay {
    if (!view) return nil;
    
    HJHUD *hjHud = [[HJHUD alloc] init];
    MBProgressHUD *mbHud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    mbHud.label.numberOfLines = 0;
    mbHud.label.textColor = [UIColor colorWithHex:0x363636];
    mbHud.label.font = [UIFont systemFontOfSize:15];
    mbHud.margin = 15;
    mbHud.removeFromSuperViewOnHide = YES;
    mbHud.label.text = title;
    hjHud.mbHud = mbHud;
    return hjHud;
}

+ (HJHUD *)hjCircle_showToView:(UIView *)view title:(NSString *)title hideAfter:(NSTimeInterval)delay {
    if (!view) return nil;
    
    HJHUD *hjHud = [[HJHUD alloc] init];
    MBProgressHUD *mbHud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    mbHud.mode = MBProgressHUDModeCustomView;
    mbHud.margin = 10.0;
    mbHud.removeFromSuperViewOnHide = YES;
    mbHud.label.text = title;
    mbHud.contentColor = [UIColor colorWithHex:0x333333];
    mbHud.label.font = [UIFont systemFontOfSize:15.0];
    
    HJLoadingHUDView *loadingView = [[HJLoadingHUDView alloc] initWithFrame:CGRectMake(0, 0, 65, 65)];
    loadingView.centerImage = [UIImage imageNamed:@"Loading_fish"];
    [loadingView startAnimation];
    mbHud.customView = loadingView;
    hjHud.mbHud = mbHud;
    return hjHud;
}

+ (HJHUD *)hjFish_showToView:(UIView *)view title:(NSString *)title hideAfter:(NSTimeInterval)delay {
    if (!view) return nil;
    
    HJHUD *hjHud = [[HJHUD alloc] init];
    MBProgressHUD *mbHud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    mbHud.label.text = title;
    mbHud.mode = MBProgressHUDModeCustomView;
    
    UIImageView *aImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 157, 100)];
    aImageView.backgroundColor = [UIColor clearColor];
    aImageView.image = IMAGE_NAMED(@"LoadingOnePic");
    aImageView.animationImages = @[IMAGE_NAMED(@"LoadingOnePic"), IMAGE_NAMED(@"LoadingTwoPic"), IMAGE_NAMED(@"LoadingThreePic"), IMAGE_NAMED(@"LoadingFourPic"), IMAGE_NAMED(@"LoadingFivePic"), IMAGE_NAMED(@"LoadingSixPic")];
    aImageView.animationDuration = 0.7;
    aImageView.animationRepeatCount = 0;
    [aImageView startAnimating];
    
    mbHud.customView = aImageView;
    hjHud.mbHud = mbHud;
    return hjHud;
}

+ (NSString *)hj_imageNamedWithState:(HJHUDState)state {
    NSString *imageNamed = @"hsk_ic_warning";
    if (state == HJHUDStateSuccessful) {
        imageNamed = @"hud_success";
    } else if (state == HJHUDStateError) {
        imageNamed = @"hud_error";
    } else if (state == HJHUDStateWarning) {
        imageNamed = @"hsk_ic_warning";
    } else if (state == HJHUDStateInfo) {
        imageNamed = @"hud_info";
    }
    return imageNamed;
}
@end








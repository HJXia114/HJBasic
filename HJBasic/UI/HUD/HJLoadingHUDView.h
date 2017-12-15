//
//  HJLoadingHUDView.h
//  HJBasic
//
//  Created by a-375 on 2017/12/11.
//  Copyright © 2017年 a-375. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HJLoadingHUDView : UIView

//圆环颜色
@property (nonatomic,strong) UIColor *circleColor;
//圆环宽度
@property (nonatomic,assign) CGFloat circleWidth;
//中间图片
@property (nonatomic,strong) UIImage *centerImage;
//动画时间
@property (nonatomic,assign) CGFloat circleDuration;
///开始动画
- (void)startAnimation;
///结束动画
- (void)stopAimation;

@end

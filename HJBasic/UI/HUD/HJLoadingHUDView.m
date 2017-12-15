//
//  HJLoadingHUDView.m
//  HJBasic
//
//  Created by a-375 on 2017/12/11.
//  Copyright © 2017年 a-375. All rights reserved.
//

#import "HJLoadingHUDView.h"
#import "HJCircleView.h"

#define kHJCircleViewAnimationKey @"kHJCircleViewAnimationKey"

@interface HJLoadingHUDView ()

@property (nonatomic,strong) UIImageView *centerImageView;
@property (nonatomic,strong) HJCircleView *circleView;

@end

@implementation HJLoadingHUDView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.centerImageView];
        [self addSubview:self.circleView];
    }
    return self;
}

- (void)updateSubviewsFrame {
    CGPoint centerPoint = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    self.centerImageView.frame = self.bounds;
    self.centerImageView.center = centerPoint;
    self.circleView.frame = self.bounds;
    self.circleView.center = centerPoint;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self updateSubviewsFrame];
}

-(CGSize)intrinsicContentSize {
    return self.bounds.size;
}

- (void)startAnimation {
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    basicAnimation.fromValue = @0;
    basicAnimation.toValue = @(M_PI * 2.0);
    basicAnimation.duration = self.circleDuration > 0 ? self.circleDuration : 1.5;
    basicAnimation.repeatCount = MAXFLOAT;
    basicAnimation.removedOnCompletion = NO;
    basicAnimation.fillMode = kCAFillModeForwards;
    [self.circleView.layer addAnimation:basicAnimation forKey:kHJCircleViewAnimationKey];
}

- (void)stopAimation {
    [self.circleView.layer removeAnimationForKey:kHJCircleViewAnimationKey];
}


#pragma mark - setter
- (void)setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
    self.circleView.circleColor = circleColor;
}

- (void)setCircleWidth:(CGFloat)circleWidth {
    _circleWidth = circleWidth;
    self.circleView.circleWidth = circleWidth;
}

- (void)setCenterImage:(UIImage *)centerImage {
    _centerImage = centerImage;
    self.centerImageView.image = centerImage;
}


#pragma mark - getter
- (UIImageView *)centerImageView {
    if (_centerImageView == nil) {
        _centerImageView = [[UIImageView alloc] init];
        _centerImageView.contentMode = UIViewContentModeCenter;
    }
    return _centerImageView;
}

- (HJCircleView *)circleView {
    if (_circleView == nil) {
        _circleView = [[HJCircleView alloc] init];
    }
    return _circleView;
}
@end





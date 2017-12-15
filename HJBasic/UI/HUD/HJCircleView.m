//
//  HJCircleView.m
//  HJBasic
//
//  Created by a-375 on 2017/12/11.
//  Copyright © 2017年 a-375. All rights reserved.
//

#import "HJCircleView.h"
#import "UIColor+Additions.h"

@interface HJCircleView ()

@property (nonatomic, strong) CAGradientLayer *gradientLayerTop;
@property (nonatomic, strong) CAGradientLayer *gradientLayerBottom;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation HJCircleView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (void)updateSubLayerFrame {
    self.shapeLayer.frame = self.bounds;
    self.gradientLayerTop.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height / 2);
    self.gradientLayerBottom.frame = CGRectMake(0, self.frame.size.height / 2, self.frame.size.width, self.frame.size.height / 2);
    
    CGFloat circleW = (self.circleWidth > 0) ? self.circleWidth : 2.0;
    CGPoint arcCenterPoint = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:arcCenterPoint
                                                        radius:self.bounds.size.width / 2 - circleW
                                                    startAngle:M_PI * 0.01
                                                      endAngle:M_PI * 1.5
                                                     clockwise:YES];
    self.shapeLayer.path = path.CGPath;
    self.layer.mask = self.shapeLayer;
}

-(void)layoutSubviews {
    [super layoutSubviews];
 
    [self updateSubLayerFrame];
}

#pragma mark - setter
-(void)setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
   
    UIColor *circleC = _circleColor ? : [UIColor colorWithHex:0x00afff];
    
    self.gradientLayerTop.colors = @[(__bridge id)circleC.CGColor, (__bridge id)[circleC colorWithAlphaComponent:0.5].CGColor];
    self.gradientLayerBottom.colors = @[(__bridge id)[circleC colorWithAlphaComponent:0.5].CGColor, (__bridge id)[circleC colorWithAlphaComponent:0].CGColor];
    self.shapeLayer.strokeColor = circleC.CGColor;
}

-(void)setCircleWidth:(CGFloat)circleWidth {
    if (circleWidth == self.circleWidth) return;
    
    _circleWidth = circleWidth;
    self.shapeLayer.lineWidth = (_circleWidth > 0) ? _circleWidth : 2.0;
    [self updateSubLayerFrame];
}

#pragma mark - getter
-(CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _shapeLayer.strokeColor = [UIColor colorWithHex:0x00afff].CGColor;
        _shapeLayer.lineWidth = 2.0;
        _shapeLayer.lineCap = kCALineCapRound;
        _shapeLayer.lineJoin = kCALineJoinRound;
    }
    return _shapeLayer;
}

//The default values  are [.5,0] and [.5,1] respectively
-(CAGradientLayer *)gradientLayerTop {
    if (!_gradientLayerTop) {
        _gradientLayerTop = [CAGradientLayer layer];
        UIColor *circleC = self.circleColor ? : [UIColor colorWithHex:0x00afff];
        _gradientLayerTop.colors = @[(__bridge id)circleC.CGColor, (__bridge id)[circleC colorWithAlphaComponent:0.5].CGColor];
        [self.layer addSublayer:_gradientLayerTop];
    }
    return _gradientLayerTop;
}

-(CAGradientLayer *)gradientLayerBottom {
    if (!_gradientLayerBottom) {
        _gradientLayerBottom = [CAGradientLayer layer];
        _gradientLayerBottom.startPoint = CGPointMake(0, 0.5);
        _gradientLayerBottom.endPoint = CGPointMake(1, 0.5);
        UIColor *circleC = self.circleColor ? : [UIColor colorWithHex:0x00afff];
        _gradientLayerBottom.colors = @[(__bridge id)[circleC colorWithAlphaComponent:0.5].CGColor, (__bridge id)[circleC colorWithAlphaComponent:0].CGColor];
        [self.layer addSublayer:_gradientLayerBottom];
    }
    return _gradientLayerBottom;
}



@end

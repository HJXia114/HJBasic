//
//  UIColor+Additions.m
//  HSKCommon
//
//  Created by Carl on 2016/11/22.
//  Copyright © 2016年 Carl. All rights reserved.
//

#import "UIColor+Additions.h"

@implementation UIColor (Additions)

+ (UIColor *)randomColor {

    return ([self randomColorWithAlpha:1]);
}

+ (UIColor *)colorWithHex:(UInt32)hex {
    NSUInteger r = (hex & 0xff0000) >> 16;//右移十六位刚好取得红色
    NSUInteger g = (hex & 0x00ff00) >> 8;
    NSUInteger b = hex & 0x0000ff;
    
    return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1.0];
}

+ (UIColor*)colorWithString:(NSString*)hex
{
    NSString *cString = [hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([cString length] < 6) return [UIColor whiteColor];
    
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];

    }
    else if ([cString hasPrefix:@"0x"] || [cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    if ([cString length] != 6) return [UIColor whiteColor];
    
    unsigned int rgb;
    [[NSScanner scannerWithString:cString] scanHexInt:&rgb];//把字符串添加到NSScanner的string的属性,同时扫描字符串中的int类型保存到rgb中
    return [self colorWithHex:rgb];
}

+ (UIColor *)randomColorWithAlpha:(CGFloat)alpha {
    u_int32_t z = 999999999;
    
    double r = ((double)(arc4random() % z) / z);
    double g = ((double)(arc4random() % z) / z);
    double b = ((double)(arc4random() % z) / z);
    
    return ([UIColor colorWithRed:r green:g blue:b alpha:alpha]);
}

@end

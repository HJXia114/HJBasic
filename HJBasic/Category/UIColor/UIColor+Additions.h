//
//  UIColor+Additions.h
//  HSKCommon
//
//  Created by Carl on 2016/11/22.
//  Copyright © 2016年 Carl. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (Additions)


+ (UIColor *)colorWithHex:(UInt32)hex;

// 0xaaaaaa, 0Xaaaaaa, #aaaaaa
+ (UIColor*)colorWithString:(NSString*)string;

+ (UIColor *)randomColor;


@end

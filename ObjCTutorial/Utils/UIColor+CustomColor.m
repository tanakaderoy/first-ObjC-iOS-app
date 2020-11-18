//
//  UIColor+CustomColor.m
//  ObjCTutorial
//
//  Created by Tanaka Mazivanhanga on 11/17/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

#import "UIColor+CustomColor.h"

@implementation UIColor (CustomColor)

+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue opacity : (CGFloat)opacity{
    CGFloat r = red/255;
    CGFloat g = green/ 255;
    CGFloat b = blue/255;
    return [UIColor colorWithRed:r green:g blue:b alpha:opacity];
}

@end

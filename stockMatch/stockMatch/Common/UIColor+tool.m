//
//  UIColor+tool.m
//  YinSuFenQi
//
//  Created by lishaopeng on 2019/1/8.
//  Copyright © 2019年 lishaopeng. All rights reserved.
//

#import "UIColor+tool.h"

@implementation UIColor (tool)


+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6)
        return [UIColor whiteColor];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor whiteColor];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)hexadecimal
{
    const char *cString = [hexadecimal cStringUsingEncoding: NSASCIIStringEncoding];
    long int hex;
    
    if (cString[0] == '#')
    {
        hex = strtol(cString + 1, NULL, 16);
    }
    else
    {
        hex = strtol(cString, NULL, 16);
    }
    
    return [[self class] colorWithHex: (UInt32)hex];
}

+(UIColor *)randomColor
{
    CGFloat red = arc4random()%255/255.0f;
    CGFloat green = arc4random()%255/255.0f;
    CGFloat blue = arc4random()%255/255.0f;
    UIColor * color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
    return color;
}

+ (UIColor *)colorWithWholeRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:alpha];
}

#pragma mark -- 辅助方法


+ (UIColor *)colorWithHex:(UInt32)hexadecimal
{
    CGFloat red, green, blue;
    
    red = (hexadecimal >> 16) & 0xFF;
    green = (hexadecimal >> 8) & 0xFF;
    blue = hexadecimal & 0xFF;
    
    return [UIColor colorWithRed: red / 255.0f green: green / 255.0f blue: blue / 255.0f alpha: 1.0f];
}

@end

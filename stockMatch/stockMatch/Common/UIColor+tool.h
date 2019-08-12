//
//  UIColor+tool.h
//  YinSuFenQi
//
//  Created by lishaopeng on 2019/1/8.
//  Copyright © 2019年 lishaopeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (tool)

/**
 * 十六进制颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/**
 * 随机颜色
 */
+(UIColor *)randomColor;

/**
 * RGB颜色
 */
+ (UIColor *)colorWithWholeRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END

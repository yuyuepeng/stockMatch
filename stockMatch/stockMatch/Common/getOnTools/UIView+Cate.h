//
//  UIView+Cate.h
//  getOn
//
//  Created by 扶摇先生 on 2018/4/11.
//  Copyright © 2018年 扶摇先生. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Cate)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat   bottom;
@property (nonatomic, assign) CGFloat   right;

- (void)setActivityWithTag:(NSInteger)tag target:(nullable id)target action:(nullable SEL)action;

@end

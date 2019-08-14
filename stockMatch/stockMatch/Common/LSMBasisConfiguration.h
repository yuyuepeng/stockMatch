//
//  LSMBasisConfiguration.h
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/13.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#ifndef LSMBasisConfiguration_h
#define LSMBasisConfiguration_h
#define weakenSelf __weak typeof(self) weakSelf = self;

///------ 尺寸 ------
#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight    [UIScreen mainScreen].bounds.size.height
#define ScreenSize      [UIScreen mainScreen].bounds.size

//是否是iPhoneX系列
#define isIPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

//导航栏相关
#define  Height_StatusBar   [[UIApplication sharedApplication] statusBarFrame].size.height
#define  Height_NavBar      (Height_StatusBar +44.0f)
#define  Height_TabBar      (isIPHONE_X ? (49.f+34.f) : 49.f)

//匹配view宽高度
#define autoScaleW(width) [LSMCommonTool autoScaleW:width]

//色值
#define RGB(R,G,B)                 [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f]
#define RGBA(R,G,B,A)              [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]


#endif /* LSMBasisConfiguration_h */

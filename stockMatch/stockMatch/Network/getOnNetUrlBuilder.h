//
//  getOnNetUrlBuilder.h
//  newApplicationNetWork
//
//  Created by 扶摇先生 on 2018/3/23.
//  Copyright © 2018年 扶摇先生. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, getOnNetUrlBuilderType) {
    //登录
    getOnNetUrlBuilderTypeLogin = 0,
    //注册
    getOnNetUrlBuilderTypeRegister,
    //更改密码
    getOnNetUrlBuilderTypeChangePassWord,
    //测试
    getOnNetUrlBuilderTypeTest,
    
    //首页data
    getOnNetUrlBuilderTypeHomePage
    
};

@interface getOnNetUrlBuilder : NSObject
+ (NSString *)urlWithPathType:(getOnNetUrlBuilderType) type ;
@end

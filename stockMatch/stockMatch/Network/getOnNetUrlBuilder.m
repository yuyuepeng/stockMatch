//
//  getOnNetUrlBuilder.m
//  newApplicationNetWork
//
//  Created by 扶摇先生 on 2018/3/23.
//  Copyright © 2018年 扶摇先生. All rights reserved.
//

#import "getOnNetUrlBuilder.h"
//NSString *const baseUrl = @"http://ek7efpZ.91xianpai.com";
//NSString *const baseUrl = @"http://api.geton.com/v1";
//NSString *const baseUrl = @"http://172.16.1.16:8080/v1";
//NSString *const baseUrl = @"http://172.16.1.112:9080/geton_crm";
NSString *const baseUrl = @"https://www.easy-mock.com/mock/5d5b53242c32cf1d296d19c3/example";
NSString *const esayBaseUrl = @"https://www.easy-mock.com/mock/5d5b53242c32cf1d296d19c3/example";


@implementation getOnNetUrlBuilder
+ (NSString *)urlWithPathType:(getOnNetUrlBuilderType)type {
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@",baseUrl];
    NSString *url1 = [getOnNetUrlBuilder appendPathWithPathType:type];
    [url appendString:url1];
    return url;
}
+ (NSString *)appendPathWithPathType:(getOnNetUrlBuilderType) type {
    switch (type) {//
        case getOnNetUrlBuilderTypeLogin:
            return @"/ysmLogin";
            break;
        case getOnNetUrlBuilderTypeRegister:
            return @"/ysmRegister";
            break;
        case getOnNetUrlBuilderTypeChangePassWord:
            return @"/changePassWord";
            break;
        case getOnNetUrlBuilderTypeTest:
            return @"/query";
            break;
        case getOnNetUrlBuilderTypeHomePage:
            return @"/homePagelData";
            break;
        default:
            break;
    }
}
@end

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


@implementation getOnNetUrlBuilder
+ (NSString *)urlWithPathType:(getOnNetUrlBuilderType)type {
    NSMutableString *url = [NSMutableString stringWithFormat:@"%@",baseUrl];
    NSString *url1 = [getOnNetUrlBuilder appendPathWithPathType:type];
    [url appendString:url1];
    return url;
}
+ (NSString *)appendPathWithPathType:(getOnNetUrlBuilderType) type {
    switch (type) {
        case getOnNetUrlBuilderTypeLogin:
            return @"/user/login";
            break;
        case getOnNetUrlBuilderTypeBanner:
            return @"/banner/1";
            break;
        case getOnNetUrlBuilderTypeHotsale:
            return @"/hotsale";
            break;
        case getOnNetUrlBuilderTypeSelect:
            return @"/car/list";
            break;
        case getOnNetUrlBuilderTypeHelp:
            return @"/question";
            break;
        case getOnNetUrlBuilderTypeProvince:
            return @"/store/province";
            break;
        case getOnNetUrlBuilderTypeTown:http://api.geton.com/v1//17
            return @"/store/city";
            break;
        case getOnNetUrlBuilderTypeStoreList:
            return @"/store/list";
            break;
        case getOnNetUrlBuilderTypeCarDetail:
            return @"/car/detail";
            break;
        case getOnNetUrlBuilderTypeSmsSend:
            return @"/sms/send";
            break;
        case getOnNetUrlBuilderTypeCollectionList:
            return @"/user/collection";
            break;
        case getOnNetUrlBuilderTypeSuggestionSub:
            return @"/user/question";
            break;
        case getOnNetUrlBuilderTypeCollect:
            return @"/car/iscollection";
            break;
        case getOnNetUrlBuilderTypeLeaveInfo:
            return @"/customer/information";
            break;
        case getOnNetUrlBuilderTypeLogout:
            return @"/user/loginout";
            break;
        case getOnNetUrlBuilderTypeBuyCar:
            return @"/car/buyinfo";
            break;
        case getOnNetUrlBuilderTypeRecommendCar:
            return @"/recommendcar";
            break;
        case getOnNetUrlBuilderTypeBuyCarTwo:
            return @"/car/buy";
            break;
        case getOnNetUrlBuilderTypeTest:
            return @"/query";
            break;
        default:
            break;
    }
}
@end

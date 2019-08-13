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
    //banner
    getOnNetUrlBuilderTypeBanner,
    
    //热销
    getOnNetUrlBuilderTypeHotsale,
    //推荐
    getOnNetUrlBuilderTypeRecommendCar,
    //选车
    getOnNetUrlBuilderTypeSelect,
    //帮助中心
    getOnNetUrlBuilderTypeHelp,
    //省份列表
    getOnNetUrlBuilderTypeProvince,
    //城市列表
    getOnNetUrlBuilderTypeTown,
    //门店列表
    getOnNetUrlBuilderTypeStoreList,
    //车辆详情
    getOnNetUrlBuilderTypeCarDetail,
    //获取验证码
    getOnNetUrlBuilderTypeSmsSend,
    //收藏列表
    getOnNetUrlBuilderTypeCollectionList,
    //提交意见反馈
    getOnNetUrlBuilderTypeSuggestionSub,
    //购买车辆
    getOnNetUrlBuilderTypeBuyCar,
    //收藏取消收藏
    getOnNetUrlBuilderTypeCollect,
    //主页留资
    getOnNetUrlBuilderTypeLeaveInfo,
    //退出登录
    getOnNetUrlBuilderTypeLogout,
    //退出登录
    getOnNetUrlBuilderTypeBuyCarTwo,
    //测试
    getOnNetUrlBuilderTypeTest
};

@interface getOnNetUrlBuilder : NSObject
+ (NSString *)urlWithPathType:(getOnNetUrlBuilderType) type ;
@end

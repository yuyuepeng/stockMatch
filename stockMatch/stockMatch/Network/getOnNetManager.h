//
//  getOnNetManager.h
//  newApplicationNetWork
//
//  Created by 扶摇先生 on 2018/3/23.
//  Copyright © 2018年 扶摇先生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "getOnNetUrlBuilder.h"
#import <AFNetworking.h>
typedef NS_ENUM(NSInteger, getOnNetUrlBuilderSpellType) {
    
    getOnNetUrlBuilderSpellTypePath = 0//路径参数
    //banner
    
};
typedef void(^Success)(NSInteger status, id response);

typedef void(^Failure)(NSInteger code, NSString *msg);

@interface getOnNetManager : NSObject

@property(nonatomic, strong) AFHTTPSessionManager *manager;

+ (instancetype)shareManager;

- (void)getWithPathtype:(getOnNetUrlBuilderType)pathType parameters:(NSDictionary *)parameters succeed:(Success)success fail:(Failure)failure;

- (void)getEasyNetWithPathtype:(getOnNetUrlBuilderType)pathType parameters:(NSDictionary *)parameters succeed:(Success)success fail:(Failure)failure;


- (void)getWithPathtype:(getOnNetUrlBuilderType)pathType pathPage:(NSString *)page succeed:(Success)success fail:(Failure)failure;

//- (void)getWithPathtype:(getOnNetUrlBuilderType)pathType spellType:(getOnNetUrlBuilderSpellType)spelltype parameters:(NSDictionary *)parameters succeed:(Success)success fail:(Failure)failure;

- (void)postWithPathType:(getOnNetUrlBuilderType)pathType form:(NSDictionary *)form succeed:(Success)success fail:(Failure)failure;
@end

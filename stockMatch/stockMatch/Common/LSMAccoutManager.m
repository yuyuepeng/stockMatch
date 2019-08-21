//
//  LSMAccoutManager.m
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/21.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import "LSMAccoutManager.h"
static LSMAccoutManager *manager;
@implementation LSMAccoutManager

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [super allocWithZone:zone];
    });
    return manager;
}
+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}
- (id)mutableCopyWithZone:(NSZone *)zone {
    return manager;
}
- (id)copyWithZone:(NSZone *)zone {
    return manager;
}

@end

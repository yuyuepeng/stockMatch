//
//  LSMAccoutManager.h
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/21.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSMAccoutManager : NSObject

@property(nonatomic, copy) NSString *phone;


+ (instancetype)shareManager;
@end

NS_ASSUME_NONNULL_END

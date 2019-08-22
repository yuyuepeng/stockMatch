//
//  YSMBaseController.h
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/12.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSMBaseController : UIViewController

@property(nonatomic, copy) NSString *navTitle;

- (void)createNavigationBarWithTitle:(NSString *)title;

- (void)addLeftButtonWithAction;
// 返回上一层控制器的方法  可重写
- (void)pop;
//
- (void)getMainQueue:(void (^)(void))block;
@end

NS_ASSUME_NONNULL_END

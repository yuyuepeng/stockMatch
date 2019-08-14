//
//  YSMScrollTextView.h
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/14.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSMScrollTextModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YSMScrollTextView : UIScrollView

- (instancetype)initWithFrame:(CGRect)frame models:(NSArray <YSMScrollTextModel *>*)models;

- (void)refreshDataWithModels:(NSArray <YSMScrollTextModel *> *)models;

@end

NS_ASSUME_NONNULL_END

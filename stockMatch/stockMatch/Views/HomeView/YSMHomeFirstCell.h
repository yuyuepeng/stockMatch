//
//  YSMHomeFirstCell.h
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/14.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YSMHomeFirstCellDelegate <NSObject>

- (void)newsClickWithIndex:(NSInteger)tag;

- (void)guandianWithIndex:(NSInteger)tag;

- (void)zixunClickWithIndex:(NSInteger)tag;

@end

NS_ASSUME_NONNULL_BEGIN

@interface YSMHomeFirstCell : UITableViewCell

@property(nonatomic, weak) id<YSMHomeFirstCellDelegate>delegate;

@end

NS_ASSUME_NONNULL_END

//
//  YSMCarouselView.h
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/13.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YSMCarouselView;

@protocol YSMCarouselViewDelegate <NSObject>

- (void)carouselView:(YSMCarouselView *_Nullable)carouselView clickWithIndex:(NSInteger)index;

@end


NS_ASSUME_NONNULL_BEGIN

@interface YSMCarouselView : UIView

@property(nonatomic, weak) id<YSMCarouselViewDelegate>delegate;

@property(nonatomic, copy) NSString *identifier;

- (void)addImagesWithUrls:(NSArray <NSString *> *)imageUrls;

- (void)addImages:(NSArray <UIImage *> *)images;


@end

NS_ASSUME_NONNULL_END

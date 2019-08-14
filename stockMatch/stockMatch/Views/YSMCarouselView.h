//
//  YSMCarouselView.h
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/13.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN

@interface YSMCarouselView : UIView

- (void)addImagesWithUrls:(NSArray <NSString *> *)imageUrls;

- (void)addImages:(NSArray <UIImage *> *)images;


@end

NS_ASSUME_NONNULL_END

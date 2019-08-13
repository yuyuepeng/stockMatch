//
//  YSMCarouselView.h
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/13.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,YSMCarouselViewType)  {
    YSMCarouselViewTypeUrl = 0,
    YSMCarouselViewTypeImage
    
};

NS_ASSUME_NONNULL_BEGIN

@interface YSMCarouselView : UIView

- (void)addImagesWithUrls:(NSArray <NSString *> *)imageUrls type:(YSMCarouselViewType)type;

- (void)addImages:(NSArray <UIImage *> *)images type:(YSMCarouselViewType)type;


@end

NS_ASSUME_NONNULL_END

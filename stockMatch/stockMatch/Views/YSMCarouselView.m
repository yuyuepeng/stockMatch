//
//  YSMCarouselView.m
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/13.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import "YSMCarouselView.h"

@interface YSMCarouselView ()<UIScrollViewDelegate>

@property(nonatomic, strong) UIScrollView *scrollView;

@property(nonatomic, assign) NSInteger imageNum;


//@property(nonatomic, strong) NSArray <UIImage *> *images;
//
//@property(nonatomic, strong) NSArray <NSString *> *imageUrls;

@end

@implementation YSMCarouselView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.scrollView];
    }
    return self;
}
- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.pagingEnabled = YES;
        _scrollView.alwaysBounceHorizontal = YES;
        _scrollView.delegate = self;
    }
    return _scrollView;
}
- (void)addImages:(NSArray<UIImage *> *)images type:(YSMCarouselViewType)type {
//    _images = images;
    _imageNum = images.count;
    self.scrollView.contentSize = CGSizeMake(self.width * (images.count + 2), self.height);
    for (NSInteger i = 0; i < images.count; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width * (i + 1), 0, self.width, self.height)];
        imageView.tag = 1000 + i;
        [imageView setImage:images[i]];
        [self.scrollView addSubview:imageView];
    }
    [self.scrollView setContentOffset:CGPointMake(self.width, 0)];
    UIImageView *left = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    left.tag = 11;
    [left setImage:images[images.count - 1]];
    [self.scrollView addSubview:left];
    UIImageView *right = [[UIImageView alloc] initWithFrame:CGRectMake(self.width * (images.count + 1), 0, self.width, self.height)];
    [right setImage:images[0]];
    right.tag = 12;
    [self.scrollView addSubview:right];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger num = (self.scrollView.contentOffset.x + 1)/(self.width);
    if (num == _imageNum + 1) {
        num = 1;
    }else if(num == 0 ){
        num = _imageNum;
    }
    
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self scrollViewDidEndDecelerating:scrollView];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat width = self.width;
    NSInteger numb = (self.scrollView.contentOffset.x + width * 0.5)/width;
    if (numb == _imageNum + 1) {
        [self.scrollView setContentOffset:CGPointMake(width, 0)];
    }else if (numb == 0) {
        [self.scrollView setContentOffset:CGPointMake(width * _imageNum, 0)];
    }
}
- (void)addImagesWithUrls:(NSArray<NSString *> *)imageUrls type:(YSMCarouselViewType)type {
//    _imageUrls = imageUrls;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

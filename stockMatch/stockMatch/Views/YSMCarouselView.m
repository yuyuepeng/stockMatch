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

@property(nonatomic, strong) UIPageControl *page;

@property(nonatomic, strong) NSTimer *timer;

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
- (void)addImages:(NSArray<UIImage *> *)images {
//    _images = images;
    _imageNum = images.count;
    self.scrollView.contentSize = CGSizeMake(self.width * (images.count + 2), self.height);
    for (NSInteger i = 0; i < images.count; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width * (i + 1), 0, self.width, self.height)];
        imageView.tag = 1000 + i;
        [imageView setImage:images[i]];
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)]];
        [self.scrollView addSubview:imageView];
    }
    [self.scrollView setContentOffset:CGPointMake(self.width, 0)];
    UIImageView *left = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    left.tag = 11;
    left.userInteractionEnabled = YES;
    [left addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)]];
    [left setImage:images[images.count - 1]];
    [self.scrollView addSubview:left];
    UIImageView *right = [[UIImageView alloc] initWithFrame:CGRectMake(self.width * (images.count + 1), 0, self.width, self.height)];
    [right setImage:images[0]];
    right.tag = 12;
    right.userInteractionEnabled = YES;
    [right addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)]];
    [self.scrollView addSubview:right];
    [self createPagecontrol];
    [self addTimer];
    
}
- (void)tapClick:(UIGestureRecognizer *)tap {
    NSInteger tag = tap.view.tag;
    if (self.delegate &&[self.delegate respondsToSelector:@selector(carouselView:clickWithIndex:)]) {
        if (tag == 11) {
            [self.delegate carouselView:self clickWithIndex:_imageNum - 1];
        }else if (tag == 12) {
            [self.delegate carouselView:self clickWithIndex:0];
        }else {
            [self.delegate carouselView:self clickWithIndex:tag - 1000];
        }
    }
    
}
- (void)addTimer {
    weakenSelf
    if (@available(iOS 10.0, *)) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
            NSInteger index = weakSelf.page.currentPage;
            if (index == weakSelf.imageNum + 1) {
                index = 0;
            }else {
                index += 1;
            }
//            NSLog(@"1--%ld",index);
            [weakSelf.scrollView setContentOffset:CGPointMake(weakSelf.width * (index + 1), 0) animated:YES];
        }];
    } else {
        _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(repeatAction) userInfo:nil repeats:YES];
        // Fallback on earlier versions
    }
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
}
- (void)repeatAction {
    NSInteger index = self.page.currentPage;
    if (index == self.imageNum + 1) {
        index = 0;
    }else {
        index += 1;
    }
    [self.scrollView setContentOffset:CGPointMake(self.width * (index + 1), 0) animated:YES];
}
- (void)createPagecontrol {
    self.page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.height - 40, self.width, 30)];
    self.page.currentPage = 0;
    self.page.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    self.page.pageIndicatorTintColor = [UIColor blackColor];
    self.page.numberOfPages = _imageNum;
    [self.page addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.page];
    
}
- (void)onClick {
    NSInteger index = self.page.currentPage;
    if (index == self.imageNum + 1) {
        index = 0;
    }else {
        index += 1;
    }
    [self.scrollView setContentOffset:CGPointMake(self.width * (index + 1), 0) animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger num = (self.scrollView.contentOffset.x + 1)/(self.width);
    if (num == _imageNum + 1) {
        num = 1;
    }else if(num == 0 ){
        num = _imageNum;
    }
    self.page.currentPage = num - 1;

//    NSLog(@"2--%ld",num);

}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self scrollViewDidEndDecelerating:scrollView];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat width = self.width;
    NSInteger numb = (self.scrollView.contentOffset.x + width * 0.5)/width;
    if (numb == _imageNum + 1) {
        [self.scrollView setContentOffset:CGPointMake(width, 0) animated:NO];
    }else if (numb == 0) {
        [self.scrollView setContentOffset:CGPointMake(width * _imageNum, 0) animated:YES];
    }
//    NSLog(@"3--%ld",numb);

}
- (void)addImagesWithUrls:(NSArray<NSString *> *)imageUrls {
    _imageNum = imageUrls.count;
    self.scrollView.contentSize = CGSizeMake(self.width * (imageUrls.count + 2), self.height);
    for (NSInteger i = 0; i < imageUrls.count; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width * (i + 1), 0, self.width, self.height)];
        imageView.tag = 1000 + i;
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrls[i]]];
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)]];
        [self.scrollView addSubview:imageView];
    }
    [self.scrollView setContentOffset:CGPointMake(self.width, 0)];
    UIImageView *left = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    left.tag = 11;
    [left sd_setImageWithURL:[NSURL URLWithString:imageUrls[imageUrls.count - 1]]];
    left.userInteractionEnabled = YES;
    [left addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)]];
    [self.scrollView addSubview:left];
    
    
    UIImageView *right = [[UIImageView alloc] initWithFrame:CGRectMake(self.width * (imageUrls.count + 1), 0, self.width, self.height)];
    right.userInteractionEnabled = YES;
    [right addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)]];
    [right sd_setImageWithURL:[NSURL URLWithString:imageUrls[0]]];
    right.tag = 12;
    [self.scrollView addSubview:right];
    [self createPagecontrol];
    [self addTimer];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

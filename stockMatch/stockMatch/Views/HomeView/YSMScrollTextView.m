//
//  YSMScrollTextView.m
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/14.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import "YSMScrollTextView.h"

@interface YSMScrollContentView : UIView

@property(nonatomic, strong) UILabel *timeLabel;

@property(nonatomic, strong) UILabel *contentLabel;

@end

@implementation YSMScrollContentView

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, self.width - 30, 20)];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = Orange_ThemeColor;
    }
    return _timeLabel;
}
- (UILabel *)contentLabel {
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, self.timeLabel.bottom + 5, self.width - 30, 50)];
        _contentLabel.textColor = RGB(51, 51, 51);
        _contentLabel.font = [UIFont boldSystemFontOfSize:14];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.numberOfLines = 2;
    }
    return _contentLabel;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.timeLabel];
        [self addSubview:self.contentLabel];
    }
    return self;
}

@end


@interface YSMScrollTextView()<UIScrollViewDelegate>



@property(nonatomic, strong) NSTimer *timer;

@property(nonatomic, copy) NSArray <YSMScrollTextModel *>*models;




@end

@implementation YSMScrollTextView {
    NSInteger currentPage;
}

- (instancetype)initWithFrame:(CGRect)frame models:(NSArray <YSMScrollTextModel *>*)models {
    self = [super initWithFrame:frame];
    if (self) {
        _models = models;
        
        self.delegate = self;
        self.pagingEnabled = YES;
        self.scrollEnabled = NO;
        self.contentSize = CGSizeMake(self.width, self.height * (self.models.count + 2));
        self.contentOffset = CGPointMake(0, self.height);
//        n = 1;
        for (NSInteger i = 0; i < self.models.count; i ++) {
            YSMScrollContentView *contentView = [[YSMScrollContentView alloc] initWithFrame:CGRectMake(0, self.height * (i + 1), self.width, self.height)];
            contentView.tag = 10000 + i;
            contentView.contentLabel.text = self.models[i].content;
            contentView.timeLabel.text = self.models[i].time;
            [self addSubview:contentView];
        }
        YSMScrollContentView *left = [[YSMScrollContentView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        left.tag = 21;
        left.timeLabel.text = self.models[self.models.count - 1].time;
        [self addSubview:left];
        left.contentLabel.text = self.models[self.models.count - 1].content;
        YSMScrollContentView *right = [[YSMScrollContentView alloc] initWithFrame:CGRectMake(0, self.height * (self.models.count + 1), self.width, self.height)];
        right.tag = 22;
        [self addSubview:right];
        right.contentLabel.text = self.models[0].content;
        right.timeLabel.text = self.models[0].time;
        currentPage = 0;
        weakenSelf
        if (@available(iOS 10.0, *)) {
            _timer = [NSTimer scheduledTimerWithTimeInterval:3 repeats:YES block:^(NSTimer * _Nonnull timer) {
                NSInteger index = self->currentPage;
                if (index == weakSelf.models.count + 1) {
                    index = 0;
                }else {
                    index += 1;
                }
                [weakSelf setContentOffset:CGPointMake(0, weakSelf.height * (index + 1)) animated:YES];
                //            NSLog(@"1--%ld",index);
            }];
        } else {
            _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(repeatAction) userInfo:nil repeats:YES];
            // Fallback on earlier versions
        }
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return self;
}
- (void)repeatAction {
    NSInteger index = currentPage;
    if (index == self.models.count + 1) {
        index = 0;
    }else {
        index += 1;
    }
    [self setContentOffset:CGPointMake(0, self.height * (index + 1)) animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger num = (self.contentOffset.y + 1)/(self.height);
    if (num == self.models.count + 1) {
        num = 1;
    }else if(num == 0 ){
        num = self.models.count;
    }
    currentPage = num - 1;
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self scrollViewDidEndDecelerating:scrollView];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
 
    NSLog(@"%f",self.contentOffset.y);
    CGFloat height = self.height;
    NSInteger numb = (self.contentOffset.y + height * 0.5)/height;
    if (numb == self.models.count + 1) {
        [self setContentOffset:CGPointMake(0, height) animated:NO];
    }else if (numb == 0) {
        [self setContentOffset:CGPointMake(0, height * self.models.count) animated:YES];
    }
    
}
- (void)refreshDataWithModels:(NSArray<YSMScrollTextModel *> *)models {

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

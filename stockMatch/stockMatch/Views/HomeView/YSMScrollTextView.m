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
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, self.timeLabel.bottom + 10, self.width - 30, 50)];
        _contentLabel.textColor = RGB(51, 51, 51);
        _contentLabel.font = [UIFont systemFontOfSize:14];
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

@property(nonatomic, strong) NSArray *arr;




@end

@implementation YSMScrollTextView {
    NSInteger currentPage;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.arr = @[@"这里注意了如果要达到字幕连续滚动不断帧的效果的话，timer调用需要非常频繁（1秒调用10次以上），此时再看看CPU使用率(@ο@)..瞬间飙升了20%左右，虽然还在能接受的范围，但在这种小地方耗费CPU显然不划算",@"你是z什么东西的钩子傻逼2我电脑上的男生迪士尼的少女般查等你阿单身男女带你去买每次都",@"我的吧测试就十多年吃的甲壳虫上课看你的速度快基督教的健康的打开道具卡的教程虚拟内存吃你能吃"];
        
        self.delegate = self;
        self.pagingEnabled = YES;
        self.scrollEnabled = NO;
        self.contentSize = CGSizeMake(self.width, self.height * (self.arr.count + 2));
        self.contentOffset = CGPointMake(0, self.height);
//        n = 1;
        for (NSInteger i = 0; i < self.arr.count; i ++) {
            YSMScrollContentView *contentView = [[YSMScrollContentView alloc] initWithFrame:CGRectMake(0, self.height * (i + 1), self.width, self.height)];
            contentView.tag = 10000 + i;
            contentView.contentLabel.text = self.arr[i];
            [self addSubview:contentView];
            
        }
        YSMScrollContentView *left = [[YSMScrollContentView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        left.tag = 21;
        [self addSubview:left];
        left.contentLabel.text = self.arr[self.arr.count - 1];
        YSMScrollContentView *right = [[YSMScrollContentView alloc] initWithFrame:CGRectMake(0, self.height * (self.arr.count + 1), self.width, self.height)];
        right.tag = 22;
        [self addSubview:right];
        right.contentLabel.text = self.arr[0];

        currentPage = 0;
        weakenSelf
        if (@available(iOS 10.0, *)) {
            _timer = [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
                NSInteger index = self->currentPage;
                if (index == weakSelf.arr.count + 1) {
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
    NSInteger currentPage;
    if (self.contentOffset.y < self.height ) {
        currentPage = self.arr.count - 1;
    }else if (self.contentOffset.y >= (self.height * self.arr.count)) {
        currentPage = 0;
    }else {
        currentPage = self.contentOffset.y/self.height - 1;
    }
    
    //                NSInteger index;
    //                if (currentPage == weakSelf.arr.count + 1) {
    //                    index = 0;
    //                }else {
    //                    index += 1;
    //                }
    
    [self setContentOffset:CGPointMake(0, self.height * (currentPage + 1)) animated:YES];

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger num = (self.contentOffset.y + 1)/(self.height);
    if (num == self.arr.count + 1) {
        num = 1;
    }else if(num == 0 ){
        num = self.arr.count;
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
    if (numb == self.arr.count + 1) {
        [self setContentOffset:CGPointMake(0, height) animated:NO];
    }else if (numb == 0) {
        [self setContentOffset:CGPointMake(0, height * self.arr.count) animated:YES];
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

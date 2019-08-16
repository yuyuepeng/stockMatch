//
//  YSMHomeFirstCell.m
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/14.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import "YSMHomeFirstCell.h"


@interface YSMHomeFirstCell()

@property(nonatomic, strong) UIScrollView *scrollView1;

@property(nonatomic, strong) UIView *tiao;

@property(nonatomic, strong) UILabel *titleLabel;

@end



@implementation YSMHomeFirstCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if ([reuseIdentifier isEqualToString:@"YSMHomeFirstCellID1"]) {
            [self createViews1];
        }else if ([reuseIdentifier isEqualToString:@"YSMHomeFirstCellID2"]) {
            [self createViews2];
        }else {
            [self createViews3];
        }
    }
    return self;
}

- (UIScrollView *)scrollView1 {
    if (_scrollView1 == nil) {
        _scrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(15, 50, ScreenWidth - 30, 140)];
        _scrollView1.contentSize = CGSizeMake(800 + 30, 80);
        _scrollView1.showsVerticalScrollIndicator = NO;
        _scrollView1.showsHorizontalScrollIndicator = NO;

    }
    return _scrollView1;
}
- (UIView *)tiao {
    if (_tiao == nil) {
        _tiao = [[UIView alloc] initWithFrame:CGRectMake(15, 15, 6, 23)];
        _tiao.layer.masksToBounds = YES;
        _tiao.layer.cornerRadius = 3;
        _tiao.backgroundColor = Orange_ThemeColor;
    }
    return _tiao;
}
- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 15, ScreenWidth - 40, 25)];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont boldSystemFontOfSize:17];
        _titleLabel.textColor = RGB(51, 51, 51);
    }
    return _titleLabel;
}
- (void)createViews1 {
    [self addSubview:self.titleLabel];
    self.tiao.centerY = self.titleLabel.centerY;
    self.titleLabel.text = @"今日资讯";
    [self addSubview:self.tiao];
    [self addSubview:self.scrollView1];
    NSArray <NSString *> *titleArr = @[@"内地券商料猪价续涨，万洲国际涨逾2%",@"中国平安首席财务官姚波：回购不是常态",@"南下资金8月累计净买已创年内新高",@"微信支付宝掀移动支付争夺战"];

    
    for (NSInteger i = 0; i < 4; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(210 * i, 0, 200, 140)];
        imageView.tag = 20 + i;
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"zixun_img%ld",i]];
        [self.scrollView1 addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ziXunClick:)]];
        
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(210 * i, 0, 200, 30)];
        view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        [self.scrollView1 addSubview:view];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(210 * i + 5, 5, 195, 25) ];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:16];
        label.textColor = [UIColor whiteColor];
        label.numberOfLines = 0;
        label.text = titleArr[i];
        label.tag = 10+i;
        label.userInteractionEnabled = YES;
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ziXunClick:)]];
        [self.scrollView1 addSubview:label];

    }
}
- (void)ziXunClick:(UITapGestureRecognizer *)tap {
    NSInteger tag = [[[NSString stringWithFormat:@"%ld",(long)tap.view.tag] substringFromIndex:1] integerValue];
    if (self.delegate &&[self.delegate respondsToSelector:@selector(zixunClickWithIndex:)]) {
        [self.delegate zixunClickWithIndex:tag];
    }
}
- (void)createViews2 {
    [self addSubview:self.titleLabel];
    self.tiao.centerY = self.titleLabel.centerY;
    self.titleLabel.text = @"热门观点";
    [self addSubview:self.tiao];
    NSArray <NSString *> *titleArr = @[@"科技股有望展开秋收行情",@"券商股能“入手”吗？"];

    for (NSInteger i = 0; i < 2; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 50 + 170 * i, ScreenWidth - 30, 160)];
        imageView.userInteractionEnabled = YES;
        imageView.tag = 60 + i;
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guandian_img%ld",i]];
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(guanDianClick:)]];

        [self addSubview:imageView];
        
        
        
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 175 + 170 * i, ScreenWidth - 40, 25) ];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:16];
        label.textColor = [UIColor whiteColor];
        label.text = titleArr[i];
        label.tag = 10+i;
        label.userInteractionEnabled = YES;
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(guanDianClick:)]];
        [self addSubview:label];
    }
}
- (void)guanDianClick:(UITapGestureRecognizer *)tap {
    NSInteger tag = [[[NSString stringWithFormat:@"%ld",(long)tap.view.tag] substringFromIndex:1] integerValue];
    if (self.delegate &&[self.delegate respondsToSelector:@selector(guandianWithIndex:)]) {
        [self.delegate guandianWithIndex:tag];
    }
}
- (void)createViews3 {
    [self addSubview:self.titleLabel];
    self.tiao.centerY = self.titleLabel.centerY;
    self.titleLabel.text = @"今日要闻";
    [self addSubview:self.tiao];
    NSArray <NSString *>* arr = @[@"人民日报海外版：房地产市场念好“稳字诀”",@"美股三大指涨跌互现 美国经济亮起黄灯"];

    
    for (NSInteger i = 0; i < 2; i ++) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(15, 50 + 90 * i, ScreenWidth - 30, 80)];
        [self addSubview:view];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, view.width - 160, 25) ];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:16];
        label.textColor = RGB(51, 51, 51);
        label.text = arr[i];
        label.tag = 10+i;
        label.userInteractionEnabled = YES;
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(newsClick:)]];
        [view addSubview:label];
        
        UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 65, view.width - 160, 15)];
        timeLabel.textAlignment = NSTextAlignmentLeft;
        timeLabel.font = [UIFont systemFontOfSize:16];
        timeLabel.textColor = HEF_COLOR_HEX(@"d0d0d0");
        timeLabel.tag = 20 + i;
        timeLabel.userInteractionEnabled = YES;
        [timeLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(newsClick:)]];

        NSInteger hour = [[[self getNowTime] substringWithRange:NSMakeRange(11, 2)] integerValue] - 1;
        timeLabel.text = [NSString stringWithFormat:@"%ld:%d",(long)hour,arc4random()%30 + 30];
        [view addSubview:timeLabel];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(view.width - 160, 0, 160, view.height)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"gupiao_img%ld",(long)i]];
        imageView.tag = 30 + i;
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(newsClick:)]];

        [view addSubview:imageView];
        
        view.tag = 40 + i;
        [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(newsClick:)]];

    }
}
- (void)newsClick:(UITapGestureRecognizer *)gesture {
    NSInteger tag = [[[NSString stringWithFormat:@"%ld",(long)gesture.view.tag] substringFromIndex:1] integerValue];
    if (self.delegate &&[self.delegate respondsToSelector:@selector(newsClickWithIndex:)]) {
        [self.delegate newsClickWithIndex:tag];
    }
}
- (NSString *)getNowTime {
    NSDate *senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *locationString=[dateformatter stringFromDate:senddate];
    return locationString;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

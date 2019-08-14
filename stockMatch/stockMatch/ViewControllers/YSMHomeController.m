//
//  YSMHomeController.m
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/12.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import "YSMHomeController.h"
#import "YSMCarouselView.h"
#import "YSMScrollTextView.h"

@interface YSMHomeController ()<UITableViewDelegate,UITableViewDataSource,YSMCarouselViewDelegate>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) UIView *tableHeader;

@property(nonatomic, strong) YSMScrollTextView *scrollTextView;

@property(nonatomic, strong) NSTimer *timer;


@end

@implementation YSMHomeController
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, Height_NavBar, ScreenWidth, ScreenHeight - Height_NavBar - Height_TabBar) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _tableView;
}
- (UIView *)tableHeader {
    if (_tableHeader == nil) {
        _tableHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 500)];
        YSMCarouselView *carouseView = [[YSMCarouselView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 200)];
        carouseView.delegate = self;
        NSMutableArray *imgaes = [NSMutableArray array];
        CGFloat width = (ScreenWidth - 30)/4;
        NSArray <NSString *> *imageNames = @[@"zaixianguwen_img",@"kechuangban_img",@"yijiandaxin_img",@"faxian_img"];
        NSArray <NSString *> *texts = @[@"在线顾问",@"科创板",@"一键打新",@"发现"];
        for (NSInteger i = 1; i < 4; i ++) {
            [imgaes addObject:[UIImage imageNamed:[NSString stringWithFormat:@"img%ld.jpg",i]]];
           
        }
        for (NSInteger i = 0; i < 4; i ++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15 + width * i, carouseView.bottom + 15, 42 , 42)];
            imageView.centerX = 15 + width * (i + 0.5);
            [imageView setImage:[UIImage imageNamed:imageNames[i]]];
            [_tableHeader addSubview:imageView];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15 + width * i, imageView.bottom + 5, width, 25)];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = RGB(51, 51, 51);
            label.font = [UIFont systemFontOfSize:12];
            label.text = texts[i];
            [_tableHeader addSubview:label];
        }
        [carouseView addImages:imgaes];
        [_tableHeader addSubview:carouseView];
        NSMutableArray <YSMScrollTextModel *>* models = [NSMutableArray arrayWithArray:[self getData]];
        
        YSMScrollTextView *textView = [[YSMScrollTextView alloc] initWithFrame:CGRectMake(0, carouseView.bottom + 87, ScreenWidth, 500 - carouseView.bottom - 87) models:models];
        self.scrollTextView = textView;
        [_tableHeader addSubview:textView];

    }
    return _tableHeader;
}
- (NSArray <YSMScrollTextModel *>*)getData {
    NSMutableArray <YSMScrollTextModel *>* models = [NSMutableArray array];
    NSArray *contents = @[@"在严退市的背景下，今年“面值退市”成为了A股上市公司退市的一个新路径。受国际环境等综合因素的影响，近期的A股市场持续低迷，杀跌较为惨烈。",@"昨日两市再度陷入调整，沪指最新指数失守2800点。盘面虽然显得有些冷清，但仍有不少大市值股逆市走强，甚至还创下历史高点，如白云机场，该股昨日逆市上涨4.48%，股价创历史新高，其年内累计涨幅逼近翻倍",@"一只没啥亮点的股票竟飞上了天。8月14日，济民制药最高价来到了48.48元，而去年六月份该股的最低价为8.43元，也就是一年多点时间，该股涨了近五倍，市值来到150亿元以上。",@"最近几年，互联网券商成为创业热门方向，其中老虎证券、富途证券等已成为行业代表性公司，并且均已实现赴美上市。 然而，当大多数互联网券商都将业务重点聚焦在股票交易上时，张磊创办的高格证券与众不同，将主要业务聚焦在海外优质上市公司的股票期权交易上。"];
    for (NSInteger i = 0; i < 4; i ++) {
        YSMScrollTextModel *model = [[YSMScrollTextModel alloc] init];
        NSInteger hour = [[[self getNowTime] substringWithRange:NSMakeRange(11, 2)] integerValue] - 1;
        model.time = [NSString stringWithFormat:@"%ld:%d",hour,arc4random()%30 + 30];
        model.content = contents[i];
        [models addObject:model];
    }
    return models;
}
- (NSString *)getNowTime {
    NSDate *senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *locationString=[dateformatter stringFromDate:senddate];
    return locationString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViews];
    // Do any additional setup after loading the view.
}
- (void)createViews {
    
    [self createNavigationBarWithTitle:@"首页"];
    [self.view addSubview:self.tableView];
    
    self.tableView.tableHeaderView = self.tableHeader;
    if (@available(iOS 10.0, *)) {
        weakenSelf
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1800 repeats:YES block:^(NSTimer * _Nonnull timer) {
            NSMutableArray <YSMScrollTextModel *>* models = [NSMutableArray arrayWithArray:[weakSelf getData]];
            [weakSelf.scrollTextView refreshDataWithModels:models];
        }];
    } else {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(refreshData) userInfo:nil repeats:YES];
        // Fallback on earlier versions
    }
}
- (void)refreshData {
    NSMutableArray <YSMScrollTextModel *>* models = [NSMutableArray arrayWithArray:[self getData]];
    
    [self.scrollTextView refreshDataWithModels:models];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    return 88;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellID"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCellID"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)carouselView:(YSMCarouselView *)carouselView clickWithIndex:(NSInteger)index {
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

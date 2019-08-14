//
//  YSMHomeController.m
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/12.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import "YSMHomeController.h"
#import "YSMCarouselView.h"
@interface YSMHomeController ()<UITableViewDelegate,UITableViewDataSource,YSMCarouselViewDelegate>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) UIView *tableHeader;

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
        
        
        
        
        
        
        
        
        
        
        
        
    }
    return _tableHeader;
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

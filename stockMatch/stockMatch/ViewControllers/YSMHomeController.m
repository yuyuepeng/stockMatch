//
//  YSMHomeController.m
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/12.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import "YSMHomeController.h"
#import "YSMCarouselView.h"
@interface YSMHomeController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic, strong) UIView *tableHeader;

@end

@implementation YSMHomeController
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, Height_NavBar, ScreenWidth, ScreenHeight - Height_NavBar - Height_TabBar) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (UIView *)tableHeader {
    if (_tableHeader == nil) {
        _tableHeader = [UIView alloc] initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    }
    return _tableHeader;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    YSMCarouselView *carouseView = [[YSMCarouselView alloc] initWithFrame:CGRectMake(0, 100, self.view.width, 100)];
    NSMutableArray *imgaes = [NSMutableArray array];
    for (NSInteger i = 1; i < 4; i ++) {
        [imgaes addObject:[UIImage imageNamed:[NSString stringWithFormat:@"img%ld.jpg",i]]];
    }
    [carouseView addImages:imgaes];
    [self.view addSubview:carouseView];
    // Do any additional setup after loading the view.
}
- (void)createViews {
    
    [self createNavigationBarWithTitle:@"首页"];
    [self.view addSubview:self.tableView];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

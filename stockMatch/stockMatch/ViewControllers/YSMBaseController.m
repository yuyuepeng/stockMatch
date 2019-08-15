//
//  YSMBaseController.m
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/12.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import "YSMBaseController.h"

@interface YSMBaseController ()

@property(nonatomic, strong) UIView *naviBar;

@property(nonatomic, strong) UILabel *titleLabel;

@property(nonatomic, strong) UIButton *backButton;

@end

@implementation YSMBaseController
- (UIView *)naviBar {
    if (_naviBar == nil) {
        _naviBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, Height_NavBar)];
        _naviBar.backgroundColor = Orange_ThemeColor;
    }
    return _naviBar;
}
- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, Height_StatusBar, 200, Height_NavBar - Height_StatusBar)];
        _titleLabel.centerX = ScreenWidth/2;
        _titleLabel.font = [UIFont systemFontOfSize:17];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
//    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];

    // Do any additional setup after loading the view.
}
- (UIButton *)backButton {
    if (_backButton == nil) {
        _backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, Height_StatusBar, 44, 44)];
        [_backButton setImage:[UIImage imageNamed:@"nav_leftBtn_white"] forState:UIControlStateNormal];
    }
    return _backButton;
}
- (void)addLeftButtonWithAction {
    [self.naviBar addSubview:self.backButton];
    [self.backButton addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
}
- (void)pop {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)createNavigationBarWithTitle:(NSString *)title {
    [self.view addSubview:self.naviBar];
    [self.view addSubview:self.titleLabel];
    self.titleLabel.text = title;
}
- (void)setNavTitle:(NSString *)navTitle {
    _navTitle = navTitle;
    self.titleLabel.text = navTitle;
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

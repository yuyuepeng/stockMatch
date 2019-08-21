//
//  YSMMineController.m
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/21.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import "YSMMineController.h"
#import "YSMLoginController.h"
@interface YSMMineController ()


@property(nonatomic, strong) UIImageView *iconView;


@property(nonatomic, strong) UILabel *nameLabel;


@property(nonatomic, strong) UIButton *logoutButton;

@end

@implementation YSMMineController
- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, Height_NavBar + 10, 70, 70)];
        _iconView.centerX = ScreenWidth/2;
        [_iconView setImage:[UIImage imageNamed:@"mine_icon"]];
        _iconView.userInteractionEnabled = YES;
        [_iconView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loginClick)]];
    }
    return _iconView;
}
- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.iconView.bottom + 5, 300, 25)];
        _nameLabel.centerX = ScreenWidth/2;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.numberOfLines = 0;
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.text = @"登录/注册";
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.userInteractionEnabled = YES;
        [_nameLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loginClick)]];
    }
    return _nameLabel;
}
- (UIButton *)logoutButton {
    if (_logoutButton == nil) {
        _logoutButton = [[UIButton alloc] initWithFrame:CGRectMake(0, ScreenHeight - 54 - Height_TabBar, ScreenWidth - 40, 44)];
        _logoutButton.backgroundColor = Orange_ThemeColor;
        [_logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
        _logoutButton.centerX = ScreenWidth/2;
        _logoutButton.layer.cornerRadius = 5;
        _logoutButton.layer.masksToBounds = YES;
        _logoutButton.hidden = YES;
        [_logoutButton addTarget:self action:@selector(logoutButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logoutButton;
}
- (void)logoutButtonClick {
    
}
- (void)loginClick {
    YSMLoginController *loginVC = [[YSMLoginController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViews];
    // Do any additional setup after loading the view.
}
- (void)createViews {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 250)];
    headerView.backgroundColor = Orange_ThemeColor;
    [self.view addSubview:headerView];
    [headerView addSubview:self.iconView];
    [headerView addSubview:self.nameLabel];
    [self.view addSubview:self.logoutButton];
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

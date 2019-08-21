//
//  YSMLoginController.m
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/21.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import "YSMLoginController.h"
#import "YSMRegisterController.h"
@interface YSMLoginController ()

@property(nonatomic, strong) UITextField *phoneTF;

@property(nonatomic, strong) UITextField *passWordTf;

@property(nonatomic, strong) UIButton *loginButton;

@end

@implementation YSMLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavigationBarWithTitle:@"登录"];
    [self addLeftButtonWithAction];
    [self createViews];
    // Do any additional setup after loading the view.
}
- (UITextField *)phoneTF {
    if (_phoneTF == nil) {
        _phoneTF = [[UITextField alloc] initWithFrame:CGRectMake(20, Height_NavBar + 80 , ScreenWidth - 40, 40)];
        _phoneTF.textAlignment = NSTextAlignmentLeft;
        _phoneTF.font = [UIFont systemFontOfSize:14];
        _phoneTF.placeholder = @"请输入您的手机号";
        _phoneTF.keyboardType = UIKeyboardTypeNumberPad;
        _phoneTF.textColor = RGB(51, 51, 51);
    }
    return _phoneTF;
}
- (UIButton *)loginButton {
    if (_loginButton == nil) {
        _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(20, self.passWordTf.bottom + 40, ScreenWidth - 40, 44)];
        _loginButton.layer.cornerRadius = 5;
        _loginButton.layer.masksToBounds = YES;
        _loginButton.backgroundColor = Orange_ThemeColor;
        _loginButton.centerX = ScreenWidth/2;
        [_loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    }
    return _loginButton;
}
- (void)loginButtonClick {
    
}

- (UITextField *)passWordTf {
    if (_passWordTf == nil) {
        _passWordTf = [[UITextField alloc] initWithFrame:CGRectMake(20,  self.phoneTF.bottom + 2, ScreenWidth - 40, 40)];
        _passWordTf.textAlignment = NSTextAlignmentLeft;
        _passWordTf.font = [UIFont systemFontOfSize:14];
        _passWordTf.placeholder = @"请输入密码";
        _passWordTf.secureTextEntry = YES;
        _passWordTf.textColor = RGB(51, 51, 51);
    }
    return _passWordTf;
}
- (void)createViews {
    [self.view addSubview:self.phoneTF];
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(20, self.phoneTF.bottom, ScreenWidth - 40, 0.5)];
    line1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line1];
    [self.view addSubview:self.passWordTf];
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(20, self.passWordTf.bottom, ScreenWidth - 40, 0.5)];
    line2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line2];
    [self.view addSubview:self.loginButton];
    
    UILabel *zhuceLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth - 120, Height_StatusBar, 105, 44)];
    zhuceLabel.textAlignment = NSTextAlignmentRight;
    zhuceLabel.textColor = [UIColor whiteColor];
    zhuceLabel.font = [UIFont systemFontOfSize:14];
    zhuceLabel.text = @"注册";
    [self.view addSubview:zhuceLabel];
    
    UIButton *registerButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 120, Height_StatusBar, 105, 44)];
    [registerButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
}
- (void)registerButtonClick {
    YSMRegisterController *registerVC = [[YSMRegisterController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
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

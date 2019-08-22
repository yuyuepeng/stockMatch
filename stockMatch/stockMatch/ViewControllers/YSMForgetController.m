//
//  YSMForgetController.m
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/22.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import "YSMForgetController.h"

@interface YSMForgetController ()

@property(nonatomic, strong) UITextField *phoneTF;

@property(nonatomic, strong) UITextField *passWordTf;

@property(nonatomic, strong) UIButton *changePassWordButton;

@property(nonatomic, copy)  NSString *phoneNum;

@property(nonatomic, copy)  NSString *passWord;

@end

@implementation YSMForgetController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavigationBarWithTitle:@"忘记密码"];
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
        [_phoneTF addTarget:self action:@selector(textDidChange:) forControlEvents:UIControlEventEditingChanged];
        _phoneTF.textColor = RGB(51, 51, 51);
    }
    return _phoneTF;
}
- (UITextField *)passWordTf {
    if (_passWordTf == nil) {
        _passWordTf = [[UITextField alloc] initWithFrame:CGRectMake(20,  self.phoneTF.bottom + 2, ScreenWidth - 40, 40)];
        _passWordTf.textAlignment = NSTextAlignmentLeft;
        _passWordTf.font = [UIFont systemFontOfSize:14];
        _passWordTf.placeholder = @"请输入密码";
        _passWordTf.secureTextEntry = YES;
        [_passWordTf addTarget:self action:@selector(textDidChange:) forControlEvents:UIControlEventEditingChanged];
        _passWordTf.textColor = RGB(51, 51, 51);
    }
    return _passWordTf;
}
- (void)textDidChange:(UITextField *)textField {
    if (textField == self.passWordTf) {
        self.passWord = textField.text;
    }else {
        self.phoneNum = textField.text;
    }
}
- (UIButton *)changePassWordButton {
    if (_changePassWordButton == nil) {
        _changePassWordButton = [[UIButton alloc] initWithFrame:CGRectMake(20, self.passWordTf.bottom + 40, ScreenWidth - 40, 44)];
        _changePassWordButton.layer.cornerRadius = 5;
        _changePassWordButton.layer.masksToBounds = YES;
        _changePassWordButton.backgroundColor = Orange_ThemeColor;
        _changePassWordButton.centerX = ScreenWidth/2;
        [_changePassWordButton addTarget:self action:@selector(changePassWordButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_changePassWordButton setTitle:@"更改密码" forState:UIControlStateNormal];
    }
    return _changePassWordButton;
}
- (void)changePassWordButtonClick {
    [self.phoneNum stringByReplacingOccurrencesOfString:@" " withString:@""];
    [self.passWord stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (self.phoneNum.length == 0 ) {
        makeToast(@"请输入手机号");
        return;
    }
    if (self.phoneNum.length != 11) {
        makeToast(@"请输入正确的手机号");
        return;
    }
    if (self.phoneNum.length == 0 ) {
        makeToast(@"请输入密码");
        return;
    }
    NSUserDefaults *standard = [NSUserDefaults standardUserDefaults];
    
    NSString *phone1 = [standard objectForKey:[NSString stringWithFormat:@"%@num",self.phoneNum]];
    if (phone1.length == 0) {
        makeToast(@"账号不存在，请先注册");
        return;
    }
    [standard setObject:self.phoneNum forKey:[NSString stringWithFormat:@"%@num",self.phoneNum]];
    
    [standard setObject:self.passWord forKey:[NSString stringWithFormat:@"%@mimas",self.phoneNum]];
    
    [self pop];
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
    [self.view addSubview:self.changePassWordButton];
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

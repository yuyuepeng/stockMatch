//
//  YSMMineController.m
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/21.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import "YSMMineController.h"

@interface YSMMineController ()


@property(nonatomic, strong) UIImageView *iconView;


@property(nonatomic, strong) UILabel *nameLabel;


@end

@implementation YSMMineController
- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, Height_NavBar + 20, 90, 90)];
        _iconView.centerX = ScreenWidth/2;
        [_iconView setImage:[UIImage imageNamed:@"mine_icon"]];
    }
    return _iconView;
}
- (UILabel *)nameLabel {
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.iconView.bottom + 20, 300, 25)];
        _nameLabel.centerX = ScreenWidth/2;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.numberOfLines = 0;
        _nameLabel.text = @"";
        _nameLabel.font = [UIFont systemFontOfSize:15];
    }
    return _nameLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViews];
    // Do any additional setup after loading the view.
}
- (void)createViews {
    

    
    
    [self.view addSubview:self.iconView];
    [self.view addSubview:self.nameLabel];
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

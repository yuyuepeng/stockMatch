//
//  YSMTabBarController.m
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/12.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import "YSMTabBarController.h"
#import "YSMNavigationController.h"
#import "YSMHomeController.h"
@interface YSMTabBarController ()

@end

@implementation YSMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self createChildVC];
    // Do any additional setup after loading the view.
}
- (void)createChildVC {
    [self setupChildVc:[[YSMHomeController alloc] init] title:@"首页" image:@"tabBar_first" selectedImage:@"tabBar_first_click" isHiddenNavgationBar:YES];
    [self setupChildVc:[[YSMInfoController alloc] init] title:@"资讯" image:@"tabBar_second" selectedImage:@"tabBar_second_click" isHiddenNavgationBar:YES];
    [self setupChildVc:[[YSMVideoController alloc] init] title:@"视频" image:@"tabBar_second" selectedImage:@"tabBar_second_click" isHiddenNavgationBar:YES];
    [self setupChildVc:[[NSClassFromString(@"YSMMineController") alloc] init] title:@"我的" image:@"tabBar_second" selectedImage:@"tabBar_second_click" isHiddenNavgationBar:YES];

}
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage isHiddenNavgationBar:(BOOL)isHidden{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//没有图片的情况下  title不会显示
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    YSMNavigationController *nav = [[YSMNavigationController alloc]initWithRootViewController:vc];
    nav.navigationBar.hidden = isHidden;
    [self addChildViewController:nav];
}

// 支持设备自动旋转
- (BOOL)shouldAutorotate
{
    return NO;
}

+ (void)initialize
{
    //设置未选中的TabBarItem的字体颜色、大小
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    attrs[NSForegroundColorAttributeName] = HEF_COLOR_HEX(@"9B8F8F");
    //设置选中了的TabBarItem的字体颜色、大小
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    selectedAttrs[NSForegroundColorAttributeName] = Orange_ThemeColor;
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];      
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

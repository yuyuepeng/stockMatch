//
//  YSMHomeController.m
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/12.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import "YSMHomeController.h"
#import "YSMCarouselView.h"
@interface YSMHomeController ()

@end

@implementation YSMHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    YSMCarouselView *carouseView = [[YSMCarouselView alloc] initWithFrame:CGRectMake(0, 100, self.view.width, 100)];
    NSMutableArray *imgaes = [NSMutableArray array];
    for (NSInteger i = 1; i < 4; i ++) {
        [imgaes addObject:[UIImage imageNamed:[NSString stringWithFormat:@"img%ld.jpg",i]]];
    }
    [carouseView addImages:imgaes type:YSMCarouselViewTypeImage];
    
    
    [self.view addSubview:carouseView];
    // Do any additional setup after loading the view.
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

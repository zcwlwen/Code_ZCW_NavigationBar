//
//  NavigationBackgroundImageController.m
//  Code_ZCW_NavigationBar
//
//  Created by 张朝伟 on 16/8/1.
//  Copyright © 2016年 zcw. All rights reserved.
//

#import "NavigationBackgroundImageController.h"

@interface NavigationBackgroundImageController ()

@end

@implementation NavigationBackgroundImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"设置导航栏的背景图";
    //设置背景图
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Background"]
                                                  forBarMetrics:UIBarMetricsDefault];
    //注意，如果是在通过navigationController push的 VC，需要通过设置barStyle为UIBarStyleBlack，才会使设置的Status Bar的外观生效
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    // Do any additional setup after loading the view.
}


- (void)viewWillDisappear:(BOOL)animated {
    //恢复到设置背景图之前的外观
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

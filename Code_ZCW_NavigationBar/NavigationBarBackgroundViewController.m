//
//  NavigationBarBackgroundViewController.m
//  Code_ZCW_NavigationBar
//  设置导航栏的背景颜色
//  Created by 张朝伟 on 16/8/1.
//  Copyright © 2016年 zcw. All rights reserved.
//

#import "NavigationBarBackgroundViewController.h"

@interface NavigationBarBackgroundViewController ()

@end

@implementation NavigationBarBackgroundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航栏的标题
    self.title = @"设置导航栏的背景颜色";
    //通过barTintColor来设置背景色
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    //设置button颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    //注意，如果是在通过navigationController push的 VC，需要通过设置barStyle为UIBarStyleBlack，才会使设置的Status Bar的外观生效
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    //恢复到默认的设置
    self.navigationController.navigationBar.barTintColor = nil;
    self.navigationController.navigationBar.tintColor = nil;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
//    self.navigationController.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//设置Status Bar 的外观，使其变成白色
//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

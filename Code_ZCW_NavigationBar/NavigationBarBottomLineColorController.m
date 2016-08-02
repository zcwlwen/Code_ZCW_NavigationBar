//
//  NavigationBarBottomLineColorController.m
//  Code_ZCW_NavigationBar
//
//  Created by 张朝伟 on 16/8/1.
//  Copyright © 2016年 zcw. All rights reserved.
//

#import "NavigationBarBottomLineColorController.h"
#import "UIImage+ColorImage.h"

@interface NavigationBarBottomLineColorController ()

@end

@implementation NavigationBarBottomLineColorController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"设置导航栏底部线条的颜色";
    
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    [navigationBar setBackgroundImage:[[UIImage alloc] init]
                       forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];
    //此处使底部线条颜色为红色
//    UIImage * image = [UIImage imageWithColor:[UIColor redColor]];
    UIImage * image = [UIImage createImageWithColor:[UIColor redColor] andSize:CGSizeMake(100, 1)];

    [navigationBar setShadowImage:image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


- (void)viewWillDisappear:(BOOL)animated {
    //恢复到之前的状态
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    [navigationBar setBackgroundImage:nil
                       forBarPosition:UIBarPositionAny
                           barMetrics:UIBarMetricsDefault];
    [navigationBar setShadowImage:nil];
}


@end

//
//  NavigationBarWithBackButtonController.m
//  Code_ZCW_NavigationBar
//
//  Created by 张朝伟 on 16/8/1.
//  Copyright © 2016年 zcw. All rights reserved.
//

#import "NavigationBarWithBackButtonController.h"

@interface NavigationBarWithBackButtonController ()

@end

@implementation NavigationBarWithBackButtonController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"设置导航栏返回按钮";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Background"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //设置返回按钮颜色
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    //    [self setBackButtonWithImage];
        [self setBackButtonTitle];
//    [self setCustomLeftButton];
    
    
    
    //左滑返回手势失效了
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    // Do any additional setup after loading the view.
}

//返回按钮只有图片
- (void)setBackButtonWithImage {
    UIImage *leftButtonIcon = [[UIImage imageNamed:@"LeftButton_back_Icon"]
                               imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonIcon
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:@selector(goToBack)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    //修复navigationController侧滑关闭失效的问题
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}

//返回按钮只有文字
- (void)setBackButtonTitle {
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"取消", nil)
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self action:@selector(goToBack)];
    leftButton.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftButton;
}
//自定义返回按钮   自定义button
- (void)setCustomLeftButton {
    UIView* leftButtonView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
    UIButton* leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    leftButton.backgroundColor = [UIColor clearColor];
    leftButton.frame = leftButtonView.frame;
    [leftButton setImage:[UIImage imageNamed:@"LeftButton_back_Icon"] forState:UIControlStateNormal];
    [leftButton setTitle:@"返回" forState:UIControlStateNormal];
    leftButton.tintColor = [UIColor redColor];
    leftButton.autoresizesSubviews = YES;
    leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    leftButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin;
    [leftButton addTarget:self action:@selector(goToBack) forControlEvents:UIControlEventTouchUpInside];
    [leftButtonView addSubview:leftButton];
    UIBarButtonItem* leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:leftButtonView];
    self.navigationItem.leftBarButtonItem = leftBarButton;
}

- (void)setBackButtonWithColor {
    //设置按钮的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)goToBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated {
    //恢复到设置背景图之前的外观
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.tintColor = nil;
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

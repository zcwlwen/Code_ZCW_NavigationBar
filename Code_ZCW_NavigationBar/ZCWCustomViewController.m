//
//  ZCWCustomViewController.m
//  Code_ZCW_NavigationBar
//
//  Created by 张朝伟 on 16/8/1.
//  Copyright © 2016年 zcw. All rights reserved.
//

#import "ZCWCustomViewController.h"

@interface ZCWCustomViewController ()
@property (nonatomic,strong)UIView *alphaView;

@end

@implementation ZCWCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /**
     *  这里要实现半透明导航栏
        自定义导航栏文字
     */
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *bg = [UIImage new];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsCompact];
    CGRect frame = self.navigationController.navigationBar.frame;
    _alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, -20, frame.size.width, frame.size.height+20)];
    _alphaView.backgroundColor = [UIColor blueColor];
    _alphaView.userInteractionEnabled = NO;
    _alphaView.alpha = 0.3;
    [self.navigationController.navigationBar insertSubview: _alphaView atIndex:0];
    
    self.navigationController.navigationBar.translucent = YES;
    
        UILabel *titleLable                    = [[UILabel alloc]initWithFrame:CGRectMake(0,0,100,44)];//在这里只有titleLable的高度起作用
        titleLable.backgroundColor             = [UIColor  clearColor];//设置Lable背景的透明
        titleLable.font                        = [UIFont  italicSystemFontOfSize:18];//设置文本字体的大小
        titleLable.textColor                   = [UIColor  purpleColor];//设置文本颜色
        titleLable.textAlignment               = NSTextAlignmentCenter;//设置文本格式位置
        titleLable.text                        = @"这里是标题";//设置标题
        self.navigationItem.titleView          = titleLable;
    //    // Do any additional setup after loading the view.
    
    //     self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}


- (void)viewWillDisappear:(BOOL)animated {
    //恢复到设置背景图之前的外观
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [_alphaView removeFromSuperview];
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

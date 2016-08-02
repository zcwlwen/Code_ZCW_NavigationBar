//
//  UIBarButtonItem+Custom.h
//  Code_ZCW_NavigationBar
//
//  Created by 张朝伟 on 16/8/2.
//  Copyright © 2016年 zcw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Custom)
+ (UIBarButtonItem *)barItemWithImage:(UIImage *)image title:(NSString *)title tintColor:(UIColor *)tintColor target:(id)target action:(SEL)action;

+ (UIBarButtonItem*)barItemWithImage:(UIImage*)image title:(NSString*)title target:(id)target action:(SEL)action;

@end

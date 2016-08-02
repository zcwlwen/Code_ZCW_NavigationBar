//
//  UIImage+ColorImage.h
//  Code_ZCW_NavigationBar
//
//  Created by 张朝伟 on 16/8/2.
//  Copyright © 2016年 zcw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ColorImage)

+ (UIImage *)imageWithColor:(UIColor *)color;


+ (UIImage *)createImageWithColor:(UIColor *)color andSize:(CGSize)size;


+ (UIImage *)imageByApplyingAlpha:(CGFloat )alpha  image:(UIImage*)image;
@end

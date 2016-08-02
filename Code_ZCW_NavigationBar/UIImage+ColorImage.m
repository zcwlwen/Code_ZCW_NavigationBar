//
//  UIImage+ColorImage.m
//  Code_ZCW_NavigationBar
//
//  Created by 张朝伟 on 16/8/2.
//  Copyright © 2016年 zcw. All rights reserved.
//

#import "UIImage+ColorImage.h"
@implementation UIImage (ColorImage)

/**
 *  创建一张纯色图片
 *
 *  @param color 传入颜色
 *
 *  @return 返回纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
/**
 *  创建纯色图片
 *
 *  @param color 颜色
 *  @param size  大小
 *
 *  @return 返回纯色图片
 */
+ (UIImage *)createImageWithColor:(UIColor *)color andSize:(CGSize)size
{
    CGRect rect=CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

/**
 *  设置图片透明度
 * @param alpha 透明度
 * @param image 图片
 */
+ (UIImage *)imageByApplyingAlpha:(CGFloat )alpha  image:(UIImage*)image
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    
    CGContextSetAlpha(ctx, alpha);
    
    
    
    CGContextDrawImage(ctx, area, image.CGImage);
    
    
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    
    
    UIGraphicsEndImageContext();
    
    
    
    return newImage;
    
}
@end

//
//  UIImage+Image.m
//
//  Created by xiaohuge on 15/2/25.
//  Copyright © 2015年 xiaohuge. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

/** 圆形图片裁剪 */
- (instancetype)hu_circleImage
{
    // 利用self生成一张圆形图片
    
    // 1.开启图形上下文
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    
    // 2.描述圆形路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    // 3.设置裁剪区域
    [path addClip];
    
    // 4.画图
    [self drawAtPoint:CGPointZero];
    
    // 5.取出图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6.关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

/** 圆形图片裁剪 */
+ (instancetype)hu_circleImageNamed:(NSString *)name
{
    return [[UIImage imageNamed:name] hu_circleImage];
}

/** 拉伸图片 */
- (instancetype)stretchableImage
{
    return [self stretchableImageWithLeftCapWidth:self.size.width * 0.5 topCapHeight:self.size.height * 0.5];
}
/** 生成未渲染图片 */
+ (instancetype)imageNamedWithOriganlMode:(NSString *)imageName
{
    // 加载原始图片
    UIImage *selImage = [UIImage imageNamed:imageName];
    
    // imageWithRenderingMode:返回每一个没有渲染图片给你
    return  [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


/** 在周边加一个边框为1的透明像素 生成抗锯齿 */
- (UIImage *)imageAntialias
{
    CGFloat border = 1.0f;
    CGRect rect = CGRectMake(border, border, self.size.width-2*border, self.size.height-2*border);
    
    UIImage *img = nil;
    
    UIGraphicsBeginImageContext(CGSizeMake(rect.size.width,rect.size.height));
    [self drawInRect:CGRectMake(-1, -1, self.size.width, self.size.height)];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(self.size);
    [img drawInRect:rect];
    UIImage* antiImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return antiImage;
}
@end

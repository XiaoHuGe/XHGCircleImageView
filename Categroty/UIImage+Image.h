//
//  UIImage+Image.h
//
//  Created by xiaohuge on 15/2/25.
//  Copyright © 2015年 xiaohuge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)
/** 圆形图片裁剪 */
- (instancetype)hu_circleImage;
/** 圆形图片裁剪 */
+ (instancetype)hu_circleImageNamed:(NSString *)name;

/** 生成未渲染图片 */
+ (instancetype)imageNamedWithOriganlMode:(NSString *)imageName;
/** 加载拉伸中间1个像素图片 */
- (instancetype)stretchableImage;

/** 生成一张抗锯齿图片 */
// 本质：在图片生成一个透明为1的像素边框
- (UIImage *)imageAntialias;

@end

//
//  UIImageView+HeaderImageView.m
//
//  Created by xiaohuge on 15/3/5.
//  Copyright © 2015年 xiaohuge. All rights reserved.
//

#import "UIImageView+HeaderImageView.h"
#import <UIImageView+WebCache.h>
#import "UIImage+Image.h"
@implementation UIImageView (HeaderImageView)


//原始图片
- (void)hu_setRectHeader:(NSString *)url{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}
//裁剪的圆形图片
- (void)hu_setCircleHeader:(NSString *)url
{
    //占位图片
    UIImage *placeholder = [[UIImage imageNamed:@"defaultUserIcon"] hu_circleImage];
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:
     ^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
         // 如果图片下载失败，就不做任何处理，按照默认的做法：会显示占位图片
         if (image == nil) return;
         
         self.image = [image hu_circleImage];
     }];
}


@end

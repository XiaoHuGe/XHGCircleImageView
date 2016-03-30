//
//  UIImageView+HeaderImageView.h
//
//  Created by xiaohuge on 15/3/5.
//  Copyright © 2015年 xiaohuge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (HeaderImageView)
/** 生成圆形头像 */
- (void)hu_setCircleHeader:(NSString *)url;

/** 生成方形头像 */
- (void)hu_setRectHeader:(NSString *)url;

@end

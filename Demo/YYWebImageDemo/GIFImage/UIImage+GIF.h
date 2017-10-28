//
//  UIImage+GIF.h
//  YYWebImageDemo
//
//  Created by nchkdxlq on 2017/10/27.
//  Copyright © 2017年 ibireme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GIF)

//加载保存在本地的gif图片
+ (UIImage *)sd_animatedGIFNamed:(NSString *)name;

//获取到图片的data后重新构造一张可以播放的图片
+ (UIImage *)sd_animatedGIFWithData:(NSData *)data;

//图片按照指定的尺寸缩放
- (UIImage *)sd_animatedImageByScalingAndCroppingToSize:(CGSize)size;

@end

//
//  KKImageCompress.m
//  FaceLink
//
//  Created by LIKUN on 2018/1/11.
//  Copyright © 2018年 程强. All rights reserved.
//

#import "KKImageCompress.h"

/*
 图片尺寸缩小策略
 宽高均 <= 1280，图片尺寸大小保持不变
 宽或高 > 1280 && 宽高比 <= 2，取较大值等于1280，较小值等比例压缩
 宽或高 > 1280 && 宽高比 > 2 && 宽或高 < 1280，图片尺寸大小保持不变
 宽高均 > 1280 && 宽高比 > 2，取较小值等于1280，较大值等比例压缩
 */

/*
 图片质量压缩策略
 图片压缩质量值 设置为 0.5
 */

#define boundary 800

@implementation KKImageCompress
+ (UIImage *)compress:(UIImage *)image
{
    UIImage *compressImage = nil;
    CGSize size = image.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    if (width<=boundary&&height<=boundary) {
        //不改变图片尺寸，只进行压缩

    }else if (width>boundary&&height>boundary){
        CGFloat radio = width/height;
        if (radio<=2) {
            //宽高取大值缩小至1280
            if (radio>1) {
                width = boundary;
                height = width/radio;
            }else{
                height=boundary;
                width = height*radio;
            }
        }else{
            //宽高取小值缩小至1280
            height = boundary;
            width = height*radio;
        }
    }else{

    }
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    UIImage *compressDataImage =  [UIImage imageWithData:data];
    compressImage = [[self class] imageCompressWithImage:compressDataImage targetHeight:height targetWidth:width];
    return compressDataImage;
}
/**  重绘*/
+ (UIImage *)imageCompressWithImage:(UIImage *)sourceImage targetHeight:(CGFloat)targetHeight targetWidth:(CGFloat)targetWidth
{
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [sourceImage drawInRect:CGRectMake(0,0,targetWidth, targetHeight)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
+ (BOOL) imageHasAlpha: (UIImage *) image
{
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(image.CGImage);
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}
@end

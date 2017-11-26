//
//  GIFViewController.m
//  YYWebImageDemo
//
//  Created by nchkdxlq on 2017/10/27.
//  Copyright © 2017年 ibireme. All rights reserved.
//

#import "GIFViewController.h"
#import "UIImage+GIF.h"
#import <ImageIO/ImageIO.h>


@interface GIFViewController ()

@property (nonatomic, strong) UIImage *gifImage;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation GIFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:_imageView];
    _imageView.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    _gifImage = [UIImage sd_animatedGIFNamed:@"niconiconi"];
//    imageView.image = gifImage;
    
//    NSArray *types = (__bridge NSArray *)CGImageSourceCopyTypeIdentifiers();
//    NSLog(@"types = %@", types);
//
//    [self imageSourceInfo];
//    [self CFDictionaryInfo];
    [self getImageData];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    if (_imageView.image) {
        _imageView.image = nil;
    } else {
        _imageView.image = _gifImage;
    }
}



- (void)imageSourceInfo
{
    NSString *file = [[NSBundle mainBundle] pathForResource:@"mew_interlaced.png" ofType:@""];
    NSData *data = [NSData dataWithContentsOfFile:file];
    
    CGImageSourceRef imageSource = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    if (imageSource == NULL) {
        fprintf(stderr, "create imageSource failed");
    }
    CFStringRef type = CGImageSourceGetType(imageSource);
    CFShow(type);
    
    size_t count = CGImageSourceGetCount(imageSource);
    printf("count = %lu\n", count);
    
    
    CFDictionaryRef properties = CGImageSourceCopyProperties(imageSource, NULL);
    CFShow(properties);
}


- (void)getImageData
{
    NSString *file = [[NSBundle mainBundle] pathForResource:@"check_green" ofType:@"png"];
    NSData *data = [NSData dataWithContentsOfFile:file];
    NSLog(@"data.length = %ld", data.length);
    UIImage *image = [UIImage imageWithData:data];
    NSLog(@"image size = {%ld, %ld}", (NSInteger)image.size.width, (NSInteger)image.size.height);
    CGDataProviderRef provider = CGImageGetDataProvider(image.CGImage);
    NSData *pixleData = (__bridge NSData *)CGDataProviderCopyData(provider);
    NSLog(@"pixleData.length = %ld", pixleData.length);
    
    
    CGImageRef imageRef = image.CGImage;
    size_t width = CGImageGetWidth(imageRef);
    size_t height = CGImageGetHeight(imageRef);
    CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(imageRef) & kCGBitmapAlphaInfoMask;
    BOOL hasAlpha = NO;
    if (alphaInfo == kCGImageAlphaLast ||
        alphaInfo == kCGImageAlphaFirst ||
        alphaInfo == kCGImageAlphaPremultipliedLast ||
        alphaInfo == kCGImageAlphaPremultipliedFirst) {
        hasAlpha = YES;
    }
    CGBitmapInfo bitmapInfo = kCGBitmapByteOrder32Host;
    bitmapInfo |= hasAlpha ? kCGImageAlphaPremultipliedFirst : kCGImageAlphaNoneSkipFirst;
    
    CGContextRef context = CGBitmapContextCreate(NULL, width, height, 8, 0, CGColorSpaceCreateDeviceRGB(), bitmapInfo);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    CGImageRef newImageRef = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    NSData *newImageData = (__bridge NSData *)CGDataProviderCopyData(CGImageGetDataProvider(newImageRef));
    NSLog(@"newImageData.length = %ld", newImageData.length);
    CGImageRelease(newImageRef);
}




- (void)CFDictionaryInfo
{
    CFStringRef keys[] = {CFSTR("one"), CFSTR("tow"), CFSTR("three")};
//    CFStringRef values[] = {CFSTR("1111"), CFSTR("2222"), CFSTR("3333")};
    int32_t __one = 1;
    int32_t __tow = 2;
    int32_t __three = 3;
    
    CFNumberRef one = CFNumberCreate(NULL, kCFNumberSInt32Type, (const void *)&__one);
    CFNumberRef tow = CFNumberCreate(NULL, kCFNumberSInt32Type, (const void *)&__tow);
    CFNumberRef three = CFNumberCreate(NULL, kCFNumberSInt32Type, (const void *)&__three);
    CFNumberRef int_values[] = {one, tow, three};
    CFDictionaryRef dicRef = CFDictionaryCreate(NULL, (const void **)&keys, (const void **)&int_values, 3, &kCFTypeDictionaryKeyCallBacks
    , &kCFTypeDictionaryValueCallBacks);
    
    CFIndex count = CFDictionaryGetCount(dicRef);
    printf("count = %ld\n", count);
    CFNumberRef value = (CFNumberRef)CFDictionaryGetValue(dicRef, CFSTR("one"));
    CFShow(value);
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

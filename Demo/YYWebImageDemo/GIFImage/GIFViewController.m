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

@end

@implementation GIFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:imageView];
    imageView.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    UIImage *gifImage = [UIImage sd_animatedGIFNamed:@"niconiconi"];
    imageView.image = gifImage;
    
//    NSArray *types = (__bridge NSArray *)CGImageSourceCopyTypeIdentifiers();
//    NSLog(@"types = %@", types);
//
//    [self imageSourceInfo];
    [self CFDictionaryInfo];
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

//
//  LQProgressiveViewController.m
//  YYWebImageDemo
//
//  Created by nchkdxlq on 2017/10/28.
//  Copyright © 2017年 ibireme. All rights reserved.
//

#import "LQProgressiveViewController.h"
#import <ImageIO/ImageIO.h>

@interface LQProgressiveViewController () {

}

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) NSData *imageData;

@end

@implementation LQProgressiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, 200, 0)];
    [slider  sizeToFit];
    [self.view addSubview:slider];
    slider.center =  CGPointMake(CGRectGetMidX(self.view.frame), 120);
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.value = 0.0;
    [slider addTarget:self action:@selector(changed:) forControlEvents:UIControlEventValueChanged];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    _imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_imageView];
    _imageView.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    _imageView.backgroundColor = [UIColor colorWithWhite:0.790 alpha:1.000];
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"mew_interlaced.png" ofType:@""];
    _imageData = [NSData dataWithContentsOfFile:file];
}

- (void)changed:(UISlider *)sender
{
    NSData *subData = [_imageData subdataWithRange:NSMakeRange(0, (NSUInteger)(_imageData.length * sender.value))];
    
    CGImageSourceRef imageSource = CGImageSourceCreateIncremental(NULL);
    
    CGImageSourceUpdateData(imageSource, (__bridge CFDataRef)subData, false);
    CGImageRef imageRef = CGImageSourceCreateImageAtIndex(imageSource, 0, NULL);
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);

    _imageView.image = image;
    
    CFRelease(imageSource);
}


- (void)dealloc {

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

//
//  FLAnimatedImageExample.m
//  YYWebImageDemo
//
//  Created by nchkdxlq on 2017/10/28.
//  Copyright © 2017年 ibireme. All rights reserved.
//

#import "FLAnimatedImageExample.h"
#import "FLAnimatedImage.h"
#import "FLAnimatedImageView.h"

@interface FLAnimatedImageExample ()

@end

@implementation FLAnimatedImageExample

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:imageView];
    imageView.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"niconiconi@2x" ofType:@"gif"];
    NSData *data = [NSData dataWithContentsOfFile:file];
    imageView.animatedImage = [FLAnimatedImage animatedImageWithGIFData:data];
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

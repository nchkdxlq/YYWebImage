//
//  YYGIFImageViewController.m
//  YYWebImageDemo
//
//  Created by nchkdxlq on 2017/10/28.
//  Copyright © 2017年 ibireme. All rights reserved.
//

#import "YYGIFImageViewController.h"
#import "YYAnimatedImageView.h"
#import "YYImage.h"

@interface YYGIFImageViewController ()

@end

@implementation YYGIFImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    YYAnimatedImageView *imageView = [[YYAnimatedImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:imageView];
    imageView.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    imageView.image = [YYImage imageNamed:@"niconiconi"];
    
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

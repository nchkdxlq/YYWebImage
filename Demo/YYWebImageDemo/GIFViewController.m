//
//  GIFViewController.m
//  YYWebImageDemo
//
//  Created by nchkdxlq on 2017/10/27.
//  Copyright © 2017年 ibireme. All rights reserved.
//

#import "GIFViewController.h"
#import "UIImage+GIF.h"

@interface GIFViewController ()

@end

@implementation GIFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:imageView];
    imageView.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    UIImage *gifImage = [UIImage sd_animatedGIFNamed:@"niconiconi"];
    imageView.image = gifImage;
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

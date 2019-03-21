//
//  ViewController.m
//  YeahmobiDemo
//
//  Created by Acan on 2019/3/21.
//  Copyright © 2019 weiphone. All rights reserved.
//

#import "ViewController.h"
#import <ApplinsSDK/ApplinsSDK.h>

@interface ViewController () <ALSNativeAdDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[Applins shareSDK] getNativeVideoAD:@"57141680" delegate:self imageRate:ALSImageWHRateOneToOne isTest:YES];
    
    // 预加载广告
    [[Applins shareSDK]preloadNativeAD:@"57141680" delegate:self imageRate:ALSImageWHRateOneToOne preloadImage:YES isTest:YES success:^(ALSNativeAdModel *nativeModel) {
        NSLog(@"预加载成功");
        
        ALSNativeAd *ad = nativeModel;
    } failure:^(NSError *error) {
        NSLog(@"预加载失败:%@", error);
    }];
}


@end

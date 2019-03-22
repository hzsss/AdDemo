//
//  ViewController.m
//  AdTimingDemo
//
//  Created by Acan on 2019/3/22.
//  Copyright © 2019 weiphone. All rights reserved.
//

#import "ViewController.h"
#import <AdTiming/AdTiming.h>

static NSString *const PlacementID = @"4606";
@interface ViewController () <ADTVideoAdDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [ADTVideoAd sharedInstance].delegate = self;
    [[ADTVideoAd sharedInstance] loadWithPlacmentID:PlacementID];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([[ADTVideoAd sharedInstance] isReady:PlacementID]) {
        [[ADTVideoAd sharedInstance] show:PlacementID];
    } else {
        NSLog(@"广告还未准备好");
    }
}


- (void)ADTVideoAdDidClick {
    NSLog(@"视频被点击了");
}

- (void)ADTVideoAdDidFailToLoad:(nonnull NSError *)error {
    NSLog(@"视频加载失败");
}

- (void)ADTVideoAdDidFinish:(ADTVideoAdFinishState)state {
    NSLog(@"视频播放完毕");
}

- (void)ADTVideoAdDidStart {
    NSLog(@"视频开始播放");
}

- (void)ADTVideoAdDidload:(nonnull NSString *)placementID {
    NSLog(@"视频加载完成");
}
@end

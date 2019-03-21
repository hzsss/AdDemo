//
//  ViewController.m
//  VangleVideoDemo
//
//  Created by Acan on 2019/3/21.
//  Copyright © 2019 weiphone. All rights reserved.
//

#import "ViewController.h"
#import <VungleSDK/VungleSDK.h>


NSString *const AppID = @"5c932229986bfc0017800e51";
NSString *const PlacementID = @"DEFAULT-7100501";

@interface ViewController () <VungleSDKDelegate>
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (nonatomic, strong) VungleSDK *sdk;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.playBtn.enabled = NO;
    [self.playBtn addTarget:self action:@selector(playAdVideo) forControlEvents:UIControlEventTouchUpInside];
    
    self.sdk = [VungleSDK sharedSDK];
    [self.sdk setDelegate:self];
}

- (void)vungleSDKDidInitialize { // 判断 SDK 是否初始化成功
    NSLog(@"sdk 初始化成功");
}

- (void)vungleSDKFailedToInitializeWithError:(NSError *)error {
    NSLog(@"初始化 sdk 失败：%@", error);
}

// 广告缓存是否成功
- (void)vungleAdPlayabilityUpdate:(BOOL)isAdPlayable placementID:(NSString *)placementID error:(NSError *)error { // 这里会多次调用，注意调用时机
    NSLog(@"广告位缓存%d成功", isAdPlayable);
    if ([placementID isEqualToString:PlacementID]) {
        self.playBtn.enabled = YES;
        NSError *error;
        [self.sdk loadPlacementWithID:AppID error:&error]; // 为广告位加载广告
    }
}

- (void)playAdVideo {
    if ([self.sdk isAdCachedForPlacementID:PlacementID]) { // 检查广告位置的广告可用性
        NSError *error;
        [self.sdk playAd:self options:nil placementID:PlacementID error:&error]; // 播放广告
    }
}

- (void)vungleWillShowAdForPlacementID:(NSString *)placementID {
    if ([placementID isEqualToString:PlacementID]) {
        NSLog(@"即将播放广告");
    }
}

- (void)vungleWillCloseAdWithViewInfo:(VungleViewInfo *)info placementID:(NSString *)placementID {
    if ([placementID isEqualToString:placementID]) {
        [self.sdk finishedDisplayingAd];
        NSLog(@"停止播放广告");
    }
}

@end

//
//  ViewController.m
//  MobvistaDemo
//
//  Created by Acan on 2019/3/21.
//  Copyright © 2019 weiphone. All rights reserved.
//

#import "ViewController.h"
#import <MTGSDK/MTGSDK.h>

NSString *const UnitID = @"82573";
@interface ViewController () <MTGNativeAdManagerDelegate>

@property (nonatomic, strong) MTGNativeAdManager *adManager;
@property (nonatomic, strong) MTGMediaView *mediaView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.adManager = [[MTGNativeAdManager alloc]
                      initWithUnitID:UnitID
                      fbPlacementId:@""
                      supportedTemplates:@[[MTGTemplate templateWithType:MTGAD_TEMPLATE_BIG_IMAGE adsNum:1]]
                      autoCacheImage:NO
                      adCategory:0
                      presentingViewController:self];
    self.adManager.showLoadingView = YES;
    self.adManager.delegate = self;
    
    // 在 MTGMediaView 上渲染广告
    self.mediaView = [[MTGMediaView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.mediaView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.mediaView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.adManager loadAds]; // 请求广告
}

// 请求广告成功的回调
- (void)nativeAdsLoaded:(NSArray *)nativeAds nativeManager:(MTGNativeAdManager *)nativeManager {
    NSLog(@"请求广告成功");
    
    if (nativeAds.count > 0) {
        MTGCampaign *campaign = nativeAds[0];
        [self.mediaView setMediaSourceWithCampaign:campaign unitId:UnitID];
    }
}

// 请求广告失败的回调
- (void)nativeAdsFailedToLoadWithError:(NSError *)error nativeManager:(MTGNativeAdManager *)nativeManager {
    NSLog(@"请求广告失败");
}

@end

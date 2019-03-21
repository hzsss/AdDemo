//
//  ViewController.m
//  AdNativeDemo
//
//  Created by Acan on 2019/3/21.
//  Copyright © 2019 weiphone. All rights reserved.
//

#import "ViewController.h"
@import GoogleMobileAds;

@interface ViewController () <GADUnifiedNativeAdLoaderDelegate, GADUnifiedNativeAdDelegate>
@property (nonatomic, strong) GADAdLoader *loader;
@property (nonatomic, strong) GADUnifiedNativeAdView *nativeAdView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GADNativeAdImageAdLoaderOptions *loaderOptions = [[GADNativeAdImageAdLoaderOptions alloc] init];
    loaderOptions.shouldRequestMultipleImages = true;
    
    GADNativeAdViewAdOptions *adOptions = [[GADNativeAdViewAdOptions alloc] init];
    adOptions.preferredAdChoicesPosition = GADAdChoicesPositionTopLeftCorner;
    
    GADMultipleAdsAdLoaderOptions *numOptions = [[GADMultipleAdsAdLoaderOptions alloc] init];
    numOptions.numberOfAds = 5;
    
    self.loader = [[GADAdLoader alloc]
                   initWithAdUnitID:@"ca-app-pub-3940256099942544/3986624511"
                   rootViewController:self
                   adTypes:@[kGADAdLoaderAdTypeUnifiedNative]
                   options:@[loaderOptions, adOptions, numOptions]];
    self.loader.delegate = self;
    
    GADRequest *request = [[GADRequest alloc] init];
    [self.loader loadRequest:request];
    
    self.nativeAdView = [[[NSBundle mainBundle] loadNibNamed:@"GADUnifiedNativeAdView" owner:nil options:nil] firstObject];
    [self.view addSubview:self.nativeAdView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.nativeAdView.frame = self.view.bounds;
}

- (void)adLoader:(nonnull GADAdLoader *)adLoader didFailToReceiveAdWithError:(nonnull GADRequestError *)error { 
    if (error) {
        NSLog(@"广告加载失败：%@", error);
    }
}

- (void)adLoaderDidFinishLoading:(GADAdLoader *)adLoader {
    NSLog(@"广告加载成功：%@", adLoader);
}

- (void)adLoader:(GADAdLoader *)adLoader didReceiveUnifiedNativeAd:(GADUnifiedNativeAd *)nativeAd {
    nativeAd.delegate = self;
    
    self.nativeAdView.nativeAd = nativeAd;
    self.nativeAdView.mediaView.mediaContent = nativeAd.mediaContent;
    
}

@end

//
//  ViewController.m
//  AdDemo
//
//  Created by Acan on 2019/3/21.
//  Copyright © 2019 weiphone. All rights reserved.
//

#import "ViewController.h"
@import GoogleMobileAds;

@interface ViewController ()<GADInterstitialDelegate>
@property (nonatomic, strong) GADInterstitial *interstitial;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createInterstital];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.interstitial.isReady) {
        [self.interstitial presentFromRootViewController:self];
    }
}

- (void)createInterstital {
    self.interstitial = [[GADInterstitial alloc] initWithAdUnitID:@"ca-app-pub-3940256099942544/4411468910"];
    self.interstitial.delegate = self;
    
    GADRequest *request = [GADRequest request];
    request.testDevices = @[ kGADSimulatorID, @"58A00AF6-8D34-4CFA-87BC-4A6EE10ACCD4"];
    [self.interstitial loadRequest:request];
}

- (void)interstitialDidReceiveAd:(GADInterstitial *)ad {
    NSLog(@"广告加载完毕");
}

- (void)interstitialDidDismissScreen:(GADInterstitial *)ad {
    [self createInterstital];
}

@end

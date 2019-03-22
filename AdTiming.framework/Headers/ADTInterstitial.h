//
//  ADTInterstitial.h
//  AdTiming SDK
//
//  Copyright 2017 AdTiming Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ADTInterstitialDelegate.h"

NS_ASSUME_NONNULL_BEGIN

/// A modal view controller to represent a AdTiming interstitial ad. This is a full-screen ad shown in your application.
@interface ADTInterstitial : NSObject

/// the delegate
@property (nonatomic, weak)id<ADTInterstitialDelegate> delegate;

/// This is a method to initialize an ADTInterstitial matching the given placement id.
/// Parameter placementID: The id of the ad placement.
- (instancetype)initWithPlacementID:(NSString *)placementID;

/// Begins loading the ADTInterstitial content.
/// You can implement `adtInterstitialDidLoad:` and `adtInterstitial:didFailWithError:` methods of `ADTInterstitialDelegate` if you would like to be notified as loading succeeds or fails.
- (void)load;

/// Presents the interstitial ad modally from the specified view controller.
/// You can implement `adtInterstitialDidClick:` and `adtInterstitialDidClose:`methods of `ADTInterstitialDelegate` if you would like to stay informed for thoses events
- (void)show;

/// Presents the interstitial ad modally from the specified view controller.
/// Parameter viewController: The view controller that will be used to present the interstitial ad.
- (void)showWithRootViewController:(UIViewController *)rootViewController;

@end

NS_ASSUME_NONNULL_END

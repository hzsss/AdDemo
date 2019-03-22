//
//  ADTBannerDelegate.h
//  AdTiming SDK
//
//  Copyright 2017 AdTiming Inc. All rights reserved.
//
#import <Foundation/Foundation.h>

@class ADTBanner;

NS_ASSUME_NONNULL_BEGIN

/// The methods declared by the ADTBannerDelegate protocol allow the adopting delegate to respond to messages from the ADTBanner class and thus respond to operations such as whether the ad has been loaded, the person has clicked the ad.
@protocol ADTBannerDelegate<NSObject>

/// Sent when an ad has been successfully loaded.
- (void)adtBannerDidLoad:(ADTBanner *)adtBanner;

/// Sent after an ADTBanner fails to load the ad.
- (void)adtBanner:(ADTBanner *)adtBanner didFailWithError:(NSError *)error;

/// Sent immediately before the impression of an ADTBanner object will be logged.
- (void)adtBannerWillExposure:(ADTBanner *)adtBanner;

/// Sent after an ad has been clicked by the person.
- (void)adtBannerDidClick:(ADTBanner *)adtBanner;

@end

NS_ASSUME_NONNULL_END

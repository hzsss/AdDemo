//
//  ADTVideoAd.h
//  AdTiming SDK
//
//  Copyright 2017 AdTiming Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ADTVideoAdDelegate.h"

NS_ASSUME_NONNULL_BEGIN

/// A modal view controller to represent a video ad. This is a full-screen ad shown in your application.
@interface ADTVideoAd : NSObject

/// the delegate
@property (nonatomic, weak) id<ADTVideoAdDelegate> delegate;

/// Returns the singleton instance.
+ (instancetype)sharedInstance;

/// Begins loading the ADTVideoAd content.
- (void)loadWithPlacmentID:(NSString*)placementID;
- (BOOL)isReady:(NSString*)placementID;

/// Presents the video ad modally from the specified view controller.
/// Parameter placementID: The id of the ad placement.
- (void)show:(NSString *)placementID;

/// Presents the video ad modally from the specified view controller.
/// Parameter viewController: The view controller that will be used to present the video ad.
/// Parameter placementID: The id of the ad placement.
- (void)show:(UIViewController *)viewController placementID:(NSString *)placementID;

/// Presents the video ad modally from the specified view controller.
/// Parameter viewController: The view controller that will be used to present the video ad.
/// Parameter placementID: The id of the ad placement.
/// Parameter extraParams: Exciting video Id.
- (void)show:(UIViewController *)viewController placementID:(NSString *)placementID extraParams:(NSString*)extraParams;

@end

NS_ASSUME_NONNULL_END

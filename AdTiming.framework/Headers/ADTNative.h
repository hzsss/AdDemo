//
//  ADTNative.h
//  AdTiming SDK
//
//  Copyright 2017 AdTiming Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ADTNativeDelegate.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ADTNativeAdType) {
    ADTNativeAdTypeNormal = 0,/// ad size: 300 x 250
    ADTNativeAdTypeLarge = 1,/// ad size: 1200 x 627
};

/// The ADTNative represents ad metadata to allow you to construct custom ad views.
@interface ADTNative : NSObject

@property(nonatomic, assign) ADTNativeAdType adType;

/// the delegate
@property(nonatomic, weak, nullable) id<ADTNativeDelegate> delegate;

/// This is a method to initialize an ADTNative.
/// placementID: Typed access to the id of the ad placement.
- (instancetype)initWithPlacmentID:(NSString*)placementID;

/// This is a method to initialize an ADTNative.
/// placementID: Typed access to the id of the ad placement.
/// viewController: The view controller that will be used to present the ad and the app store view.
- (instancetype)initWithPlacmentID:(NSString*)placementID rootViewController:(UIViewController*)viewController;

/// Begins loading the ADTNative content.
- (void)loadAd;
@end

NS_ASSUME_NONNULL_END

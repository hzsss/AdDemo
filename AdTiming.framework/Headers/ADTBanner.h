//
//  ADTBanner.h
//  AdTiming SDK
//
//  Copyright 2017 AdTiming Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "ADTBannerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

/// Banner Ad Size
typedef NS_ENUM(NSInteger, ADTBannerType) {
    ADTBannerTypeDefault = 0,       ///ad size: 320 x 50
    ADTBannerTypeLarge = 1,         ///ad size: 320 x 100
    ADTBannerTypeSmart = 2          ///ad size: screen.width x 50
};

/// Banner Ad layout attribute
typedef NS_ENUM(NSInteger, ADTBannerLayoutAttribute) {
    ADTBannerLayoutAttributeTop = 0,
    ADTBannerLayoutAttributeLeft = 1,
    ADTBannerLayoutAttributeBottom = 2,
    ADTBannerLayoutAttributeRight = 3,
    ADTBannerLayoutAttributeHorizontally = 4,
    ADTBannerLayoutAttributeVertically = 5
};

/// A customized UIView to represent a AdTiming ad (banner ad).
@interface ADTBanner : UIView

/// the delegate
@property (nonatomic, weak)id<ADTBannerDelegate> delegate;
/// This is a method to initialize an ADTBanner.
/// type: The size of the ad. Default is ADTBannerTypeDefault.
/// placementID: Typed access to the id of the ad placement.
- (instancetype)initWithBannerType:(ADTBannerType)type placementID:(NSString *)placementID;

/// set the banner position.
- (void)addLayoutAttribute:(ADTBannerLayoutAttribute)attribute constant:(CGFloat)constant;

/// Begins loading the ADTBanner content. And to show with default controller([UIApplication sharedApplication].keyWindow.rootViewController) when load success.
- (void)loadAndShow;

/// Begins loading the ATBannerView content. And to show when load success.
- (void)loadAndShow:(UIViewController *)controller;

@end

NS_ASSUME_NONNULL_END

//
//  ADTNativeView.h
//  AdTiming SDK
//
//  Copyright 2017 AdTiming Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ADTNativeAd;
@class ADTNativeMediaView;

NS_ASSUME_NONNULL_BEGIN

/// A customized UIView to represent a ad (native ad).
@interface ADTNativeView : UIView

@property (nonatomic, strong) ADTNativeAd *nativeAd;
@property (nonatomic, strong) ADTNativeMediaView *mediaView;

/// This is a method to initialize an ADTNativeView.
/// Parameter frame: the ADTNativeView frame.
- (instancetype)initWithFrame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END

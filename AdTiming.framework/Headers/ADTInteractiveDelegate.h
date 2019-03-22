//
//  ADTInteractiveDelegate.h
//  AdTiming
//
//  Created by ylm on 2019/2/14.
//  Copyright © 2019年 AdTiming. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ADTInteractiveDelegate <NSObject>

/// Sent when an ad has been successfully loaded.
- (void)ADTInteractiveDidLoad;

/// Sent after an ADTInteractive fails to load the ad.
- (void)ADTInteractiveDidFailToLoad:(NSError*)error;

/// Sent immediately before the impression of an ADTInteractive object will be logged.
- (void)ADTInteractiveImpression;

/// Sent after an ADTInteractive did close.
- (void)ADTInteractiveDidClose;

@end

NS_ASSUME_NONNULL_END

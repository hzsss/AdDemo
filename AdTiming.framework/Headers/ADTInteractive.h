//
//  ADTInteractive.h
//  AdTiming
//
//  Created by ylm on 2019/2/14.
//  Copyright © 2019年 AdTiming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADTInteractiveDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ADTInteractive : NSObject
/// the delegate
@property (nonatomic, weak)id<ADTInteractiveDelegate> delegate;

/// This is a method to initialize an ADTInteractive matching the given placement id.
/// Parameter placementID: The id of the ad placement.
- (instancetype)initWithPlacementID:(NSString *)placementID;

/// Begins loading the ADTInteractive content.
/// You can implement `ADTInteractiveDidFailToLoad` and `ADTInteractiveDidFailToLoad:` methods of `ADTInteractiveDelegate` if you would like to be notified as loading succeeds or fails.
- (void)load;

/// Presents the ADTInteractive ad modally from the specified view controller.
/// You can implement `ADTInteractiveImpression` and `ADTInteractiveDidClose`methods of `ADTInteractiveDelegate` if you would like to stay informed for thoses events
- (void)show;
@end

NS_ASSUME_NONNULL_END

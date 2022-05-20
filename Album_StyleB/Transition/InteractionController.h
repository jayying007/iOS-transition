//
//  InteractionController.h
//  Album_StyleB
//
//  Created by janezhuang on 2022/5/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InteractionController : NSObject <UIViewControllerInteractiveTransitioning>
@property (nonatomic) UIPanGestureRecognizer *panGesture;
@end

NS_ASSUME_NONNULL_END

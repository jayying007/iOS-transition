//
//  PushAnimationController.m
//  Album_StyleB
//
//  Created by janezhuang on 2022/5/20.
//

#import "PushAnimationController.h"
#import "UIViewController+Transition.h"

@implementation PushAnimationController
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    CGFloat duration = [self transitionDuration:transitionContext];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    CGRect toViewFinalFrame = [transitionContext finalFrameForViewController:toVC];
    
    UIImageView *snapshotView = [[UIImageView alloc] initWithFrame:toVC.snapshotFrame];
    snapshotView.image = toVC.snapshotImage;
    snapshotView.contentMode = UIViewContentModeScaleAspectFit;
    
    UIView *blockView = [[UIView alloc] initWithFrame:snapshotView.frame];
    blockView.backgroundColor = UIColor.whiteColor;
    [containerView addSubview:blockView];
    
    UIView *bgView = [[UIView alloc] initWithFrame:containerView.bounds];
    bgView.backgroundColor = UIColor.whiteColor;
    bgView.alpha = 0;
    [containerView addSubview:bgView];
    
    [containerView addSubview:snapshotView];
    
    toView.alpha = 0;
    [containerView addSubview:toView];
    
    [UIView animateWithDuration:duration animations:^{
        snapshotView.frame = toViewFinalFrame;
        bgView.alpha = 1;
    } completion:^(BOOL finished) {
        toView.alpha = 1;
        [transitionContext completeTransition:YES];
    }];
}
@end

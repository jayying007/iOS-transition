//
//  PopAnimationController.m
//  Album_StyleB
//
//  Created by janezhuang on 2022/5/20.
//

#import "PopAnimationController.h"
#import "UIViewController+Transition.h"

@interface PopAnimationController ()
@property (nonatomic) UIImageView *snapshotView;
@property (nonatomic) UIView *blockView;
@end

@implementation PopAnimationController
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    CGFloat duration = [self transitionDuration:transitionContext];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    CGRect toViewFinalFrame = [transitionContext finalFrameForViewController:toVC];
    
    [containerView addSubview:toView];
    
    self.blockView = [[UIView alloc] initWithFrame:fromVC.snapshotFrame];
    self.blockView.backgroundColor = UIColor.whiteColor;
    [containerView addSubview:self.blockView];
    
    self.snapshotView = [[UIImageView alloc] initWithFrame:containerView.bounds];
    [containerView addSubview:self.snapshotView];
    
    [UIView animateWithDuration:duration animations:^{
        self.snapshotView.frame = fromVC.snapshotFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)animationEnded:(BOOL)transitionCompleted {
    [self.blockView removeFromSuperview];
    [self.snapshotView removeFromSuperview];
}
@end

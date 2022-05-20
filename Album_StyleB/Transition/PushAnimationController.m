//
//  PushAnimationController.m
//  Album_StyleB
//
//  Created by janezhuang on 2022/5/20.
//

#import "PushAnimationController.h"
#import "UIViewController+Transition.h"

@interface PushAnimationController ()
@property (nonatomic) UIImageView *snapshotView;
@property (nonatomic) UIView *blockView;
@property (nonatomic) UIView *bgView;
@end

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
    
    self.snapshotView = [[UIImageView alloc] initWithFrame:toVC.snapshotFrame];
    self.snapshotView.image = toVC.snapshotImage;
    self.snapshotView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.blockView = [[UIView alloc] initWithFrame:self.snapshotView.frame];
    self.blockView.backgroundColor = UIColor.whiteColor;
    [containerView addSubview:self.blockView];
    
    self.bgView = [[UIView alloc] initWithFrame:containerView.bounds];
    self.bgView.backgroundColor = UIColor.whiteColor;
    self.bgView.alpha = 0;
    [containerView addSubview:self.bgView];
    
    [containerView addSubview:self.snapshotView];
    
    toView.alpha = 0;
    [containerView addSubview:toView];
    
    [UIView animateWithDuration:duration animations:^{
        self.snapshotView.frame = toViewFinalFrame;
        self.bgView.alpha = 1;
    } completion:^(BOOL finished) {
        toView.alpha = 1;
        [transitionContext completeTransition:YES];
    }];
}

- (void)animationEnded:(BOOL)transitionCompleted {
    [self.snapshotView removeFromSuperview];
    [self.blockView removeFromSuperview];
    [self.bgView removeFromSuperview];
}
@end

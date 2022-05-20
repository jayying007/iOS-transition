//
//  InteractionController.m
//  Album_StyleB
//
//  Created by janezhuang on 2022/5/20.
//

#import "InteractionController.h"
#import "UIViewController+Transition.h"

@interface InteractionController ()
@property (nonatomic) id<UIViewControllerContextTransitioning> transitionContext;

@property (nonatomic) UIView *fromView_bg_view;
@property (nonatomic) UIImageView *snapshotView;
@end

@implementation InteractionController
- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    CGRect toViewFinalFrame = [transitionContext finalFrameForViewController:toVC];
    
    fromView.hidden = YES;
    
    [containerView addSubview:toView];
    
    UIView *toView_front_view = [[UIView alloc] initWithFrame:fromVC.snapshotFrame];
    toView_front_view.backgroundColor = UIColor.whiteColor;
    [containerView addSubview:toView_front_view];
    
    self.fromView_bg_view = [[UIView alloc] initWithFrame:containerView.bounds];
    self.fromView_bg_view.backgroundColor = UIColor.whiteColor;
    self.fromView_bg_view.alpha = 1;
    [containerView addSubview:self.fromView_bg_view];
    
    self.snapshotView = [[UIImageView alloc] initWithFrame:containerView.bounds];
    self.snapshotView.image = fromVC.snapshotImage;
    self.snapshotView.contentMode = UIViewContentModeScaleAspectFit;
    [containerView addSubview:self.snapshotView];
    
    self.transitionContext = transitionContext;
}


- (void)setPanGesture:(UIPanGestureRecognizer *)panGesture {
    _panGesture = panGesture;
    [_panGesture addTarget:self action:@selector(handlePanGesture:)];
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGesture {
    UIView *containerView = [self.transitionContext containerView];
    CGPoint point = [panGesture translationInView:containerView];
    
    CGFloat completePercent;
    CGFloat scaleFactor;
    
    if (point.y > 0) {
        completePercent = MIN(point.y * 2 / containerView.bounds.size.height, 1);
        
        scaleFactor = 1 - (completePercent * 0.4);
    } else {
        scaleFactor = 1;
        completePercent = 0;
    }
    
    if (panGesture.state == UIGestureRecognizerStateChanged) {
        self.fromView_bg_view.alpha = 1 - completePercent;
        self.snapshotView.transform = CGAffineTransformScale(CGAffineTransformTranslate(CGAffineTransformIdentity, point.x, point.y), scaleFactor, scaleFactor);
    } else if (panGesture.state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [panGesture velocityInView:containerView];
        
        if (velocity.y < 0) {
            [self cancelInteractiveTransition];
            return;
        }
        
        if (velocity.y == 0) {
            if (completePercent > 0.5) {
                [self finishInteractiveTransition];
            } else {
                [self cancelInteractiveTransition];
            }
            return;
        }
        
        [self finishInteractiveTransition];
    } else {
        [self cancelInteractiveTransition];
    }
}

- (void)finishInteractiveTransition {
    UIViewController *fromVC = [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.snapshotView.transform = CGAffineTransformIdentity;
        self.snapshotView.frame = fromVC.snapshotFrame;
        self.fromView_bg_view.alpha = 0;
    } completion:^(BOOL finished) {
        [self.transitionContext finishInteractiveTransition];
        [self.transitionContext completeTransition:YES];
    }];
}

- (void)cancelInteractiveTransition {
    [UIView animateWithDuration:0.2 animations:^{
        self.snapshotView.transform = CGAffineTransformIdentity;
        self.fromView_bg_view.alpha = 1;
    } completion:^(BOOL finished) {
        [self.transitionContext cancelInteractiveTransition];
        [self.transitionContext completeTransition:YES];
    }];
}
@end

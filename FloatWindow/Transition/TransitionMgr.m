//
//  TransitionMgr.m
//  FloatWindow
//
//  Created by janezhuang on 2022/5/22.
//

#import "TransitionMgr.h"
#import "PopInteraction.h"
#import "PopAnimation.h"

@interface TransitionMgr ()
@property (nonatomic) PopInteraction *popInteraction;
@property (nonatomic) PopAnimation *popAnimation;
@end

@implementation TransitionMgr
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static TransitionMgr *instance;
    dispatch_once(&onceToken, ^{
        instance = [[TransitionMgr alloc] init];
    });
    return instance;
}

- (void)handleEdgePanGesture:(UIScreenEdgePanGestureRecognizer *)edgePanGesture {
    [self.popInteraction handleEdgePanGesture:edgePanGesture];
}
#pragma mark - 转场代理
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPop) {
        self.popAnimation = [[PopAnimation alloc] init];
        return self.popAnimation;
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    if (self.useInteraction) {
        self.popInteraction = [[PopInteraction alloc] init];
        return self.popInteraction;
    }
    return nil;
}
@end

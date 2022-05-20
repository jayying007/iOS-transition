//
//  MMNavigationViewController.m
//  Album_StyleB
//
//  Created by janezhuang on 2022/5/20.
//

#import "MMNavigationViewController.h"


@interface MMNavigationViewController () <UINavigationControllerDelegate>

@end

@implementation MMNavigationViewController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.delegate = self;
        self.pushAnimator = [[PushAnimationController alloc] init];
        self.popAnimator = [[PopAnimationController alloc] init];
        self.interactController = [[InteractionController alloc] init];
    }
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        return self.pushAnimator;
    }
    if (operation == UINavigationControllerOperationPop) {
        return self.popAnimator;
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    if (animationController == self.popAnimator) {
        return self.interactController;
    }
    return nil;
}
@end

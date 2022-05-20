//
//  MMNavigationViewController.m
//  Album_StyleB
//
//  Created by janezhuang on 2022/5/20.
//

#import "MMNavigationViewController.h"
#import "PushAnimationController.h"

@interface MMNavigationViewController () <UINavigationControllerDelegate>
@property (nonatomic) PushAnimationController *pushAnimator;
@end

@implementation MMNavigationViewController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.delegate = self;
        self.pushAnimator = [[PushAnimationController alloc] init];
    }
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        return self.pushAnimator;
    }
    return nil;
}
@end

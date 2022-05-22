//
//  MMNavigationController.m
//  Album_StyleA
//
//  Created by janezhuang on 2022/5/20.
//

#import "MMNavigationController.h"
#import "PushAnimationController.h"

@interface MMNavigationController () <UINavigationControllerDelegate>
@property (nonatomic) PushAnimationController *pushAnimator;
@end

@implementation MMNavigationController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData {
    self.delegate = self;
}
#pragma mark -
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        self.pushAnimator = [[PushAnimationController alloc] init];
        return self.pushAnimator;
    }
    return nil;
}
@end

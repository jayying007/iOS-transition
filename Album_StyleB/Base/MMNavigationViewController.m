//
//  MMNavigationViewController.m
//  Album_StyleB
//
//  Created by janezhuang on 2022/5/20.
//

#import "MMNavigationViewController.h"
#import "TransitionController.h"

@interface MMNavigationViewController () <UINavigationControllerDelegate>
@property (nonatomic) TransitionController *transitionController;
@end

@implementation MMNavigationViewController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.transitionController = [[TransitionController alloc] initWithNavController:self];
        self.delegate = self.transitionController;
    }
    return self;
}
@end

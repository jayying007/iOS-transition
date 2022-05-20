//
//  MMNavigationViewController.h
//  Album_StyleB
//
//  Created by janezhuang on 2022/5/20.
//

#import <UIKit/UIKit.h>
#import "PushAnimationController.h"
#import "PopAnimationController.h"
#import "InteractionController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MMNavigationViewController : UINavigationController
@property (nonatomic) PushAnimationController *pushAnimator;
@property (nonatomic) PopAnimationController *popAnimator;
@property (nonatomic) InteractionController *interactController;
@end

NS_ASSUME_NONNULL_END

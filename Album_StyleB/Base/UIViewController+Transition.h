//
//  UIViewController+Transition.h
//  Album_StyleB
//
//  Created by janezhuang on 2022/5/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Transition)
@property (nonatomic) CGRect snapshotFrame;
@property (nonatomic) UIImage *snapshotImage;
@end

NS_ASSUME_NONNULL_END

//
//  UIViewController+Transition.m
//  Album_StyleB
//
//  Created by janezhuang on 2022/5/20.
//

#import "UIViewController+Transition.h"
#import <objc/runtime.h>

static const char* kSnapshotFrame = "snapshotFrame";
static const char* kSnapshotImage = "snapshotImage";

@implementation UIViewController (Transition)
- (CGRect)snapshotFrame {
    NSValue *value = objc_getAssociatedObject(self, kSnapshotFrame);
    return [value CGRectValue];
}

- (void)setSnapshotFrame:(CGRect)snapshotFrame {
    NSValue *value = [NSValue valueWithCGRect:snapshotFrame];
    objc_setAssociatedObject(self, kSnapshotFrame, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)snapshotImage {
    UIImage *image = objc_getAssociatedObject(self, kSnapshotImage);
    return image;
}

- (void)setSnapshotImage:(UIImage *)snapshotImage {
    objc_setAssociatedObject(self, kSnapshotImage, snapshotImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end

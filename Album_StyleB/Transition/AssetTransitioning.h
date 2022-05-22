//
//  AssetTransitioning.h
//  Album_StyleB
//
//  Created by janezhuang on 2022/5/22.
//

#import <UIKit/UIKit.h>
#import "AssetTransitionItem.h"

@protocol AssetTransitioning <NSObject>
- (NSArray<AssetTransitionItem *> *)itemsForTransition:(id<UIViewControllerContextTransitioning>)context;
- (CGRect)targetFrameForItem:(AssetTransitionItem *)item;
@end

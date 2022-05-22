//
//  AlbumViewController.m
//  Album_StyleB
//
//  Created by janezhuang on 2022/5/20.
//

#import "AlbumViewController.h"
#import "ImgFullScreenViewController.h"
#import "AssetTransitioning.h"

@interface AlbumViewController () <AssetTransitioning>
@property (nonatomic) NSArray *imageNames;
@property (nonatomic) NSIndexPath *selectedIndexPath;
@end

@implementation AlbumViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.imageNames = @[@"s_2", @"s_3", @"s_4", @"s_5", @"s_7", @"s_8", @"s_9", @"s_11", @"s_13", @"x_1", @"x_3", @"x_6", @"x_7", @"x_9", @"x_10", @"x_12"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
        self.navigationController.navigationBar.standardAppearance = appearance;
        self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageNames.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UIImage *image = [UIImage imageNamed:self.imageNames[indexPath.item]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = cell.bounds;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [cell.contentView addSubview:imageView];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndexPath = indexPath;
    
    ImgFullScreenViewController *vc = [[ImgFullScreenViewController alloc] initWithImage:self.imageNames[indexPath.row]];
    vc.indexPath = indexPath;
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSArray<AssetTransitionItem *> *)itemsForTransition:(id<UIViewControllerContextTransitioning>)context {
    UICollectionViewCell *cell = [self collectionView:self.collectionView cellForItemAtIndexPath:self.selectedIndexPath];
    
    AssetTransitionItem *item = [[AssetTransitionItem alloc] init];
    item.indexPath = self.selectedIndexPath;
    item.image = [UIImage imageNamed:self.imageNames[self.selectedIndexPath.row]];
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    item.initialFrame = [cell convertRect:cell.bounds toView:window];
    item.initialFrame = CGRectMake(item.initialFrame.origin.x, item.initialFrame.origin.y + self.collectionView.adjustedContentInset.top, item.initialFrame.size.width, item.initialFrame.size.height);
    
    return @[ item ];
}

- (CGRect)targetFrameForItem:(AssetTransitionItem *)item {
    UICollectionViewCell *cell = [self collectionView:self.collectionView cellForItemAtIndexPath:item.indexPath];
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    CGRect rect = [cell convertRect:cell.bounds toView:window];

    return (CGRect) {
        .size = rect.size,
        .origin = {
            .x = rect.origin.x,
            .y = rect.origin.y - self.collectionView.contentOffset.y //为啥需要加这个偏移量？而且和上面的还不一样
        }
    };
}
@end

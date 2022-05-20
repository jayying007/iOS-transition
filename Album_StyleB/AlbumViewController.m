//
//  AlbumViewController.m
//  Album_StyleB
//
//  Created by janezhuang on 2022/5/20.
//

#import "AlbumViewController.h"
#import "ImgFullScreenViewController.h"
#import "UIViewController+Transition.h"

@interface AlbumViewController ()
@property (nonatomic) NSArray *imageNames;
@end

@implementation AlbumViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.imageNames = @[@"s_2", @"s_3", @"s_4", @"s_5", @"s_7", @"s_8", @"s_9", @"s_11", @"s_13", @"x_1", @"x_3", @"x_6", @"x_7", @"x_9", @"x_10", @"x_12"];
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
    cell.contentView.layer.borderWidth = 2;
    cell.contentView.layer.borderColor = UIColor.lightGrayColor.CGColor;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ImgFullScreenViewController *vc = [[ImgFullScreenViewController alloc] initWithImage:self.imageNames[indexPath.row]];
    vc.snapshotImage = [UIImage imageNamed:self.imageNames[indexPath.row]];
    
    UICollectionViewCell *cell = [self collectionView:collectionView cellForItemAtIndexPath:indexPath];
    vc.snapshotFrame = [cell convertRect:cell.frame toView:nil];
    
    [self.navigationController pushViewController:vc animated:YES];
}
@end

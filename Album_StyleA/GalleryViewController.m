//
//  GalleryViewController.m
//  Album_StyleA
//
//  Created by janezhuang on 2022/5/19.
//

#import "GalleryViewController.h"
#import "AlbumCoverViewController.h"

@interface GalleryViewController ()
@property (nonatomic) NSArray *coverNames;
@end

@implementation GalleryViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Bleach";

    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.coverNames = @[@"other", @"main", @"boss"];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.coverNames.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UIImage *image = [UIImage imageNamed:self.coverNames[indexPath.item]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = cell.bounds;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [cell.contentView addSubview:imageView];
    cell.contentView.layer.borderWidth = 2;
    cell.contentView.layer.borderColor = UIColor.lightGrayColor.CGColor;
    
    return cell;
}
#pragma mark -
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(48, 24, 0, 24);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 32;
    
    AlbumCoverViewController *vc = [[AlbumCoverViewController alloc] initWithCollectionViewLayout:flowLayout];
    vc.type = indexPath.item + 1;
    [self.navigationController pushViewController:vc animated:YES];
}
@end

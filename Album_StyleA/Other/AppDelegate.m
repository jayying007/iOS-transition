//
//  AppDelegate.m
//  Album_StyleA
//
//  Created by janezhuang on 2022/5/19.
//

#import "AppDelegate.h"
#import "GalleryViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(150, 150);
    flowLayout.minimumLineSpacing = 40;
    GalleryViewController *vc = [[GalleryViewController alloc] initWithCollectionViewLayout:flowLayout];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end

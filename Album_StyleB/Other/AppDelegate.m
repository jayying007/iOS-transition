//
//  AppDelegate.m
//  Album_StyleB
//
//  Created by janezhuang on 2022/5/20.
//

#import "AppDelegate.h"
#import "AlbumViewController.h"
#import "MMNavigationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(108, 108);
    flowLayout.minimumLineSpacing = 32;
    flowLayout.minimumInteritemSpacing = 32;
    AlbumViewController *vc = [[AlbumViewController alloc] initWithCollectionViewLayout:flowLayout];
    
    self.window.rootViewController = [[MMNavigationViewController alloc] initWithRootViewController:vc];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end

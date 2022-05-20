//
//  ImgFullScreenViewController.m
//  Album_StyleB
//
//  Created by janezhuang on 2022/5/20.
//

#import "ImgFullScreenViewController.h"

@interface ImgFullScreenViewController ()
@property (nonatomic) NSString *imageName;
@end

@implementation ImgFullScreenViewController

- (instancetype)initWithImage:(NSString *)imageName {
    self = [super init];
    if (self) {
        self.imageName = imageName;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:self.imageName];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
}

@end

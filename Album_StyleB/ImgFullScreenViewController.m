//
//  ImgFullScreenViewController.m
//  Album_StyleB
//
//  Created by janezhuang on 2022/5/20.
//

#import "ImgFullScreenViewController.h"
#import "MMNavigationViewController.h"

@interface ImgFullScreenViewController () <UIGestureRecognizerDelegate>
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
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    panGesture.delegate = self;
    [self.view addGestureRecognizer:panGesture];
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGesture {
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        InteractionController *interactController = [(MMNavigationViewController *)self.navigationController interactController];
        interactController.panGesture = panGesture;
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([gestureRecognizer isKindOfClass:UIPanGestureRecognizer.class]) {
        CGPoint point = [(UIPanGestureRecognizer *)gestureRecognizer translationInView:gestureRecognizer.view];

        return point.y > 0 && (fabs(point.y) > fabs(point.x));
    }
    
    return YES;
}
@end

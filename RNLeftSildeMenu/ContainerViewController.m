//
//  ContainerViewController.m
//  SuperDemo
//
//  Created by Rany on 16/8/29.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import "ContainerViewController.h"
#import "DetailViewController.h"
#import "HamburgerView.h"

@interface ContainerViewController ()<UIScrollViewDelegate>

{
    DetailViewController *_detailVC;
    
}

@property (strong, nonatomic) IBOutlet UIScrollView *scorllView;

@property (strong, nonatomic) IBOutlet UIView *menuContainView;

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _isShow = NO;
    
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.menuContainView.layer.anchorPoint = CGPointMake(1.0, 0.5);
    
    [self hideOrShowMenu:NO animated:false];

}


- (void)hideOrShowMenu:(BOOL)isShow animated:(BOOL)isAnimated
{
    CGFloat xOffset = CGRectGetWidth(self.menuContainView.bounds);

    CGPoint contentOffset = isShow?CGPointZero:CGPointMake(xOffset, 0);
    
    [self.scorllView setContentOffset:contentOffset animated:isAnimated];

    _isShow = isShow;

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"DetailViewSegue"]) {
                
        UINavigationController *navVC = (UINavigationController *)segue.destinationViewController;
        
        _detailVC = (DetailViewController *)navVC.topViewController;
    }

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat multiplier = 1.0 / CGRectGetWidth(self.menuContainView.bounds);
    
    CGFloat offset = scrollView.contentOffset.x * multiplier;
    
    CGFloat fraction = 1.0 - offset;

    self.menuContainView.layer.transform = [self transformForFraction:fraction];
    
    self.menuContainView.alpha = fraction;
    

    HamburgerView *rotatingView = (HamburgerView *)_detailVC.hamburger;
    
    [rotatingView rotateWithFraction:fraction];
    
    scrollView.pagingEnabled = scrollView.contentOffset.x < (scrollView.contentSize.width - CGRectGetWidth(scrollView.frame));
    
    CGFloat menuOffset = CGRectGetWidth(self.menuContainView.bounds);
    
    _isShow = !CGPointEqualToPoint(CGPointMake(menuOffset, 0), scrollView.contentOffset);
    
}


- (CATransform3D)transformForFraction:(CGFloat)fraction
{
    
    CATransform3D identity = CATransform3DIdentity;
    
    identity.m34 = -1.0 / 1000.0;
    
    double angle = (1.0 - fraction) * -M_PI_2;
    
    CGFloat xOffset = CGRectGetWidth(self.menuContainView.bounds) * 0.5;
    
    CATransform3D rotateTransform = CATransform3DRotate(identity, angle, 0.0, 1.0, 0.0);
    
    CATransform3D translateTransform = CATransform3DMakeTranslation(xOffset, 0.0, 0.0);
    
    return CATransform3DConcat(rotateTransform, translateTransform);
    
}

@end

//
//  DetailViewController.m
//  SuperDemo
//
//  Created by Rany on 16/8/29.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import "DetailViewController.h"
#import "ContainerViewController.h"
#import "UIColor+HRExtension.h"
@interface DetailViewController ()
{
    ContainerViewController * _menuVC;
}
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNavBarLeftButton];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showDetailView:) name:@"KCallToShowInDetailViewNotification" object:nil];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeMenu)];
    
    [self.view addGestureRecognizer:tapGesture];
}

- (void)closeMenu
{
    [_menuVC hideOrShowMenu:NO animated:YES];
}

- (void)setNavBarLeftButton
{
    _hamburger = [[HamburgerView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    UINavigationController *navVC = (UINavigationController *)self.parentViewController;
    
    _menuVC = (ContainerViewController *)navVC.parentViewController;

    [_hamburger tapViewBlock:^{
                
        
        [_menuVC hideOrShowMenu:!_menuVC.isShow animated:YES];
        
    }];
    
    self.navigationController.navigationBar.clipsToBounds = YES;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:_hamburger];
    
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)showDetailView:(NSNotification *)info
{
    NSDictionary *dict = info.object;
    
    self.view.backgroundColor =  [UIColor colorWithArray:dict[@"colors"]];
    
    self.backgroundImageView.image = [UIImage imageNamed: dict[@"bigImage"]];

    [_menuVC hideOrShowMenu:!_menuVC.isShow animated:YES];
}

-(void)dealloc
{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"KCallToShowInDetailViewNotification" object:nil];
}
@end

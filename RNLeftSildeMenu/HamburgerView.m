//
//  HamburgerView.m
//  SuperDemo
//
//  Created by Rany on 16/8/30.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import "HamburgerView.h"

@interface HamburgerView()

{
    TapBlock _tapBlock;
}
@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation HamburgerView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configure];

    }
    return self;
}


- (void)configure
{
    _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Hamburger"]];
    
    _imageView.frame = self.bounds;
    
    _imageView.contentMode = UIViewContentModeCenter;
    
    [self addSubview:_imageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTarget)];
    
    [self addGestureRecognizer:tap];
}

- (void)rotateWithFraction:(CGFloat)fraction
{
    CGFloat angle = fraction * M_PI_2;
    _imageView.transform = CGAffineTransformMakeRotation(angle);
}

- (void)tapTarget
{
    if (_tapBlock) {
        
        _tapBlock();
    }
}

-(void)tapViewBlock:(TapBlock)block
{
    _tapBlock = block;
}

@end

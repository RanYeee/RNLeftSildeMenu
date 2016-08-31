//
//  HamburgerView.h
//  SuperDemo
//
//  Created by Rany on 16/8/30.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapBlock)();

@interface HamburgerView : UIView

- (void)tapViewBlock:(TapBlock)block;

- (void)rotateWithFraction:(CGFloat)fraction;

@end

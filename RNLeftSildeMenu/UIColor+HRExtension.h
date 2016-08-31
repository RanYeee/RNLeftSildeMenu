//
//  UIColor+HRExtension.h
//  SmartCommunity
//
//  Created by Harvey Huang on 15-3-20.
//  Copyright (c) 2015年 Horizontal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HRExtension)

+ (UIColor*)colorWithHexString:(NSString*)hex;
+ (UIColor *)colorWithHexNumber:(NSInteger)rgbValue;
+ (UIColor *)HFPinkColor;
+ (UIColor *)colorWithHex:(int)color;
+ (UIColor *)colorWithArray:(NSArray *)colorArr;
@end

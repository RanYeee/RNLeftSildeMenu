//
//  LeftMemuCell.m
//  SuperDemo
//
//  Created by Rany on 16/8/29.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import "LeftMemuCell.h"
#import "UIColor+HRExtension.h"

@implementation LeftMemuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureForMenuItem:(NSDictionary *)menuItem
{
    
//    NSLog(@"image>> %@,colors>> %@",menuItem[@"colors"],[self colorWithColorArray:menuItem[@"colors"]]);
    
    self.memuImageView.image = [UIImage imageNamed:menuItem[@"image"]];
    
    self.backgroundColor = [UIColor colorWithArray:menuItem[@"colors"]];
    
}



@end

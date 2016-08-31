//
//  LeftMemuCell.h
//  SuperDemo
//
//  Created by Rany on 16/8/29.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftMemuCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *memuImageView;

- (void)configureForMenuItem:(NSDictionary *)menuItem;

@end

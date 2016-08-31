//
//  MenuViewController.m
//  SuperDemo
//
//  Created by Rany on 16/8/29.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import "MenuViewController.h"
#import "LeftMemuCell.h"

@interface MenuViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    NSArray *_dataArray;
}

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    NSString *path = [[NSBundle mainBundle]pathForResource:@"MenuItems" ofType:@"plist"];
    
    _dataArray = [NSArray arrayWithContentsOfFile:path];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"LeftMemuCell";
    
    LeftMemuCell *cell = (LeftMemuCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    [cell configureForMenuItem:_dataArray[indexPath.row]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return MAX(80, CGRectGetHeight(self.view.bounds)/_dataArray.count);
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dict = _dataArray[indexPath.row];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"KCallToShowInDetailViewNotification" object:dict];
}


@end

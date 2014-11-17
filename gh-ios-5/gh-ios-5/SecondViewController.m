//
//  SecondViewController.m
//  gh-ios-5
//
//  Created by Dmitry on 15.11.14.
//  Copyright (c) 2014 Dmitry Tarianyk. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize mTableView;

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat height = self.view.frame.size.height - self.tabBarController.tabBar.frame.size.height;
    CGRect rect = CGRectMake(0, 20, self.view.frame.size.width, height - 20);
    
    mTableView = [[UITableView alloc] initWithFrame:rect];
    [self.view addSubview:mTableView];
    [mTableView setDataSource:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    [cell.textLabel setText:[[NSString alloc] initWithFormat:@"Item %li", (long)indexPath.row]];
    
    return cell;
}

@end

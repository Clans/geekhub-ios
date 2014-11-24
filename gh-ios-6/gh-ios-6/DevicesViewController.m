//
//  ViewController.m
//  gh-ios-6
//
//  Created by Dmitry on 19.11.14.
//  Copyright (c) 2014 Dmitry Tarianyk. All rights reserved.
//

#import "DevicesViewController.h"
#import "InfoViewController.h"

@interface DevicesViewController ()

@property (nonatomic, strong) NSArray *iPhones;
@property (nonatomic, strong) NSArray *iPads;

@end

NSString *const IPhoneCellIdentifier = @"IPhoneCellIdentifier";
NSString *const IPadCellIdentifier = @"IPadCellIdentifier";

@implementation DevicesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _iPhones = [[NSArray alloc] initWithObjects:@"iPhone", @"iPhone 3GS", @"iPhone 4", @"iPhone 5", @"iPhone 6", nil];
    _iPads = [[NSArray alloc] initWithObjects:@"iPad 2", @"iPad 3", @"iPad 4", @"iPad Air", nil];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    [tableView release]; // ??
    
    [self setTitle:@"Devices"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [_iPhones count];
    } else {
        return [_iPads count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellId;
    if (indexPath.section == 0) {
        cellId = IPhoneCellIdentifier;
    } else {
        cellId = IPadCellIdentifier;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId] autorelease];
    }
    
    NSString *title;
    if (indexPath.section == 0) {
        title = _iPhones[indexPath.row];
    } else {
        title = [_iPads objectAtIndex:indexPath.row];
    }
    
    [[cell textLabel] setText:title];

    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"iPhones";
    } else {
        return @"iPads";
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *deviceName = selectedCell.textLabel.text;
    
    InfoViewController *infoController = [[InfoViewController alloc] initWithDeviceName:deviceName];
    [self.navigationController pushViewController:infoController animated:YES];
    [infoController release];
}

- (void) dealloc {
    [_iPhones release];
    [_iPads release];
    
    [super dealloc];
}

@end

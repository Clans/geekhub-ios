//
//  FirstViewController.m
//  gh-ios-5
//
//  Created by Dmitry on 15.11.14.
//  Copyright (c) 2014 Dmitry Tarianyk. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

//@synthesize books;
//@synthesize bookKeys;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"items" ofType:@"plist"];
    
    _books = [[NSDictionary alloc] initWithContentsOfFile:file];
    _bookKeys = [_books allKeys];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [_books count];
    } else {
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    NSString *bookName;
    if (indexPath.section == 0) {
        bookName = [_bookKeys objectAtIndex:indexPath.row];
    } else {
        bookName = [[NSString alloc] initWithFormat:@"Item %li", (long)indexPath.row];
    }
    
    [[cell textLabel] setText:bookName];
    
    NSString *authorName;
    if (indexPath.section == 0) {
        authorName = [_books objectForKey:[_bookKeys objectAtIndex:indexPath.row]];
    } else {
        authorName = [[NSString alloc] initWithFormat:@"Description for item %li", (long)indexPath.row];
    }
    
    [[cell detailTextLabel] setText:authorName];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Java books";
    } else {
        return @"Placeholder items";
    }
}

@end

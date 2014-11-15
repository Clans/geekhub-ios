//
//  FirstViewController.h
//  gh-ios-5
//
//  Created by Dmitry on 15.11.14.
//  Copyright (c) 2014 Dmitry Tarianyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITableViewDataSource>

@property (nonatomic, strong) NSDictionary *books;
@property (nonatomic, strong) NSArray *bookKeys;

@end


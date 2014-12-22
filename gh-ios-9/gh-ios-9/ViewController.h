//
//  ViewController.h
//  gh-ios-9
//
//  Created by Dmitry on 21.12.14.
//  Copyright (c) 2014 Dmitry Tarianyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController <UITextFieldDelegate, NSFetchedResultsControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end


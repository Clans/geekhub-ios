//
//  ViewController.h
//  gh-ios-8
//
//  Created by Dmitry on 06.12.14.
//  Copyright (c) 2014 Dmitry Tarianyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

extern NSString *const IMAGES_FOLDER;

- (IBAction)startWorking:(id)sender;

@end


//
//  ViewController.h
//  CurrencyConverter
//
//  Created by Dmitry on 17.01.15.
//  Copyright (c) 2015 Dmitry Tarianyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

- (IBAction)selectFromCurrency:(id)sender;
- (IBAction)selectToCurrency:(id)sender;
- (IBAction)convert:(id)sender;

@end


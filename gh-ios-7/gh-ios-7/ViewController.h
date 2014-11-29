//
//  ViewController.h
//  gh-ios-7
//
//  Created by Dmitry on 29.11.14.
//  Copyright (c) 2014 geekhub. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UITextFieldDelegate>

- (IBAction)buttonPressed:(UIButton *)sender;

- (IBAction)setSegmentedLabel:(UISegmentedControl *)sender;

- (IBAction)onSliderValueChanged:(UISlider *)sender;

- (IBAction)showAlert:(UISwitch *)sender;

- (IBAction)showProgress:(UIButton *)sender;

- (IBAction)stepperValueChanged:(UIStepper *)sender;

- (IBAction)onImageButtonClicked:(UIButton *)sender;
@end

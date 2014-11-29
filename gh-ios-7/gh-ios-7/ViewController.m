//
//  ViewController.m
//  gh-ios-7
//
//  Created by Dmitry on 29.11.14.
//  Copyright (c) 2014 geekhub. All rights reserved.
//


#import "ViewController.h"


@interface ViewController ()

@property(nonatomic, weak) IBOutlet UILabel *btnLabel;
@property(nonatomic, weak) IBOutlet UISegmentedControl *segmentedControl;
@property(nonatomic, weak) IBOutlet UILabel *segmentLabel;
@property(nonatomic, weak) IBOutlet UILabel *inputLabel;
@property(nonatomic, weak) IBOutlet UISlider *slider;
@property(nonatomic, weak) IBOutlet UILabel *sliderLabel;
@property(nonatomic, weak) IBOutlet UIButton *progressBtn;
@property(nonatomic, weak) IBOutlet UIActivityIndicatorView *progressIndicator;
@property(nonatomic, weak) IBOutlet UIStepper *stepper;
@property(nonatomic, weak) IBOutlet UILabel *stepperLabel;
@property(nonatomic, weak) IBOutlet UIButton *imageBtn;
@property(nonatomic, strong) IBOutlet UIImageView *imageView;
@property(nonatomic, weak) IBOutlet UISwitch *uiSwitch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _segmentLabel.text = [_segmentedControl titleForSegmentAtIndex:(NSUInteger) _segmentedControl.selectedSegmentIndex];
    _sliderLabel.text = [NSString stringWithFormat:@"%d%%", (int) (_slider.value * 100)];
    _stepperLabel.text = [NSString stringWithFormat:@"%d", (int) _stepper.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    _btnLabel.text = @"Button pressed";
}

- (IBAction)setSegmentedLabel:(UISegmentedControl *)sender {
    _segmentLabel.text = [sender titleForSegmentAtIndex:(NSUInteger) sender.selectedSegmentIndex];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    _inputLabel.text = textField.text;
    return YES;
}

- (IBAction)onSliderValueChanged:(UISlider *)sender {
    _sliderLabel.text = [NSString stringWithFormat:@"%d%%", (int) (sender.value * 100)];
}

- (IBAction)showAlert:(UISwitch *)sender {
    UIAlertView *alertView = [[UIAlertView alloc]
            initWithTitle:@"Alert"
                  message:[NSString stringWithFormat:@"Switch state was changed to %@", sender.isOn ? @"ON" : @"OFF"]
                 delegate:nil
        cancelButtonTitle:@"OK"
        otherButtonTitles:nil];

    [alertView show];
}

- (IBAction)showProgress:(UIButton *)sender {
    if ([_progressIndicator isAnimating]) {
        [_progressIndicator stopAnimating];
    } else {
        [_progressIndicator startAnimating];
    }
}

- (IBAction)stepperValueChanged:(UIStepper *)sender {
    _stepperLabel.text = [NSString stringWithFormat:@"%d", (int) sender.value];
}

- (IBAction)onImageButtonClicked:(UIButton *)sender {
    _imageView.image = [UIImage imageNamed:@"glass-hack.png"];
}
@end
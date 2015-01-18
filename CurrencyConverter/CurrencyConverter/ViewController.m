//
//  ViewController.m
//  CurrencyConverter
//
//  Created by Dmitry on 17.01.15.
//  Copyright (c) 2015 Dmitry Tarianyk. All rights reserved.
//

#import "ViewController.h"
#import "ActionSheetStringPicker.h"
#import "AFHTTPRequestOperationManager.h"
#import "Currency.h"
#import "math.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *currencyFrom;
@property (weak, nonatomic) IBOutlet UITextField *currencyTo;
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UIPickerView *picker2;
@property (strong, nonatomic) NSArray *currencies;
@property (strong, nonatomic) NSMutableArray *currenciesArray;
@property (weak, nonatomic) IBOutlet UITextField *amount;
@property (weak, nonatomic) IBOutlet UILabel *result;

@property (strong, nonatomic) Currency *fromCurrency;
@property (strong, nonatomic) Currency *toCurrency;

@end

@implementation ViewController

static NSString * const URL = @"https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=11";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self parseJsonResponse:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)initPickers {
    _currencies = [[NSArray alloc] initWithObjects:@"UAH", @"USD", @"EUR", @"RUR", nil];
}

- (IBAction)selectFromCurrency:(id)sender {
    if (!_currencies) {
        return;
    }
    
    [ActionSheetStringPicker showPickerWithTitle:@"Select from currency"
                                            rows:_currencies
                                initialSelection:0
                                       doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
                                           if ([sender respondsToSelector:@selector(setText:)]) {
                                               [sender performSelector:@selector(setText:) withObject:selectedValue];
                                           }
                                           
                                           _fromCurrency = nil;
                                           for (Currency *currency in _currenciesArray) {
                                               NSLog(@"currency from: %@", currency.ccy);
                                               NSLog(@"selectedValue: %@", selectedValue);
                                               
                                               if ([currency.ccy isEqualToString:selectedValue]) {
                                                   _fromCurrency = currency;
                                                   NSLog(@"selected from currency: %@", currency.ccy);
                                                   break;
                                               }
                                           }
                                       }
                                     cancelBlock:nil origin:sender];
}

- (IBAction)selectToCurrency:(id)sender {
    if (!_currencies) {
        return;
    }
    
    [ActionSheetStringPicker showPickerWithTitle:@"Select to currency"
                                            rows:_currencies
                                initialSelection:0
                                       doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
                                           if ([sender respondsToSelector:@selector(setText:)]) {
                                               [sender performSelector:@selector(setText:) withObject:selectedValue];
                                           }
                                           
                                           _toCurrency = nil;
                                           for (Currency *currency in _currenciesArray) {
                                               NSLog(@"currency to: %@", currency.ccy);
                                               NSLog(@"selectedValue: %@", selectedValue);
                                               
                                               if ([currency.ccy isEqualToString:selectedValue]) {
                                                   _toCurrency = currency;
                                                   NSLog(@"selected to currency: %@", currency.ccy);
                                                   break;
                                               }
                                           }
                                       }
                                     cancelBlock:nil origin:sender];
}

- (IBAction)convert:(id)sender {
    double amount = abs([_amount.text doubleValue]);
    double rate;
    double result;
    
    if (!_fromCurrency && !_toCurrency) {
        result = amount;
    } else if (_fromCurrency && _toCurrency) {
        if (_fromCurrency == _toCurrency) {
            result = amount;
        } else {
            double uah = [_fromCurrency.buy doubleValue] * amount;
            result = uah / [_toCurrency.sale doubleValue];
        }
    } else {
        if (!_toCurrency) {
            rate = [_fromCurrency.buy doubleValue];
            result = amount * rate;
        } else {
            rate = [_toCurrency.sale doubleValue];
            result = amount / rate;
        }
    }
    
    [_result setText:[NSString stringWithFormat:@"Result: %0.3f", result]];
}

- (void) parseJsonResponse:(id)responseObject {
    NSArray *responseArray = responseObject;
    _currenciesArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *object in responseArray) {
        Currency *currency = [Currency new];
        [currency setValuesForKeysWithDictionary:object];
        [_currenciesArray addObject:currency];
    }
    
    [self initPickers];
}
@end

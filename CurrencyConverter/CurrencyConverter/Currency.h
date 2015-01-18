//
//  CurObject.h
//  CurrencyConverter
//
//  Created by Dmitry on 18.01.15.
//  Copyright (c) 2015 Dmitry Tarianyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Currency : NSObject

@property (strong, nonatomic) NSString *ccy;
@property (strong, nonatomic) NSString *base_ccy;
@property (strong, nonatomic) NSString *buy;
@property (strong, nonatomic) NSString *sale;

@end

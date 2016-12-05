//
//  ExchangeRatesManager.m
//  ConverterMany
//
//  Created by Student on 19.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//
#import "ExchangeRatesManager.h"
#import "Currency.h"
#import "Date.h"

@implementation ExchangeRatesManager
{
    NSDictionary *exchangeRates;
}

@synthesize errorHandler = _errorHandler;

- ( instancetype ) init
{
    self = [super init];
    
    [ self makeExchangeRates ];
    
    return self;
}

- ( void ) makeExchangeRates
{
    NSMutableDictionary *rates = [ [ NSMutableDictionary alloc] init ];
    
    [rates setObject : @( 0.015 ) forKey : @"USD" ];
    [rates setObject : @( 0.02 ) forKey : @"AUD" ];
    [rates setObject : @( 0.012 ) forKey : @"GBP" ];
    
    exchangeRates = [ rates copy ];
}

- ( void ) exchangeRateForCurrency : ( Currency * ) currency completion : ( void (^)( NSNumber * ) ) completion
{
    completion( exchangeRates[ currency.code ] );
}

- ( void ) exchangeCourseForDate : ( Date * ) date completion : ( void (^)( NSMutableArray * ) ) completion
{
    completion( exchangeRates[ date.date ] );
}
@end

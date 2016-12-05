//
//  AppContext.h
//  ConverterMany
//
//  Created by Student on 19.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IExchangeRatesManager.h"

@class CurrencyManager;
@class ExchangeRatesManager;
@class AppConfig;
@protocol IExchangeRatesManager;

@interface AppContext : NSObject

@property ( nonatomic, strong, readonly ) AppConfig *config;

@property ( nonatomic, strong, readonly ) CurrencyManager *currencyManager;
@property ( nonatomic, strong, readonly ) id< IExchangeRatesManager > exchangeRatesManager;

- ( instancetype ) initWithConfigName : ( NSString * ) configName;

- ( instancetype ) init NS_UNAVAILABLE;

@end

//
//  AppContext.m
//  ConverterMany
//
//  Created by Student on 19.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import "AppContext.h"
#import "CurrencyManager.h"
#import "ExchangeRatesManager.h"
#import "AppConfig.h"
#import "RemoteExchangeRatesManager.h"

@implementation AppContext

- ( instancetype ) initWithConfigName : ( NSString * ) configName
{
    self = [ super init ];
    
    _config = [ [ AppConfig alloc ] initWithConfigName : configName ];
    
    _currencyManager = [ [ CurrencyManager alloc ] init ];
    
    _exchangeRatesManager = _config.useRemoteExchangeRates ? [ [ RemoteExchangeRatesManager alloc ] initWithAppConfig :_config baseCurrency : _currencyManager.baseCurrency ] : [ [ ExchangeRatesManager alloc ] init ];
    
    return self;
}

- ( instancetype ) init
{
    assert( NO );
    return nil;
}

@end

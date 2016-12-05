//
//  RemoteExchangeRatesManager.m
//  ConverterMany
//
//  Created by Student on 19.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import "RemoteExchangeRatesManager.h"

#import "Currency.h"
#import "Date.h"
#import "RequestHelper.h"
#import "AppConfig.h"

@implementation RemoteExchangeRatesManager
{
    AppConfig *config;
    
    NSDictionary *currencyRates;
    RequestHelper< NSDictionary * > *requestHelper;
    
    Currency *currentCurrency;
    Currency *baseCurrency;
    Date *currentDate;
    
    void ( ^completionHandler )( NSNumber * );
    void ( ^completionHandlerSecond )( NSMutableArray * );
}

@synthesize errorHandler = _errorHandler;

- ( instancetype ) initWithAppConfig : ( AppConfig * ) appConfig baseCurrency : ( Currency * ) aBaseCurrency
{
    assert( nil != appConfig );
    assert( nil != aBaseCurrency );
    
    self = [ super init ];
    
    config = appConfig;
    baseCurrency = aBaseCurrency;
    
    return self;
}

- ( void ) loadRates : ( NSString * ) option;
{
    currencyRates = nil;
    
    NSDictionary *params = @{ @"base" : baseCurrency.code };
    
    typeof( self ) __weak weakSelf = self;
    
    if( [ option isEqualToString : @"currensy" ] )
    {
        requestHelper = [ [ RequestHelper < NSDictionary * > alloc ] initWithAppConfig : config apiMethod : @"/latest" params :params paramsSecond : nil ];
        requestHelper.responseHandler = ^( NSDictionary *response )
        {
            [ weakSelf updateRates:response ];
        };
    }
    
    if( [ option isEqualToString : @"date" ] )
    {
        NSString *valutes = @"RUB,USD,GBP,AUD";
        NSDictionary *paramsSecond = @{ @"symbols": valutes };
        requestHelper = [ [ RequestHelper< NSDictionary * > alloc ] initWithAppConfig:config apiMethod : [ @"/" stringByAppendingString : currentDate.date ] params : params paramsSecond : paramsSecond ];
        requestHelper.responseHandler = ^( NSDictionary *response )
        {
            [ weakSelf updateRatesDate:response ];
        };
    }
    
  
    
    requestHelper.failureHandler = ^( NSError *error )
    {
        [ weakSelf handleError : error ];
    };
    
    [ requestHelper execute ];
}

- ( void ) exchangeRateForCurrency : ( Currency * ) currency completion : ( void (^)( NSNumber * ) ) completion
{
    if( [ currency isEqual:currentCurrency ] )
    {
        completion( currencyRates[ currency.code ] );
        return;
    }
    
    currentCurrency = currency;
    completionHandler = [ completion copy ];
    
    [ self loadRates : @"currensy" ];
}

- ( void ) exchangeCourseForDate : ( Date * ) date completion : ( void(^)(NSMutableArray * ) ) completion
{
    currentDate = date;
    completionHandlerSecond = [ completion copy ];
    [ self loadRates : @"date" ];
}
- ( void ) updateRatesDate : ( NSDictionary * ) rates
{
    currencyRates = rates[ @"rates" ];
    NSMutableArray *rate = [ [ NSMutableArray alloc ] init ];
    if( NULL != completionHandlerSecond )
    {
        if ( ! [ baseCurrency.code isEqualToString : @"RUB" ] )
        {
            [ rate addObject : currencyRates[ @"RUB" ] ];
        }
        if ( ! [ baseCurrency.code isEqualToString : @"USD" ] )
        {
           [ rate addObject : currencyRates[ @"USD" ] ];
        }
        if ( ! [ baseCurrency.code isEqualToString : @"GBP" ] )
        {
           [ rate addObject : currencyRates[ @"GBP" ] ];
        }
        if ( ! [ baseCurrency.code isEqualToString:  @"AUD" ] )
        {
           [ rate addObject : currencyRates[ @"AUD" ] ];
        }
        
        dispatch_async( dispatch_get_main_queue(), ^{
            completionHandlerSecond( rate );
            completionHandlerSecond = NULL;
        } );
    }
}

- ( void ) updateRates : ( NSDictionary * ) rates
{
    currencyRates = rates[ @"rates" ];
    
    if( NULL != completionHandler )
    {
        NSNumber *rate = currencyRates[ currentCurrency.code ];
        
        dispatch_async( dispatch_get_main_queue(), ^{
            completionHandler( rate );
            completionHandler = NULL;
        } );
    }
}

- ( void ) handleError : ( NSError * ) error
{
    if( NULL != _errorHandler )
    {
        dispatch_async( dispatch_get_main_queue(), ^{
            _errorHandler( error );
        });
    }
}

- ( instancetype )init
{
    assert( NO );
    return nil;
}

@end

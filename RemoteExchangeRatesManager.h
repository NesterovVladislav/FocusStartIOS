//
//  RemoteExchangeRatesManager.h
//  ConverterMany
//
//  Created by Student on 19.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IExchangeRatesManager.h"

@class AppConfig;

@interface RemoteExchangeRatesManager : NSObject< IExchangeRatesManager >

- ( instancetype ) initWithAppConfig : ( AppConfig * ) appConfig baseCurrency : ( Currency * ) aBaseCurrency;

- ( instancetype ) init NS_UNAVAILABLE;

@end

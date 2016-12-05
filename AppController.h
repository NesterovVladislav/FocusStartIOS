//
//  AppController.h
//  CurrencyConverter
//
//  Created by Kirill Zuev on 04/11/2016.
//  Copyright © 2016 Kirill Zuev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppContext;

@interface AppController : NSObject

@property ( nonatomic, strong, readonly ) AppContext *appContext;

- ( instancetype ) initWithConfigName : ( NSString * ) configName;

- ( instancetype ) init NS_UNAVAILABLE;

@end

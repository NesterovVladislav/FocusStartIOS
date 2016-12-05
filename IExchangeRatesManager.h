//
//  IExchangeRatesManager.h
//  ConverterMany
//
//  Created by Student on 19.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Currency;
@class Date;

@protocol IExchangeRatesManager < NSObject >

@property ( nonatomic, nullable, copy ) void ( ^errorHandler )( NSError *error );

- ( void ) exchangeRateForCurrency : ( Currency * ) currency completion : ( void (^)( NSNumber *exchangeRate ) ) completion;
- ( void ) exchangeCourseForDate : ( Date * ) date completion : ( void (^)( NSMutableArray *exchangeCourse ) ) completion;

NS_ASSUME_NONNULL_END

@end

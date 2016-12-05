//
//  CurrencyManager.h
//  ConverterMany
//
//  Created by Student on 12.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Currency;

@interface CurrencyManager : NSObject

@property (nonatomic, copy, readonly) NSArray<Currency *> *currencies;
@property (nonatomic, readonly) NSString *currencyBase;
@property (nonatomic, readonly) NSString *currencyOption;
@property (nonatomic, readonly) Currency *defaultCurrency;
@property (nonatomic, readonly) Currency *baseCurrency;
-(instancetype)initWithCurrencyManager:(NSMutableArray *) aCurrencyArray;
- (instancetype)init;

@end

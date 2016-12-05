//
//  CurrencyManager.m
//  ConverterMany
//
//  Created by Student on 12.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import "CurrencyManager.h"
#import "Currency.h"

@implementation CurrencyManager
-(instancetype)initWithCurrencyManager:(NSMutableArray *) aCurrencyArray{
    self = [super init];
    
    NSMutableArray *currencies = [[NSMutableArray alloc] init];
    
    Currency * baseCur = [self baseCurrency];
    int i=0;
    if ( ![baseCur.code isEqualToString: @"RUB"])
    {
       [currencies addObject:[Currency currencyWithCode:@"RUB" name:[ NSString stringWithFormat : @"%@", [aCurrencyArray objectAtIndex:i]]]];
        ++i;
    }
    if ( ![baseCur.code isEqualToString: @"USD"])
    {
       [currencies addObject:[Currency currencyWithCode:@"USD" name:[ NSString stringWithFormat : @"%@", [aCurrencyArray objectAtIndex:i]]]];
        ++i;
    }
    if ( ![baseCur.code isEqualToString: @"GBP"])
    {
       [currencies addObject:[Currency currencyWithCode:@"GBP" name:[ NSString stringWithFormat : @"%@", [aCurrencyArray objectAtIndex:i]]]];
        ++i;
    }
    if ( ![baseCur.code isEqualToString: @"AUD"])
    {
          [currencies addObject:[Currency currencyWithCode:@"AUD" name:[ NSString stringWithFormat : @"%@", [aCurrencyArray objectAtIndex:i]]]];
        ++i;
    }
    
 
    
 
    _currencies = [currencies copy];
    
    return self;
    
}
- (instancetype)init
{
    self = [super init];
    
    NSMutableArray *currencies = [[NSMutableArray alloc] init];
    Currency * baseCur = [self baseCurrency];
    if ( ![baseCur.code isEqualToString: @"RUB"])
    {
    [currencies addObject:[Currency currencyWithCode:@"RUB" name:@"Российский рубль"]];
    }
    if ( ![baseCur.code isEqualToString: @"USD"])
    {
    [currencies addObject:[Currency currencyWithCode:@"USD" name:@"Доллар США"]];
    }
    if ( ![baseCur.code isEqualToString: @"GBP"])
    {
    [currencies addObject:[Currency currencyWithCode:@"GBP" name:@"Фунт стерлингов"]];
    }
    if ( ![baseCur.code isEqualToString: @"AUD"])
    {
    [currencies addObject:[Currency currencyWithCode:@"AUD" name:@"Австралийский доллар"]];
    }
    
    _currencies = [currencies copy];
    
    return self;
}

- (Currency *)defaultCurrency
{
    return _currencies.firstObject;
}

- (Currency *)baseCurrency
{
    NSString *configName = @"config.plist";
    NSString *localConfigPath = [[NSBundle mainBundle] pathForResource:configName.stringByDeletingPathExtension
                                                                ofType:configName.pathExtension];
    
    NSDictionary *contents = [NSDictionary dictionaryWithContentsOfFile:localConfigPath];
    return [Currency currencyWithCode:contents[NSStringFromSelector(@selector(currencyBase))] name:contents[NSStringFromSelector(@selector(currencyOption))]];
}

@end

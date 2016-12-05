//
//  Currency.m
//  ConverterMany
//
//  Created by Student on 12.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import "Currency.h"

@implementation Currency

+ (instancetype)currencyWithCode:(NSString *)code name:(NSString *)name
{
    Currency *result = [[Currency alloc] initWithCode:code name:name];
    
    return result;
}

- (instancetype)initWithCode:(NSString *)code name:(NSString *)name
{
    self = [super init];
    
    _code = [code copy];
    _name = [name copy];
    
    return self;
}

- (BOOL)isEqualToCurrency:(Currency *)currency
{
    return _code == currency.code;
}

- (BOOL)isEqual:(id)other
{
    if(other == self)
    {
        return YES;
    }
    
    if(NO == [other isKindOfClass:[self class]])
    {
        return NO;
    }
    
    return [self isEqualToCurrency:other];
}

- (NSUInteger)hash
{
    return _code.hash;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end

//
//  Date.m
//  ConverterMany
//
//  Created by Student on 26.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import "Date.h"

@implementation Date
+ (instancetype)dateWithCode:(NSDate *)code
{
    Date *result = [[Date alloc] initWithCode:code];
    
    return result;
}

- (instancetype)initWithCode:(NSDate *)code
{
    self = [super init];
    
    static NSDateFormatter *dateFormatter;
    dateFormatter = [[ NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    _date = [dateFormatter stringFromDate: code];

    
    return self;
}

- (BOOL)isEqualToDate:(Date *)date
{
    return _date == date.date;
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
    
    return [self isEqualToDate:other];
}

- (NSUInteger)hash
{
    return _date.hash;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}

@end

 

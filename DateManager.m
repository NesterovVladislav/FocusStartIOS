//
//  DateManager.m
//  ConverterMany
//
//  Created by Student on 26.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import "DateManager.h"
#import "Date.h"

@implementation DateManager
- (instancetype)init
{
    self = [super init];
    
    NSMutableArray *dates = [[NSMutableArray alloc] init];
    NSDate *currentDate = [NSDate date];
    for( int i =0; i <=21; i++){
    [dates addObject:[Date dateWithCode:[currentDate dateByAddingTimeInterval:-(i*60*60*24)]]];
    }
    _dates = [dates copy];
    
    return self;
}

- (Date *)defaultCurrency
{
    return _dates.firstObject;
}

@end

 

//
//  DateManager.h
//  ConverterMany
//
//  Created by Student on 26.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Date;

@interface DateManager : NSObject
@property (nonatomic, copy, readonly) NSArray<Date *> *dates;

@property (nonatomic, readonly) Date *defaultCurrency;
 
- (instancetype)init;
@end

//
//  Date.h
//  ConverterMany
//
//  Created by Student on 26.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Date : NSObject

@property (nonatomic, readonly) NSString * date;


+(instancetype) dateWithCode:(NSDate *) code ;

-(instancetype) initWithCode:(NSDate *) code ;


-(instancetype) init NS_UNAVAILABLE;


@end

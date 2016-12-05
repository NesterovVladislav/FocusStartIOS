//
//  CurrenayConverter.m
//  ConverterMany
//
//  Created by Student on 29.10.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import "CurrenayConverter.h"

@implementation CurrenayConverter

-( NSDecimalNumber * ) convertRubtoUSD : ( NSDecimalNumber * ) value and : ( NSDecimalNumber * ) cource{
    return [ value decimalNumberByMultiplyingBy : cource ];
}
-(float)convertCodeInCourse:(NSString *)code{
    float course;
    if( [code  isEqualToString:@"USD" ]){
        course = 62.5;
    } else if( [code isEqualToString:@"FRK"]){
        course = 32.5;
    }else{
        course = 5.03;
    }
    return course;
}

@end

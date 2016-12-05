//
//  CurrenayConverter.h
//  ConverterMany
//
//  Created by Student on 29.10.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrenayConverter : NSObject
    -( NSDecimalNumber * ) convertRubtoUSD : ( NSDecimalNumber * ) value and : ( NSDecimalNumber * ) cource;
    -(float)convertCodeInCourse:(NSString *)code;
@end

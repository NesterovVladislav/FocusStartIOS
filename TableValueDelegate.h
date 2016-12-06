//
//  TableValueDelegate.h
//  ConverterMany
//
//  Created by Student on 05.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Currency.h"
#import "Date.h"

@protocol TableValueDelegate <NSObject>

- ( void ) finishSelectValueWantedClose : ( Currency * ) currency;
- ( void ) finishHistory;
@end

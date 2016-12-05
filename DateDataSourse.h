//
//  DateDataSourse.h
//  ConverterMany
//
//  Created by Student on 26.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DateManager.h"

@class Date;
@interface DateDataSourse : NSObject< UITableViewDataSource, UITableViewDelegate >
@property(nonatomic, readonly) Date * selectedDate;
-(instancetype)initWithDateManager:(DateManager *) aDateManager;
-(NSString *) getDate;
-( instancetype)  init NS_UNAVAILABLE;
@end



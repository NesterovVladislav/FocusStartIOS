//
//  ViewHistory.h
//  ConverterMany
//
//  Created by Student on 28.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableValueDelegate.h"
@class Date;
@interface ViewHistory : UIViewController

@property (nonatomic, strong, readonly) NSMutableArray *array;
@property (nonatomic, strong, readonly) Date *date;
- (instancetype)initWithArray:(NSMutableArray *)array date :( Date *) date;
@end

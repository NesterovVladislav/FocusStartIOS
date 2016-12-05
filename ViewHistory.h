//
//  ViewHistory.h
//  ConverterMany
//
//  Created by Student on 28.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableValueDelegate.h"
@interface ViewHistory : UIViewController

@property(weak) id<TableValueDelegate> delegate;
@property (nonatomic, strong, readonly) NSMutableArray *array;
- (instancetype)initWithArray:(NSMutableArray *)array;
@end

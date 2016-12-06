//
//  HistoryViewController.h
//  ConverterMany
//
//  Created by Student on 26.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableValueDelegate.h"
#import "AppContext.h"

@interface HistoryViewController : UIViewController

@property( weak ) id< TableValueDelegate > delegate;
@property (nonatomic, strong, readonly) AppContext *appContext;
@end

//
//  TableValuteViewController.h
//  ConverterMany
//
//  Created by Student on 05.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableValueDelegate.h"

@interface TableValuteViewController : UIViewController

@property( weak ) id< TableValueDelegate > delegate;


@end

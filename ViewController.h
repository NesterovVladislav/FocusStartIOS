//
//  ViewController.h
//  ConverterMany
//
//  Created by Student on 29.10.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableValueDelegate.h"
#import "AppContext.h"

@interface ViewController : UIViewController< TableValueDelegate >

@property ( nonatomic, strong, readonly ) AppContext *appContext;

- ( instancetype ) initWithAppContext : ( AppContext * ) anAppContext;

@end


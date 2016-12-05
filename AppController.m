//
//  AppController.m
//  CurrencyConverter
//
//  Created by Kirill Zuev on 04/11/2016.
//  Copyright © 2016 Kirill Zuev. All rights reserved.
//

#import "AppController.h"
#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "AppContext.h"

@implementation AppController
{
    UIWindow *window;
}

- ( instancetype ) initWithConfigName : ( NSString * ) configName
{
    self = [ super init ];
    
    _appContext = [ [ AppContext alloc ] initWithConfigName : configName ];
    
    [ self makeWindow ];
    
    return self;
}

- ( void ) makeWindow
{
    window = [ [ UIWindow alloc ] initWithFrame : [ UIScreen mainScreen ].bounds ];
    
    ViewController *mainVC = [ [ ViewController alloc ] initWithAppContext : _appContext ];
    
    UINavigationController *navigationController = [ [ UINavigationController alloc ] initWithRootViewController : mainVC ];
    navigationController.navigationBar.translucent = NO;
    
    window.rootViewController = navigationController;
    
    [ window makeKeyAndVisible ];
}

- ( instancetype ) init
{
    assert(NO);
    return nil;
}

@end

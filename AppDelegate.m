//
//  AppDelegate.m
//  ConverterMany
//
//  Created by Student on 29.10.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- ( BOOL ) application : ( UIApplication * ) application didFinishLaunchingWithOptions : ( NSDictionary * ) launchOptions 
	{
		UIWindow *window = [ [ UIWindow alloc ] initWithFrame : [ UIScreen mainScreen ].bounds ];
		ViewController  *mainVC = [ [ ViewController alloc ] initWithNibName : nil bundle : nil ];
		UINavigationController *navigationController = [ [ UINavigationController alloc ] initWithRootViewController : mainVC ];
		navigationController.navigationBar.translucent = NO;
		window.rootViewController = navigationController;
		[ window makeKeyAndVisible ];
		self.window = window;
        return YES;
	}

- ( void ) applicationWillResignActive : ( UIApplication * ) application {}

- ( void ) applicationDidEnterBackground : ( UIApplication * ) application {}

- ( void ) applicationWillEnterForeground : ( UIApplication * ) application {}

- ( void ) applicationDidBecomeActive : ( UIApplication * ) application {}

- ( void ) applicationWillTerminate : ( UIApplication * ) application {}

@end

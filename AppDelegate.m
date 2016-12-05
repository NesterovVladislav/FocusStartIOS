//
//  AppDelegate.m
//  ConverterMany
//
//  Created by Student on 29.10.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import "AppDelegate.h"
#import "AppController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
{
    AppController *appController;
}

- ( BOOL ) application : ( UIApplication * )application didFinishLaunchingWithOptions : ( NSDictionary * ) launchOptions {
    appController = [ [ AppController alloc ] initWithConfigName : @"config.plist" ];
    return YES;
}

@end

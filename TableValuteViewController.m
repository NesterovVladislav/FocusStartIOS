//
//  TableValuteViewController.m
//  ConverterMany
//
//  Created by Student on 05.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import "TableValuteViewController.h"
#import "ViewController.h"

@interface TableValuteViewController ()

@end

@implementation TableValuteViewController
{
    IBOutlet UITableView *tableData;
}

- ( void ) viewDidLoad
	{
		[ super viewDidLoad ];
		self.title = @"Table Valute";
		[ self configureNavigationItem ];
	}

- ( void ) configureNavigationItem
	{
		UIBarButtonItem *doneButton = [ [ UIBarButtonItem alloc ] initWithTitle : @"Save Course" style : UIBarButtonItemStyleDone target : self action:@selector ( doneTapped ) ];
		self.navigationItem.rightBarButtonItem = doneButton;
	}

- ( void ) doneTapped
	{
		[ self.delegate FinishSelectValueWantedClose ];
	}

- ( void ) didReceiveMemoryWarning
	{
		[ super didReceiveMemoryWarning ];
	}

@end

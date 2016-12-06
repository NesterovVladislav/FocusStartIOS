//
//  TableValuteViewController.m
//  ConverterMany
//
//  Created by Student on 05.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import "TableValuteViewController.h"
#import "ViewController.h"
#import "CurrencyDatasource.h"

@interface TableValuteViewController ()

@end

@implementation TableValuteViewController
{
    IBOutlet UITableView *tableData;
    CurrencyDatasource *dataSource;
}



- ( void ) viewDidLoad
{
    [ super viewDidLoad ];
    self.title = @"Table Valute";

    CurrencyManager *aCurrencuManager = [ [ CurrencyManager alloc ] init ];
    dataSource = [ [ CurrencyDatasource alloc ] initWithCurrencyManager : aCurrencuManager ];
    
    tableData.dataSource = dataSource;
    tableData.delegate = dataSource;
    
    [ self configureNavigationItem ];
}

- ( void ) configureNavigationItem
{
    UIBarButtonItem *doneButton = [ [ UIBarButtonItem alloc ] initWithTitle : @"Save Course" style : UIBarButtonItemStyleDone target:self action : @selector(doneTapped ) ];
    
    self.navigationItem.rightBarButtonItem = doneButton;
}

- ( void ) doneTapped
{
    [ dataSource tableView : tableData didSelectRowAtIndexPath : tableData.indexPathForSelectedRow ];
    [ self.delegate finishSelectValueWantedClose : dataSource.selectedCurrency ];
}

- ( void ) didReceiveMemoryWarning
{
    [ super didReceiveMemoryWarning ];
}
@end

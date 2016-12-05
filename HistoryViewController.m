//
//  HistoryViewController.m
//  ConverterMany
//
//  Created by Student on 26.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import "HistoryViewController.h"
#import "ViewController.h"
#import "DateDataSourse.h"
#import "ViewHistory.h"

@interface HistoryViewController ()< UITextFieldDelegate >


@end

@implementation HistoryViewController
{
    IBOutlet UITableView * tableData;
    DateDataSourse *dateSours;
    ViewHistory * tableVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Table History";
     _appContext = [[AppContext alloc] initWithConfigName:@"config.plist"];
    DateManager * aDateManager=[[DateManager alloc] init];
    dateSours=[[DateDataSourse alloc] initWithDateManager:aDateManager];
    tableData.dataSource = dateSours;
    tableData.delegate = dateSours;
     [self configureNavigationItem];
   /* CurrencyManager * aCurrencuManager=[[CurrencyManager alloc] init];
    dataSource=[[CurrencyDatasource alloc] initWithCurrencyManager:aCurrencuManager];
    
    tableData.dataSource = dataSource;
    tableData.delegate = dataSource;
    [self configureNavigationItem];
    // Do any additional setup after loading the view from its nib.*/
}

-(void) configureNavigationItem
{
    UIBarButtonItem *seeButton = [[UIBarButtonItem alloc] initWithTitle:@"See" style:UIBarButtonItemStyleDone target:self action:@selector(seeHistory)];
    //self.navigationItem.rightBarButtonItem = seeButton;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleDone target:self action:@selector(doneTapped)];
    self.navigationItem.rightBarButtonItems=@[seeButton,doneButton];
    //self.navigationItem.rightBarButtonItem = doneButton;
}
- (void)updateDate:(NSMutableArray *)rate{
    tableVC= [ [ ViewHistory alloc ] initWithArray:rate];
    tableVC.delegate = self;
    [self.navigationController pushViewController:tableVC animated:YES];
}
-(void)doneTapped{
    [self.delegate FinishHistory];
}
-(void) seeHistory{
        [dateSours tableView:tableData didSelectRowAtIndexPath:tableData.indexPathForSelectedRow];
    typeof(self) __weak weakSelf = self;
    [self.appContext.exchangeRatesManager exchangeCourseForDate:dateSours.selectedDate  completion:^(NSMutableArray *dates){
        [weakSelf updateDate:dates];
    }];
    /* [dataSource tableView:tableData didSelectRowAtIndexPath:tableData.indexPathForSelectedRow];
    //NSString * code = [dataSource getCode];
    //[ self.delegate FinishSelectValueWantedClose:code ];*/
    //[self.delegate FinishWhatchHistory:dateSours.selectedDate ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)FinishSelectValueWantedClose:(Currency *)currency
{
   /* [self.navigationController popViewControllerAnimated:YES];
    typeof(self) __weak weakSelf = self;
    
    [self.appContext.exchangeRatesManager exchangeRateForCurrency:currency completion:^(NSNumber *rate) {
        [weakSelf updateRate:rate];
    }];*/
}
-(void)FinishHistory{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)FinishHistorySee{ [self.navigationController popViewControllerAnimated:YES]; }
@end

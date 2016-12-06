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

static NSString * const REUSE_IDENTIFIER= @"dateCell";

@interface HistoryViewController ()< UITableViewDelegate>

@end
@implementation HistoryViewController
{
    IBOutlet UITableView * tableData;
    DateDataSourse *dateSours;
    ViewHistory * tableVC;
    DateManager * aDateManager;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Table History";
     _appContext = [[AppContext alloc] initWithConfigName:@"config.plist"];
    aDateManager=[[DateManager alloc] init];
    dateSours=[[DateDataSourse alloc] initWithDateManager:aDateManager];
    tableData.dataSource = dateSours;
    tableData.delegate = self;
     [self configureNavigationItem];
}

- (void)tableView:(UITableView *) tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    [dateSours tableView:tableData didSelectRowAtIndexPath:indexPath];
    typeof(self) __weak weakSelf = self;
    [self.appContext.exchangeRatesManager exchangeCourseForDate:dateSours.selectedDate  completion:^(NSMutableArray *dates){
        [weakSelf updateDate:dates];
    }];
}

-( UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [ tableView dequeueReusableCellWithIdentifier:REUSE_IDENTIFIER];
    
    if ( nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:REUSE_IDENTIFIER];
    }
    cell.textLabel.text= aDateManager.dates[indexPath.row].date;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    dateSours.selectedDate = aDateManager.dates[indexPath.row];
}

-(void) configureNavigationItem
{
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleDone target:self action:@selector(doneTapped)];
    self.navigationItem.rightBarButtonItem = doneButton;
}
- (void)updateDate:(NSMutableArray *)rate{
   tableVC= [ [ ViewHistory alloc ] initWithArray:rate date:dateSours.selectedDate ];
     UINavigationController *navigationController = [ [ UINavigationController alloc ] initWithRootViewController : tableVC ];
      [self presentViewController:navigationController animated:YES completion:NULL];
}
-(void)doneTapped{
   [self.delegate finishHistory];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

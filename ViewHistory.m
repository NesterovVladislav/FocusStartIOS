//
//  ViewHistory.m
//  ConverterMany
//
//  Created by Student on 28.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import "ViewHistory.h"
#import "ViewController.h"
#import "CurrencyDatasource.h"
#import "Date.h"
@interface ViewHistory ()

@end

@implementation ViewHistory
{
    IBOutlet UITableView * tableData;
    CurrencyDatasource *dataSource;
}
- (instancetype)initWithArray:(NSMutableArray *)array date:(Date *)date{
    assert( nil != array );
    
    self = [super initWithNibName:nil bundle:nil];
    
    _array= array;
    _date = date;
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _date.date;
    
    CurrencyManager * aCurrencuManager=[[CurrencyManager alloc] initWithCurrencyManager:_array];
    dataSource=[[CurrencyDatasource alloc] initWithCurrencyManager:aCurrencuManager];
    
    tableData.dataSource = dataSource;
    tableData.delegate = dataSource;
    [self configureNavigationItem];
    // Do any additional setup after loading the view from its nib.
}
-(void) configureNavigationItem
{
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleDone target:self action:@selector(doneTapped)];
    
    self.navigationItem.rightBarButtonItem = doneButton;
}

-(void) doneTapped{

    [ self dismissViewControllerAnimated:YES completion:NULL ];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

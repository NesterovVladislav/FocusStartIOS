//
//  CurrencyDatasource.m
//  ConverterMany
//
//  Created by Student on 12.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import "CurrencyDatasource.h"
#import "Currency.h"

static NSString * const REUSE_IDENTIFIER= @"currencyCell";

@implementation CurrencyDatasource
{
    CurrencyManager *currencyManager;
}
-(instancetype)initWithCurrencyManager:(CurrencyManager *) aCurrencyManager
{
    self = [ super init];
    currencyManager = aCurrencyManager;
    return self;
}
-(NSString *) getCode{
    return _selectedCurrency.code;
}
-(NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section
{
    return currencyManager.currencies.count;
}

-( UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [ tableView dequeueReusableCellWithIdentifier:REUSE_IDENTIFIER];
    
    if ( nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:REUSE_IDENTIFIER];
    }
    cell.textLabel.text= currencyManager.currencies[indexPath.row].name;
    cell.detailTextLabel.text = currencyManager.currencies[indexPath.row].code;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedCurrency = currencyManager.currencies[indexPath.row];
    for (UITableViewCell *cell in [tableView visibleCells]) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
}

- (instancetype)init
{
    assert( NO );
    return nil;
}
@end

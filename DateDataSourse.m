//
//  DateDataSourse.m
//  ConverterMany
//
//  Created by Student on 26.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import "DateDataSourse.h"
#import "Date.h"
static NSString * const REUSE_IDENTIFIER= @"dateCell";

@implementation DateDataSourse
{
    DateManager *dateManager;
}
-(instancetype)initWithDateManager:(DateManager *) aDateManager
{
    self = [ super init];
    dateManager = aDateManager;
    return self;
}

-(NSString *) getDate{
    return _selectedDate.date;
}
-(NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section
{
    return dateManager.dates.count;
}

-( UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [ tableView dequeueReusableCellWithIdentifier:REUSE_IDENTIFIER];
    
    if ( nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:REUSE_IDENTIFIER];
    }
    cell.textLabel.text= dateManager.dates[indexPath.row].date;
      cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedDate = dateManager.dates[indexPath.row];
}
- (instancetype)init
{
    assert( NO );
    return nil;
}
@end


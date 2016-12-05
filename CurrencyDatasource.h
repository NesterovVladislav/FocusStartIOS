//
//  CurrencyDatasource.h
//  ConverterMany
//
//  Created by Student on 12.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CurrencyManager.h"

@class Currency;

@interface CurrencyDatasource : NSObject< UITableViewDataSource, UITableViewDelegate >

@property(nonatomic, readonly) Currency * selectedCurrency;
-(instancetype)initWithCurrencyManager:(CurrencyManager *) aCurrencyManager;
-(NSString *) getCode;
-( instancetype)  init NS_UNAVAILABLE;

@end

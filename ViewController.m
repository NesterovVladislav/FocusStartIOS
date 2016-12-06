//
//  ViewController.m
//  ConverterMany
//
//  Created by Student on 29.10.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import "ViewController.h"
#import "CurrenayConverter.h"
#import "TableValuteViewController.h"
#import "HistoryViewController.h"
#import "Currency.h"
#import "CurrencyManager.h"
#import "DateManager.h"
#import "ExchangeRatesManager.h"



@interface ViewController ()< UITextFieldDelegate >



@end

@implementation ViewController
{
    IBOutlet UITextField *inputSumMoney;
    IBOutlet UITextField *outputSumMoney;
    IBOutlet UILabel *infomationLaabel;
    TableValuteViewController *tableValueVC;
    HistoryViewController *tableHistoryVC;
    CurrenayConverter *converter;
    CurrencyManager *currencyManager;
    NSNumber *exchangeRate;
    NSString * information;
    NSDecimalNumber *paramentConvert;
}

- ( instancetype ) initWithAppContext : ( AppContext * ) anAppContext
{
    assert( nil != anAppContext );
    
    self = [super initWithNibName : nil bundle : nil ];
    
    _appContext = anAppContext;
    
    return self;
}

- ( void ) viewDidLoad
{
    [ super viewDidLoad ];
    
    inputSumMoney.delegate = self;
    
    self.title = @"Converter Valute";
    
    converter = [ [ CurrenayConverter alloc ] init ];
    currencyManager = [ [ CurrencyManager alloc ] init ];
    
    information = [ NSString stringWithFormat : @"%@%@", @"Convert from ", currencyManager.baseCurrency.code ];
    [ infomationLaabel setText : information ];
    
    paramentConvert = [ NSDecimalNumber decimalNumberWithString : @"0.0" ];
}

- ( void ) viewWillAppear : ( BOOL ) animated
{
    [ super viewWillAppear : animated ];
    typeof( self ) __weak weakSelf = self;
    self.appContext.exchangeRatesManager.errorHandler = ^( NSError *error )
    {
        [ weakSelf handleError : error ];
    };
}

- ( void ) didReceiveMemoryWarning
{
    [ super didReceiveMemoryWarning] ;
}

- ( void ) ConverSumma : ( NSString * ) sum
{
    NSDecimalNumber * itog = [ converter convertRubtoUSD : [ NSDecimalNumber decimalNumberWithString : [ sum isEqualToString : @"" ] ? @"0.0" : sum ] and : paramentConvert ];
    [ outputSumMoney setText : [ NSString stringWithFormat : @"%0.2lf", itog.doubleValue ] ];
}

- ( IBAction ) OpetTableValue
{
    tableValueVC = [ [ TableValuteViewController alloc ] initWithNibName : nil bundle : nil ];
    tableValueVC.delegate = self;
    [ self.navigationController pushViewController : tableValueVC animated : YES ];
}

- ( IBAction ) OpetTableHistory
{
    tableHistoryVC = [ [ HistoryViewController alloc ] initWithNibName : nil bundle : nil ];
    tableHistoryVC.delegate = self;
    [ self.navigationController pushViewController : tableHistoryVC animated : YES ];
}

- ( BOOL ) textField : ( UITextField * ) textField shouldChangeCharactersInRange : ( NSRange ) range replacementString : ( NSString * ) string
{
    if( paramentConvert.floatValue == 0 )
    {
        [ infomationLaabel setText : [ NSString stringWithFormat : @"%@", @"select course"]];
        return NO;
    }
    
    NSString *newString = textField.text;
    newString = [ newString stringByReplacingCharactersInRange : range withString : string ];
    if ( ! [ string isEqualToString : @"" ] )
    {
        NSError *error = NULL;
        NSRegularExpression *expr = [ NSRegularExpression regularExpressionWithPattern : @"[0-9]?+\\.?[0-9]?" options :NSRegularExpressionCaseInsensitive error : &error ];
        
        if ( error )
        {
           [ self handleError : error ];
        }
        
        NSRange coordinateRange = [ expr rangeOfFirstMatchInString : string options : 0 range : NSMakeRange( 0, [ string length ] ) ];
        
        if ( coordinateRange.length == 0 )
        {
            newString = [ newString substringToIndex : [ newString length ] - 1 ];
            return NO;
        }
    }
    
    [ self ConverSumma:newString ];
    return YES;
}

- ( void ) finishSelectValueWantedClose : ( Currency * ) currency
{
    [ self.navigationController popViewControllerAnimated : YES ];
    typeof( self ) __weak weakSelf = self;
    
    [ self.appContext.exchangeRatesManager exchangeRateForCurrency : currency completion : ^( NSNumber *rate ) {
        [ weakSelf updateRate : rate and:currency ];
    }];
}

- ( void ) handleError : ( NSError * ) error
{
    UIAlertController *alert = [ UIAlertController alertControllerWithTitle : @"Ошибка"
                                                                   message:error.localizedDescription
                                                            preferredStyle : UIAlertControllerStyleAlert ];
     UIAlertAction* actionCancel = [ UIAlertAction actionWithTitle : @"Закрыть" style : UIAlertActionStyleCancel handler : nil ];
    [ alert addAction : actionCancel ];
    [ self presentViewController : alert animated : YES completion : nil ];
}

- ( void ) updateRate : ( NSNumber * ) rate and : ( Currency * ) currency
{
    paramentConvert = [ NSDecimalNumber decimalNumberWithString : rate.stringValue ];
    [ self ConverSumma : inputSumMoney.text ];
    
    [ infomationLaabel setText : [ NSString stringWithFormat : @"%@%@%@%@%.3lf", information, @" in ", currency.code,
                                  @" at the rate of ", paramentConvert.doubleValue ] ];
}

- (void)finishHistory{
    [ self.navigationController popViewControllerAnimated : YES ];
}
@end

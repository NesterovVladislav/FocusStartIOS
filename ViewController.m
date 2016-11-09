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

float paramentConvert = 62.5;

@interface ViewController ()< UITextFieldDelegate >

@end

@implementation ViewController
	{
		IBOutlet UITextField *inputSumMoney;
		IBOutlet UITextField *outputSumMoney;
		IBOutlet UITextField *inputNewCours;
		TableValuteViewController *tableValueVC;
	}

- ( void ) viewDidLoad
	{
		[super viewDidLoad ];
		inputSumMoney.delegate = self;
		inputNewCours.delegate = self;
		self.title = @"Converter Valute";
	}

- ( void ) didReceiveMemoryWarning
	{
		[ super didReceiveMemoryWarning ];
	}

- ( void ) ConverSumma : ( NSString * ) sum
	{
		CurrenayConverter *converter = [ [ CurrenayConverter alloc ] init ];
		float itog = [ converter convertRubtoUSD : sum.floatValue and : paramentConvert ];
		NSLog( @"converter %0.3f", itog );
		[ outputSumMoney setText : [ NSString stringWithFormat : @"%0.3f", itog ] ];
	}

- ( IBAction ) ClickButtonForConvert
	{
		[ self ConverSumma : inputSumMoney.text ];
	}

-( IBAction ) SaveNewCours
	{
		paramentConvert = inputNewCours.text.floatValue;
		[ self ConverSumma : inputSumMoney.text ];
	}

- ( IBAction ) OpetTableValue
	{
		tableValueVC = [ [ TableValuteViewController alloc ] initWithNibName : nil bundle : nil ];
		tableValueVC.delegate = self;
		[ self.navigationController pushViewController : tableValueVC animated : YES ];
	}

- ( BOOL ) textField : ( UITextField * ) textField shouldChangeCharactersInRange : ( NSRange ) range replacementString : ( NSString * ) string
	{
		NSString *newString;
		newString = textField.text;
		newString = [ newString stringByReplacingCharactersInRange : range withString : string ];
		if( textField == inputSumMoney )
			{
				[ self ConverSumma:newString ];
				return YES;
			} else if( textField == inputNewCours )
			{
				paramentConvert = newString.floatValue;
				[ self ConverSumma : inputSumMoney.text ];
				return YES;
			}
		return NO;
	}

- ( void ) FinishSelectValueWantedClose
	{
	    [ self.navigationController popViewControllerAnimated : YES ];
	}

@end

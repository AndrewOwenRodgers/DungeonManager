//
//  DiceVC.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/13/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "DiceVC.h"

@interface DiceVC ()
{
    CGFloat slideheight;
}
@end

@implementation DiceVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setUpLabel:self.d4RollLabel];
	[self setUpLabel:self.d6RollLabel];
	[self setUpLabel:self.d8RollLabel];
	[self setUpLabel:self.d10RollLabel];
	[self setUpLabel:self.d12RollLabel];
	[self setUpLabel:self.d20RollLabel];
	self.numberOfd4s.delegate = self;
	self.numberOfd6s.delegate = self;
	self.numberOfd8s.delegate = self;
	self.numberOfd10s.delegate = self;
	self.numberOfd12s.delegate = self;
	self.numberOfd20s.delegate = self;
	self.numberOfCustomDice.delegate = self;
	self.numberOfFacesOnCustomDice.delegate = self;
}

-(void)setUpLabel:(UILabel*)label
{
	label.layer.cornerRadius = (label.frame.size.height / 2);
	label.layer.masksToBounds = YES;
	[label.layer setBorderColor: [[UIColor colorWithRed:153/255.f green:1.f blue:1.f alpha:1.0] CGColor]];
	[label.layer setBorderWidth: 1.5];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)rolledDice:(id)sender
{
	if([sender tag] == 4)
	{
		[self roll:[self.numberOfd4s.text integerValue] ofDiceType:[sender tag]];
	}
	else if ([sender tag] == 6)
	{
		[self roll:[self.numberOfd6s.text integerValue] ofDiceType:[sender tag]];
	}
	else if ([sender tag] == 8)
	{
		[self roll:[self.numberOfd8s.text integerValue] ofDiceType:[sender tag]];
	}
	else if ([sender tag] == 10)
	{
		[self roll:[self.numberOfd10s.text integerValue] ofDiceType:[sender tag]];
	}
	else if ([sender tag] == 12)
	{
		[self roll:[self.numberOfd12s.text integerValue] ofDiceType:[sender tag]];
	}
	else if ([sender tag] == 20)
	{
		[self roll:[self.numberOfd20s.text integerValue] ofDiceType:[sender tag]];
	}
	else
	{
		[self roll:[self.numberOfCustomDice.text integerValue] ofDiceType:[self.numberOfFacesOnCustomDice.text integerValue]];
	}
}

-(void)roll:(NSInteger)numberOfDice ofDiceType:(NSInteger)numberOfFacesOnDice
{
	NSString *newDiceString = [NSString stringWithFormat:@"d%ds:", numberOfFacesOnDice];
	
	for (int i = 0; i < numberOfDice; i++)
	{
		if (i == (numberOfDice - 1))
		{
			newDiceString = [newDiceString stringByAppendingString: [NSString stringWithFormat:@" %d", arc4random_uniform(numberOfFacesOnDice)]];
		}
		else
		{
			newDiceString = [newDiceString stringByAppendingString: [NSString stringWithFormat:@" %d ::", arc4random_uniform(numberOfFacesOnDice)]];
		}
	}
	
	newDiceString = [newDiceString stringByAppendingString:@"\r"];
	
	if (self.diceRollDisplay.text)
	{
		self.diceRollDisplay.text = [newDiceString stringByAppendingString:self.diceRollDisplay.text];
	}
	else
	{
		self.diceRollDisplay.text = newDiceString;
	}
}

- (IBAction)backButton:(id)sender
{
	[[NSNotificationCenter defaultCenter] postNotificationName:@"ReenableTouches" object:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField //Slides the view up when the keyboard appears
{
    CGRect textFieldRect = [self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect = [self.view.window convertRect:self.view.bounds fromView:self.view];
    CGFloat midline = textFieldRect.origin.y + (CGFloat)0.5 * textFieldRect.size.height;
    CGFloat numerator = midline - viewRect.origin.y - (CGFloat)0.2 * viewRect.size.height;
    CGFloat denominator = (CGFloat)0.6 * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        slideheight = floor((CGFloat)216 * heightFraction);
    }
    else
    {
        slideheight = floor((CGFloat)168 * heightFraction);
    }
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= slideheight;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:(CGFloat)0.3];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
	
	UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
	[keyboardDoneButtonView sizeToFit];
	UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
																   style:UIBarButtonItemStyleBordered target:self
																  action:@selector(textViewBeDone:)];
	[keyboardDoneButtonView setItems:[NSArray arrayWithObjects:doneButton, nil]];
	textField.inputAccessoryView = keyboardDoneButtonView;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += slideheight;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:(CGFloat)0.3];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

-(void)textViewBeDone:(id)sender
{
    [self.view endEditing:YES];
}

@end
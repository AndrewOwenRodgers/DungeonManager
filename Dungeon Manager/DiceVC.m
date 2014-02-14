//
//  DiceVC.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/13/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "DiceVC.h"

@interface DiceVC ()

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
	[self setUpLabel:self.customDiceRollLabel];
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
	[self roll:20 ofDiceType:20];
}

-(void)roll:(NSInteger)numberOfDice ofDiceType:(NSInteger)numberOfFacesOnDice
{
	NSString *newDiceString = [NSString stringWithFormat:@"d%ds:", numberOfFacesOnDice];
	
	for (int i = 0; i < numberOfDice; i++)
	{
		newDiceString = [newDiceString stringByAppendingString: [NSString stringWithFormat:@" %d", arc4random_uniform(numberOfFacesOnDice)]];
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

@end
//
//  DiceVC.h
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/13/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/ADBannerView.h>

@interface DiceVC : UIViewController
<UITextFieldDelegate, ADBannerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *diceRollDisplay;
@property (weak, nonatomic) IBOutlet UITextField *numberOfd4s;
@property (weak, nonatomic) IBOutlet UITextField *numberOfd6s;
@property (weak, nonatomic) IBOutlet UITextField *numberOfd8s;
@property (weak, nonatomic) IBOutlet UITextField *numberOfd10s;
@property (weak, nonatomic) IBOutlet UITextField *numberOfd12s;
@property (weak, nonatomic) IBOutlet UITextField *numberOfd20s;
@property (weak, nonatomic) IBOutlet UITextField *numberOfCustomDice;
@property (weak, nonatomic) IBOutlet UITextField *numberOfFacesOnCustomDice;
@property (weak, nonatomic) IBOutlet UILabel *d4RollLabel;
@property (weak, nonatomic) IBOutlet UILabel *d6RollLabel;
@property (weak, nonatomic) IBOutlet UILabel *d8RollLabel;
@property (weak, nonatomic) IBOutlet UILabel *d10RollLabel;
@property (weak, nonatomic) IBOutlet UILabel *d12RollLabel;
@property (weak, nonatomic) IBOutlet UILabel *d20RollLabel;
@property (weak, nonatomic) IBOutlet ADBannerView *banner;

- (IBAction)backButton:(id)sender;

@end

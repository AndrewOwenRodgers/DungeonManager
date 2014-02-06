//
//  GameCharacterVC.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/6/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "GameCharacterVC.h"

@interface GameCharacterVC ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *classTextField;
@property (weak, nonatomic) IBOutlet UITextField *raceTextField;
@property (weak, nonatomic) IBOutlet UITextField *levelTextField;
@property (weak, nonatomic) IBOutlet UITextField *XPTextField;
@property (weak, nonatomic) IBOutlet UITextField *genderTextField;
@property (weak, nonatomic) IBOutlet UITextView *BioTextView;

@end

@implementation GameCharacterVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nameTextField.delegate = self;
    self.classTextField.delegate = self;
    self.raceTextField.delegate = self;
    self.levelTextField.delegate = self;
    self.XPTextField.delegate = self;

    self.BioTextView.delegate = self;
    
    self.nameTextField.text = self.character.characterName;
    self.classTextField.text = self.character.primaryClass;
    self.raceTextField.text = self.character.race;
    
    
    self.BioTextView.text = self.character.bio;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -TextField and TextView editing

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 0)
    {
        self.character.characterName = textField.text;
    }
    else if (textField.tag == 1)
    {
        self.character.primaryClass = textField.text;
    }
    else if (textField.tag == 2)
    {
        self.character.race = textField.text;
    }
    
    [self.delegate saveCharacters];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    self.character.bio = textView.text;
    [self.delegate saveCharacters];
}

@end

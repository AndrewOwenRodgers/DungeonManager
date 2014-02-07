//
//  GameCharacterVC.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/6/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "GameCharacterVC.h"

@interface GameCharacterVC ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;//0
@property (weak, nonatomic) IBOutlet UITextField *classTextField;//1
@property (weak, nonatomic) IBOutlet UITextField *raceTextField;//2
@property (weak, nonatomic) IBOutlet UITextField *levelTextField;//3
@property (weak, nonatomic) IBOutlet UITextField *XPTextField;//4
@property (weak, nonatomic) IBOutlet UITextField *homelandTextField;//5
@property (weak, nonatomic) IBOutlet UITextField *deityTextField;//6
@property (weak, nonatomic) IBOutlet UITextField *alignmentTextField;//7
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;//8
@property (weak, nonatomic) IBOutlet UITextField *maxHPTextField;//9
@property (weak, nonatomic) IBOutlet UITextField *currentHPTextField;//10
@property (weak, nonatomic) IBOutlet UITextField *initiativeTextField;//11
@property (weak, nonatomic) IBOutlet UITextField *babTextField;//12
@property (weak, nonatomic) IBOutlet UITextField *spellResistanceTextField;//13
@property (weak, nonatomic) IBOutlet UITextField *moneyTextField;//14
@property (weak, nonatomic) IBOutlet UITextField *armorClassTextField;//21 OUT OF ORDER
@property (weak, nonatomic) IBOutlet UITextField *genderTextField;//15
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;//16
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;//17
@property (weak, nonatomic) IBOutlet UITextField *hairColorTextField;//18
@property (weak, nonatomic) IBOutlet UITextField *eyeColorTextField;//19
@property (weak, nonatomic) IBOutlet UITextField *skinColorTextField;//20


@property (weak, nonatomic) IBOutlet UITextView *BioTextView;//0

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
    
    // [textField.text intValue]
    
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

#pragma mark -Swipe View Methods

- (IBAction)showNextView:(id)sender
{
    NSInteger nextIndex = [_formView currentItemIndex] +1;
    [_formView scrollToItemAtIndex:nextIndex duration:0.4];
}

- (IBAction)showPreviousView:(id)sender
{
    NSInteger nextIndex = [_formView currentItemIndex] -1;
    [_formView scrollToItemAtIndex:nextIndex duration:0.4];
}

- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView
{
    return 8;
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (index == 1)
    {
        return self.nameView;
    }
    if (index == 2)
    {
        return self.backgroundView;
    }
    if (index == 3)
    {
        return self.physicalView;
    }
    UIView *stuff = [[UIView alloc] initWithFrame:swipeView.frame];
    stuff.backgroundColor = [UIColor redColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 120, 120)];
    label.text = [NSString stringWithFormat:@"view number %d", index];
    [stuff addSubview:label];
    return stuff;
}

@end

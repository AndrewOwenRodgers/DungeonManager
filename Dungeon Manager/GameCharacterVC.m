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


@property (weak, nonatomic) IBOutlet UICollectionView *attributeCollection;//0
@property (weak, nonatomic) IBOutlet UICollectionView *skillsCollection;//1

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
    
    
    self.attributeCollection.delegate = self;
    self.attributeCollection.dataSource = self;
    self.skillsCollection.delegate = self;
    self.skillsCollection.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -Buttons and the delete method

- (IBAction)backButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)newAttributeButton:(id)sender
{
    AttributeData *attribute = [[AttributeData alloc] init];
    attribute.attributeName = @"New";
    attribute.attributeValue = 0;
    
    if ([sender tag] == 0)
    {
        if (!self.character.coreAttributes)
        {
            self.character.coreAttributes = [NSMutableArray array];
        }
        [self.character.coreAttributes addObject:attribute];
        [self.attributeCollection reloadData];
    }
    if ([sender tag] == 1)
    {
        if (!self.character.classSkills)
        {
            self.character.classSkills = [NSMutableArray array];
        }
        attribute.secondaryAttribute = @"New";
        [self.character.classSkills addObject:attribute];
        [self.skillsCollection reloadData];
    }
    
    [self.delegate saveCharacters];
}

-(void)deleteAttributeOfType:(NSInteger)type atIndex:(NSInteger)index
{
    if (type == 0)
    {
        [self.character.coreAttributes removeObjectAtIndex:index];
    }
    if (type == 1)
    {
        [self.character.classSkills removeObjectAtIndex:index];
    }
    
    [self.delegate saveCharacters];
    [self.attributeCollection reloadData];
}

#pragma mark -CollectionViews

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AttributeCell *cell;
    if (collectionView.tag == 0)
    {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"attributeCell" forIndexPath:indexPath];
        cell.attribute = self.character.coreAttributes[indexPath.row];
    }
    else if (collectionView.tag == 1)
    {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"skillsCell" forIndexPath:indexPath];
        cell.attribute = self.character.classSkills[indexPath.row];
    }
    
    cell.attribute.attributeType = collectionView.tag;
    [cell buildView];
    cell.delegate = self.delegate;
    cell.deletionDelegate = self;
    cell.attribute.attributeIndex = [indexPath row];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView.tag == 0)
    {
        return self.character.coreAttributes.count;
    }
    return 0;
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

#pragma mark -Swipe View Methods

- (IBAction)showNextView:(id)sender
{
    NSInteger nextIndex = [self.formView currentItemIndex] + 1;
    [self.formView scrollToItemAtIndex:nextIndex duration:0.4];
}

- (IBAction)showPreviousView:(id)sender
{
    NSInteger nextIndex = [self.formView currentItemIndex] -1;
    [self.formView scrollToItemAtIndex:nextIndex duration:0.4];
}

- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView
{
    return 8;
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    GameCharacterVC *returner;
    if (index == 1)
    {
        returner = [[GameCharacterVC alloc] initWithNibName:@"NameView" bundle:nil];
        returner.character = self.character;
        return returner.view;
    }
    if (index == 2)
    {
        returner = [[GameCharacterVC alloc] initWithNibName:@"BackgroundView" bundle:nil];
        returner.character = self.character;
        return returner.view;
    }
    if (index == 3)
    {
        returner = [[GameCharacterVC alloc] initWithNibName:@"PhysicalView" bundle:nil];
        returner.character = self.character;
        return returner.view;
    }
    if (index == 4)
    {
        returner = [[GameCharacterVC alloc] initWithNibName:@"Statistics1View" bundle:nil];
        returner.character = self.character;
        return returner.view;
    }
    if (index == 5)
    {
        returner = [[GameCharacterVC alloc] initWithNibName:@"AttributeView" bundle:nil];
        returner.character = self.character;
        return returner.view;
    }
    if (index == 6)
    {
        returner = [[GameCharacterVC alloc] initWithNibName:@"SkillsView" bundle:nil];
        returner.character = self.character;
        return returner.view;
    }
    UIView *stuff = [[UIView alloc] initWithFrame:swipeView.frame];
    stuff.backgroundColor = [UIColor blueColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 120, 120)];
    label.text = [NSString stringWithFormat:@"view number %d", index];
    [stuff addSubview:label];
    return stuff;
}

@end

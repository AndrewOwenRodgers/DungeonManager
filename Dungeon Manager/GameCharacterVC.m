//
//  GameCharacterVC.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/6/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "GameCharacterVC.h"
#import "getDocumentsDirectory.h"

@interface GameCharacterVC ()
{
    CGFloat slideheight;
}

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
@property (weak, nonatomic) IBOutlet UITextField *domainTextField;//22

@property (weak, nonatomic) IBOutlet UILabel *totalWeightLabel;//0
@property (weak, nonatomic) IBOutlet UITextView *BioTextView;//0
@property (weak, nonatomic) IBOutlet UITextView *otherTextView;//1

@property (strong, nonatomic) IBOutlet UICollectionView *attributeCollection;//0
@property (strong, nonatomic) IBOutlet UICollectionView *skillsCollection;//1
@property (strong, nonatomic) IBOutlet UICollectionView *featsCollection;//2
@property (strong, nonatomic) IBOutlet UICollectionView *spellsCollection;//3
@property (strong, nonatomic) IBOutlet UICollectionView *spellAmountCollection;//4
@property (strong, nonatomic) IBOutlet UICollectionView *inventoryCollection;//5

@end

@implementation GameCharacterVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	if ([[NSFileManager defaultManager] fileExistsAtPath:self.character.avatarPath])
	{
		self.characterImageView.image = [UIImage imageWithContentsOfFile:self.character.avatarPath];
	}
	
    self.nameTextField.text = self.character.characterName;
    self.classTextField.text = self.character.primaryClass;
    self.raceTextField.text = self.character.race;
    self.levelTextField.text = [NSString stringWithFormat:@"%d", self.character.primaryLevel];
    self.XPTextField.text = [NSString stringWithFormat:@"%d", self.character.xp];
    self.homelandTextField.text = self.character.homeland;
    self.deityTextField.text = self.character.deity;
    self.alignmentTextField.text = self.character.alignment;
    self.ageTextField.text = [NSString stringWithFormat:@"%d", self.character.age];
    self.maxHPTextField.text = [NSString stringWithFormat:@"%d", self.character.maxHealth];
    self.currentHPTextField.text = [NSString stringWithFormat:@"%d", self.character.currentHealth];
    self.initiativeTextField.text = [NSString stringWithFormat:@"%d", self.character.initiativeModifier];
    self.babTextField.text = [NSString stringWithFormat:@"%d", self.character.baseAttackBonus];
    self.spellResistanceTextField.text = [NSString stringWithFormat:@"%d", self.character.spellResistance];
    self.moneyTextField.text = [NSString stringWithFormat:@"%d", self.character.currency];
    self.armorClassTextField.text = [NSString stringWithFormat:@"%d", self.character.armorClass];
    self.genderTextField.text = self.character.gender;
    self.heightTextField.text = self.character.height;
    self.weightTextField.text = self.character.weight;
    self.hairColorTextField.text = self.character.hairColor;
    self.eyeColorTextField.text = self.character.eyeColor;
    self.skinColorTextField.text = self.character.skinColor;
	self.domainTextField.text = self.character.domain;
	self.totalWeightLabel.text = [NSString stringWithFormat:@"%d", self.character.inventoryTotalWeight];
    
    self.BioTextView.text = self.character.bio;
	self.otherTextView.text = self.character.otherAbilitiesAndWounds;
	
//	UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textViewBeDone:)];
//	[self.BioTextView addGestureRecognizer:gestureRecognizer];
//	[self.otherTextView addGestureRecognizer:gestureRecognizer];
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
    
    if ([sender tag] == 0)
    {
        if (!self.character.coreAttributes)
        {
            self.character.coreAttributes = [NSMutableArray array];
        }
        [self.character.coreAttributes addObject:attribute];
        [self.attributeCollection reloadData];
    }
    else if ([sender tag] == 1)
    {
        if (!self.character.classSkills)
        {
            self.character.classSkills = [NSMutableArray array];
		}
        [self.character.classSkills addObject:attribute];
        [self.skillsCollection reloadData];
    }
	else if ([sender tag] == 2)
    {
        if (!self.character.feats)
        {
            self.character.feats = [NSMutableArray array];
        }
		attribute.attributeDescription = @"Feat description";
        [self.character.feats addObject:attribute];
        [self.featsCollection reloadData];
    }
	else if ([sender tag] == 3)
    {
        if (!self.character.spells)
        {
            self.character.spells = [NSMutableArray array];
        }
		attribute.attributeDescription = @"Spell description";
        [self.character.spells addObject:attribute];
        [self.spellsCollection reloadData];
    }
	else if ([sender tag] == 4)
    {
        if (!self.character.spellAmounts)
        {
            self.character.spellAmounts = [NSMutableArray array];
        }
        [self.character.spellAmounts addObject:attribute];
        [self.spellAmountCollection reloadData];
    }
	else if ([sender tag] == 5)
    {
        if (!self.character.inventory)
        {
            self.character.inventory = [NSMutableArray array];
        }
		attribute.attributeDescription = @"Item description";
        [self.character.inventory addObject:attribute];
        [self.inventoryCollection reloadData];
    }
    
    [self.delegate saveCharacters];
}

-(void)deleteAttributeOfType:(NSInteger)type atIndex:(NSInteger)index
{
    if (type == 0)
    {
        [self.character.coreAttributes removeObjectAtIndex:index];
		[self.attributeCollection reloadData];
    }
    else if (type == 1)
    {
        [self.character.classSkills removeObjectAtIndex:index];
		[self.skillsCollection reloadData];
    }
	else if (type == 2)
    {
        [self.character.feats removeObjectAtIndex:index];
		[self.featsCollection reloadData];
    }
	else if (type == 3)
    {
        [self.character.spells removeObjectAtIndex:index];
		[self.spellsCollection reloadData];
    }
	else if (type == 4)
    {
        [self.character.spellAmounts removeObjectAtIndex:index];
		[self.spellAmountCollection reloadData];
    }
	else if (type == 5)
    {
        [self.character.inventory removeObjectAtIndex:index];
		[self.inventoryCollection reloadData];
    }
    [self.delegate saveCharacters];
}

-(void)recalculateWeights
{
	self.character.inventoryTotalWeight = 0;
	for (AttributeData *inventoryItem in self.character.inventory)
	{
		self.character.inventoryTotalWeight = self.character.inventoryTotalWeight + (inventoryItem.attributeWeight * inventoryItem.attributeValue);
	}
	self.totalWeightLabel.text = [NSString stringWithFormat:@"%d", self.character.inventoryTotalWeight];
}

#pragma mark -CollectionViews

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AttributeCell *cell;
    if (collectionView.tag == 0)
    {
        [collectionView registerNib:[UINib nibWithNibName:@"AttributeCell" bundle:nil] forCellWithReuseIdentifier:@"attributeCell"];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"attributeCell" forIndexPath:indexPath];
        cell.attribute = self.character.coreAttributes[indexPath.row];
    }
    else if (collectionView.tag == 1)
    {
        [collectionView registerNib:[UINib nibWithNibName:@"SkillCell" bundle:nil] forCellWithReuseIdentifier:@"skillCell"];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"skillCell" forIndexPath:indexPath];
        cell.attribute = self.character.classSkills[indexPath.row];
    }
	else if (collectionView.tag == 2)
    {
        [collectionView registerNib:[UINib nibWithNibName:@"FeatCell" bundle:nil] forCellWithReuseIdentifier:@"featCell"];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"featCell" forIndexPath:indexPath];
        cell.attribute = self.character.feats[indexPath.row];
    }
	else if (collectionView.tag == 3)
    {
        [collectionView registerNib:[UINib nibWithNibName:@"SpellCell" bundle:nil] forCellWithReuseIdentifier:@"spellCell"];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"spellCell" forIndexPath:indexPath];
        cell.attribute = self.character.spells[indexPath.row];
    }
	else if (collectionView.tag == 4)
    {
        [collectionView registerNib:[UINib nibWithNibName:@"SpellAmountCell" bundle:nil] forCellWithReuseIdentifier:@"spellAmountCell"];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"spellAmountCell" forIndexPath:indexPath];
        cell.attribute = self.character.spellAmounts[indexPath.row];
    }
	else if (collectionView.tag == 5)
    {
        [collectionView registerNib:[UINib nibWithNibName:@"InventoryCell" bundle:nil] forCellWithReuseIdentifier:@"inventoryCell"];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"inventoryCell" forIndexPath:indexPath];
        cell.attribute = self.character.inventory[indexPath.row];
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
    else if (collectionView.tag == 1)
    {
        return self.character.classSkills.count;
    }
	else if (collectionView.tag == 2)
    {
        return self.character.feats.count;
    }
	else if (collectionView.tag == 3)
    {
        return self.character.spells.count;
    }
	else if (collectionView.tag == 4)
    {
        return self.character.spellAmounts.count;
    }
	else if (collectionView.tag == 5)
    {
        return self.character.inventory.count;
    }
    return 0;
}

#pragma mark -TextField and TextView editing

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
    
	[self.characterImageView setAlpha:0.f];
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
	
	[UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:(CGFloat)0.3];
    
	[self.characterImageView setAlpha:1.f];
    
    [UIView commitAnimations];
    
    if (textField.tag == 0)
    {
		if (self.character.avatarPath)
		{
			NSString *oldPath = self.character.avatarPath;
			self.character.avatarPath = [self.character.avatarPath stringByReplacingOccurrencesOfString: self.character.characterName withString:textField.text];
			[[NSFileManager defaultManager] moveItemAtPath:oldPath toPath:self.character.avatarPath error:nil];
		}
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
    else if (textField.tag == 3)
    {
        self.character.primaryLevel = [textField.text integerValue];
        self.character.totalLevel = self.character.primaryLevel;
        for (AttributeData *secClass in self.character.secondaryClasses)
        {
            self.character.totalLevel = self.character.totalLevel + secClass.attributeValue;
        }
    }
    else if (textField.tag == 4)
    {
        self.character.xp = [textField.text integerValue];
    }
    else if (textField.tag == 5)
    {
        self.character.homeland = textField.text;
    }
    else if (textField.tag == 6)
    {
        self.character.deity = textField.text;
    }
    else if (textField.tag == 7)
    {
        self.character.alignment = textField.text;
    }
    else if (textField.tag == 8)
    {
        self.character.age = [textField.text integerValue];
    }
    else if (textField.tag == 9)
    {
        self.character.maxHealth = [textField.text integerValue];
    }
    else if (textField.tag == 10)
    {
        self.character.currentHealth = [textField.text integerValue];
    }
    else if (textField.tag == 11)
    {
        self.character.initiativeModifier = [textField.text integerValue];
    }
    else if (textField.tag == 12)
    {
        self.character.baseAttackBonus = [textField.text integerValue];
    }
    else if (textField.tag == 13)
    {
        self.character.spellResistance = [textField.text integerValue];
    }
    else if (textField.tag == 14)
    {
        self.character.currency = [textField.text integerValue];
    }
    else if (textField.tag == 21)
    {
        self.character.armorClass = [textField.text integerValue];
    }
    else if (textField.tag == 15)
    {
        self.character.gender = textField.text;
    }
    else if (textField.tag == 16)
    {
        self.character.height = textField.text;
    }
    else if (textField.tag == 17)
    {
        self.character.weight = textField.text;
    }
    else if (textField.tag == 18)
    {
        self.character.hairColor = textField.text;
    }
    else if (textField.tag == 19)
    {
        self.character.eyeColor = textField.text;
    }
    else if (textField.tag == 20)
    {
        self.character.skinColor = textField.text;
    }
	else if (textField.tag == 22)
    {
        self.character.domain = textField.text;
    }
    
    [self.delegate saveCharacters];
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
	CGRect textFieldRect = [self.view.window convertRect:textView.bounds fromView:textView];
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
    
	[self.characterImageView setAlpha:0.f];
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
	
	UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
	[keyboardDoneButtonView sizeToFit];
	UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
																   style:UIBarButtonItemStyleBordered target:self
																  action:@selector(textViewBeDone:)];
	[keyboardDoneButtonView setItems:[NSArray arrayWithObjects:doneButton, nil]];
	textView.inputAccessoryView = keyboardDoneButtonView;
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
	CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += slideheight;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:(CGFloat)0.3];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
	
	[UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:(CGFloat)0.3];
    
	[self.characterImageView setAlpha:1.f];
    
    [UIView commitAnimations];
	
	[textView resignFirstResponder];
	
	if (textView.tag == 0)
	{
		self.character.bio = textView.text;
	}
	else if (textView.tag == 1)
	{
		self.character.otherAbilitiesAndWounds = textView.text;
	}
    [self.delegate saveCharacters];
}

-(void)textViewBeDone:(id)sender
{
    [self.view endEditing:YES];
}

#pragma -Camera/Pictures

- (IBAction)startPicker:(id)sender
{
    UIActionSheet *mySheet;
    
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        mySheet = [[UIActionSheet alloc] initWithTitle:@"Pick Photo" delegate:self cancelButtonTitle:@"cancel"destructiveButtonTitle:nil otherButtonTitles: @"Camera", @"Photo Library", nil];
    }
    else if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        mySheet = [[UIActionSheet alloc] initWithTitle:@"Pick Photo" delegate:self cancelButtonTitle:@"cancel"destructiveButtonTitle:nil otherButtonTitles: @"Photo Library", nil];
    }
    else
    {
        return;
    }
    
    [mySheet showFromBarButtonItem:sender animated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *myPicker = [[UIImagePickerController alloc] init];
    myPicker.delegate = self;
    myPicker.allowsEditing = YES;
    
    if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Camera"])
    {
        myPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else
    {
        myPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:myPicker animated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker
 didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:^{
        UIImage *editedImage = [info objectForKey: UIImagePickerControllerEditedImage];
        self.characterImageView.image = editedImage;
        
        NSData *imageData = UIImageJPEGRepresentation(editedImage, 0.5);
        self.character.avatarPath = [NSString stringWithFormat:@"%@%@.jpeg", self.delegate.filePath, self.character.characterName];
        [imageData writeToFile:self.character.avatarPath atomically:YES];
        [self.delegate saveCharacters];
    }];
}

@end

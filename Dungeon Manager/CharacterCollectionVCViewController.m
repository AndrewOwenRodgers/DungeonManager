//
//  CharacterCollectionVCViewController.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 1/31/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "CharacterCollectionVCViewController.h"

@interface CharacterCollectionVCViewController ()

@property (nonatomic) NSInteger deleteNumber;

@end

@implementation CharacterCollectionVCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.characters = [[NSMutableArray alloc] init];
    
    self.characterCollection.dataSource = self;
    self.characterCollection.delegate = self;
    
    NSFileManager *fm = [[NSFileManager alloc] init];
    if ([fm fileExistsAtPath:self.filePath])
    {
        self.characters = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
    }
	if (!self.characters)
	{
		self.characters = [[NSMutableArray alloc] init];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.characterCollection reloadData];
}

#pragma mark -Character array handling

- (IBAction)newCharacter:(id)sender
{
    GameCharacter *character = [[GameCharacter alloc] init];
    [self.characters addObject:character];

    NSInteger matchingTitleCounter = 1;
    
    for (NSInteger i = 0; i < self.characters.count; i++)
    {
        for (GameCharacter *character in self.characters)
        {
            if ([character.characterName isEqualToString:[NSString stringWithFormat:@"Unnamed %zd", matchingTitleCounter]])
            {
                matchingTitleCounter++;
            }
        }
    }
    //There are better ways to run this search, but I'll do that later.
    
    character.characterName = [NSString stringWithFormat:@"Unnamed %zd", matchingTitleCounter];
    
    character.primaryClass = @"Person";
    character.totalLevel = 1;
    
    [self saveCharacters];
    
    [self.characterCollection reloadData];
}

-(void)deleteCharacter: (NSInteger)characterNumber
{
	self.deleteNumber = characterNumber;
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Are you sure?"
													message:@"Once you delete the character, it'll be gone forever"
												   delegate:self
										  cancelButtonTitle:@"Yep!"
										  otherButtonTitles:@"Never mind!", nil];
	[alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == alertView.cancelButtonIndex)
	{
		[self.characters removeObjectAtIndex:self.deleteNumber];
		[self.characterCollection reloadData];
		[self saveCharacters];
    }
}

-(void)saveCharacters
{
    [NSKeyedArchiver archiveRootObject:self.characters
                                toFile:self.filePath];
}

#pragma mark -Collection view management

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)path
{
    CharacterCell *cell = [self.characterCollection dequeueReusableCellWithReuseIdentifier:@"characterCell" forIndexPath:path];
    cell.cellCharacter = [self.characters objectAtIndex:[path row]];
    cell.delegate = self;
    cell.characterIndex = [path row];
    
    [cell initializeDisplay];
    
    return cell;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.characters.count;
}

#pragma mark -Transition handling

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSInteger itemNumber = [self.characterCollection indexPathForCell:sender].row;
    if ([segue.identifier isEqualToString:@"characterVCSegue"])
    {
        GameCharacterVC *destination = (GameCharacterVC *)segue.destinationViewController;
        destination.character = self.characters[itemNumber];
        destination.delegate = self;
    }
}

-(IBAction)backButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end

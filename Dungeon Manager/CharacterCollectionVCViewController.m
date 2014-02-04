//
//  CharacterCollectionVCViewController.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 1/31/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "CharacterCollectionVCViewController.h"

@interface CharacterCollectionVCViewController ()

@end

@implementation CharacterCollectionVCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.characters = [[NSMutableArray alloc] init];
    
    self.characterCollection.dataSource = self;
    self.characterCollection.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -Collection view management

- (IBAction)newCharacter:(id)sender
{
    GameCharacter *character = [[GameCharacter alloc] init];
    [self.characters addObject:character];
    
    character.characterName = @"Some dude";
    character.primaryClass = @"Person";
    character.totalLevel = 1;
    
    [self.characterCollection reloadData];
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)path
{
    CharacterCell *cell = [self.characterCollection dequeueReusableCellWithReuseIdentifier:@"characterCell" forIndexPath:path];
    cell.cellCharacter = [self.characters objectAtIndex:[path row]];
    
    [cell initializeDisplay];
    
    return cell;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.characters.count;
}

@end

//
//  CharacterCollectionVCViewController.h
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 1/31/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CharacterCell.h"
#import "GameCharacter.h"
#import "GameCharacterVC.h"
#import "ShakeVC.h"

@interface CharacterCollectionVCViewController : ShakeVC
<UICollectionViewDelegate, UICollectionViewDataSource, NSCoding, CharacterDeletion, CharacterSaving>

@property (strong, nonatomic) NSMutableArray *characters;
@property (nonatomic) BOOL isPCVC;
@property (weak, nonatomic) IBOutlet UICollectionView *characterCollection;
@property (strong, nonatomic) NSString *filePath;

-(void)deleteCharacter:(NSInteger)characterNumber;

@end
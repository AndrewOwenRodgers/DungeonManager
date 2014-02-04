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

@interface CharacterCollectionVCViewController : UIViewController
<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSMutableArray *characters;
@property (nonatomic) BOOL isPCVC;
@property (weak, nonatomic) IBOutlet UICollectionView *characterCollection;

@end
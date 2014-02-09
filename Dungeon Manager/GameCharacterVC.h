//
//  GameCharacterVC.h
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/6/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameCharacter.h"
#import <SwipeView.h>
#import "AttributeCell.h"
#import "CharacterSaving.h"

@interface GameCharacterVC : UIViewController
<UITextFieldDelegate, UITextViewDelegate, SwipeViewDataSource, SwipeViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, DeleteAttribute>


@property (weak, nonatomic) IBOutlet SwipeView *formView;

@property (unsafe_unretained) id <CharacterSaving> delegate;
@property (weak, nonatomic) GameCharacter *character;

@end

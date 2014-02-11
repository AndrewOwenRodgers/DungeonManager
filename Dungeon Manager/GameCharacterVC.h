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
<UITextFieldDelegate, UITextViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, DeleteAttribute, UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate>

@property (unsafe_unretained) id <CharacterSaving> delegate;
@property (strong, nonatomic) GameCharacter *character;
@property (weak, nonatomic) IBOutlet UIImageView *characterImageView;

@end

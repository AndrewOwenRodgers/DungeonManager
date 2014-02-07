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
@property (weak, nonatomic) IBOutlet UIView *nameView; //1
@property (weak, nonatomic) IBOutlet UIView *backgroundView;//2
@property (weak, nonatomic) IBOutlet UIView *physicalView;//3
@property (weak, nonatomic) IBOutlet UIView *statistics1View;//4
@property (weak, nonatomic) IBOutlet UIView *attributesView;//5
@property (weak, nonatomic) IBOutlet UIView *skillsView;//6

@end

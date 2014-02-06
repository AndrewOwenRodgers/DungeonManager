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

@protocol CharacterSaving <NSObject>

-(void)saveCharacters;

@end

@interface GameCharacterVC : UIViewController
<UITextFieldDelegate, UITextViewDelegate, SwipeViewDataSource, SwipeViewDelegate>


@property (weak, nonatomic) IBOutlet SwipeView *formView;

@property (unsafe_unretained) id <CharacterSaving> delegate;
@property (weak, nonatomic) GameCharacter *character;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

//
//  GameCharacterVC.h
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/6/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameCharacter.h"

@interface GameCharacterVC : UIViewController
<UITextFieldDelegate>

@property (weak, nonatomic) GameCharacter *character;

@end

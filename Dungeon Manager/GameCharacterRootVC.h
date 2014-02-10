//
//  GameCharacterRootVC.h
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/10/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "GameCharacterVC.h"

@interface GameCharacterRootVC : GameCharacterVC
<SwipeViewDataSource, SwipeViewDelegate>

@property (weak, nonatomic) IBOutlet SwipeView *formView;

@end

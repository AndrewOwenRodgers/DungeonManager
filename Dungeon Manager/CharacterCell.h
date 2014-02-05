//
//  CharacterCell.h
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/1/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameCharacter.h"

@protocol CharacterDeletion <NSObject>

-(void)deleteCharacter:(int)characterNumber;

@end

@interface CharacterCell : UICollectionViewCell

@property (unsafe_unretained) id <CharacterDeletion> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *characterAvatar;
@property (weak, nonatomic) IBOutlet UILabel *characterName;
@property (weak, nonatomic) IBOutlet UILabel *levelAndClass;
@property (nonatomic) int characterIndex;
@property (weak, nonatomic) GameCharacter *cellCharacter;

-(void)initializeDisplay;

@end

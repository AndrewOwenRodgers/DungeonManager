//
//  CharacterCell.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/1/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "CharacterCell.h"

@implementation CharacterCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
    }
    return self;
}

- (void) initializeDisplay
{
    self.characterName.text = self.cellCharacter.characterName;
    self.levelAndClass.text = [NSString stringWithFormat:@"Level %i %@", self.cellCharacter.totalLevel, self.cellCharacter.primaryClass];
    
    if (self.cellCharacter.avatarPath)
    {
        self.characterAvatar.image = [UIImage imageWithContentsOfFile:self.cellCharacter.avatarPath];
    }
    else
    {
        self.characterAvatar.image = nil;
    }
	self.characterAvatar.layer.cornerRadius = 60;
	self.characterAvatar.layer.masksToBounds = YES;
    [self.characterAvatar.layer setBorderColor: [[UIColor grayColor] CGColor]];
	[self.characterAvatar.layer setBorderWidth: 3.0];
}

- (IBAction)deleteButton:(id)sender
{
    [self.delegate deleteCharacter:self.characterIndex];
}

@end

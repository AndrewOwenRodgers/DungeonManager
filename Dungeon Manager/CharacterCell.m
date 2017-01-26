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
    self.levelAndClass.text = [NSString stringWithFormat:@"Level %zd %@", self.cellCharacter.totalLevel, self.cellCharacter.primaryClass];
    
    if (self.cellCharacter.avatarPath)
    {
        self.characterAvatar.image = [UIImage imageWithContentsOfFile:self.cellCharacter.avatarPath];
    }
    else
    {
        self.characterAvatar.image = nil;
    }
	self.characterAvatar.layer.cornerRadius = (self.characterAvatar.frame.size.height / 2);
	self.characterAvatar.layer.masksToBounds = YES;
    [self.characterAvatar.layer setBorderColor: [[UIColor grayColor] CGColor]];
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		[self.characterAvatar.layer setBorderWidth: 6.0];
	}
	else
	{
		[self.characterAvatar.layer setBorderWidth: 3.0];
	}
	self.deleteButton.layer.cornerRadius = self.deleteButton.frame.size.height / 3;
	self.deleteButton.layer.masksToBounds = YES;
}

- (IBAction)deleteButton:(id)sender
{
    [self.delegate deleteCharacter:self.characterIndex];
}

@end

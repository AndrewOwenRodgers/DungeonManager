//
//  GameCharacter.h
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/3/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AttributeData.h"

@interface GameCharacter : NSObject
<NSCoding>;

//BASIC INFO VIEW
@property (nonatomic) NSString *characterName;
//
@property (nonatomic) NSString *primaryClass;
//
@property (nonatomic) NSInteger primaryLevel;
//
@property (nonatomic) NSString *race;
//
@property (nonatomic) NSInteger xp;
//

//BACKGROUND VIEW
@property (nonatomic) NSString *homeland;
//
@property (nonatomic) NSString *deity;
//
@property (nonatomic) NSString *alignment;
//
@property (nonatomic) NSInteger age;
//
@property (nonatomic) NSString *bio;
//

//APPEARANCE VIEW
@property (nonatomic) NSString *gender;
//
@property (nonatomic) NSString *height;
//
@property (nonatomic) NSString *weight;
//
@property (nonatomic) NSString *hairColor;
//
@property (nonatomic) NSString *eyeColor;
//
@property (nonatomic) NSString *skinColor;
//


//STATISTICS ONE VIEW
@property (nonatomic) NSInteger maxHealth;
//
@property (nonatomic) NSInteger currentHealth;
//
@property (nonatomic) NSInteger initiativeModifier;
//
@property (nonatomic) NSInteger baseAttackBonus;
//
@property (nonatomic) NSInteger spellResistance;
//
@property (nonatomic) NSInteger currency;
//
@property (nonatomic) NSInteger armorClass;
//

//STATISTICS TWO VIEW
@property (nonatomic) NSMutableArray *speeds;
@property (nonatomic) NSMutableArray *languages;
@property (nonatomic) NSMutableArray *savingThrows;
@property (nonatomic) NSMutableArray *secondaryClasses;

//ATTRIBUTES VIEW
@property (nonatomic) NSMutableArray *coreAttributes;
//

//CLASS SKILLS VIEW
@property (nonatomic) NSMutableArray *classSkills;

//FEATS VIEW
@property (nonatomic) NSMutableArray *feats;

//SPELLS VIEW
@property (nonatomic) NSMutableArray *spells;
@property (nonatomic) NSString *domain;

//INVENTORY VIEW
@property (nonatomic) NSMutableArray *inventory;
@property (nonatomic) NSInteger inventoryTotalWeight;

@property (nonatomic) NSString *otherAbilitiesAndWounds;

//OTHERS
@property (nonatomic) NSInteger totalLevel;
//
@property (nonatomic) NSString *avatarPath;


@end

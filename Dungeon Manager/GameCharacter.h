//
//  GameCharacter.h
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/3/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameCharacter : NSObject
<NSCoding>;

@property (nonatomic) NSString *characterName;
//
@property (nonatomic) NSString *primaryClass;
//
@property (nonatomic) int primaryLevel;
//
@property (nonatomic) int totalLevel;
//
@property (nonatomic) NSString *avatarPath;
@property (nonatomic) NSString *bio;
//
@property (nonatomic) NSString *race;
//
@property (nonatomic) NSString *gender;
//
@property (nonatomic) NSString *homeland;
//
@property (nonatomic) NSString *deity;
//
@property (nonatomic) NSString *alignment;
//
@property (nonatomic) int age;
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

@property (nonatomic) int maxHealth;
@property (nonatomic) NSMutableDictionary *coreAttributes;
@property (nonatomic) NSMutableDictionary *classSkills;
@property (nonatomic) NSMutableDictionary *classSkillAttributes;
@property (nonatomic) NSMutableDictionary *feats;
@property (nonatomic) NSMutableDictionary *spells;
@property (nonatomic) NSString *domain;
@property (nonatomic) NSMutableDictionary *speeds;
@property (nonatomic) NSMutableArray *languages;
@property (nonatomic) int initiativeModifier;
@property (nonatomic) int baseAttackBonus;
@property (nonatomic) int spellResistance;
@property (nonatomic) NSMutableDictionary *savingThrows;
@property (nonatomic) NSMutableDictionary *secondaryClasses;

@property (nonatomic) int currentHealth;
@property (nonatomic) int currency;
@property (nonatomic) NSMutableDictionary *inventory;
@property (nonatomic) NSMutableDictionary *inventoryWeights;
@property (nonatomic) int inventoryTotalWeight;
@property (nonatomic) int xp;
@property (nonatomic) NSString *otherAbilitiesAndWounds;

@end

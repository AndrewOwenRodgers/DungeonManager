//
//  GameCharacter.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/3/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "GameCharacter.h"

@interface GameCharacter()

@property (nonatomic) UITextView *bio;
@property (nonatomic) NSString *race;
@property (nonatomic) NSString *gender;
@property (nonatomic) NSString *homeland;
@property (nonatomic) NSString *deity;
@property (nonatomic) NSString *alignment;
@property (nonatomic) int age;
@property (nonatomic) NSString *height;
@property (nonatomic) int weight;
@property (nonatomic) NSString *hairColor;
@property (nonatomic) NSString *eyeColor;

@property (nonatomic) int maxHealth;
@property (nonatomic) NSMutableDictionary *coreAttributes;
@property (nonatomic) NSMutableDictionary *classSkills;
@property (nonatomic) NSMutableDictionary *classSkillAttributes;
@property (nonatomic) NSMutableDictionary *feats;
@property (nonatomic) NSMutableDictionary *spells;
@property (nonatomic) NSString *domain;
@property (nonatomic) NSMutableDictionary *speeds;
@property (nonatomic) NSMutableArray *languages;
@property (nonatomic) int primaryLevel;
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
@property (nonatomic) UITextView *otherAbilitiesAndWounds;

@end

@implementation GameCharacter

-(id) initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.bio.text = [decoder decodeObjectForKey:@"biotext"];
    self.race = [decoder decodeObjectForKey:@"race"];
    self.gender = [decoder decodeObjectForKey:@"gender"];
    self.homeland = [decoder decodeObjectForKey:@"homeland"];
    self.deity = [decoder decodeObjectForKey:@"deity"];
    self.alignment = [decoder decodeObjectForKey:@"alignment"];
    self.age = [decoder decodeIntForKey:@"age"];
    self.height = [decoder decodeObjectForKey:@"height"];
    self.weight = [decoder decodeIntForKey:@"weight"];
    self.hairColor = [decoder decodeObjectForKey:@"hairColor"];
    self.eyeColor = [decoder decodeObjectForKey:@"eyeColor"];
    
    self.maxHealth = [decoder decodeIntForKey:@"maxHealth"];
    self.coreAttributes = [decoder decodeObjectForKey:@"coreAttributes"];
    self.classSkills = [decoder decodeObjectForKey:@"classSkills"];
    self.classSkillAttributes = [decoder decodeObjectForKey:@"classSkillsAttributes"];
    self.feats = [decoder decodeObjectForKey:@"feats"];
    self.spells = [decoder decodeObjectForKey:@"spells"];
    self.domain = [decoder decodeObjectForKey:@"domain"];
    self.speeds = [decoder decodeObjectForKey:@"speeds"];
    self.languages = [decoder decodeObjectForKey:@"languages"];
    self.primaryLevel = [decoder decodeIntForKey:@"primaryLevel"];
    self.initiativeModifier = [decoder decodeIntForKey:@"initiativeModifier"];
    self.baseAttackBonus = [decoder decodeIntForKey:@"baseAttackBonus"];
    self.spellResistance = [decoder decodeIntForKey:@"spellResistance"];
    self.savingThrows = [decoder decodeObjectForKey:@"savingThrows"];
    self.secondaryClasses = [decoder decodeObjectForKey:@"secondaryClasses"];
    
    self.currentHealth = [decoder decodeIntForKey:@"currentHealth"];
    self.currency = [decoder decodeIntForKey:@"currency"];
    self.inventory = [decoder decodeObjectForKey:@"inventory"];
    self.inventoryWeights = [decoder decodeObjectForKey:@"inventoryWeights"];
    self.inventoryTotalWeight = [decoder decodeIntForKey:@"inventoryTotalWeight"];
    self.xp = [decoder decodeIntForKey:@"xp"];
    self.otherAbilitiesAndWounds.text = [decoder decodeObjectForKey:@"otherAbilitiesAndWounds"];
    
    self.characterName = [decoder decodeObjectForKey:@"characterName"];
    self.primaryClass = [decoder decodeObjectForKey:@"primaryClass"];
    self.totalLevel = [decoder decodeIntForKey:@"totalLevel"];
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.bio.text forKey:@"biotext"];
    [encoder encodeObject:self.race forKey:@"race"];
    [encoder encodeObject:self.gender forKey:@"gender"];
    [encoder encodeObject:self.homeland forKey:@"homeland"];
    [encoder encodeObject:self.deity forKey:@"deity"];
    [encoder encodeObject:self.alignment forKey:@"alignment"];
    [encoder encodeInt:self.age forKey:@"age"];
    [encoder encodeObject:self.height forKey:@"height"];
    [encoder encodeInt:self.weight forKey:@"weight"];
    [encoder encodeObject:self.hairColor forKey:@"hairColor"];
    [encoder encodeObject:self.eyeColor forKey:@"eyeColor"];
    
    [encoder encodeInt:self.maxHealth forKey:@"maxHealth"];
    [encoder encodeObject:self.coreAttributes forKey:@"coreAttributes"];
    [encoder encodeObject:self.classSkills forKey:@"classSkills"];
    [encoder encodeObject:self.classSkillAttributes forKey:@"classSkillsAttributes"];
    [encoder encodeObject:self.feats forKey:@"feats"];
    [encoder encodeObject:self.spells forKey:@"spells"];
    [encoder encodeObject:self.domain forKey:@"domain"];
    [encoder encodeObject:self.speeds forKey:@"speeds"];
    [encoder encodeObject:self.languages forKey:@"languages"];
    [encoder encodeInt:self.primaryLevel forKey:@"primaryLevel"];
    [encoder encodeInt:self.initiativeModifier forKey:@"initiativeModifier"];
    [encoder encodeInt:self.baseAttackBonus forKey:@"baseAttackBonus"];
    [encoder encodeInt:self.spellResistance forKey:@"spellResistance"];
    [encoder encodeObject:self.savingThrows forKey:@"savingThrows"];
    [encoder encodeObject:self.secondaryClasses forKey:@"secondaryClasses"];
    
    [encoder encodeInt:self.currentHealth forKey:@"currentHealth"];
    [encoder encodeInt:self.currency forKey:@"currency"];
    [encoder encodeObject:self.inventory forKey:@"inventory"];
    [encoder encodeObject:self.inventoryWeights forKey:@"inventoryWeights"];
    [encoder encodeInt:self.inventoryTotalWeight forKey:@"inventoryTotalWeight"];
    [encoder encodeInt:self.xp forKey:@"xp"];
    [encoder encodeObject:self.otherAbilitiesAndWounds.text forKey:@"otherAbilitiesAndWounds"];
    
    [encoder encodeObject:self.characterName forKey:@"characterName"];
    [encoder encodeObject:self.primaryClass forKey:@"primaryClass"];
    [encoder encodeInt:self.totalLevel forKey:@"totalLevel"];
}

@end
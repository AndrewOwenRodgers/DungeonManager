//
//  GameCharacter.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/3/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "GameCharacter.h"

@interface GameCharacter()

@end

@implementation GameCharacter

-(id) initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.bio = [decoder decodeObjectForKey:@"biotext"];
    self.race = [decoder decodeObjectForKey:@"race"];
    self.gender = [decoder decodeObjectForKey:@"gender"];
    self.homeland = [decoder decodeObjectForKey:@"homeland"];
    self.deity = [decoder decodeObjectForKey:@"deity"];
    self.alignment = [decoder decodeObjectForKey:@"alignment"];
    self.age = [decoder decodeIntForKey:@"age"];
    self.height = [decoder decodeObjectForKey:@"height"];
    self.weight = [decoder decodeObjectForKey:@"weight"];
    self.hairColor = [decoder decodeObjectForKey:@"hairColor"];
    self.eyeColor = [decoder decodeObjectForKey:@"eyeColor"];
    
    self.maxHealth = [decoder decodeIntegerForKey:@"maxHealth"];
    self.coreAttributes = [decoder decodeObjectForKey:@"coreAttributes"];
    self.classSkills = [decoder decodeObjectForKey:@"classSkills"];
    self.classSkillAttributes = [decoder decodeObjectForKey:@"classSkillsAttributes"];
    self.feats = [decoder decodeObjectForKey:@"feats"];
    self.spells = [decoder decodeObjectForKey:@"spells"];
    self.domain = [decoder decodeObjectForKey:@"domain"];
    self.speeds = [decoder decodeObjectForKey:@"speeds"];
    self.languages = [decoder decodeObjectForKey:@"languages"];
    self.primaryLevel = [decoder decodeIntegerForKey:@"primaryLevel"];
    self.initiativeModifier = [decoder decodeIntegerForKey:@"initiativeModifier"];
    self.baseAttackBonus = [decoder decodeIntegerForKey:@"baseAttackBonus"];
    self.spellResistance = [decoder decodeIntegerForKey:@"spellResistance"];
    self.armorClass = [decoder decodeIntegerForKey:@"armorClass"];
    self.savingThrows = [decoder decodeObjectForKey:@"savingThrows"];
    self.secondaryClasses = [decoder decodeObjectForKey:@"secondaryClasses"];
    
    self.currentHealth = [decoder decodeIntegerForKey:@"currentHealth"];
    self.currency = [decoder decodeIntegerForKey:@"currency"];
    self.inventory = [decoder decodeObjectForKey:@"inventory"];
    self.inventoryWeights = [decoder decodeObjectForKey:@"inventoryWeights"];
    self.inventoryTotalWeight = [decoder decodeIntegerForKey:@"inventoryTotalWeight"];
    self.xp = [decoder decodeIntegerForKey:@"xp"];
    self.otherAbilitiesAndWounds = [decoder decodeObjectForKey:@"otherAbilitiesAndWounds"];
    
    self.characterName = [decoder decodeObjectForKey:@"characterName"];
    self.primaryClass = [decoder decodeObjectForKey:@"primaryClass"];
    self.totalLevel = [decoder decodeIntegerForKey:@"totalLevel"];
    self.avatarPath = [decoder decodeObjectForKey:@"avatarPath"];
    self.skinColor = [decoder decodeObjectForKey:@"skinColor"];
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.bio forKey:@"biotext"];
    [encoder encodeObject:self.race forKey:@"race"];
    [encoder encodeObject:self.gender forKey:@"gender"];
    [encoder encodeObject:self.homeland forKey:@"homeland"];
    [encoder encodeObject:self.deity forKey:@"deity"];
    [encoder encodeObject:self.alignment forKey:@"alignment"];
    [encoder encodeInteger:self.age forKey:@"age"];
    [encoder encodeObject:self.height forKey:@"height"];
    [encoder encodeObject:self.weight forKey:@"weight"];
    [encoder encodeObject:self.hairColor forKey:@"hairColor"];
    [encoder encodeObject:self.eyeColor forKey:@"eyeColor"];
    
    [encoder encodeInteger:self.maxHealth forKey:@"maxHealth"];
    [encoder encodeObject:self.coreAttributes forKey:@"coreAttributes"];
    [encoder encodeObject:self.classSkills forKey:@"classSkills"];
    [encoder encodeObject:self.classSkillAttributes forKey:@"classSkillsAttributes"];
    [encoder encodeObject:self.feats forKey:@"feats"];
    [encoder encodeObject:self.spells forKey:@"spells"];
    [encoder encodeObject:self.domain forKey:@"domain"];
    [encoder encodeObject:self.speeds forKey:@"speeds"];
    [encoder encodeObject:self.languages forKey:@"languages"];
    [encoder encodeInteger:self.primaryLevel forKey:@"primaryLevel"];
    [encoder encodeInteger:self.initiativeModifier forKey:@"initiativeModifier"];
    [encoder encodeInteger:self.baseAttackBonus forKey:@"baseAttackBonus"];
    [encoder encodeInteger:self.spellResistance forKey:@"spellResistance"];
    [encoder encodeInteger:self.armorClass forKey:@"armorClass"];
    [encoder encodeObject:self.savingThrows forKey:@"savingThrows"];
    [encoder encodeObject:self.secondaryClasses forKey:@"secondaryClasses"];
    
    [encoder encodeInteger:self.currentHealth forKey:@"currentHealth"];
    [encoder encodeInteger:self.currency forKey:@"currency"];
    [encoder encodeObject:self.inventory forKey:@"inventory"];
    [encoder encodeObject:self.inventoryWeights forKey:@"inventoryWeights"];
    [encoder encodeInteger:self.inventoryTotalWeight forKey:@"inventoryTotalWeight"];
    [encoder encodeInteger:self.xp forKey:@"xp"];
    [encoder encodeObject:self.otherAbilitiesAndWounds forKey:@"otherAbilitiesAndWounds"];
    
    [encoder encodeObject:self.characterName forKey:@"characterName"];
    [encoder encodeObject:self.primaryClass forKey:@"primaryClass"];
    [encoder encodeInteger:self.totalLevel forKey:@"totalLevel"];
    [encoder encodeObject:self.avatarPath forKey:@"avatarPath"];
    [encoder encodeObject:self.skinColor forKey:@"skinColor"];
}

@end
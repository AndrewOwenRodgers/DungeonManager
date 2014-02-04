//
//  GameCharacter.h
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/3/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameCharacter : NSObject

@property (nonatomic) NSString *characterName;
@property (nonatomic) NSString *primaryClass;
@property (nonatomic) NSString *avatarPath;
@property (nonatomic) int totalLevel;
@property (nonatomic) BOOL isNPC;

@end

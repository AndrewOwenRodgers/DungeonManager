//
//  CharacterSaving.h
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/7/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CharacterSaving <NSObject>

@property NSString *filePath;
-(void)saveCharacters;

@end

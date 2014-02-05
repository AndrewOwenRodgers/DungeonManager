//
//  getDocumentsDirectory.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/4/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "getDocumentsDirectory.h"

@implementation getDocumentsDirectory

+(NSString *)docs
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}

@end

//
//  Campaign.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 1/30/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "Campaign.h"

@implementation Campaign

-(id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    
    self.title = [decoder decodeObjectForKey:@"title"];
    self.imagePath = [decoder decodeObjectForKey:@"imagePath"];
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.imagePath forKey:@"imagePath"];
}

@end
//
//  AttributeData.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/6/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "AttributeData.h"

@implementation AttributeData

-(id)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    self.attributeName = [coder decodeObjectForKey:@"name"];
    self.secondaryAttribute = [coder decodeObjectForKey:@"secondaryAttribute"];
    self.attributeValue = [coder decodeIntegerForKey:@"value"];
    self.attributeWeight = [coder decodeIntegerForKey:@"weight"];
    self.attributeDescription = [coder decodeObjectForKey:@"description"];
    return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.attributeName forKey:@"name"];
    [encoder encodeObject:self.secondaryAttribute forKey:@"secondaryAttribute"];
    [encoder encodeInteger:self.attributeValue forKey:@"value"];
    [encoder encodeInteger:self.attributeWeight forKey:@"weight"];
    [encoder encodeObject:self.attributeDescription forKey:@"description"];
}

@end

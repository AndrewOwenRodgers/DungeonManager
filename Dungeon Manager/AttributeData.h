//
//  AttributeData.h
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/6/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AttributeData : NSObject
<NSCoding>

@property NSString *attributeName;
@property NSInteger attributeValue;
@property NSInteger attributeWeight;
@property NSString *secondaryAttribute;
@property NSString *attributeDescription;

@end

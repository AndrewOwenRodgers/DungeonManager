//
//  Campaign.h
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 1/30/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Campaign : NSObject
<NSCoding>;

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *imagePath;

@end

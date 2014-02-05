//
//  CampaignCell.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 1/30/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "CampaignCell.h"

@implementation CampaignCell

- (IBAction)deleteButton:(id)sender
{
    [self.delegate deleteCampaign:self.campaignNumber];
}

@end

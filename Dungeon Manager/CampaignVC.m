//
//  CampaignVC.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 1/30/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "CampaignVC.h"
#import "CharacterCollectionVCViewController.h"

@interface CampaignVC ()

@end

@implementation CampaignVC

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"NPCSegue"])
    {
        CharacterCollectionVCViewController *dest = (CharacterCollectionVCViewController *) segue.destinationViewController;
        dest.filePath = [NSString stringWithFormat:@"%@NPC", self.campaignFilePath];
    }
    else if ([segue.identifier isEqualToString:@"characterSegue"])
    {
        CharacterCollectionVCViewController *dest = (CharacterCollectionVCViewController *) segue.destinationViewController;
        dest.filePath = [NSString stringWithFormat:@"%@Characters", self.campaignFilePath];
    }
}

@end

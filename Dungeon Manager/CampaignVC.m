//
//  CampaignVC.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 1/30/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "CampaignVC.h"
#import "CharacterCollectionVCViewController.h"
#import "getDocumentsDirectory.h"

@interface CampaignVC ()

@end

@implementation CampaignVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.campaignTitleTextField.delegate = self;
    self.campaignTitleTextField.text = self.campaign.title;
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
        dest.filePath = [NSString stringWithFormat:@"%@%@NPCs", self.campaignFilePath, self.campaign.title];
    }
    else if ([segue.identifier isEqualToString:@"characterSegue"])
    {
        CharacterCollectionVCViewController *dest = (CharacterCollectionVCViewController *) segue.destinationViewController;
        dest.filePath = [NSString stringWithFormat:@"%@%@Characters", self.campaignFilePath, self.campaign.title];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.campaignTitleTextField resignFirstResponder];
    self.lastCampaignName = self.campaign.title;
    self.campaign.title = self.campaignTitleTextField.text;
    [self changeCampaigns];
    return YES;
}

-(void)changeCampaigns
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *filesInDocs = [fileManager contentsOfDirectoryAtPath:[getDocumentsDirectory docs]
                                                            error:nil];
    for (NSString *filePath in filesInDocs)
    {
        if (!([filePath rangeOfString:self.lastCampaignName].location == NSNotFound))
        {
            NSString *newPath = [filePath stringByReplacingOccurrencesOfString:self.lastCampaignName withString:self.campaign.title];
            [fileManager moveItemAtPath:filePath toPath:newPath error:nil];
        }
    }
    [self.delegate saveCampaigns];
}

@end

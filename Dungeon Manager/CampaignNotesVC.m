//
//  CampaignNotesVC.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/9/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "CampaignNotesVC.h"

@interface CampaignNotesVC ()

@end

@implementation CampaignNotesVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.notes.delegate = self;
    NSFileManager *fm = [NSFileManager defaultManager];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)backButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end

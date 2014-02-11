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
	if ([fm fileExistsAtPath:self.filePath])
	{
		self.notes.text = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filePath];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)backButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)saveButton:(id)sender
{
	[NSKeyedArchiver archiveRootObject:self.notes.text toFile:self.filePath];
}

@end

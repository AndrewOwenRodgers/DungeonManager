//
//  ViewController.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 1/30/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "InitialViewController.h"
#import "getDocumentsDirectory.h"


@interface InitialViewController ()

@property (strong, nonatomic) NSMutableArray *campaignArray;
@property (strong, nonatomic) NSString *campaignFilePath;
@property (nonatomic) NSInteger deleteNumber;

@end

@implementation InitialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.campaignArray = [[NSMutableArray alloc] init];
    self.navigationController.navigationBarHidden = YES;

    self.campaignCollection.dataSource = self;
    self.campaignCollection.delegate = self;
    
    self.campaignFilePath = [NSString stringWithFormat:@"%@/campaigns", [getDocumentsDirectory docs]];
    
    self.campaignArray = [NSKeyedUnarchiver unarchiveObjectWithFile:self.campaignFilePath];
    
    if (!self.campaignArray)
    {
        self.campaignArray = [[NSMutableArray alloc] init];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.campaignCollection reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark -Campaign Collection View

-(UICollectionViewCell *) collectionView:(UICollectionView *)campaignCollection cellForItemAtIndexPath:indexPath
{
    CampaignCell *cell = [self.campaignCollection dequeueReusableCellWithReuseIdentifier:@"campaignCell"
                                                                            forIndexPath:indexPath];
    Campaign *campaign = [self.campaignArray objectAtIndex:[indexPath row]];
    cell.campaignNumber = [indexPath row];
    cell.campaignLabel.text = campaign.title;
    cell.delegate = self;
    
    if (campaign.imagePath)
    {
        cell.campaignImageView.image = [UIImage imageWithContentsOfFile:campaign.imagePath];
    }
    else
    {
        cell.campaignImageView.image = nil;
    }
	cell.campaignImageView.layer.cornerRadius = (cell.campaignImageView.frame.size.height / 2);
	cell.campaignImageView.layer.masksToBounds = YES;
    [cell.campaignImageView.layer setBorderColor: [[UIColor grayColor] CGColor]];
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
	{
		[cell.campaignImageView.layer setBorderWidth: 6.0];
	}
	else
	{
		[cell.campaignImageView.layer setBorderWidth: 3.0];
	}
	[cell makeDeleteButtonRound];

    return cell;
}

-(NSInteger) collectionView:(UICollectionView *)campaignCollection numberOfItemsInSection:(NSInteger)section
{
    return self.campaignArray.count;
}

#pragma mark -Campaign Handling

- (IBAction)createCampaign:(id)sender
{
    Campaign *newCampaign = [[Campaign alloc] init];
    NSInteger matchingTitleCounter = 1;
    
    for (NSInteger i = 0; i < self.campaignArray.count; i++)
    {
        for (Campaign *campaign in self.campaignArray)
        {
            if ([campaign.title isEqualToString:[NSString stringWithFormat:@"Campaign %li", (long)matchingTitleCounter]])
            {
                matchingTitleCounter++;
            }
        }
    }

    newCampaign.title = [NSString stringWithFormat:@"Campaign %li", (long)matchingTitleCounter];
    
    [self.campaignArray addObject:newCampaign];
    [self.campaignCollection reloadData];
    
    [self saveCampaigns];
}

-(void)deleteCampaign:(NSInteger)campaignNumber
{
	self.deleteNumber = campaignNumber;
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Are you sure?"
													message:@"Once you delete the campaign, it'll be gone forever"
												   delegate:self
										  cancelButtonTitle:@"Yep!"
										  otherButtonTitles:@"Never mind!", nil];
	[alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == alertView.cancelButtonIndex)
	{
		Campaign *deletedCampaign = [self.campaignArray objectAtIndex:self.deleteNumber];
		[self.campaignArray removeObjectAtIndex:self.deleteNumber];
		NSString *searchString = deletedCampaign.title;
		
		NSFileManager *fileManager = [NSFileManager defaultManager];
		NSArray *filesInDocs = [fileManager contentsOfDirectoryAtPath:[getDocumentsDirectory docs]
																error:nil];
		
		for (NSString *path in filesInDocs)
		{
			NSString *completePath = [[[getDocumentsDirectory docs] stringByAppendingString:@"/"] stringByAppendingString:path];
			if (!([completePath rangeOfString:searchString].location == NSNotFound))
			{
				[fileManager removeItemAtPath:completePath error:nil];
			}
		}
		[self saveCampaigns];
		[self.campaignCollection reloadData];
    }
}

-(void) saveCampaigns
{
    [NSKeyedArchiver archiveRootObject:self.campaignArray toFile:self.campaignFilePath];
}

#pragma mark -Transition Handling
//Sends campaign data to the new VC when you click on a cell, then segues
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSInteger itemNumber = [self.campaignCollection indexPathForCell:sender].row;
    
    if ([segue.identifier isEqualToString: @"campaignSegue"])
    {
        CampaignVC *destinationVC = segue.destinationViewController;
        destinationVC.delegate = self;
        destinationVC.campaign = self.campaignArray[itemNumber];
        destinationVC.campaignFilePath = self.campaignFilePath;
    }
}

@end

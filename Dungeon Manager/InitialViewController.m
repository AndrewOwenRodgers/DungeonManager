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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark -Campaign Collection View

-(UICollectionViewCell *) collectionView:(UICollectionView *)campaignCollection cellForItemAtIndexPath:indexPath
{
    CampaignCell *cell = [self.campaignCollection dequeueReusableCellWithReuseIdentifier:@"campaignCell" forIndexPath:indexPath];
    Campaign *campaign = [self.campaignArray objectAtIndex:[indexPath row]];
    cell.campaignLabel.text = campaign.title;
    
    if (campaign.imagePath)
    {
        cell.campaignImageView.image = [UIImage imageWithContentsOfFile:campaign.imagePath];
    }
    
    else
    {
        cell.campaignImageView.image = nil;
    }
    
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
    int matchingTitleCounter = 1;
    
    for (Campaign *campaign in self.campaignArray)
    {
        if ([campaign.title isEqualToString:[NSString stringWithFormat:@"Unnamed %i", matchingTitleCounter]])
        {
            matchingTitleCounter++;
        }
        else break;
    }
    
    newCampaign.title = [NSString stringWithFormat:@"Unnamed %i", matchingTitleCounter];
    
    [self.campaignArray addObject:newCampaign];
    [self.campaignCollection reloadData];
    
    [NSKeyedArchiver archiveRootObject:self.campaignArray toFile:self.campaignFilePath];
}

//Sends campaign data to the new VC when you click on a cell, then segues
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSInteger itemNumber = [self.campaignCollection indexPathForCell:sender].row;
    
    if ([segue.identifier isEqualToString: @"campaignSegue"])
    {
        CampaignVC *destinationVC = segue.destinationViewController;
        destinationVC.campaign = self.campaignArray[itemNumber];
    }
}

@end
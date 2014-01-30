//
//  ViewController.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 1/30/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "InitialViewController.h"

@interface InitialViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *campaignCollection;
@property (strong, nonatomic) NSMutableArray *campaignArray;

@end

@implementation InitialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark -Campaign Collection View

-(CampaignCell *) collectionView:(UICollectionView *)campaignCollection cellForItemAtIndexPath:path
{
    CampaignCell *cell = [self.campaignCollection dequeueReusableCellWithReuseIdentifier:@"campaignCell" forIndexPath:path];
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
    newCampaign.title = @"Untitled campaign";
    [self.campaignArray addObject:newCampaign];
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

//
//  ViewController.h
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 1/30/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Campaign.h"
#import "CampaignCell.h"
#import "CampaignVC.h"
#import "ShakeVC.h"
#import <iAd/ADBannerView.h>

@interface InitialViewController : ShakeVC
<UICollectionViewDataSource, UICollectionViewDelegate, NSCoding, CampaignDeletion, CampaignSaver>

@property (weak, nonatomic) IBOutlet UICollectionView *campaignCollection;

-(void)deleteCampaign: (NSInteger)campaignNumber;
@property (weak, nonatomic) IBOutlet ADBannerView *banner;

@end

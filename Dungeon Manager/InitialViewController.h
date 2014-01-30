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

@interface InitialViewController : UIViewController
<UICollectionViewDataSource, UICollectionViewDelegate, NSCoding>

@end

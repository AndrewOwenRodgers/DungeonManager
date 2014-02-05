//
//  CampaignCell.h
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 1/30/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CampaignDeletion <NSObject>

-(void) deleteCampaign:(int)campaignNumber;

@end

@interface CampaignCell : UICollectionViewCell

@property (unsafe_unretained) id <CampaignDeletion> delegate;
@property (weak, nonatomic) IBOutlet UILabel *campaignLabel;
@property (weak, nonatomic) IBOutlet UIImageView *campaignImageView;
@property int campaignNumber;

@end

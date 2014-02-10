//
//  CampaignVC.h
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 1/30/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Campaign.h"

@protocol CampaignSaver <NSObject>

-(void)saveCampaigns;

@end

@interface CampaignVC : UIViewController
<UITextFieldDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate>

@property (unsafe_unretained) id <CampaignSaver> delegate;
@property (weak, nonatomic) Campaign *campaign;
@property (weak, nonatomic) NSString *campaignFilePath;
@property (strong, nonatomic) NSString *lastCampaignName;
@property (weak, nonatomic) IBOutlet UITextField *campaignTitleTextField;
@property (weak, nonatomic) IBOutlet UIImageView *campaignImageView;

@end
//
//  CampaignNotesVC.h
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/9/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CampaignNotesVC : UIViewController
<UITextViewDelegate>;

@property (strong, nonatomic) NSString *filePath;
@property (weak, nonatomic) IBOutlet UITextView *notes;

- (IBAction)backButton:(id)sender;

@end

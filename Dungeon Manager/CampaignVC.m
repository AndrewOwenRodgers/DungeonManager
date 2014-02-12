//
//  CampaignVC.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 1/30/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "CampaignVC.h"
#import "CharacterCollectionVCViewController.h"
#import "getDocumentsDirectory.h"
#import "CampaignNotesVC.h"

@interface CampaignVC ()

@property (weak, nonatomic) IBOutlet UIButton *characterButton;
@property (weak, nonatomic) IBOutlet UIButton *npcButton;
@property (weak, nonatomic) IBOutlet UIButton *notesButton;

@end

@implementation CampaignVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.campaignTitleTextField.delegate = self;
    self.campaignTitleTextField.text = self.campaign.title;
    if ([[NSFileManager defaultManager] fileExistsAtPath:self.campaign.imagePath])
    {
        self.campaignImageView.image = [UIImage imageWithContentsOfFile:self.campaign.imagePath];
    }
    else
    {
        self.campaignImageView.image = nil;
    }
	self.campaignImageView.layer.cornerRadius = 75;
	self.campaignImageView.layer.masksToBounds = YES;
    [self.campaignImageView.layer setBorderColor: [[UIColor grayColor] CGColor]];
	[self.campaignImageView.layer setBorderWidth: 3.0];
	
	[self buttonSetUp:self.characterButton];
	[self buttonSetUp:self.npcButton];
	[self buttonSetUp:self.notesButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"NPCSegue"])
    {
        CharacterCollectionVCViewController *dest = (CharacterCollectionVCViewController *) segue.destinationViewController;
        dest.filePath = [NSString stringWithFormat:@"%@%@NPCs", self.campaignFilePath, self.campaign.title];
    }
    else if ([segue.identifier isEqualToString:@"characterSegue"])
    {
        CharacterCollectionVCViewController *dest = (CharacterCollectionVCViewController *) segue.destinationViewController;
        dest.filePath = [NSString stringWithFormat:@"%@%@Characters", self.campaignFilePath, self.campaign.title];
    }
    else if ([segue.identifier isEqualToString:@"notesSegue"])
    {
        CampaignNotesVC *dest = (CampaignNotesVC *) segue.destinationViewController;
        dest.filePath = [NSString stringWithFormat:@"%@%@Notes", self.campaignFilePath, self.campaign.title];
    }
}

- (IBAction)backButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.lastCampaignName = self.campaign.title;
    self.campaign.title = self.campaignTitleTextField.text;
    [self changeCampaigns];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.campaignTitleTextField resignFirstResponder];
    return YES;
}

-(void)changeCampaigns
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *filesInDocs = [fileManager contentsOfDirectoryAtPath:[getDocumentsDirectory docs]
                                                            error:nil];
    for (NSString *filePath in filesInDocs)
    {
        NSString *completePath = [[[getDocumentsDirectory docs] stringByAppendingString:@"/"] stringByAppendingString:filePath];
        if (!([completePath rangeOfString:self.lastCampaignName].location == NSNotFound))
        {
            NSString *newPath = [completePath stringByReplacingOccurrencesOfString:self.lastCampaignName withString:self.campaign.title];
            [fileManager moveItemAtPath:completePath toPath:newPath error:nil];
        }
    }
	
	self.campaign.imagePath = [self.campaign.imagePath stringByReplacingOccurrencesOfString: self.lastCampaignName withString:self.campaign.title];

	NSString *characterPath = [NSString stringWithFormat:@"%@%@Characters", self.campaignFilePath, self.campaign.title];
	NSMutableArray *charactersArray = [NSKeyedUnarchiver unarchiveObjectWithFile:characterPath];
	for (GameCharacter *character in charactersArray)
	{
		character.avatarPath = [character.avatarPath stringByReplacingOccurrencesOfString:self.lastCampaignName withString:self.campaign.title];
	}
	[NSKeyedArchiver archiveRootObject:charactersArray toFile:characterPath];
	
	NSString *npcPath = [NSString stringWithFormat:@"%@%@NPCs", self.campaignFilePath, self.campaign.title];
	NSMutableArray *npcArray = [NSKeyedUnarchiver unarchiveObjectWithFile:npcPath];
	for (GameCharacter *character in npcArray)
	{
		character.avatarPath = [character.avatarPath stringByReplacingOccurrencesOfString:self.lastCampaignName withString:self.campaign.title];
	}
	[NSKeyedArchiver archiveRootObject:npcArray toFile:npcPath];

    [self.delegate saveCampaigns];
}
-(void) buttonSetUp:(UIButton *)button
{
	[button setTitleColor:[UIColor colorWithRed:153/255.f green:1.f blue:1.f alpha:1.0] forState:UIControlStateNormal];
	button.layer.cornerRadius = 30;
	button.layer.masksToBounds = YES;
	[button.layer setBorderColor: [[UIColor colorWithRed:153/255.f green:1.f blue:1.f alpha:1.0] CGColor]];
	[button.layer setBorderWidth: 3.0];

	button.backgroundColor = [UIColor colorWithRed:30/255.f green:65/255.f blue:86/255.f alpha:1.0];
}

#pragma -Camera/Pictures

- (IBAction)startPicker:(id)sender
{
    UIActionSheet *mySheet;
    
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        mySheet = [[UIActionSheet alloc] initWithTitle:@"Pick Photo" delegate:self cancelButtonTitle:@"cancel"destructiveButtonTitle:nil otherButtonTitles: @"Camera", @"Photo Library", nil];
    }
    else if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        mySheet = [[UIActionSheet alloc] initWithTitle:@"Pick Photo" delegate:self cancelButtonTitle:@"cancel"destructiveButtonTitle:nil otherButtonTitles: @"Photo Library", nil];
    }
    else
    {
        return;
    }
    
    [mySheet showFromBarButtonItem:sender animated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *myPicker = [[UIImagePickerController alloc] init];
    myPicker.delegate = self;
    myPicker.allowsEditing = YES;
    
    if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Camera"])
    {
        myPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else
    {
        myPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:myPicker animated:YES completion:nil];
    
}

- (void) imagePickerController:(UIImagePickerController *)picker
 didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:^{
        UIImage *editedImage = [info objectForKey: UIImagePickerControllerEditedImage];
        self.campaignImageView.image = editedImage;
        
        NSData *imageData = UIImageJPEGRepresentation(editedImage, 0.5);
        self.campaign.imagePath = [[getDocumentsDirectory docs]stringByAppendingString: [NSString stringWithFormat:@"/%@.jpeg", self.campaign.title]];
        [imageData writeToFile:self.campaign.imagePath atomically:YES];
        [self.delegate saveCampaigns];
    }];
}

@end

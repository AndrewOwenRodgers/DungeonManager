//
//  GameCharacterRootVC.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/10/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "GameCharacterRootVC.h"

@interface GameCharacterRootVC ()

@property (strong, nonatomic) NSMutableArray *gameVCs;
@property (strong, nonatomic) NSMutableArray *namesArray;

@end

@implementation GameCharacterRootVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.gameVCs = [[NSMutableArray alloc] init];
    for (int i = 0; i < 11; i++)
    {
        GameCharacterVC *returner;
        
        if (i == 0)
        {
            returner = [[GameCharacterVC alloc] initWithNibName:@"NameView" bundle:nil];
        }
        else if (i == 1)
        {
            returner = [[GameCharacterVC alloc] initWithNibName:@"BackgroundView" bundle:nil];
        }
        else if (i == 2)
        {
            returner = [[GameCharacterVC alloc] initWithNibName:@"PhysicalView" bundle:nil];
        }
        else if (i == 3)
        {
            returner = [[GameCharacterVC alloc] initWithNibName:@"Statistics1View" bundle:nil];
        }
        else if (i == 4)
        {
            returner = [[GameCharacterVC alloc] initWithNibName:@"AttributeView" bundle:nil];
        }
        else if (i == 5)
        {
            returner = [[GameCharacterVC alloc] initWithNibName:@"SkillsView" bundle:nil];
        }
		else if (i == 6)
        {
            returner = [[GameCharacterVC alloc] initWithNibName:@"FeatsView" bundle:nil];
        }
		else if (i == 7)
        {
            returner = [[GameCharacterVC alloc] initWithNibName:@"SpellsView" bundle:nil];
        }
		else if (i == 8)
        {
            returner = [[GameCharacterVC alloc] initWithNibName:@"SpellAmountsView" bundle:nil];
        }
		else if (i == 9)
        {
            returner = [[GameCharacterVC alloc] initWithNibName:@"InventoryView" bundle:nil];
        }
		else if (i == 10)
        {
            returner = [[GameCharacterVC alloc] initWithNibName:@"OtherView" bundle:nil];
        }
        else
        {
            returner = [[GameCharacterVC alloc ] init];
        }
        
		returner.characterImageView = self.characterImageView;
        returner.delegate = self.delegate;
        returner.character = self.character;
        [self.gameVCs addObject:returner];
    }
	self.namesArray = [[NSMutableArray alloc] initWithObjects:@"Basic Info", @"Background", @"Appearance", @"Basic Stats", @"Attributes", @"Skills", @"Feats", @"Spells 1", @"Spells 2", @"Inventory", @"Other", nil];
	
	self.characterImageView.layer.cornerRadius = (self.characterImageView.frame.size.height / 2);
	self.characterImageView.layer.masksToBounds = YES;
    [self.characterImageView.layer setBorderColor: [[UIColor grayColor] CGColor]];
	[self.characterImageView.layer setBorderWidth: 3.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -Swipe View Methods

- (IBAction)showNextView:(id)sender
{
    NSInteger nextIndex = [self.formView currentItemIndex] + 1;
    [self.formView scrollToItemAtIndex:nextIndex duration:0.4];
}

- (IBAction)showPreviousView:(id)sender
{
    NSInteger nextIndex = [self.formView currentItemIndex] -1;
    [self.formView scrollToItemAtIndex:nextIndex duration:0.4];
}

- (IBAction)showCharacterRoot:(id)sender
{
    [self.formView scrollToItemAtIndex:0 duration:0.4];
}

- (IBAction)showViewAtIndex:(id)sender
{
    [self.formView scrollToItemAtIndex:([sender tag] + 1) duration:0.4];
}

- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView
{
    return 12;
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (index > 0)
    {
        return ((GameCharacterVC *)self.gameVCs[index - 1]).view;
    }
	
	
	
    UIView *stuff = [[UIView alloc] initWithFrame:swipeView.frame];
    stuff.backgroundColor = [UIColor colorWithRed:13/255.f green:1/255.f blue:35/255.f alpha:1.0];
//	stuff.contentSize = CGSizeMake(swipeView.frame.size.width, swipeView.frame.size.height * 1.1);
//	stuff.showsVerticalScrollIndicator = YES;
	
	for (int i = 0; i < self.gameVCs.count; i++)
	{
		UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[button addTarget:self
				   action:@selector(showViewAtIndex:)
		 forControlEvents:UIControlEventTouchDown];
		[button setTitle:self.namesArray[i] forState:UIControlStateNormal];
		[button setTitleColor:[UIColor colorWithRed:153/255.f green:1.f blue:1.f alpha:1.0] forState:UIControlStateNormal];
		button.layer.cornerRadius = 15;
		button.layer.masksToBounds = YES;
		[button.layer setBorderColor: [[UIColor colorWithRed:153/255.f green:1.f blue:1.f alpha:1.0] CGColor]];

		if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
		{
			[button.layer setBorderWidth: 6.0];
		}
		else
		{
			[button.layer setBorderWidth: 3.0];
		}
		
		CGFloat offsetX, offsetY;
		offsetY = (190.f + (40 * (i / 2)));
		
		if (i % 2 == 0) {
			offsetX = 10;
		} else {
			offsetX = 170;
		}

		button.frame = CGRectMake(offsetX, offsetY, 140.0, 30.0);
		button.tag = i;
		button.backgroundColor = [UIColor colorWithRed:30/255.f green:65/255.f blue:86/255.f alpha:1.0];
		[stuff addSubview:button];
	}
    return stuff;
}

@end

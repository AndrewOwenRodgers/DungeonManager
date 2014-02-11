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

@end

@implementation GameCharacterRootVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.gameVCs = [[NSMutableArray alloc] init];
    for (int i = 0; i < 12; i++)
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
	
    return stuff;
}

@end

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
    for (int i = 1; i < 8; i++)
    {
        if (i == 1)
        {
            GameCharacterVC *returner;
            returner = [[GameCharacterVC alloc] initWithNibName:@"NameView" bundle:nil];
            returner.character = self.character;
            [self.gameVCs addObject:returner];
        }
        else if (i == 2)
        {
            GameCharacterVC *returner;
            returner = [[GameCharacterVC alloc] initWithNibName:@"BackgroundView" bundle:nil];
            returner.character = self.character;
            [self.gameVCs addObject:returner];
        }
        else if (i == 3)
        {
            GameCharacterVC *returner;
            returner = [[GameCharacterVC alloc] initWithNibName:@"PhysicalView" bundle:nil];
            returner.character = self.character;
            [self.gameVCs addObject:returner];
        }
        else if (i == 4)
        {
            GameCharacterVC *returner;
            returner = [[GameCharacterVC alloc] initWithNibName:@"Statistics1View" bundle:nil];
            returner.character = self.character;
            [self.gameVCs addObject:returner];
        }
        else if (i == 5)
        {
            GameCharacterVC *returner;
            returner = [[GameCharacterVC alloc] initWithNibName:@"AttributeView" bundle:nil];
            returner.character = self.character;
            [self.gameVCs addObject:returner];
        }
        else if (i == 6)
        {
            GameCharacterVC *returner;
            returner = [[GameCharacterVC alloc] initWithNibName:@"SkillsView" bundle:nil];
            returner.character = self.character;
            [self.gameVCs addObject:returner];
        }
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
    return 8;
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (index > 0)
    {
        return ((GameCharacterVC *)self.gameVCs[index - 1]).view;
    }
    UIView *stuff = [[UIView alloc] initWithFrame:swipeView.frame];
    stuff.backgroundColor = [UIColor blueColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 120, 120)];
    label.text = [NSString stringWithFormat:@"view number %d", index];
    [stuff addSubview:label];
    return stuff;
}

@end

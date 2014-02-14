//
//  ShakeVC.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/14/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "ShakeVC.h"

@interface ShakeVC ()

@end

@implementation ShakeVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Shake Gesture

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"GotShaken" object:self];
	}
}

@end

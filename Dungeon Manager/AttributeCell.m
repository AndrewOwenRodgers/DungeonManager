//
//  AttributeCell.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/6/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "AttributeCell.h"

@implementation AttributeCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
    }
    
    self.attributeTextField.delegate = self;
    self.valueTextField.delegate = self;
    self.secondaryAttributeTextField.delegate = self;
    
    return self;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 1)
    {
        
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end

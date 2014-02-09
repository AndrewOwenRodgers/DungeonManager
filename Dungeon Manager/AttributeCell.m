//
//  AttributeCell.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/6/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "AttributeCell.h"

@implementation AttributeCell

-(IBAction)deleteButton:(id)sender
{
    [self.deletionDelegate deleteAttributeOfType:self.attribute.attributeType atIndex:self.attribute.attributeIndex];
}

-(void)buildView
{
    self.attributeTextField.delegate = self;
    self.valueTextField.delegate = self;
    self.secondaryAttributeTextField.delegate = self;
    self.weightTextField.delegate = self;
    
    self.attributeTextField.text = self.attribute.attributeName;
    self.valueTextField.text = [NSString stringWithFormat:@"%d", self.attribute.attributeValue];
    self.secondaryAttributeTextField.text = self.attribute.secondaryAttribute;
    self.weightTextField.text = [NSString stringWithFormat:@"%d", self.attribute.attributeWeight];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.tag == 0)
    {
        self.attribute.attributeName = textField.text;
    }
    if (textField.tag == 1)
    {
        self.attribute.attributeValue = [textField.text integerValue];
    }
    if (textField.tag == 2)
    {
        self.attribute.attributeWeight = [textField.text integerValue];
    }
    if (textField.tag == 3)
    {
        self.attribute.secondaryAttribute = textField.text;
    }
    [self.delegate saveCharacters];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end

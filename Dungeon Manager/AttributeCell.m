//
//  AttributeCell.m
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/6/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import "AttributeCell.h"

@interface AttributeCell()
{
    CGFloat slideheight;
}

@end

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
	self.featDescription.delegate = self;
    
    self.attributeTextField.text = self.attribute.attributeName;
    self.valueTextField.text = [NSString stringWithFormat:@"%d", self.attribute.attributeValue];
    self.secondaryAttributeTextField.text = self.attribute.secondaryAttribute;
    self.weightTextField.text = [NSString stringWithFormat:@"%d", self.attribute.attributeWeight];
	self.featDescription.text = self.attribute.attributeDescription;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField //Slides the view up when the keyboard appears
{
    CGRect textFieldRect = [self.deletionDelegate.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect = [self.deletionDelegate.view.window convertRect:self.deletionDelegate.view.bounds fromView:self.deletionDelegate.view];
    CGFloat midline = textFieldRect.origin.y + (CGFloat)0.5 * textFieldRect.size.height;
    CGFloat numerator = midline - viewRect.origin.y - (CGFloat)0.2 * viewRect.size.height;
    CGFloat denominator = (CGFloat)0.6 * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        slideheight = floor((CGFloat)216 * heightFraction);
    }
    else
    {
        slideheight = floor((CGFloat)168 * heightFraction);
    }
    CGRect viewFrame = self.deletionDelegate.view.frame;
    viewFrame.origin.y -= slideheight;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:(CGFloat)0.3];
    
	[self.deletionDelegate.characterImageView setAlpha:0.f];
    [self.deletionDelegate.view setFrame:viewFrame];
    
    [UIView commitAnimations];
	
	UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
	[keyboardDoneButtonView sizeToFit];
	UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
																   style:UIBarButtonItemStyleBordered target:self
																  action:@selector(textViewBeDone:)];
	[keyboardDoneButtonView setItems:[NSArray arrayWithObjects:doneButton, nil]];
	textField.inputAccessoryView = keyboardDoneButtonView;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect viewFrame = self.deletionDelegate.view.frame;
    viewFrame.origin.y += slideheight;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:(CGFloat)0.3];
    
    [self.deletionDelegate.view setFrame:viewFrame];
	[self.deletionDelegate.characterImageView setAlpha:1.f];
	
    [UIView commitAnimations];
    
    if (textField.tag == 0)
    {
        self.attribute.attributeName = textField.text;
    }
    if (textField.tag == 1)
    {
        self.attribute.attributeValue = [textField.text integerValue];
		[self.deletionDelegate recalculateWeights];
    }
    if (textField.tag == 2)
    {
        self.attribute.attributeWeight = [textField.text integerValue];
		[self.deletionDelegate recalculateWeights];
    }
    if (textField.tag == 3)
    {
        self.attribute.secondaryAttribute = textField.text;
    }
    [self.delegate saveCharacters];
}

-(void)textViewBeDone:(id)sender
{
    [self.deletionDelegate.view endEditing:YES];
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
	CGRect textFieldRect = [self.deletionDelegate.view.window convertRect:textView.bounds fromView:textView];
    CGRect viewRect = [self.deletionDelegate.view.window convertRect:self.deletionDelegate.view.bounds fromView:self.deletionDelegate.view];
    CGFloat midline = textFieldRect.origin.y + (CGFloat)0.5 * textFieldRect.size.height;
    CGFloat numerator = midline - viewRect.origin.y - (CGFloat)0.2 * viewRect.size.height;
    CGFloat denominator = (CGFloat)0.6 * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        slideheight = floor((CGFloat)216 * heightFraction);
    }
    else
    {
        slideheight = floor((CGFloat)168 * heightFraction);
    }
    CGRect viewFrame = self.deletionDelegate.view.frame;
    viewFrame.origin.y -= slideheight;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:(CGFloat)0.3];
    
	[self.deletionDelegate.characterImageView setAlpha:0.f];
    [self.deletionDelegate.view setFrame:viewFrame];
    
    [UIView commitAnimations];
	
	UIToolbar* keyboardDoneButtonView = [[UIToolbar alloc] init];
	[keyboardDoneButtonView sizeToFit];
	UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
																   style:UIBarButtonItemStyleBordered target:self
																  action:@selector(textViewBeDone:)];
	[keyboardDoneButtonView setItems:[NSArray arrayWithObjects:doneButton, nil]];
	textView.inputAccessoryView = keyboardDoneButtonView;
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
	CGRect viewFrame = self.deletionDelegate.view.frame;
    viewFrame.origin.y += slideheight;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:(CGFloat)0.3];
    
    [self.deletionDelegate.view setFrame:viewFrame];
	[self.deletionDelegate.characterImageView setAlpha:1.f];
    
    [UIView commitAnimations];
	
	[textView resignFirstResponder];
	self.attribute.attributeDescription = textView.text;
	[self.delegate saveCharacters];
}

@end

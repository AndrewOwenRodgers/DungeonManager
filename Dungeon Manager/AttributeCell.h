//
//  AttributeCell.h
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/6/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AttributeData.h"
#import "CharacterSaving.h"

@protocol DeleteAttribute <NSObject>

-(void)deleteAttributeOfType:(NSInteger)type atIndex:(NSInteger)index;
-(void)recalculateWeights;
@property UIView *view;
@property (weak, nonatomic) IBOutlet UIImageView *characterImageView;

@end

@interface AttributeCell : UICollectionViewCell
<UITextFieldDelegate, UITextViewDelegate>

@property (unsafe_unretained) id <DeleteAttribute> deletionDelegate;
@property (unsafe_unretained) id <CharacterSaving> delegate;
@property (weak, nonatomic) AttributeData *attribute;
@property (weak, nonatomic) IBOutlet UITextField *attributeTextField;
@property (weak, nonatomic) IBOutlet UITextField *valueTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondaryAttributeTextField;
@property (weak, nonatomic) IBOutlet UITextView *featDescription;

-(void)buildView;

@end

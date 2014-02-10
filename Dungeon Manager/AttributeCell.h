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
@property UIView *view;

@end

@interface AttributeCell : UICollectionViewCell
<UITextFieldDelegate>

@property (unsafe_unretained) id <DeleteAttribute> deletionDelegate;
@property (unsafe_unretained) id <CharacterSaving> delegate;
@property (weak, nonatomic) AttributeData *attribute;
@property (weak, nonatomic) IBOutlet UITextField *attributeTextField;
@property (weak, nonatomic) IBOutlet UITextField *valueTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondaryAttributeTextField;

-(void)buildView;

@end

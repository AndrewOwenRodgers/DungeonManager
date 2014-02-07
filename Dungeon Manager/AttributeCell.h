//
//  AttributeCell.h
//  Dungeon Manager
//
//  Created by Andrew Rodgers on 2/6/14.
//  Copyright (c) 2014 EnhanceDailyLife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AttributeData.h"

@interface AttributeCell : UICollectionViewCell
<UITextFieldDelegate>

@property (weak, nonatomic) AttributeData *attribute;
@property (weak, nonatomic) UITextField *attributeTextField;
@property (weak, nonatomic) UITextField *valueTextField;
@property (weak, nonatomic) UITextField *secondaryAttributeTextField;

@end

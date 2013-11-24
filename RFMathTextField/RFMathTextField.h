//
//  RFMathTextField.h
//  Math2ValidateDemo
//
//  Created by Rex Finn on 11/23/13.
//  Copyright (c) 2013 Rex Finn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RFMathTextField : UITextField <UITextFieldDelegate>

enum {
    RFMathTextFieldEquationTypeAddition,
    RFMathTextFieldEquationTypeSubtraction,
    RFMathTextFieldEquationTypeMultiplication,
    RFMathTextFieldEquationTypeDivision,
    RFMathTextFieldEquationTypeRandom
};
typedef NSInteger RFMathTextFieldEquationTypes;

-(id)initWithFrame:(CGRect)frame withEquation:(RFMathTextFieldEquationTypes)equationType andNotification:(NSString*)notification;
-(id)initWithFrame:(CGRect)frame withEquation:(RFMathTextFieldEquationTypes)equationType;
-(void)refreshEquation;

@end

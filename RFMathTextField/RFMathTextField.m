//
//  RFMathTextField.m
//  RFMathTextFieldDemo
//
//  Created by Rudd Fawcett on 11/23/13.
//  Copyright (c) 2013 Rudd Fawcett. All rights reserved.
//

#import "RFMathTextField.h"

@interface RFMathTextField ()

@property (nonatomic, readwrite) NSString *notificationName;
@property (nonatomic, readwrite) RFMathTextFieldEquationTypes currentType;
@property (nonatomic, readwrite) BOOL notification;

@end

@implementation RFMathTextField

-(id)initWithFrame:(CGRect)frame withEquation:(RFMathTextFieldEquationTypes)equationType andNotification:(NSString*)notification {
    self = [super initWithFrame:frame];
    if (self) {
        _currentType = equationType;
        _notificationName = notification;
        _notification = YES;
        [self equationWithType:equationType];
        
        self.delegate = self;
        self.keyboardType = UIKeyboardTypeNumberPad;
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame withEquation:(RFMathTextFieldEquationTypes)equationType {
    self = [super initWithFrame:frame];
    if (self) {
        _currentType = equationType;
        _notification = NO;
        [self equationWithType:equationType];
        
        self.delegate = self;
        self.keyboardType = UIKeyboardTypeNumberPad;
    }
    return self;
}

-(void)equationWithType:(RFMathTextFieldEquationTypes)equationType {
    self.text = nil;
    self.textColor = [UIColor blackColor];
    self.userInteractionEnabled = YES;
    
    int firstNumber;
    int secondNumber;
    
    NSString *equation;
    
    switch (equationType) {
        case RFMathTextFieldEquationTypeAddition:
            firstNumber = arc4random_uniform(10);
            secondNumber = arc4random_uniform(10);
            
            equation = [NSString stringWithFormat:@"%d + %d",firstNumber,secondNumber];
            
            [self doMath:equation];
            break;
        case RFMathTextFieldEquationTypeSubtraction:
            secondNumber = arc4random_uniform(10); // Put second number of equation first
            firstNumber = secondNumber + arc4random_uniform(10-secondNumber);; // Set min of random to second number (no negatives)
            
            equation = [NSString stringWithFormat:@"%d - %d",firstNumber,secondNumber];
            
            [self doMath:equation];
            break;
        case RFMathTextFieldEquationTypeMultiplication:
            firstNumber = arc4random_uniform(10);
            secondNumber = arc4random_uniform(10);
            
            equation = [NSString stringWithFormat:@"%d * %d",firstNumber,secondNumber];
            
            [self doMath:equation];
            break;
        case RFMathTextFieldEquationTypeRandom:
            {
                RFMathTextFieldEquationTypes randomType = (RFMathTextFieldEquationTypes) (arc4random_uniform(RFMathTextFieldEquationTypeDivision));
                
                [self equationWithType:randomType];
            }
            break;
            
            //Division may or may not be added - need to account for remainders/decimals
            
        default:
            break;
    }
}

-(void)refreshEquation {
    [self equationWithType:_currentType];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if ([[self.text stringByReplacingCharactersInRange:range withString:string] integerValue] == _equationAnswer) {
        
        self.text = [self.text stringByReplacingCharactersInRange:range withString:string];
        
        NSLog(@"[%@] A correct answer has been entered.",[self class]);
        
        [self endEditing:YES];
        self.textColor = [UIColor colorWithRed:0.271 green:0.710 blue:0.145 alpha:1.00];
        self.userInteractionEnabled = NO;
        self.answerCorrect = YES;
        
        if (_notification) {[[NSNotificationCenter defaultCenter] postNotificationName:_notificationName object:self];

        }
    }
    
    return YES;
}

-(void)doMath:(NSString*)equation {
    _equationAnswer = [[[NSExpression expressionWithFormat:equation] expressionValueWithObject:nil context:nil] integerValue];
    [self setPlaceholder:[equation stringByReplacingOccurrencesOfString:@"*" withString:@"x"]];
}

@end

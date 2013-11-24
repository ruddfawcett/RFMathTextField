//
//  RFMathTextField.m
//  Math2ValidateDemo
//
//  Created by Rex Finn on 11/23/13.
//  Copyright (c) 2013 Rex Finn. All rights reserved.
//

#import "RFMathTextField.h"

@interface RFMathTextField ()

@property (nonatomic, readwrite) NSInteger equationAnswer;
@property (nonatomic, readwrite) NSString *notificationName;
@property (nonatomic, readwrite) RFMathTextFieldEquationTypes currentType;
@property (nonatomic, readwrite) BOOL answerCorrect;
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
    
    int firstNumber = 0 + arc4random() % (10-0);
    int secondNumber = 0 + arc4random() % (10-0);
    
    NSString *equation;
    
    switch (equationType) {
        case RFMathTextFieldEquationTypeAddition:
            equation = [NSString stringWithFormat:@"%d + %d = ",firstNumber,secondNumber];
            _equationAnswer = firstNumber + secondNumber;
            break;
        
        // Other types will be added soon,
        // Reminder: Make sure subtraction doesn't return a negative answer
        // Reminder: No division by zero
            
        default:
            break;
    }
    
    [self setPlaceholder:equation];
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
    
@end

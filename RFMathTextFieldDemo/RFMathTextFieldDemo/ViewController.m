//
//  ViewController.m
//  Math2ValidateDemo
//
//  Created by Rudd Fawcett on 11/23/13.
//  Copyright (c) 2013 Rex Finn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) RFMathTextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *notificationName = @"answerIsCorrect";
    
    _textField = [[RFMathTextField alloc] initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width - 40, 31)
                                           withEquation:RFMathTextFieldEquationTypeAddition andNotification:notificationName];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:_textField];
    
    UIButton *refreshButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [refreshButton addTarget:self action:@selector(refreshEquation:) forControlEvents:UIControlEventTouchUpInside];
    [refreshButton setTitle:@"Refresh Equation" forState:UIControlStateNormal];
    refreshButton.frame = CGRectMake(20, 145, self.view.bounds.size.width - 40, 31);
    
    [self.view addSubview:refreshButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:notificationName object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)refreshEquation:(id)sender {
    [_textField refreshEquation];
}

-(IBAction)handleNotification:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Correct!"
                                                        message:nil
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    
    [alertView show];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

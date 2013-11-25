//
//  ViewController.m
//  RFMathTextFieldDemo
//
//  Created by Rudd Fawcett on 11/23/13.
//  Copyright (c) 2013 Rex Finn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) RFMathTextField *textField;
@property (strong, nonatomic) UILabel *answerLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *notificationName = @"answerIsCorrect";
    
    _textField = [[RFMathTextField alloc] initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width - 40, 31)
                                           withEquation:RFMathTextFieldEquationTypeRandom andNotification:notificationName];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:_textField];
    
    UIButton *refreshButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [refreshButton addTarget:self action:@selector(refreshEquation:) forControlEvents:UIControlEventTouchUpInside];
    [refreshButton setTitle:@"Refresh Equation" forState:UIControlStateNormal];
    refreshButton.frame = CGRectMake(20, 145, self.view.bounds.size.width - 40, 31);
    
    [self.view addSubview:refreshButton];
    
    _answerLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 190, self.view.bounds.size.width - 40, 31)];
    _answerLabel.text = @"Equation Answer:";
    
    [self.view addSubview:_answerLabel];
    
    UIButton *answerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [answerButton addTarget:self action:@selector(revealAnswer:) forControlEvents:UIControlEventTouchUpInside];
    [answerButton setTitle:@"Reveal Answer" forState:UIControlStateNormal];
    answerButton.frame = CGRectMake(20, 235, self.view.bounds.size.width - 40, 31);
    
    [self.view addSubview:answerButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:notificationName object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)refreshEquation:(id)sender {
    [_textField refreshEquation];
    _answerLabel.text = @"Equation Answer:";
}

-(IBAction)revealAnswer:(id)sender {
    _answerLabel.text = [NSString stringWithFormat:@"Equation Answer: %d",[_textField equationAnswer]];
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

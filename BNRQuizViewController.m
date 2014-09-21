//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by Matthew Linaberry on 8/27/14.
//  Copyright (c) 2014 Matthew Linaberry. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;
@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;
@end

@implementation BNRQuizViewController

// This gets called when the BNR View Controller is instantiated!

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    
    if (self)
    {
        // create the arrays!
        self.questions = @[@"From what is cognac made?",
                           @"What is 7+7?",
                           @"What is the capital of Vermont?"];
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
    
    return self;  //required!
}

- (IBAction)showQuestion:(id)sender
{
    // this steps to the next question
    self.currentQuestionIndex++;
    
    // loop back to the beginning when needed.
    if (self.currentQuestionIndex == [self.questions count])
    {
        self.currentQuestionIndex = 0;
    }
    
    // get the question text!
    NSString *question = self.questions[self.currentQuestionIndex];
    
    // display the string in the quesiton label
    self.questionLabel.text = question;
    
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender
{
    NSString *answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
}
@end

//
//  ViewController.m
//  JosephusProblem
//
//  Created by Carlos Alban on 8/15/15.
//  Copyright (c) 2015 Carlos Alban. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

BOOL personStay = NO;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createMainView];
    
    
    //NSLog(@"Final chair %lu", (unsigned long)self.finalPerson.chairNumber);
    
    
}

-(void)createMainView{
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    //Title Label Properties
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    self.titleLabel.center = CGPointMake(screenSize.width/2, screenSize.height/2 - 160);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont fontWithName:@"Devanagari Sangam MN" size:35.0f];
    self.titleLabel.text = @"Enter Chairs:";
    
    //Result Label Properties
    self.resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    self.resultLabel.center = CGPointMake(screenSize.width/2, screenSize.height/2 + 80);
    self.resultLabel.textAlignment = NSTextAlignmentCenter;
    self.resultLabel.font = [UIFont fontWithName:@"Devanagari Sangam MN" size:25.0f];
    self.resultLabel.alpha = 0;
    
    
    //TextField Properties
    self.numberField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    self.numberField.center = CGPointMake(screenSize.width/2, screenSize.height/2 - 40);
    self.numberField.backgroundColor = [UIColor colorWithRed:180/255.0f green:132/255.0f blue:232/255.0f alpha:0.8f];
    self.numberField.font =  [UIFont fontWithName:@"Devanagari Sangam MN" size:25.0f];
    self.numberField.layer.cornerRadius = 75;
    self.numberField.placeholder = @"10";
    self.numberField.keyboardType = UIKeyboardTypeNumberPad;
    self.numberField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.numberField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.numberField.textAlignment = NSTextAlignmentCenter;
    self.numberField.delegate = self;
    self.numberField.transform = CGAffineTransformMakeScale(1, 1);
    [self.numberField setReturnKeyType:UIReturnKeyDone];
    
    [self.view addSubview:self.numberField];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.resultLabel];
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.numberField resignFirstResponder];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.numberField.backgroundColor = [UIColor colorWithRed:60/255.0f green:90/255.0f blue:252/255.0f alpha:0.3f];
                         self.numberField.transform = CGAffineTransformMakeScale(1.4, 1.4);
                         self.resultLabel.alpha = 0.0f;
                     }completion:^(BOOL finished){
                         
                     }];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    personStay = NO;
    self.initialChairs = [self.numberField.text integerValue];
    [self calculatePattern:[self initalizeList: self.initialChairs]];
    self.resultLabel.text = [NSString stringWithFormat:@"chair number is %lu", (unsigned long)self.finalPerson.chairNumber];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.numberField.backgroundColor = [UIColor colorWithRed:180/255.0f green:132/255.0f blue:232/255.0f alpha:0.8f];
                         self.numberField.transform = CGAffineTransformIdentity;
                         self.resultLabel.alpha = 1.0f;
                     }completion:^(BOOL finished){
                         [self fadeOutResultLabel];
                     }];
    
}

-(void)fadeOutResultLabel{
    
    [UIView animateWithDuration:2.5
                          delay:0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.resultLabel.alpha = 0.0f;
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
}

-(NSMutableArray*)initalizeList: (NSUInteger)Nchairs{
    
    if (Nchairs < 1){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Input"
                                                        message:@"Please enter an integer greater than 0. Default value of 10 substituted."
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
        [alert show];
        
        Nchairs = 10;
        self.numberField.text = @"10";
    }
    
    NSMutableArray *returned = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < Nchairs; i++) {
        
        Person *newPerson = [Person new];
        newPerson.chairNumber = i+1;
        [returned addObject:newPerson];
        
    }
    
    return returned;
}


-(void)calculatePattern: (NSMutableArray*)personList{
    
    NSMutableArray *tempList = [NSMutableArray new];
    
    for (Person *person in personList) {
        
        if (personStay == YES) {
            [tempList addObject:person];
        }
        personStay = !personStay;
        
    }
    
    if ([tempList count] > 1){
        
        [self calculatePattern:tempList];
        return;
    }
    
    
    self.finalPerson = [tempList objectAtIndex:0]; //Result we care about
    
    return;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

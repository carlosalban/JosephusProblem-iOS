//
//  ViewController.h
//  JosephusProblem
//
//  Created by Carlos Alban on 8/15/15.
//  Copyright (c) 2015 Carlos Alban. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, assign) NSUInteger initialChairs;
@property (nonatomic, strong) Person* finalPerson;
@property (nonatomic, strong) UITextField *numberField;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *resultLabel;


@end


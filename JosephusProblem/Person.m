//
//  Person.m
//  JosephusProblem
//
//  Created by Carlos Alban on 8/15/15.
//  Copyright (c) 2015 Carlos Alban. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)init{
    
    if (self = [super init]){
        
        self.Name = @"John Snow";
        self.chairNumber = 0;
    }
    return self;
}


@end

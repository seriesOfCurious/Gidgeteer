//
//  BaseGidget.m
//  Gidgeteer
//
//  Created by Justin Noormand on 5/8/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import "BaseGidget.h"

@implementation BaseGidget

+(instancetype)getGidgetWithDelegate:(id)delegate {
    BaseGidget *gidget = [[BaseGidget alloc] init];
    gidget.delegate = delegate;
    return gidget;
}

-(void)updateView {
    
}

@end

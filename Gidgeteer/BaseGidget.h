//
//  BaseGidget.h
//  Gidgeteer
//
//  Created by Justin Noormand on 5/8/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseGidget;

@protocol GidgetUpdateProtocol <NSObject>
@optional
-(void)updateGidget:(BaseGidget*)gidget;

@end

@interface BaseGidget : UIView

+(instancetype)getGidgetWithDelegate:(id)delegate;
-(void)updateView;

@property (nonatomic) id delegate;

@end

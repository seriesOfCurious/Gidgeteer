//
//  SettingsConstants.h
//  Gidgeteer
//
//  Created by Justin Noormand on 5/8/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GidgetSettingsObject : NSObject

@property (nonatomic) NSString *gidgetTitle;
@property (assign) BOOL isEnabled;
@property (assign) NSInteger gidgetOrder;

@end

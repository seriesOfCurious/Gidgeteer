//
//  SettingsDAO.m
//  Gidgeteer
//
//  Created by Justin Noormand on 5/8/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import "SettingsDAO.h"
#import "SettingsConstants.h"
#import "WeatherGidget.h"

@implementation SettingsDAO

+(instancetype)instance {
    static SettingsDAO * thisInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        thisInstance = [[self alloc] init];
    });
    thisInstance.locationString = @"78704";
    return thisInstance;
}

+(NSMutableArray *)getAllGidgetsSettingsObjects {
    GidgetSettingsObject *testObject1 = [GidgetSettingsObject new];
    testObject1.gidgetTitle = @"Test Title";
    testObject1.gidgetOrder = 0;
    testObject1.isEnabled = YES;
    
    GidgetSettingsObject *testObject2 = [GidgetSettingsObject new];
    testObject2.gidgetTitle = @"Some Other Thing";
    testObject2.gidgetOrder = 0;
    testObject2.isEnabled = YES;
    
    return [[NSMutableArray alloc] initWithArray:@[testObject1,testObject2]];
}

+(NSMutableArray *)getAllGidgetsDisplayableGidgetsForViewController:(UIViewController *)viewController {
    NSMutableArray *gidgetArray = [[NSMutableArray alloc] init];
    
    WeatherGidget *weatherGidget = [WeatherGidget getGidgetWithDelegate:viewController];
    [gidgetArray addObject:weatherGidget];
    
    return gidgetArray;
}

@end

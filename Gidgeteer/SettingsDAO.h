//
//  SettingsDAO.h
//  Gidgeteer
//
//  Created by Justin Noormand on 5/8/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseUtil.h"

@interface SettingsDAO : BaseUtil

+(NSMutableArray *)getAllGidgetsSettingsObjects;
+(NSMutableArray *)getAllGidgetsDisplayableGidgetsForViewController:(UIViewController*)viewController;

@property (nonatomic) NSString * locationString;

@end

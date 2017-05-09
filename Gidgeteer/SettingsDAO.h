//
//  SettingsDAO.h
//  Gidgeteer
//
//  Created by Justin Noormand on 5/8/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsDAO : NSObject

+(NSMutableArray *)getAllGidgetsSettingsObjects;
+(NSMutableArray *)getAllGidgetsDisplayableGidgets;

@end

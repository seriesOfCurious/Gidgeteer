//
//  WeatherConnectionManager.h
//  Gidgeteer
//
//  Created by Justin Noormand on 5/9/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseConnectionManager.h"

@interface WeatherData : BaseConnectionData
@property (nonatomic) CGFloat tempHigh;
@property (nonatomic) CGFloat tempLow;
@property (nonatomic) CGFloat tempCurrent;
@property (nonatomic) CGFloat humidity;
@property (nonatomic) CGFloat windSpeed;
@property (nonatomic) NSString *clouds;
@property (nonatomic) NSDate *sunriseTime;
@property (nonatomic) NSDate *sunsetTime;


@end

@protocol WeatherConnectionManagerDelegate <NSObject>
@optional
- (void)connectionManagerReturnedWeatherData:(WeatherData *)data;
@end

@interface WeatherConnectionManager : BaseConnectionManager

-(instancetype)initWithDelegate:(id)weatherConnectionDelegate;

@end

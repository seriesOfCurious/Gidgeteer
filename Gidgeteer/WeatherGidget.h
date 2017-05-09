//
//  WeatherGidget.h
//  Gidgeteer
//
//  Created by Justin Noormand on 5/8/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import "BaseGidget.h"

@interface WeatherGidget : BaseGidget

@property (nonatomic) IBOutlet UIView *infoView;
@property (nonatomic) IBOutlet UILabel *temperatureLabel;
@property (nonatomic) IBOutlet UILabel *humidityLabel;
@property (nonatomic) IBOutlet UILabel *windLabel;
@property (nonatomic) IBOutlet UILabel *cloudsLabel;
@property (nonatomic) IBOutlet UILabel *sunriseTimeLabel;
@property (nonatomic) IBOutlet UILabel *sunsetTimeLabel;

-(void)setContentWithTemperatureString:(NSString*)temperatureString andHumidityString:(NSString*)humidityString andWindSpeedString:(NSString*)windSpeedString andCloudsString:(NSString*)cloudsString andSunriseString:(NSString*)sunriseString andSunsetString:(NSString*)sunsetString;

@end

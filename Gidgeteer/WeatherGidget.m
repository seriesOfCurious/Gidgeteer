//
//  WeatherGidget.m
//  Gidgeteer
//
//  Created by Justin Noormand on 5/8/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import "WeatherGidget.h"
#import <QuartzCore/QuartzCore.h>

@implementation WeatherGidget

+(instancetype)getGidget {
    WeatherGidget * viewObject = [[[NSBundle mainBundle] loadNibNamed:@"WeatherGidget" owner:self options:nil] objectAtIndex:0];
    viewObject.backgroundColor = [UIColor clearColor];
    viewObject.infoView.layer.cornerRadius = 5;
    viewObject.infoView.layer.masksToBounds = YES;
    
    return viewObject;
}

-(void)setContentWithTemperatureString:(NSString*)temperatureString andHumidityString:(NSString*)humidityString andWindSpeedString:(NSString*)windSpeedString andCloudsString:(NSString*)cloudsString andSunriseString:(NSString*)sunriseString andSunsetString:(NSString*)sunsetString {
    self.temperatureLabel.text = temperatureString;
    self.humidityLabel.text = humidityString;
    self.windLabel.text = windSpeedString;
    self.cloudsLabel.text = cloudsString;
    self.sunriseTimeLabel.text = sunriseString;
    self.sunsetTimeLabel.text = sunsetString;
    
    /*
    // sunrise gradient
    CAGradientLayer *sunriseGradient = [CAGradientLayer layer];
    
    sunriseGradient.frame = self.sunriseView.bounds;
    sunriseGradient.colors = @[(id)[UIColor yellowColor].CGColor, (id)[UIColor orangeColor].CGColor];
    
    [self.sunriseView.layer insertSublayer:sunriseGradient atIndex:0];
    
    // sunset gradient
    CAGradientLayer *sunsetGradient = [CAGradientLayer layer];
    
    sunsetGradient.frame = self.sunsetView.bounds;
    sunsetGradient.colors = @[(id)[UIColor purpleColor].CGColor, (id)[UIColor blueColor].CGColor];
    
    [self.sunsetView.layer insertSublayer:sunsetGradient atIndex:0];
     */
}

-(void)updateView {
    [self setContentWithTemperatureString:@"74 F" andHumidityString:@"10%" andWindSpeedString:@"50 MPH" andCloudsString:@"Cloudy" andSunriseString:@"7:00 AM" andSunsetString:@"8:00 PM"];
}

@end

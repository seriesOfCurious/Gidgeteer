//
//  WeatherGidget.m
//  Gidgeteer
//
//  Created by Justin Noormand on 5/8/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import "WeatherGidget.h"
#import <QuartzCore/QuartzCore.h>

@interface WeatherGidget()

@property (nonatomic) WeatherData *currentData;

@end

@implementation WeatherGidget

+(instancetype)getGidgetWithDelegate:(id)delegate {
    WeatherGidget * gidget = [[[NSBundle mainBundle] loadNibNamed:@"WeatherGidget" owner:self options:nil] objectAtIndex:0];
    gidget.backgroundColor = [UIColor clearColor];
    gidget.infoView.layer.cornerRadius = 5;
    gidget.infoView.layer.masksToBounds = YES;
    [gidget setAllContentLabelsHidden:YES];
    gidget.delegate = delegate;
    
    return gidget;
}

-(void)setAllContentLabelsHidden:(BOOL)hidden {
    self.temperatureLabel.hidden = hidden;
    self.humidityLabel.hidden = hidden;
    self.windLabel.hidden = hidden;
    self.cloudsLabel.hidden = hidden;
    self.sunriseTimeLabel.hidden = hidden;
    self.sunsetTimeLabel.hidden = hidden;
}

-(void)setContent {
    WeatherData *data = self.currentData;
    NSString *temperatureString = [NSString stringWithFormat:@"%ld F",(long)data.tempCurrent];
    NSString *humidityString = [NSString stringWithFormat:@"%ld%%",(long)data.humidity];
    NSString *windspeedString = [NSString stringWithFormat:@"%ld mpg",(long)data.windSpeed];
    NSString *conditionsString = data.clouds;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [formatter setDateFormat:@"h:mm a"];
    NSString * sunriseString = [formatter stringFromDate:data.sunriseTime];
    NSString * sunsetString = [formatter stringFromDate:data.sunsetTime];
    
    self.temperatureLabel.text = temperatureString;
    self.humidityLabel.text = humidityString;
    self.windLabel.text = windspeedString;
    self.cloudsLabel.text = conditionsString;
    self.sunriseTimeLabel.text = sunriseString;
    self.sunsetTimeLabel.text = sunsetString;
    
    [self setAllContentLabelsHidden:NO];
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
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(updateGidget:)]) {
        [self.delegate updateGidget:self];
    }
}

-(void)updateView {
    WeatherConnectionManager *wcManager = [[WeatherConnectionManager alloc] initWithDelegate:self];
    [wcManager start];
}

-(void)connectionManagerReturnedWeatherData:(WeatherData *)data {
    self.currentData = data;
    [self performSelectorOnMainThread:@selector(setContent) withObject:nil
                        waitUntilDone:NO];
}

@end

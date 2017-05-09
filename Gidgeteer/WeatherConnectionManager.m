//
//  WeatherConnectionManager.m
//  Gidgeteer
//
//  Created by Justin Noormand on 5/9/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import "WeatherConnectionManager.h"
#import "SettingsDAO.h"

#define WEATHER_URL @"http://api.openweathermap.org/data/2.5/weather?zip="
#define WEATHER_API_ID @"&appid=0b57829b8a563d8b0fb14f89e59692df&units=imperial"

@implementation WeatherConnectionManager

-(instancetype)initWithDelegate:(id)weatherConnectionDelegate {
    NSString * weatherURL = [NSString stringWithFormat:@"%@%@%@",WEATHER_URL,[SettingsDAO instance].locationString,WEATHER_API_ID];
    self = [super initWithUrl:weatherURL];
    if(self) {
        self.delegate = weatherConnectionDelegate;
    }
    return self;
}

-(void)handleData:(NSData *)data withNSURLResponse:(NSURLResponse *)response andError:(NSError *)error {
    if(self.delegate && [self.delegate respondsToSelector:@selector(connectionManagerReturnedWeatherData:)]) {
        WeatherData *weatherData = [[WeatherData alloc] initWithData:data];
        [self.delegate connectionManagerReturnedWeatherData:weatherData];
    }
}

@end

@implementation WeatherData

-(instancetype) initWithData:(NSData*)data {
    self = [super initWithData:data];
    NSDictionary *dictFromData = nil;
    NSError *error = nil;
    if(data) {
        dictFromData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        self.tempHigh = [[[dictFromData objectForKey:@"main"] objectForKey:@"temp_max"] floatValue];
        self.tempLow = [[[dictFromData objectForKey:@"main"] objectForKey:@"temp_min"] floatValue];
        self.tempCurrent = [[[dictFromData objectForKey:@"main"] objectForKey:@"temp"] floatValue];
        self.humidity = [[[dictFromData objectForKey:@"main"] objectForKey:@"humidity"] floatValue];
        self.windSpeed = [[[dictFromData objectForKey:@"wind"] objectForKey:@"speed"] floatValue];
        self.clouds = [[dictFromData objectForKey:@"weather"][0] objectForKey:@"main"];
        self.sunriseTime = [NSDate dateWithTimeIntervalSince1970:[[[dictFromData objectForKey:@"sys"] objectForKey:@"sunrise"] integerValue]];
        self.sunsetTime = [NSDate dateWithTimeIntervalSince1970:[[[dictFromData objectForKey:@"sys"] objectForKey:@"sunset"] integerValue]];
    }
    return self;
}

@end

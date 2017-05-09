//
//  BaseConnectionManager.m
//  Gidgeteer
//
//  Created by Justin Noormand on 5/9/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import "BaseConnectionManager.h"

@interface BaseConnectionManager()

@property (nonatomic) NSURL *cmTargetUrl;

@end

@implementation BaseConnectionManager

- (id)initWithUrl: (NSString *)targetUrl
{
    self = [super init];
    if (self) {
        self.cmTargetUrl = [NSURL URLWithString:targetUrl];
    }
    
    return self;
}

- (void)start {
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
        dataTaskWithURL:self.cmTargetUrl
        completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            [self handleData:data withNSURLResponse:response andError:error];
    }];
    [downloadTask resume];
}

-(void)handleData:(NSData *)data withNSURLResponse:(NSURLResponse *)response andError:(NSError *)error {
    if(self.delegate && [self.delegate respondsToSelector:@selector(connectionManagerReturnedData:)]) {
        BaseConnectionData *bcData = [BaseConnectionData new];
        bcData.data = data;
        [self.delegate connectionManagerReturnedData:bcData];
    }
}


@end

@implementation BaseConnectionData

-(instancetype) initWithData:(NSData*)data {
    self = [super init];
    if(self) {
        self.data = data;
    }
    return self;
}

@end


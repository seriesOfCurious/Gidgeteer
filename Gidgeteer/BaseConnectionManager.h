//
//  BaseConnectionManager.h
//  Gidgeteer
//
//  Created by Justin Noormand on 5/9/17.
//  Copyright © 2017 Justin Noormand. All rights reserved.
//

#import <UIKit/UIKit.h>

// BaseConnectionData definition
@interface BaseConnectionData : NSObject
-(instancetype) initWithData:(NSData*)data;
@property (nonatomic) NSData *data;
@end

// delegate protocol
@protocol ConnectionManagerDelegate <NSObject>
@optional
- (void)connectionManagerReturnedData:(BaseConnectionData *)data;
@end

// connection manager
@interface BaseConnectionManager : NSObject <NSURLConnectionDelegate>

- (id)initWithUrl: (NSString *)targetUrl;
- (void)start;

@property (assign) id delegate;

@end

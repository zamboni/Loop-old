//
//  Server.m
//  Loop
//
//  Created by Fletcher Fowler on 8/19/12.
//  Copyright (c) 2012 Zamboni Dev. All rights reserved.
//

#import "Server.h"
#import "SMWebRequest.h"
#import "User.h"

@implementation Server

@synthesize webRequest  = _webRequest;
@synthesize delegate    = _delegate;

static Server *sharedObject;
+ (Server *)sharedInstance{
    if (sharedObject == nil){
        sharedObject = [[super allocWithZone:NULL] init];
    }
    return sharedObject;
}

+ (void)login:(NSString *)email:(NSString *)password
{
    NSDictionary *params = @{
        @"email"    : email,
        @"password" : password
    };
    
    NSMutableURLRequest *request = [self createRequest:@"http://localhost:3000/session.json":params];
    Server *shared = [Server sharedInstance];
    
    shared.webRequest = [SMWebRequest requestWithURLRequest:request delegate:nil context:nil];
    [shared.webRequest addTarget:self action:@selector(loginResponse:) forRequestEvents:SMWebRequestEventComplete];
    [shared.webRequest addTarget:self action:@selector(loginFailure:) forRequestEvents:SMWebRequestEventError];
    [shared.webRequest start];
}

+ (void)loginResponse:(NSData *)data
{
    Server *shared = [Server sharedInstance];

    NSError *error;
    NSDictionary *loginResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if([[loginResponse objectForKey:@"status"] isEqualToString:@"success"])
    {
        NSLog(@"login");
        
    }
    else{
        NSLog(@"login failure");
    }
    [shared.delegate didLogin:@"user"];

}

+ (void)loginFailure:(NSError *)theError
{
    Server *shared = [Server sharedInstance];

    [shared.delegate didLogin:@"user"];

    NSLog(@"failure");
    NSLog(@"%d", [theError code]);
    
}

+ (void)registerUser:(NSString *)email:(NSString *)password
{
    NSDictionary *params = @{
        @"user"     : @{
            @"email"    : email,
            @"password" : password
        }
    };
    
    Server *server = [Server sharedInstance];
    
    NSMutableURLRequest *request = [self createRequest:@"http://localhost:3000/users.json":params];
    server.webRequest = [SMWebRequest requestWithURLRequest:request delegate:nil context:nil];
    [server.webRequest addTarget:self action:@selector(registrationResponse:) forRequestEvents:SMWebRequestEventComplete];
    [server.webRequest addTarget:self action:@selector(registrationFailure:) forRequestEvents:SMWebRequestEventError];
    [server.webRequest start];
}

+ (void)registrationResponse:(NSData *)data
{
    Server *shared = [Server sharedInstance];
    
    NSError *error;
    NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    NSString *email = [[response objectForKey:@"user"] objectForKey:@"email"];
    [User createUser:email];
    NSArray *users = [User getUser:email];
    NSLog(users.description);
}

+ (NSMutableURLRequest *)createRequest:(NSString *)url:(NSDictionary *)params
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:kNilOptions error:&error];
    NSURL *requestUrl = [NSURL URLWithString:url];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestUrl];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    return request;
}

@end

//
//  Server.h
//  Loop
//
//  Created by Fletcher Fowler on 8/19/12.
//  Copyright (c) 2012 Zamboni Dev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerDelegate.h"
#import "SMWebRequest.h"

@interface Server : NSObject{
    SMWebRequest *webRequest;
}

@property (nonatomic, retain) SMWebRequest *webRequest;
@property (nonatomic, assign) id<ServerDelegate> delegate;

+ (Server *) sharedInstance;
+ (void)login:(NSString *)email:(NSString *)password;
+ (void)registerUser:(NSString *)email:(NSString *)password;

@end

//
//  ServerDelegate.h
//  Loop
//
//  Created by Fletcher Fowler on 8/19/12.
//  Copyright (c) 2012 Zamboni Dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Server;

@protocol ServerDelegate <NSObject>

@optional

- (void)didLogin:(NSString *)userId;
- (void)didRegister:(NSString *)userId;

@end

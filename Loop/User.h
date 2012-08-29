//
//  User.h
//  Loop
//
//  Created by Fletcher Fowler on 8/27/12.
//  Copyright (c) 2012 Zamboni Dev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * email;

+ (void)createUser:(NSString *)email;
+ (NSArray *)getUser:(NSString *)email;

@end

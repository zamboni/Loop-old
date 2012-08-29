//
//  User.m
//  Loop
//
//  Created by Fletcher Fowler on 8/27/12.
//  Copyright (c) 2012 Zamboni Dev. All rights reserved.
//

#import "User.h"


@implementation User

@dynamic email;

+ (void)createUser:(NSString *)email
{
    NSManagedObjectContext *context = [NSManagedObjectContext contextForCurrentThread];
    User *user = [User createInContext:context];
    user.email = email;
    [context save];
}

+ (NSArray *)getUser:(NSString *)email
{
    NSArray *users = [User findByAttribute:@"email" withValue:email];
    return users;
}
@end

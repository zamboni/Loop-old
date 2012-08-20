//
//  Provider.h
//  Loop
//
//  Created by Fletcher Fowler on 8/17/12.
//  Copyright (c) 2012 Zamboni Dev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Provider : NSManagedObject

@property (nonatomic, retain) NSString * rid;
@property (nonatomic, retain) NSString * access_token;
@property (nonatomic, retain) NSString * type;

@end

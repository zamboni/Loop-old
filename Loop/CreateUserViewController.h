//
//  CreateUserViewController.h
//  Loop
//
//  Created by Fletcher Fowler on 8/20/12.
//  Copyright (c) 2012 Zamboni Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Server.h"

@interface CreateUserViewController : UIViewController <ServerDelegate>

@property IBOutlet UITextField *emailField;
@property IBOutlet UITextField *passwordField;
@property IBOutlet UITextField *passwordConfirmationField;

- (IBAction)sendRegistration;


@end

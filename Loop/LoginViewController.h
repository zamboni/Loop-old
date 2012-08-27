//
//  LoginViewController.h
//  Loop
//
//  Created by Fletcher Fowler on 8/17/12.
//  Copyright (c) 2012 Zamboni Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerDelegate.h"
#import "Server.h"

@interface LoginViewController : UIViewController <NSFetchedResultsControllerDelegate, ServerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


- (NSFetchedResultsController *)fetchedResultsController;

@property IBOutlet UITextField *emailField;
@property IBOutlet UITextField *passwordField;
- (IBAction)login;

@end

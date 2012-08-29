//
//  CreateUserViewController.m
//  Loop
//
//  Created by Fletcher Fowler on 8/20/12.
//  Copyright (c) 2012 Zamboni Dev. All rights reserved.
//

#import "CreateUserViewController.h"

@interface CreateUserViewController ()

@end

@implementation CreateUserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendRegistration
{
    NSString *email                 = self.emailField.text;
    NSString *password              = self.passwordField.text;
    NSString *password_confirmation = self.passwordConfirmationField.text;
    if(password isEqualToString:<#(NSString *)#>)
    [[Server sharedInstance] setDelegate:self];
    [Server registerUser:email:password];    
}

- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
	for (UIView* view in self.view.subviews) {
		if ([view isKindOfClass:[UITextField class]])
			[view resignFirstResponder];
	}
}

@end

//
//  LoginViewController.m
//  Loop
//
//  Created by Fletcher Fowler on 8/17/12.
//  Copyright (c) 2012 Zamboni Dev. All rights reserved.
//

#import "LoginViewController.h"
#import "SMWebRequest.h"
#import "Server.h"
#import "AppDelegate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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

- (IBAction)login
{
    NSString *email     = self.emailField.text;
    NSString *password  = self.passwordField.text;

    [[Server sharedInstance] setDelegate:self];
    [Server login:email:password];
}

- (void)didLogin:(NSString *)userId
{
    NSLog(@"loggedin");
}

- (void)touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event {
	for (UIView* view in self.view.subviews) {
		if ([view isKindOfClass:[UITextField class]])
			[view resignFirstResponder];
	}
}

@end

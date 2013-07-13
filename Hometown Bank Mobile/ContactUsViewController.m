//
//  ContactUsViewController.m
//  Hometown Bank Mobile
//
//  Created by James Forkey on 6/20/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//

#import "ContactUsViewController.h"

@interface ContactUsViewController ()

@end

@implementation ContactUsViewController


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

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//Open MFMail and set preferences
-(IBAction) openEmail {
    MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
    [mailComposer setMailComposeDelegate:self];
    if ([MFMailComposeViewController canSendMail]) {
        [mailComposer setToRecipients:[NSArray arrayWithObjects:@"customerserv@hometowncoop.com", nil]];
        [mailComposer setSubject:@""];
        [mailComposer setMessageBody:@"" isHTML:NO]; [mailComposer setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
//        [self presentModalViewController:mailComposer animated:YES];
        if([self respondsToSelector:@selector(presentViewController:animated:completion:)])
            [self presentViewController:mailComposer animated:YES completion:^{/* done */}];
        else
            [self presentModalViewController:mailComposer animated:YES];
    } 
    
}

//Dismiss MFMail
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    if (error) { 
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"Error %@", [error description]] delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil]; [alert show];
        if([self respondsToSelector:@selector(dismissViewControllerAnimated:completion:)])
            [self dismissViewControllerAnimated:YES completion:^{/* done */}];
        else
            [self dismissModalViewControllerAnimated:YES];
    }
    if([self respondsToSelector:@selector(dismissViewControllerAnimated:completion:)])
        [self dismissViewControllerAnimated:YES completion:^{/* done */}];
    else
        [self dismissModalViewControllerAnimated:YES];
}


@end

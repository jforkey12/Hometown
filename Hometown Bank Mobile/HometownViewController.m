//
//  HometownViewController.m
//  Hometown Bank Mobile
//
//  Created by James Forkey on 6/27/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//

#import "HometownViewController.h"

@interface HometownViewController ()

@end

@implementation HometownViewController

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


-(IBAction) fullWebsite {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://m.hometowncoop.com"]];
    
}
@end

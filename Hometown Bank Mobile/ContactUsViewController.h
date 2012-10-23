//
//  ContactUsViewController.h
//  Hometown Bank Mobile
//
//  Created by James Forkey on 6/20/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ContactUsViewController : UIViewController <MFMailComposeViewControllerDelegate> {
    
}

-(IBAction) openEmail;

@end

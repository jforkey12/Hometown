//
//  BranchesViewController.h
//  Hometown Bank Mobile
//
//  Created by James Forkey on 6/20/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface BranchesViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) IBOutlet UIScrollView *branchesScrollView;

@end
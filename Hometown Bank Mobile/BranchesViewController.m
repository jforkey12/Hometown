//
//  BranchesViewController.m
//  Hometown Bank Mobile
//
//  Created by James Forkey on 6/20/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//

//
//  BranchesViewController.m
//  Hometown Bank Mobile
//
//  Created by James Forkey on 6/20/12.
//  Copyright (c) 2012 Worcester State College. All rights reserved.
//

#import "BranchesViewController.h"

@interface BranchesViewController ()

@end

@implementation BranchesViewController
@synthesize mapView;
@synthesize branchesScrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        mapView.showsUserLocation = YES;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CLLocationCoordinate2D atholBranch;
    CLLocationCoordinate2D oxfordBranch;
    CLLocationCoordinate2D sLancasterBranch;
    CLLocationCoordinate2D sturbridgeBranch;
    CLLocationCoordinate2D websterBranch;
    CLLocationCoordinate2D websterConvCenter;
    CLLocationCoordinate2D auburnBranch;
    CLLocationCoordinate2D centerPoint;

    
    mapView.showsUserLocation = YES;
    mapView.mapType = MKMapTypeStandard;
    
    atholBranch.latitude = 42.593849;
    atholBranch.longitude = -72.231653;
    oxfordBranch.latitude = 42.116241;
    oxfordBranch.longitude = -71.859942;
    sLancasterBranch.latitude = 42.439462;
    sLancasterBranch.longitude = -71.68648;
    sturbridgeBranch.latitude = 42.179688196665961;
    sturbridgeBranch.longitude = -72.11700439453125;
    websterBranch.latitude = 42.049388241412856;
    websterBranch.longitude = -71.88296556472778;
    websterConvCenter.latitude = 42.055594;
    websterConvCenter.longitude = -71.870742;
    auburnBranch.latitude = 42.19075435955535;
    auburnBranch.longitude = -71.84601545333862;
    centerPoint.latitude = 42.351059441067235;
    centerPoint.longitude = -71.86307430267334;
    
    
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = atholBranch;
    annotationPoint.title = @"Athol Branch";
    annotationPoint.subtitle = @"90 Exchange St, Athol, MA";
    [mapView addAnnotation:annotationPoint];
    

    MKPointAnnotation *annotationPoint2 = [[MKPointAnnotation alloc] init];
    annotationPoint2.coordinate = oxfordBranch;
    annotationPoint2.title = @"Oxford Branch";
    annotationPoint2.subtitle = @"31 Sutton Ave, Oxford, MA";
    [mapView addAnnotation:annotationPoint2];
    
    MKPointAnnotation *annotationPoint3 = [[MKPointAnnotation alloc] init];
    annotationPoint3.coordinate = sLancasterBranch;
    annotationPoint3.title = @"South Lancaster Branch";
    annotationPoint3.subtitle = @"131 Main St, S. Lancaster, MA";
    [mapView addAnnotation:annotationPoint3];
    
    MKPointAnnotation *annotationPoint4 = [[MKPointAnnotation alloc] init];
    annotationPoint4.coordinate = sturbridgeBranch;
    annotationPoint4.title = @"Sturbridge Branch";
    annotationPoint4.subtitle = @"331 Main St, Route 131, Sturbridge, MA";
    [mapView addAnnotation:annotationPoint4];
    
    MKPointAnnotation *annotationPoint5 = [[MKPointAnnotation alloc] init];
    annotationPoint5.coordinate = websterBranch;
    annotationPoint5.title = @"Webster Convenience Center";
    annotationPoint5.subtitle = @"218R Main St, Webster, MA";
    [mapView addAnnotation:annotationPoint5];
    
    MKPointAnnotation *annotationPoint7 = [[MKPointAnnotation alloc] init];
    annotationPoint5.coordinate = websterConvCenter;
    annotationPoint5.title = @"Webster Branch";
    annotationPoint5.subtitle = @"4 Grove Rd, Webster, MA";
    [mapView addAnnotation:annotationPoint7];
    
    MKPointAnnotation *annotationPoint6 = [[MKPointAnnotation alloc] init];
    annotationPoint6.coordinate = auburnBranch;
    annotationPoint6.title = @"Auburn Branch";
    annotationPoint6.subtitle = @"569 Southbridge St, Heritage Plaza, Auburn, MA";
    [mapView addAnnotation:annotationPoint6];
    
    [branchesScrollView setScrollEnabled:YES];
    [branchesScrollView setContentSize:CGSizeMake(320,1325)];
    
    self.mapView.region = MKCoordinateRegionMakeWithDistance(centerPoint, 70000, 120000);
    
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    MKAnnotationView* annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                                       reuseIdentifier:@"MyCustomAnnotation"];
    
    annotationView.canShowCallout = YES;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    id <MKAnnotation> annotation = view.annotation;
    CLLocationCoordinate2D coordinate = [annotation coordinate];
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil];
    MKMapItem *mapitem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapitem.name = annotation.title;
    [mapitem openInMapsWithLaunchOptions:@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving}];

}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    MKCoordinateRegion region;
    region.center = self.mapView.userLocation.coordinate;
    
    MKCoordinateSpan span;
    span.latitudeDelta  = .5;
    span.longitudeDelta = .5;
    region.span = span;
    
    [self.mapView setRegion:region animated:YES];
}
- (void)dealloc
{
    // [self.mapView.userLocation removeObserver:self forKeyPath:@"location"];
    [self.mapView removeFromSuperview];
    self.mapView = nil;
    
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


-(IBAction) goToUserLoc{
    
    //Initializes the map, sets the delegate, the map type and shows the user location
    MKCoordinateRegion region;
	self.mapView.mapType=MKMapTypeStandard;
	self.mapView.showsUserLocation = YES;
    [self.mapView setRegion:region animated:YES];
    
    //Creates a 2D coordinate and sets it to the user's current lat/long
    //Centers the map to those coordinates and zooms to an appropriate level.
    //You can play with the numbers depending on what zoom level you want.
    
	CLLocationCoordinate2D userLoc;
	userLoc.latitude = self.mapView.userLocation.location.coordinate.latitude;
	userLoc.longitude = self.mapView.userLocation.location.coordinate.longitude;
	self.mapView.region = MKCoordinateRegionMakeWithDistance(userLoc, .5, .5);
    
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    self.mapView.centerCoordinate = userLocation.location.coordinate;
}

@end
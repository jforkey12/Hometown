//
//  MyLocation.h
//  Hometown Bank Mobile
//
//  Created by James Forkey on 6/20/13.
//  Copyright (c) 2013 Hometown Coop Bank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyLocation : NSObject <MKAnnotation>

- (id)initWithName:(NSString*)name address:(NSString*)address
        coordinate:(CLLocationCoordinate2D)coordinate;

-(MKMapItem*)mapItem;

@end

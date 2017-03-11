//
//  MapController.m
//  FreshTask
//
//  Created by Pavankumar on 11/03/17.
//  Copyright © 2017 Sample. All rights reserved.
//

#import "MapController.h"

@interface MapController ()

@end

@implementation MapController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self new_method];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)new_method
{
    self.mapview.delegate = self;
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        // Use one or the other, not both. Depending on what you put in info.plist
        [self.locationManager requestAlwaysAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    
    self.mapview.showsUserLocation = YES;
    self.mapview.mapType = MKMapTypeStandard;
    [self.mapview setZoomEnabled:YES];
    [self.mapview setScrollEnabled:YES];
    
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [mapView setRegion:[mapView regionThatFits:region] animated:YES];
}
-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
}

- (NSString *)deviceLocation {
    return [NSString stringWithFormat:@"latitude: %f longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude];
}


@end

//
//  ViewController.m
//  LocationTest
//
//  Created by Dacio Leal Rodriguez on 10/07/14.
//  Copyright (c) 2014 Dacio Leal Rodriguez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CLLocationManager *locationManager;
}
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    locationManager = [[CLLocationManager alloc] init];
//    locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
//    locationManager.delegate = self;
    
    [self startStandardUpdates];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) startStandardUpdates
{
    if (locationManager == nil) {
        locationManager = [[CLLocationManager alloc] init];
    }
    locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    locationManager.delegate = self;
    
    locationManager.distanceFilter = 500.0; //Meters
    
    [locationManager startUpdatingLocation];
}

- (void) startSignificantChangeUpdates
{
    if (locationManager == nil) {
        locationManager = [[CLLocationManager alloc] init];
    }
    locationManager.delegate = self;
    
    [locationManager startMonitoringSignificantLocationChanges];
}

#pragma mark - CLLocation delegate methods

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    NSDate *eventDate = location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    
    if (abs(howRecent) < 15.0) {
//        NSLog(@"latitude: %.6f, longitude: %.6f", location.coordinate.latitude, location.coordinate.longitude);
        _latitudeLabel.text = [NSString stringWithFormat:@"Latitude: %.6f", location.coordinate.latitude];
        _longitudeLabel.text = [NSString stringWithFormat:@"Longitude: %.6f", location.coordinate.longitude];
    }
}


@end
























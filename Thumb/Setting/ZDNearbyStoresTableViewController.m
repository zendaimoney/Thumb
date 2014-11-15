//
//  ZDNearbyStoresTableViewController.m
//  Thumb
//
//  Created by peter on 14/11/13.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDNearbyStoresTableViewController.h"
#import "ZDMapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "ZDShopAddressTableCell.h"

@interface ZDNearbyStoresTableViewController ()<CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *arr;

@end

@implementation ZDNearbyStoresTableViewController

- (void)viewDidLoad
{
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 1000.f;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    if ([self currentSystemVersion] >= 8.0) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    
    self.arr = @[@"1",@"2"];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark - tabbleView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentifier = @"shopAddressCell";
    ZDShopAddressTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier forIndexPath:indexPath];
    return cell;
}

#pragma mark - properties

- (CLLocationManager *)locationManager
{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
    }
    return _locationManager;
}

#pragma mark - current device

- (float)currentSystemVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

#pragma makr - Navgition

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showMap"]) {
        ZDMapViewController *mapViewController = segue.destinationViewController;
        mapViewController.coord = self.coordinate;
    }
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"location error is :%@",error.localizedDescription);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    self.coordinate = location.coordinate;
    [self.locationManager stopUpdatingLocation];
}

@end

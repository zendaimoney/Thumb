//
//  ZDMapViewController.m
//  Thumb
//
//  Created by peter on 14/11/13.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDMapViewController.h"
#import "MyAnnotaion.h"
#import <MapKit/MapKit.h>

@interface ZDMapViewController ()<CLLocationManagerDelegate,MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ZDMapViewController

- (void)viewDidLoad
{
    self.mapView.delegate = self;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.coord, 500, 500);
    MKCoordinateRegion adjustRegion = [self.mapView regionThatFits:region];
    [self.mapView setRegion:adjustRegion animated:YES];
    
    MyAnnotaion *myAnnotaion = [[MyAnnotaion alloc] initWithTitle:@"我在这里" subtitle:@"哈哈" coordinate:self.coord];
    [self.mapView addAnnotation:myAnnotaion];
}

- (void)showDetail
{
    
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *placemarkIdentifier = @"my annotaion";
    if ([annotation isKindOfClass:[MyAnnotaion class]]) {
        MKPinAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:placemarkIdentifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:placemarkIdentifier];
        }
        annotationView.pinColor = MKPinAnnotationColorRed;
        annotationView.animatesDrop = YES;
        annotationView.canShowCallout = YES;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [button addTarget:self action:@selector(showDetail) forControlEvents:UIControlEventTouchUpInside];
        annotationView.rightCalloutAccessoryView = button;
        return annotationView;
    }else return nil;
}

@end

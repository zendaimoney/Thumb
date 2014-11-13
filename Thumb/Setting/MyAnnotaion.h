//
//  MyAnnotaion.h
//  Thumb
//
//  Created by peter on 14/11/13.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotaion : NSObject<MKAnnotation>

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *subtitle;
@property (nonatomic) CLLocationCoordinate2D coordinate;

- (MyAnnotaion *)initWithTitle:(NSString *)Title
                      subtitle:(NSString *)subTitle
                    coordinate:(CLLocationCoordinate2D)coorDinate;
@end

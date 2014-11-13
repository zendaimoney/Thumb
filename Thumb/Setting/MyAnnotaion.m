//
//  MyAnnotaion.m
//  Thumb
//
//  Created by peter on 14/11/13.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "MyAnnotaion.h"

@implementation MyAnnotaion

- (MyAnnotaion *)initWithTitle:(NSString *)Title subtitle:(NSString *)subTitle coordinate:(CLLocationCoordinate2D)coorDinate
{
    self = [super init];
    if (self) {
        self.title = Title;
        self.subtitle = subTitle;
        self.coordinate = coorDinate;
    }
    return self;
}

@end

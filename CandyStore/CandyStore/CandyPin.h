//
//  CandyPin.h
//  CandyStore
//
//  Created by Andrew Brandt on 9/26/14.
//  Copyright (c) 2014 Andrew Brandt. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;
@class Candy;

@interface CandyPin : NSObject<MKAnnotation>

@property (strong, nonatomic) Candy *candy;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@end

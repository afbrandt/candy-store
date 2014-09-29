//
//  MKSCandyMapViewController.h
//  CandyStore
//
//  Created by Andrew Brandt on 9/17/14.
//  Copyright (c) 2014 Andrew Brandt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@class Candy;

@interface MKSCandyMapViewController : UIViewController<MKMapViewDelegate>

@property (weak, nonatomic) Candy *candy;

@end

//
//  MKSCandyMapViewController.m
//  CandyStore
//
//  Created by Andrew Brandt on 9/17/14.
//  Copyright (c) 2014 Andrew Brandt. All rights reserved.
//

#import "MKSCandyMapViewController.h"
#import "Candy.h"
#import "CandyPin.h"

@interface MKSCandyMapViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MKSCandyMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CandyPin *pin = [CandyPin new];
    pin.candy = self.candy;
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.02, 0.02);
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake([[self.candy candyXCoordinate] doubleValue], [[self.candy candyYCoordinate] doubleValue]);
    MKCoordinateRegion region = MKCoordinateRegionMake(location, span);
    
    [self.mapView setRegion:region animated:YES];
    
    [self.mapView addAnnotation:pin];
    //[self.mapView setCenterCoordinate:pin.coordinate animated:YES];
    //[self.mapView selectAnnotation:self.candy animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

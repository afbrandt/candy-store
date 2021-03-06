//
//  Candy.m
//  CandyStore
//
//  Created by Andrew Brandt on 9/16/14.
//  Copyright (c) 2014 Andrew Brandt. All rights reserved.
//

#import "Candy.h"

@implementation Candy

@dynamic candyName;
@dynamic candyImage;
@dynamic candyXCoordinate;
@dynamic candyYCoordinate;

+ (instancetype)createCandyWithContext: (NSManagedObjectContext *)context {
    Candy *candy = [NSEntityDescription insertNewObjectForEntityForName:@"MKSCandy" inManagedObjectContext:context];
    return candy;
}

- (void)setCoordinate: (CLLocationCoordinate2D)newCoordinate {
    self.coordinate = CLLocationCoordinate2DMake([self.candyXCoordinate doubleValue], [self.candyYCoordinate doubleValue]);
}

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake([self.candyXCoordinate doubleValue], [self.candyYCoordinate doubleValue]);
}

@end

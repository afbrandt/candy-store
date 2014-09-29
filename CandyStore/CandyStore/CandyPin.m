//
//  CandyPin.m
//  CandyStore
//
//  Created by Andrew Brandt on 9/26/14.
//  Copyright (c) 2014 Andrew Brandt. All rights reserved.
//

#import "CandyPin.h"
#import "Candy.h"

@implementation CandyPin

- (void)setCandy: (Candy *)candy {
    _candy = candy;
    _coordinate = CLLocationCoordinate2DMake([self.candy.candyXCoordinate doubleValue], [self.candy.candyYCoordinate doubleValue]);
}

@end

//
//  Candy.h
//  CandyStore
//
//  Created by Andrew Brandt on 9/16/14.
//  Copyright (c) 2014 Andrew Brandt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Candy : NSManagedObject

@property (nonatomic, retain) NSString * candyName;
@property (nonatomic, retain) NSData * candyImage;
@property (nonatomic, retain) NSString * candyLocation;

@end

//
//  MKSCandyTableViewController.h
//  CandyStore
//
//  Created by Andrew Brandt on 9/16/14.
//  Copyright (c) 2014 Andrew Brandt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MKSCandyTableViewController : UITableViewController

@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) NSArray *candies;

@end

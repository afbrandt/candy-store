//
//  MKSCandyChatTableViewController.h
//  CandyStore
//
//  Created by Andrew Brandt on 9/25/14.
//  Copyright (c) 2014 Andrew Brandt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MKSCandyChatTableViewController : UITableViewController<NSURLSessionDelegate>

@property (copy, nonatomic) NSMutableArray *chatMessages;

@end

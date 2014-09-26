//
//  ChatMessage.h
//  CandyStore
//
//  Created by Andrew Brandt on 9/25/14.
//  Copyright (c) 2014 Andrew Brandt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatMessage : NSObject

@property (strong, nonatomic) NSString *message;

+ (NSArray *)buildChatFromJSON: (NSArray *)json;
+ (instancetype)chatWithJSONDictionary: (NSDictionary *)json;

@end

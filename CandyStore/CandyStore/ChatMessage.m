//
//  ChatMessage.m
//  CandyStore
//
//  Created by Andrew Brandt on 9/25/14.
//  Copyright (c) 2014 Andrew Brandt. All rights reserved.
//

#import "ChatMessage.h"

@implementation ChatMessage

+ (NSArray *)buildChatFromJSON: (NSArray *)json {
    NSMutableArray *chat = [NSMutableArray array];

    for (NSDictionary *chatItem in json) {
        ChatMessage *msg = [self chatWithJSONDictionary:chatItem];
        [chat addObject:msg];
    }
    
    return chat;
}

+ (instancetype)chatWithJSONDictionary:(NSDictionary *)json {
    ChatMessage *chat = [ChatMessage new];
    
    chat.message = json[@"message"];
    
    return chat;
}

@end

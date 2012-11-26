//
//  HNRStory.h
//  HNReader
//
//  Created by Jurre Stender on 11/24/12.
//  Copyright (c) 2012 Jurre Stender. All rights reserved.
//
//{
//    "title":"News about Mark Crispin (author of the original IMAP specification)",
//    "url":"https://www.ietf.org/mail-archive/web/imap5/current/msg00571.html",
//    "id":4825893,
//    "commentCount":6,
//    "points":59,
//    "postedAgo":"1 hour ago",
//    "postedBy":"muriithi"
//}

#import <Foundation/Foundation.h>

@interface HNRStory : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *points;
@property(nonatomic, copy) NSString *postedAgo;
@property(nonatomic, copy) NSString *postedBy;
@property(nonatomic, copy) NSURL *uri;

- (id)initWithDictionary:(NSDictionary *)dictionary;

- (NSString *)formatSubtitle;

- (NSAttributedString *)formatTitleWithBaseUri;

@end

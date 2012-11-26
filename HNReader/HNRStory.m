//
//  HNRStory.m
//  HNReader
//
//  Created by Jurre Stender on 11/24/12.
//  Copyright (c) 2012 Jurre Stender. All rights reserved.
//

#import "HNRStory.h"

@implementation HNRStory

@synthesize title, points, postedAgo, postedBy, uri;

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.points = [dictionary objectForKey:@"points"];
        self.title = [dictionary objectForKey:@"title"];
        self.postedAgo = [dictionary objectForKey:@"postedAgo"];
        self.postedBy = [dictionary objectForKey:@"postedBy"];
        self.uri = [[NSURL alloc] initWithString:[dictionary objectForKey:@"url"]];
    }
    return self;
}

- (NSString *)formatSubtitle
{
    NSString *subtitle = [NSString stringWithFormat:@"%@ points by %@, %@", self.points, self.postedBy, self.postedAgo];
    return subtitle;
}

- (NSAttributedString *)formatTitleWithBaseUri
{
    NSString *titleWithBaseUri = [NSString stringWithFormat:@"%@ (%@)", self.title, self.uri.host];
    NSMutableAttributedString *formattedTitle = [[NSMutableAttributedString alloc] initWithString:titleWithBaseUri];
    [formattedTitle addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(title.length + 1, titleWithBaseUri.length - title.length - 1)];
    return formattedTitle;
}

@end

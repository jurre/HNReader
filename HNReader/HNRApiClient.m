//
//  HNRApiClient.m
//  HNReader
//
//  Created by Jurre Stender on 11/24/12.
//  Copyright (c) 2012 Jurre Stender. All rights reserved.
//

#import "HNRApiClient.h"
#import "AFNetworking.h"

#define HNRApiClientBaseURLString @"http://api.ihackernews.com/"
#define HNApiStubClientBaseURLString @"http://0.0.0.0:4567/"

@implementation HNRApiClient

// singleton
+ (id)sharedInstance
{
    static HNRApiClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[HNRApiClient alloc] initWithBaseURL:[NSURL URLWithString:HNApiStubClientBaseURLString]];
    });
    
    return __sharedInstance;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        // custom settings
        [self setDefaultHeader:@"Accept" value:@"application/json"];
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    }
    return self;
}

@end

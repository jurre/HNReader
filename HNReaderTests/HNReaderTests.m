//
//  HNReaderTests.m
//  HNReaderTests
//
//  Created by Jurre Stender on 11/24/12.
//  Copyright (c) 2012 Jurre Stender. All rights reserved.
//

#import "HNReaderTests.h"
#import "HNRStory.h"
#import <SenTestingKit/SenTestingKit.h>

@interface HNReaderTests : SenTestCase

@end

@implementation HNReaderTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testFormatString
{
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                @"Dotcom: \"We've hit the jackpot\"", @"title",
                                @"137", @"points",
                                @"17 hours ago", @"postedAgo",
                                @"weisser", @"postedBy",
                                nil];
    HNRStory *story = [[HNRStory alloc] initWithDictionary:dictionary];
    STFail([story formatSubtitle]);
}
@end

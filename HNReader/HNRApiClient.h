//
//  HNRApiClient.h
//  HNReader
//
//  Created by Jurre Stender on 11/24/12.
//  Copyright (c) 2012 Jurre Stender. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"

@interface HNRApiClient : AFHTTPClient

+ (id)sharedInstance;

@end

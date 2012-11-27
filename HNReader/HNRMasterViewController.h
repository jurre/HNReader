//
//  HNRMasterViewController.h
//  HNReader
//
//  Created by Jurre Stender on 11/24/12.
//  Copyright (c) 2012 Jurre Stender. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HNRMasterViewController : UITableViewController

@property(nonatomic, retain) NSMutableArray *stories;

- (float)cellContentWidth;
@end

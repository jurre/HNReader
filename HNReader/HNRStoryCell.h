//
//  HNRStoryCell.h
//  HNReader
//
//  Created by Jurre Stender on 11/24/12.
//  Copyright (c) 2012 Jurre Stender. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HNRStoryCell : UITableViewCell
{
    IBOutlet UILabel *titleTextLabel;
    IBOutlet UILabel *userLabel;
}
@property (nonatomic, retain) IBOutlet UILabel *titleTextLabel;
@property (nonatomic, retain) IBOutlet UILabel *userLabel;
@property (nonatomic, retain) NSURL *uri;

@end

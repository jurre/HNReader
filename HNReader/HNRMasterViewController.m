//
//  HNRMasterViewController.m
//  HNReader
//
//  Created by Jurre Stender on 11/24/12.
//  Copyright (c) 2012 Jurre Stender. All rights reserved.
//

#import "HNRMasterViewController.h"
#import "HNRDetailViewController.h"
#import "HNRStoryCell.h"
#import "AFNetworking.h"
#import "HNRApiClient.h"
#import "HNRStory.h"

#define BackgroundColor [UIColor colorWithRed:0.859 green:0.862 blue:0.833 alpha:1.000];
#define OrangeColor [UIColor colorWithRed:1.000 green:0.280 blue:0.000 alpha:1.000]

@implementation HNRMasterViewController

@synthesize stories = _stories;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    [refreshControl addTarget:self action:@selector(loadStories) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    
    [self.navigationController.navigationBar setTintColor:OrangeColor];
    
    self.tableView.backgroundColor = BackgroundColor;

    [self loadStories];
}

- (void)loadStories
{
    [[HNRApiClient sharedInstance] getPath:@"page" parameters:nil
                                   success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                       NSMutableArray *stories = [NSMutableArray array];
                                       for (id storyDictionary in [responseObject valueForKey:@"items"]) {
                                               HNRStory *story = [[HNRStory alloc] initWithDictionary:storyDictionary];
                                               [stories addObject:story];
                                       }
                                       self.stories = nil;
                                       self.stories = stories;
                                       [self.tableView reloadData];
                                       [self.refreshControl endRefreshing];
                                   }
                                   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                       NSLog(@"Error! %@", error);
                                       // TODO: show some sort of unobtrusive message to the user
                                       [self.refreshControl endRefreshing];
                                   }];
}

- (void)orientationChanged:(id)object
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.stories.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HNRStory *story = [self.stories objectAtIndex:indexPath.row];
    NSAttributedString *titleText = [story formatTitleWithBaseUri];
    
    NSString *subtitleText = [story formatSubtitle];
    UIFont *titleFont = [UIFont systemFontOfSize:15.0];
    CGSize constraint = CGSizeMake([self cellContentWidth], 20000.0f);
    
    CGSize storyLabelSize = [titleText.string sizeWithFont:titleFont constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    
    UIFont *subtitleFont = [UIFont systemFontOfSize:14.0];
    CGSize subtitleSize = [subtitleText sizeWithFont:subtitleFont constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    
    return (storyLabelSize.height + subtitleSize.height) + (10 * 2);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HNRStoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoryIdentifier" forIndexPath:indexPath];
    
    HNRStory *story = [self.stories objectAtIndex:indexPath.row];
    NSAttributedString *titleText = [story formatTitleWithBaseUri];
    CGSize constraint = CGSizeMake([self cellContentWidth], 20000.0f);
    
    UIFont *titleFont = [UIFont systemFontOfSize:15.0];
    CGSize titleSize = [titleText.string sizeWithFont:titleFont constrainedToSize:constraint];
    
    UIFont *subtitleFont = [UIFont systemFontOfSize:12.0];
    CGSize subTitleSize = [titleText.string sizeWithFont:subtitleFont constrainedToSize:constraint];
    
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.titleTextLabel.numberOfLines = 0;
    cell.titleTextLabel.frame = CGRectMake(5, 2, [self cellContentWidth], titleSize.height + 30);
    cell.titleTextLabel.font = titleFont;
    cell.titleTextLabel.attributedText = titleText;
    cell.titleTextLabel.backgroundColor = BackgroundColor;
    [cell.titleTextLabel sizeToFit];
    
    cell.userLabel.frame = CGRectMake(5, titleSize.height, subTitleSize.width, subTitleSize.height + 10);
    cell.userLabel.text = [story formatSubtitle];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        HNRStory *story = self.stories[indexPath.row];
        [[segue destinationViewController] setRequestURL:story.uri];
    }
}

- (float)cellContentWidth
{
    CGSize deviceSize = [UIScreen mainScreen].bounds.size;
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
        return deviceSize.height - 30;
    } else {
        return deviceSize.width - 30;
    }
}

@end

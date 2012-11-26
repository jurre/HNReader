//
//  HNRDetailViewController.m
//  HNReader
//
//  Created by Jurre Stender on 11/24/12.
//  Copyright (c) 2012 Jurre Stender. All rights reserved.
//

#import "HNRDetailViewController.h"

@implementation HNRDetailViewController

@synthesize webView = _webView;
@synthesize url = _url;

#pragma mark - Managing the detail item

- (void)setRequestURL:(NSURL *)url
{
        self.url = url;
        
        // Update the view.
        [self configureView];
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.url) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  HNRDetailViewController.h
//  HNReader
//
//  Created by Jurre Stender on 11/24/12.
//  Copyright (c) 2012 Jurre Stender. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HNRDetailViewController : UIViewController
{
    IBOutlet UIWebView *webView;
}

@property (strong, nonatomic) NSURL *url;
@property (strong, retain) UIWebView *webView;

- (void)configureView;
- (void)setRequestURL:(NSURL *)url;

@end

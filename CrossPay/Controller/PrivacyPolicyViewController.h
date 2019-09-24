//
//  PrivacyPolicyViewController.h
//  CrossPay
//
//  Created by sai kiran  on 5/21/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "ViewController.h"

@interface PrivacyPolicyViewController : ViewController
- (IBAction)crs_back:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *crs_privacyView;
@property (strong, nonatomic) IBOutlet UIScrollView *crs_ScrollView;
@property (strong, nonatomic) IBOutlet UIWebView *crs_webview1;

@end

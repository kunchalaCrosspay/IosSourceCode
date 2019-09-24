//
//  TermsandCondtionsViewController.h
//  CrossPay
//
//  Created by sai kiran  on 8/12/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TermsandCondtionsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *crs_webView;
- (IBAction)crs_WebBack:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *crs_PopupView;
- (IBAction)crs_ok:(id)sender;
- (IBAction)crs_Exit:(id)sender;


@end

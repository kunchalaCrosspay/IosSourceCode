//
//  ReferalTermsandCondtionsViewController.m
//  CrossPay
//
//  Created by sai kiran  on 11/5/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "ReferalTermsandCondtionsViewController.h"
#import "ReferalViewController.h"
@interface ReferalTermsandCondtionsViewController ()

@end

@implementation ReferalTermsandCondtionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *fullURL = @"https://www.crosspaymt.com/refer/t&c.html";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_crs_Webview loadRequest:requestObj];
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)crs_backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end

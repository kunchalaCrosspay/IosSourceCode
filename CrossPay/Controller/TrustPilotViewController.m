//
//  TrustPilotViewController.m
//  CrossPay
//
//  Created by sai kiran  on 7/5/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "TrustPilotViewController.h"
#import "MBProgressHUD.h"
@interface TrustPilotViewController ()<UIWebViewDelegate>

@end

@implementation TrustPilotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *fullURL = @"https://uk.trustpilot.com/review/crosspaymt.com?utm_medium=Trustbox&utm_source=EmailSignature1";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webview loadRequest:requestObj];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)webViewDidStartLoad:(UIWebView *)webView {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}


-(void)webViewDidFinishLoad:(UIWebView *)webView {
     [MBProgressHUD hideHUDForView:self.view animated:YES];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)crs_Back:(id)sender {
     [self.navigationController popViewControllerAnimated:YES];
}
@end

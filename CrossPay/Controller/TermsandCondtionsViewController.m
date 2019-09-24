//
//  TermsandCondtionsViewController.m
//  CrossPay
//
//  Created by sai kiran  on 8/12/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import "TermsandCondtionsViewController.h"
#import "crs_sharedmethods.h"
//#import <Google/Analytics.h>
@interface TermsandCondtionsViewController ()

@end

@implementation TermsandCondtionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
       self.crs_PopupView.hidden = YES;
    NSString *fullURL = @"https://ws.crosspaymt.com/Crosspayprod/cp_services/t&c.html";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_crs_webView loadRequest:requestObj];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)crs_WebBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
        
        

    
}


-(void)viewWillAppear:(BOOL)animated
{
    
    
//    
//    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
//    [tracker set:kGAIScreenName value:@"Terms and Conditions View controller"];
//    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
//    
}
- (IBAction)crs_ok:(id)sender {
        self.crs_PopupView.hidden = YES;
}

- (IBAction)crs_Exit:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end

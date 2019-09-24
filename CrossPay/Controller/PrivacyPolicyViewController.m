//
//  PrivacyPolicyViewController.m
//  CrossPay
//
//  Created by sai kiran  on 5/21/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "PrivacyPolicyViewController.h"

@interface PrivacyPolicyViewController ()<UIWebViewDelegate>

@end

@implementation PrivacyPolicyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // = CGSizeMake(self.view.frame.size.width-30, 1170);
    // Do any additional setup after loading the view.
    
    
    //self.crs_ScrollView.contentSize = CGSizeMake(self.view.frame.size.width-30, 13400);
    
    
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [_crs_webview1 loadHTMLString:htmlString baseURL: [[NSBundle mainBundle] bundleURL]];
    
    [super viewDidLoad];
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

- (IBAction)crs_back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end

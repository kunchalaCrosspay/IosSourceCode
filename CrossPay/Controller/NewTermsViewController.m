//
//  NewTermsViewController.m
//  CrossPay
//
//  Created by sai kiran  on 5/21/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "NewTermsViewController.h"

@interface NewTermsViewController ()

@end

@implementation NewTermsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"sample2" ofType:@"html"];
    NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    [_crs_webview2 loadHTMLString:htmlString baseURL: [[NSBundle mainBundle] bundleURL]];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)crs_back:(id)sender {
    
    
     [self.navigationController popViewControllerAnimated:YES];
    
}
@end

//
//  GiftAidViewController.m
//  CrossPay
//
//  Created by sai kiran  on 9/11/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "GiftAidViewController.h"
#import "CharityPayViewController.h"
@interface GiftAidViewController ()
{
    NSString * stringUrl;
    
    
}
@end

@implementation GiftAidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.crs_giftAidWeb.delegate = self;
    
    
    stringUrl = @"https://www.gov.uk/donating-to-charity/gift-aid";
    
    NSURL * url = [NSURL URLWithString:stringUrl];
    NSURLRequest * requestUrl = [NSURLRequest requestWithURL:url];
    [self.crs_giftAidWeb loadRequest:requestUrl];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)crs_Backaction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end

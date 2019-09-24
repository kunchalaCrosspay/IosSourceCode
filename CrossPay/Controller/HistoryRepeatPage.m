//
//  HistoryRepeatPage.m
//  CrossPay
//
//  Created by sai kiran  on 7/31/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import "HistoryRepeatPage.h"
#import "crs_sharedmethods.h"
@interface HistoryRepeatPage ()

@end

@implementation HistoryRepeatPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //   InterNet Connection Code For Checking net Connection
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

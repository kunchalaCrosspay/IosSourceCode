//
//  OriginalProfileViewController.m
//  CrossPay
//
//  Created by sai kiran  on 8/4/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import "Empty.h"
#import "crs_sharedmethods.h"

@interface OriginalProfileViewController ()

@end

@implementation OriginalProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //   InterNet Connection Code For Checking net Connection
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
    }
    
    
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

@end

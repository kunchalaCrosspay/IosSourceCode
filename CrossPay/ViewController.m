//
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import "ViewController.h"
#import "crs_sharedmethods.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //   InterNet Connection Code For Checking net Connection
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
    }
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

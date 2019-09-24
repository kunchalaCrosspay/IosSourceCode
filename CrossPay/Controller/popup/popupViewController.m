//
//  popupViewController.m
//  Payment
//
//  Created by SaiKiran Kunchala on 7/15/17.
//  Copyright © 2017 Sa. All rights reserved.
//

#import "popupViewController.h"
#import "LoginViewController.h"
#import "loginmpinViewController.h"
#import "Crs_sharedvariable.h"
#import "VerifyMobileScreen.h"
#import "InitialViewController.h"
#import "MBProgressHUD.h"
#import "crs_sharedmethods.h"
#import "GlobalUrlsFile.h"

@interface popupViewController ()

@end

@implementation popupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)RemoveAction:(id)sender {
    [self.view removeFromSuperview];
}



/// Logout //
- (IBAction)Logout_yes:(id)sender {
    
    
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"user_id"];
   // [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"mobile"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    VerifyMobileScreen * viewController = [storyboard instantiateViewControllerWithIdentifier:@"loginvcSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    
    
    
    
}

- (IBAction)Logout_No:(id)sender {
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    [self.view removeFromSuperview];
}
-(void)viewWillAppear:(BOOL)animated
{
    
//    
//    
//    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
//    [tracker set:kGAIScreenName value:@"Logout  View controller"];
//    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
//    
}
@end

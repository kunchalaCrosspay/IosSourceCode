//
//  NotVerifiedOTPViewController.m
//  CrossPay
//
//  Created by sai kiran  on 8/23/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "NotVerifiedOTPViewController.h"

#import "GlobalUrlsFile.h"
#import "HomeViewController.h"
#import "GlobalUrlsFile.h"
#import "crs_sharedmethods.h"
#import "Crs_sharedvariable.h"
#import "loginmpinViewController.h"
#import "MBProgressHUD.h"
@interface NotVerifiedOTPViewController ()

@end

@implementation NotVerifiedOTPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)crs_VerifyAction:(id)sender {
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSError * error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_ValidateOtp];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    //f ([self.crsVerifiaction isEqualToString:@"Register"]) {
        
        
        //[mapData setObject:self.mobileNumber forKey:@"mobile"];
        
//    //}
//    else{
//        if ([_crs_emailVerifiaction isEqualToString:@"email"]) {
//
//            [mapData setObject:_ForOtp forKey:@"email"];
//        }
//
//
//        else{
//
//            [mapData setObject:_ForOtp forKey:@"mobile"];
//
//        }
//
//
//    }
    
    
            if ([_crs_emailVerifiaction isEqualToString:@"email"]) {
    
                [mapData setObject:_ForOtp forKey:@"email"];
            }
    
    
            else{
    
                [mapData setObject:_ForOtp forKey:@"mobile"];
    
            }
    
    [mapData setObject:self.crs_OtpField.text forKey:@"otp"];
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"error %@",error);
            NSLog(@"data %@",data);
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json );
            
            NSLog(@"%@", [json valueForKey:@"message"]);
            if ([[json valueForKey:@"message"] isEqualToString:@"Success"]) {
                if ([self.Crs_EmailDisplayer isEqualToString:@"email"]) {
                    
                    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
                    [defaults setObject:[json valueForKey:@"user_id"] forKey:@"user_id"];
                    [defaults setObject:[json valueForKey:@"mobile"] forKey:@"mobile"];
                    [defaults setObject:[json valueForKey:@"email"] forKey:@"email"];
                    
                   // [defaults setObject:[json valueForKey:@"ref_code"] forKey:@"ref_code"];
                    
                    
                    
                    [defaults synchronize];
                    
                    
                    
                }
                else{
                    
                    
                    
                    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
                    [defaults setObject:[json valueForKey:@"user_id"] forKey:@"user_id"];
                    [defaults setObject:[json valueForKey:@"mobile"] forKey:@"mobile"];
                    [defaults setObject:[json valueForKey:@"email"] forKey:@"email"];
                    
                    //[defaults setObject:[json valueForKey:@"ref_code"] forKey:@"ref_code"];
                    
                    
                    
                    [defaults synchronize];
                    
                    
                }
                
                
                
                
                
                [Crs_sharedvariable sharedMySingleton].crs_userId = [json valueForKey:@"user_id"];
                
                 [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
                HomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewControllerSID"];;
                
                [self.navigationController pushViewController:viewController animated:YES];
                
            }
            else{
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                
            }
            
            
            
            
            
            
            
            
        });
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}
@end

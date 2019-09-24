//
//  VerifyMobileScreen.m
//  CrossPay
//
//  Created by sai kiran  on 7/31/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import "VerifyMobileScreen.h"
#import "crs_sharedmethods.h"
#import "Crs_sharedvariable.h"
#import "loginmpinViewController.h"
#import "registerViewController.h"
#import "InitialViewController.h"
#import "MBProgressHUD.h"
#import "GlobalUrlsFile.h"
#import "OtppopupViewController.h"
#import "HomeViewController.h"
#import "NewRegistrationViewController.h"
#import "Register1ViewController.h"
//#import <Google/Analytics.h>
@interface VerifyMobileScreen ()
{
    NSString * message;
    NSString * EmailVerfify;
    NSString * Otp;
    NSString * MyCoustmerNumber;
    NSString * VerifyMail;
    NSString * NotVerified;
}
@end

@implementation VerifyMobileScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //   InterNet Connection Code For Checking net Connection
    
    self.crs_VerifyOtpView.hidden = YES;
    
    
    self.crs_Home.hidden = YES;
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Clear" style:UIBarButtonItemStyleBordered target:self action:@selector(clearNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    _crs_VerifyMobileNumberField.inputAccessoryView = numberToolbar;
    _crs_OtpVerifyField.inputAccessoryView = numberToolbar;
    
    
    
    
    [self.crs_VerifyOutlet.layer setBorderWidth:3.0];
    [self.crs_VerifyOutlet.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    
    
    
    
    [self.crs_VerifyOtpOkHome.layer setBorderWidth:1.0];
    [self.crs_VerifyOtpOkHome.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    [self.crs_VerifyGreen.layer setBorderWidth:1.0];
    [self.crs_VerifyGreen.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    [self.Crs_OtpNewOut.layer setBorderWidth:1.0];
    [self.Crs_OtpNewOut.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    
    self.crs_VerifyMobileNumberField.textColor = [UIColor whiteColor];
    
    
    
    
    self.crs_OtpView.hidden = YES;
    
    
    self.crs_VerifyMobileNumberField.delegate = self ;
    
    
    
    //    [self.crs_VerifyMobileNumberField setValue:[UIColor whiteColor]
    //                       forKeyPath:@"_placeholderLabel.textColor"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)crs_VerifyMobilSction:(id)sender {
    
    NSUserDefaults * removeUD = [NSUserDefaults standardUserDefaults];
    [removeUD removeObjectForKey:@"mobile"];
     [removeUD removeObjectForKey:@"email"];
    [[NSUserDefaults standardUserDefaults]synchronize ];
    
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    if ([self.crs_VerifyMobileNumberField.text isEqualToString:@""])  {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Enter your registered Email Address or Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    // else if (self.crs_VerifyMobileNumberField.text.length <9)
    
    
    //{
    
    // UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    //[alert show];
    
    
    
    
    
    // }
    
    
    
    else{
        
        BOOL mobile=[self validateEmail:self.crs_VerifyMobileNumberField.text];
        //[[crs_sharedmethods sharedMySingleton ]GetLoadingview ];
        
        if (mobile) {
            NSLog(@"venkatesh");
            EmailVerfify = @"email";
            
        }
        else
        {
            EmailVerfify = @"mobile";
            
            NSLog(@"sai");
        }
        
        
        
        
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_login];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
        
        
        
        if ([EmailVerfify isEqualToString:@"email"]) {
            [mapData setObject:self.crs_VerifyMobileNumberField.text forKey:@"email"];
        }
        else
        {
            
            [mapData setObject:self.crs_VerifyMobileNumberField.text forKey:@"mobile"];
            
            
        }
        
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [[crs_sharedmethods sharedMySingleton].Ary_view_LoadingBg removeFromSuperview];
                
                NSLog(@"error %@",error);
                NSLog(@"data %@",data);
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@", json );
                
                NSLog(@"%@", [json valueForKey:@"message"]);
                
                
                
                if ([[json valueForKey :@"status" ]isEqualToString:@"200"]) {
                    
                    Otp = [json valueForKey:@"OTP"];
//                    if ([Otp isEqualToString:@"0"]) {
                    
                        NSString * ConverterToLowerCase = [[json valueForKey:@"email"] lowercaseString];




                        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
                        [defaults setObject:[json valueForKey:@"user_id"] forKey:@"user_id"];

                        [defaults setObject:[json valueForKey:@"mobile"] forKey:@"mobile"];

                        [defaults setObject:ConverterToLowerCase forKey:@"email"];


                        [defaults synchronize];
                        
                        
                        [Crs_sharedvariable sharedMySingleton].crs_ForgotEmailDisplayer = [json valueForKey:@"email"];

                        [Crs_sharedvariable sharedMySingleton].crs_ChangeMpinEmail = [json valueForKey:@"mobile"];
                        
                        [Crs_sharedvariable sharedMySingleton].crs_MobileNumber = self.crs_VerifyMobileNumberField.text;
                        
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                        
                        loginmpinViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginmpinViewControllerSID"];;
                        
                        if ([EmailVerfify isEqualToString:@"email"]) {
                            viewController.Crs_EmailDisplayer = @"email";
                            NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
                            [defaults setObject:@"email" forKey:@"emailComparsion"];
                            [defaults synchronize];
                        }
                        else
                        {
                            
                            viewController.Crs_EmailDisplayer = @"mobile";
                            NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
                            [defaults setObject:@"mobile" forKey:@"emailComparsion"];
                            [defaults synchronize];
                        }
                        
                        [self.navigationController pushViewController:viewController animated:YES];
                    
                    
                }
                else if ([[json valueForKey:@"status"]isEqualToString:@"405"])
                {
                    
                    
                    self.crs_VerifyOtpView.hidden = NO;
                    
                }
                
                
                else if ([[json valueForKey:@"status"]isEqualToString:@"406"])
                {
                    
                    
                    if ([[json valueForKey:@"message"]isEqualToString:@"Not a Verified User."]) {
                        
                        
                        
                        self.crs_EnterOtpField.text = [json valueForKey:@"OTP"];
                        //self.crs_OtpView.hidden = NO;
                        
                        
                        
                    }
                    else{
                        
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        
                        
                        
                    }
                    
                    
                    
                }
                
                //            if ([self.crs_VerifyMobileNumberField.text isEqualToString:@""])  {
                //
                //
                //
                //                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"First Name should Not be empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                //
                //                [alert show];
                //
                
                else{
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                    
                }
                
                
                
                
                
                
            });
            
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
    }
    
}
//- (IBAction)crs_VerifyActio:(id)sender {
//
//
//
//
//
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//
//    NSError * error;
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
//    NSURL *url = [NSURL URLWithString:Crosspay_ValidateOtp];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
//                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                                       timeoutInterval:60.0];
//
//    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
//
//    [request setHTTPMethod:@"POST"];
//    NSMutableDictionary * mapData=[NSMutableDictionary new];
//
//
//
//
//
//    [mapData setObject:self.crs_EnterOtpField.text forKey:@"otp"];
//
//
//
//    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
//    [request setHTTPBody:postData];
//
//
//    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [MBProgressHUD hideHUDForView:self.view animated:YES];
//            NSLog(@"error %@",error);
//            NSLog(@"data %@",data);
//            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//            NSLog(@"%@", json );
//
//            NSLog(@"%@", [json valueForKey:@"message"]);
//            if ([[json valueForKey :@"message" ]isEqualToString:@"Success"]) {
//
//
//                [Crs_sharedvariable sharedMySingleton].crs_MobileNumber = self.crs_VerifyMobileNumberField.text;
//
//                [Crs_sharedvariable sharedMySingleton].crs_ChangeMpinEmail = [json valueForKey:@"mobile"];
//
//                 [Crs_sharedvariable sharedMySingleton].crs_userId = [json valueForKey:@"user_id"];
//                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//
//                loginmpinViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginmpinViewControllerSID"];;
//
//                [self.navigationController pushViewController:viewController animated:YES];
//            }
//
//
//
//            else {
//                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"InValid OTP" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//                [alert show];
//
//
//
//
//
//
//
//
//            }
//
//
//
//
//
//
//
//
//
//        });
//
//
//    }];
//
//    [postDataTask resume];
//
//
//
//
//}

- (IBAction)crs_ResendOtpAvtion:(id)sender {
}

- (IBAction)crsNewUserAcount:(id)sender {
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    registerViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"RegisterViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}

- (IBAction)crs_BackButton:(id)sender {
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
    }
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}






- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField==self.crs_VerifyMobileNumberField)
    {
        if (self.self.crs_VerifyMobileNumberField.text.length >=1000 && range.length == 0)        {
            return NO; // return NO to not change text
        }        else
        {
            
            //
            //            NSString *validRegEx =@"^[0-9,A-Z,a-z.]*$"; //change this regular expression as your requirement
            //            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            //            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            //            if (myStringMatchesRegEx)
            //                return YES;
            //            else
            //                return NO;
            //
            return YES;
            
            
            
            
            
            
        }
        
        
        
    }
    
    
    
    
    
    else{
        
        
        
        
        
        
        {return YES;}
        
    }
    
}
//-(void)webcalling:(NSString*) str
//{
//    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//        return ;
//    }
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//
//    NSError * error;
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
//    NSURL *url = [NSURL URLWithString:Crosspay_ValidateOtp];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
//                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                                       timeoutInterval:60.0];
//
//    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
//
//    [request setHTTPMethod:@"POST"];
//    NSMutableDictionary * mapData=[NSMutableDictionary new];
//
//
//
//
//    if ([EmailVerfify isEqualToString:@"email"]) {
//        [mapData setObject:self.crs_VerifyMobileNumberField.text forKey:@"email"];
//    }
//    else
//    {
//
//        [mapData setObject:self.crs_VerifyMobileNumberField.text forKey:@"mobile"];
//
//
//    }
//
//    [mapData setObject:str forKey:@"otp"];
//
//
//
//    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
//    [request setHTTPBody:postData];
//
//
//    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [MBProgressHUD hideHUDForView:self.view animated:YES];
//            NSLog(@"error %@",error);
//            NSLog(@"data %@",data);
//            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//            NSLog(@"%@", json );
//
//            NSLog(@"%@", [json valueForKey:@"message"]);
//            if ([[json valueForKey :@"message" ]isEqualToString:@"Success"]) {
//
//
//                NSString * ConverterToLowerCase = [[json valueForKey:@"email"] lowercaseString];
//
//
//
//
//                NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
//                [defaults setObject:[json valueForKey:@"user_id"] forKey:@"user_id"];
//
//                [defaults setObject:[json valueForKey:@"mobile"] forKey:@"mobile"];
//
//                [defaults setObject:ConverterToLowerCase forKey:@"email"];
//
//
//                [defaults synchronize];
//
//
//                [Crs_sharedvariable sharedMySingleton].crs_ForgotEmailDisplayer = [json valueForKey:@"email"];
//
//                [Crs_sharedvariable sharedMySingleton].crs_ChangeMpinEmail = [json valueForKey:@"mobile"];
//
//                [Crs_sharedvariable sharedMySingleton].crs_MobileNumber = self.crs_VerifyMobileNumberField.text;
//
//                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//
//                loginmpinViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginmpinViewControllerSID"];;
//
//
//                if ([EmailVerfify isEqualToString:@"email"]) {
//                    viewController.Crs_EmailDisplayer = @"email";
//                    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
//                    [defaults setObject:@"email" forKey:@"emailComparsion"];
//                    [defaults synchronize];
//                }
//                else
//                {
//
//                    viewController.Crs_EmailDisplayer = @"mobile";
//                    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
//                    [defaults setObject:@"mobile" forKey:@"emailComparsion"];
//                    [defaults synchronize];
//                }
//
//                [self.navigationController pushViewController:viewController animated:YES];
//            }
//
//
//
//            else {
//                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"InValid OTP" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//                [alert show];
//
//
//
//
//
//
//
//
//            }
//
//
//
//
//
//
//
//
//
//        });
//
//
//    }];
//
//    [postDataTask resume];
//
//
//
//
//}
//-(void)OtpCalling
//{
//    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//        return ;
//    }
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//
//    NSError * error;
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
//    NSURL *url = [NSURL URLWithString:Crosspay_ValidateOtp];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
//                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                                       timeoutInterval:60.0];
//
//    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
//
//    [request setHTTPMethod:@"POST"];
//    NSMutableDictionary * mapData=[NSMutableDictionary new];
//
//
//
//
//    if ([EmailVerfify isEqualToString:@"email"]) {
//        [mapData setObject:self.crs_VerifyMobileNumberField.text forKey:@"email"];
//    }
//    else
//    {
//
//        [mapData setObject:self.crs_VerifyMobileNumberField.text forKey:@"mobile"];
//
//
//    }
//
//    [mapData setObject:self.crs_OtpVerifyField.text forKey:@"otp"];
//
//
//
//    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
//    [request setHTTPBody:postData];
//
//
//    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [MBProgressHUD hideHUDForView:self.view animated:YES];
//            NSLog(@"error %@",error);
//            NSLog(@"data %@",data);
//            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//            NSLog(@"%@", json );
//
//            NSLog(@"%@", [json valueForKey:@"message"]);
//            if ([[json valueForKey :@"message" ]isEqualToString:@"Success"]) {
//
//
//                NSString * ConverterToLowerCase = [[json valueForKey:@"email"] lowercaseString];
//
//
//
//
//                NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
//                [defaults setObject:[json valueForKey:@"user_id"] forKey:@"user_id"];
//
//                [defaults setObject:[json valueForKey:@"mobile"] forKey:@"mobile"];
//
//                [defaults setObject:ConverterToLowerCase forKey:@"email"];
//
//
//                [defaults synchronize];
//
//
//                [Crs_sharedvariable sharedMySingleton].crs_ForgotEmailDisplayer = [json valueForKey:@"email"];
//
//                [Crs_sharedvariable sharedMySingleton].crs_ChangeMpinEmail = [json valueForKey:@"mobile"];
//
//                [Crs_sharedvariable sharedMySingleton].crs_MobileNumber = self.crs_VerifyMobileNumberField.text;
//
//                self.crs_Home.hidden = NO;
//
//                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//
//                HomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewControllerSID"];;
//
//
//                if ([EmailVerfify isEqualToString:@"email"]) {
//                    viewController.Crs_EmailDisplayer = @"email";
//                    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
//                    [defaults setObject:@"email" forKey:@"emailComparsion"];
//                    [defaults synchronize];
//                }
//                else
//                {
//
//                     viewController.Crs_EmailDisplayer = @"mobile";
//                    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
//                    [defaults setObject:@"mobile" forKey:@"emailComparsion"];
//                    [defaults synchronize];
//                }
//
//                [self.navigationController pushViewController:viewController animated:YES];
//            }
//
//
//
//            else {
//                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"InValid OTP" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//                [alert show];
//
//
//
//
//
//
//
//
//            }
//
//
//
//
//
//
//
//
//
//        });
//
//
//    }];
//
//    [postDataTask resume];
//
//
//
//
//}

-(BOOL) validateEmail:(NSString*) emailString
{
    NSString *regExPattern = @"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$";
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:emailString options:0 range:NSMakeRange(0, [emailString length])];
    NSLog(@"%lu", (unsigned long)regExMatches);
    if (regExMatches == 0) {
        return NO;
    }
    else
        return YES;
}


-(void)clearNumberPad{
    [_crs_VerifyMobileNumberField resignFirstResponder];
    
    
    _crs_VerifyMobileNumberField.text = @"";
    
    
     [_crs_OtpVerifyField resignFirstResponder];
    
    
    
    
    
}

-(void)doneWithNumberPad{
    //NSString *numberFromTheKeyboard = self.crs_SelectBranch.text;
    [_crs_VerifyMobileNumberField resignFirstResponder];
    [_crs_OtpVerifyField resignFirstResponder];
}

-(void)viewWillAppear:(BOOL)animated
{
    
    
    //
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"Verify Mobile Screen View controller"];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
}

- (IBAction)Crs_VerifyOTPButton:(id)sender {
    
    
//    if ([self.crs_OtpVerifyField.text isEqualToString:@""])  {
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"OTP Can Not Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//    else {
//
//
//
//
//
//        [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
//
//        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
//
//            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//            [alert show];
//
//            return ;
//
//
//
//
//
//
//
//
//
//        }
//        {
//
//
    
    
    
}
-(void)OtpCalling{
    
   
    
    
}
- (IBAction)crs_OkHomeAction:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
   Register1ViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"Register1SID"];;
    viewController.verfiyMobileScreenCoustmerNumber = MyCoustmerNumber;
    [self.navigationController pushViewController:viewController animated:YES];
    
}
- (IBAction)crs_OtpAction:(id)sender {
    
    
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
    
    
    
    
    if ([EmailVerfify isEqualToString:@"email"]) {
        [mapData setObject:self.crs_VerifyMobileNumberField.text forKey:@"email"];
    }
    else
    {
        
        [mapData setObject:self.crs_VerifyMobileNumberField.text forKey:@"mobile"];
        
        
    }
    
    [mapData setObject:self.crs_OtpVerifyField.text forKey:@"otp"];
    
    
    
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
           
            
            
            if ([[json valueForKey :@"status" ]isEqualToString:@"200"]) {
                
                Otp = [json valueForKey:@"OTP"];
                //                    if ([Otp isEqualToString:@"0"]) {
                
                 NotVerified = self.crs_VerifyMobileNumberField.text;
                NSString * ConverterToLowerCase = [[json valueForKey:@"email"] lowercaseString];
                
                
                
                
                NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
                [defaults setObject:[json valueForKey:@"user_id"] forKey:@"user_id"];
                
                [defaults setObject:[json valueForKey:@"mobile"] forKey:@"mobile"];
                
                [defaults setObject:ConverterToLowerCase forKey:@"email"];
                
                
                [defaults synchronize];
                
                
                [Crs_sharedvariable sharedMySingleton].crs_ForgotEmailDisplayer = [json valueForKey:@"email"];
                
                [Crs_sharedvariable sharedMySingleton].crs_ChangeMpinEmail = [json valueForKey:@"mobile"];
                
                [Crs_sharedvariable sharedMySingleton].crs_MobileNumber = self.crs_VerifyMobileNumberField.text;
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
                loginmpinViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginmpinViewControllerSID"];;
                
                if ([EmailVerfify isEqualToString:@"email"]) {
                    viewController.Crs_EmailDisplayer = @"email";
                    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
                    [defaults setObject:@"email" forKey:@"emailComparsion"];
                    [defaults synchronize];
                }
                else
                {
                    
                    viewController.Crs_EmailDisplayer = @"mobile";
                    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
                    [defaults setObject:@"mobile" forKey:@"emailComparsion"];
                    [defaults synchronize];
                }
                
                [self.navigationController pushViewController:viewController animated:YES];
                
                
            }
            

            
            else {
                
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
            
            }
            
            
            
            
            
        });
        
        
    }];
    
    [postDataTask resume];
    
}




@end

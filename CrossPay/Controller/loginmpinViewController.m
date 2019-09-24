//
//  loginmpinViewController.m
//  Payment
//
//  Created by saikiran kunchala on 7/29/17.
//  Copyright © 2017 WELCOME. All rights reserved.
//

#import "loginmpinViewController.h"
#import "forgot_mpinViewController.h"
#import "registerViewController.h"
#import "HomeViewController.h"
#import "crs_sharedmethods.h"
#import "Crs_sharedvariable.h"
#import "InitialViewController.h"
#import "MBProgressHUD.h"
#import "VerifyMobileScreen.h"
#import "GlobalUrlsFile.h"
#import "SettingsViewController.h"
#import "Register1ViewController.h"
#import "NewHomeViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>//®

//#import <Google/Analytics.h>
@interface loginmpinViewController ()
{
    NSString * success;
    NSString * MpinUserId;
     NSString * MpincoustmerNumber;
}

@end

@implementation loginmpinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //   InterNet Connection Code For Checking net Connection
    [self GetVersion];
    
    self.crs_versionView.hidden = YES;
    NSLog(@" Sai %@",Crosspay_login);
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackOpaque;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Clear All" style:UIBarButtonItemStyleBordered target:self action:@selector(clearNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    _pin1.inputAccessoryView = numberToolbar;
    _pin2.inputAccessoryView = numberToolbar;
    _pin3.inputAccessoryView = numberToolbar;
    _pin4.inputAccessoryView = numberToolbar;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    [self.crs_MpinOut.layer setBorderWidth:1.0];
    [self.crs_MpinOut.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    
    
    
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
    };
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    self.Crs_EmailDisplayer  =    [defaults objectForKey:@"emailComparsion"];
    if ([_Crs_EmailDisplayer isEqualToString:@"email"]){
        
        
        
        
        NSString * string = [defaults objectForKey:@"email"];
        [Crs_sharedvariable sharedMySingleton].crs_MobileNumber = [defaults objectForKey:@"email"];
        
        //  NSString *trimmedString=[string substringFromIndex:MAX((int)[string length]-10, 0)];
        
        
        
        NSString *newStr = [string substringWithRange:NSMakeRange(4, [string length]-4)];
        
        self.crs_EnterMpinMobile.text
        = [NSString stringWithFormat:@"xxxx%@",newStr];
        
        
    }
    else{
        
        
        
        
        
        NSString * string = [Crs_sharedvariable sharedMySingleton].crs_MobileNumber;
        
        NSString *trimmedString=[string substringFromIndex:MAX((int)[string length]-5, 0)];
        
        
        self.crs_EnterMpinMobile.text
        = [NSString stringWithFormat:@"XXXXX%@",trimmedString];
        
        
    }
    
    
    
    
    
    
    
    
    
    [self.pin1 setValue:[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0]
             forKeyPath:@"_placeholderLabel.textColor"];
    
    
    [self.pin2 setValue:[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0]
             forKeyPath:@"_placeholderLabel.textColor"];
    
    
    [self.pin3 setValue:[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0]
             forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.pin4 setValue:[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0]
             forKeyPath:@"_placeholderLabel.textColor"];
    
    
    
    
    
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


-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    if (textField == _pin1)
    {
        [_pin2 becomeFirstResponder];
    }
    else if (textField == _pin2)
    {
        [_pin3 becomeFirstResponder];
    }
    else if (textField == _pin3)
    {
        [_pin4 becomeFirstResponder];
    }
    
    return NO;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // This allows numeric text only, but also backspace for deletes
    if (string.length > 0 && ![[NSScanner scannerWithString:string] scanInt:NULL])
        return NO;
    
    NSUInteger oldLength = [textField.text length];
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    
    // This 'tabs' to next field when entering digits
    if (newLength == 1) {
        if (textField == _pin1)
        {
            [self performSelector:@selector(setNextResponder:) withObject:_pin2 afterDelay:0.2];
        }
        else if (textField == _pin2)
        {
            [self performSelector:@selector(setNextResponder:) withObject:_pin3 afterDelay:0.2];
        }
        else if (textField == _pin3)
        {
            [self performSelector:@selector(setNextResponder:) withObject:_pin4 afterDelay:0.2];
        }
    }
    //this goes to previous field as you backspace through them, so you don't have to tap into them individually
    else if (oldLength > 0 && newLength == 0) {
        if (textField == _pin4)
        {
            [self performSelector:@selector(setNextResponder:) withObject:_pin3 afterDelay:0.1];
        }
        else if (textField == _pin3)
        {
            [self performSelector:@selector(setNextResponder:) withObject:_pin2 afterDelay:0.1];
        }
        else if (textField == _pin2)
        {
            [self performSelector:@selector(setNextResponder:) withObject:_pin1 afterDelay:0.1];
        }
    }
    
    return newLength <= 1;
}

- (void)setNextResponder:(UITextField *)nextResponder
{
    [nextResponder becomeFirstResponder];
}





-(void)post_webservice
{
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    
    [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
    
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSError * error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSString * GlobalLogin = [NSString stringWithFormat:@"%@",Crosspay_login];
    NSLog(@" DIMBU %@",GlobalLogin);
    NSURL *url = [NSURL URLWithString:GlobalLogin];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    NSString * pin=[NSString stringWithFormat:@"%@%@%@%@",self.pin1.text,self.pin2.text,self.pin3.text,self.pin4.text];
    
    
    
    
    
    
    //    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_MobileNumber forKey:@"mobile"];
    if ([_Crs_EmailDisplayer isEqualToString:@"email"]) {
        [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_MobileNumber forKey:@"email"];
        
    }
    
    else{
        
        [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_MobileNumber forKey:@"mobile"];
        
        
        
    }
    
    [mapData setObject:pin forKey:@"password"];
    
    
    
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
            if ([[json valueForKey:@"status"] isEqualToString:@"406"]) {
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            [alert show];
                return ;
            }
            MpinUserId = [json valueForKey:@"user_id"];
            MpincoustmerNumber = [json valueForKey:@"customerno"];
            self.Crs_FirstName =  [json valueForKey:@"first_name"];
            if ([self.Crs_FirstName isEqualToString:@""]) {
                
                
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Crosspay" message:@"To,continue please update your details" preferredStyle:UIAlertControllerStyleAlert];
                
                // create the actions handled by each button
                UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                 
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    Register1ViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"Register1SID"];;
                    viewController.MyCoustmerId =  MpinUserId;
                    viewController.MyCoustmerNumber = MpincoustmerNumber;
                    [self.navigationController pushViewController:viewController animated:YES];
                    NSLog(@"User said DEFO!");
                }];
                
                UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Never!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    NSLog(@"User said NEVER!");
                }];
                
                // add actions to our alert
                [alert addAction:action1];
                //[alert addAction:action2];
                
                // display the alert controller
                [self presentViewController:alert animated:YES completion:nil];
                
            }
            
//            else if (![self.Crs_FirstName isEqualToString:@""]){
//
//
//                [Crs_sharedvariable sharedMySingleton].crs_userId = [json valueForKey:@"user_id"];
//                [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId = [json valueForKey:@"user_id"];
//                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//
//                NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
//
//                [self.navigationController pushViewController:viewController animated:YES];
//
//
//            }
            
            
            else {
                success=[json valueForKey:@"message"];
                if ([success isEqualToString:@"Success"]) {
                    if ([self.Crs_EmailDisplayer isEqualToString:@"email"]) {
                        
                        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
                        [defaults setObject:[json valueForKey:@"user_id"] forKey:@"user_id"];
                        [defaults setObject:[json valueForKey:@"mobile"] forKey:@"mobile"];
                        [defaults setObject:[json valueForKey:@"email"] forKey:@"email"];
                        
                        [defaults setObject:[json valueForKey:@"ref_code"] forKey:@"ref_code"];
                        
                        
                        
                        [defaults synchronize];
                        
                        
                        
                    }
                    else{
                        
                        
                        NSLog(@"%@", [json valueForKey:@"message"]);
                        
                        
                        
                        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
                        [defaults setObject:[json valueForKey:@"user_id"] forKey:@"user_id"];
                        [defaults setObject:[json valueForKey:@"mobile"] forKey:@"mobile"];
                        [defaults setObject:[json valueForKey:@"email"] forKey:@"email"];
                        
                        [defaults setObject:[json valueForKey:@"ref_code"] forKey:@"ref_code"];
                        
                        
                        
                        [defaults synchronize];
                        
                        
                    }
                    
                    
                    
                    
                    
                    [Crs_sharedvariable sharedMySingleton].crs_userId = [json valueForKey:@"user_id"];
                    [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId = [json valueForKey:@"user_id"];
                    
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
                    
                    [self.navigationController pushViewController:viewController animated:YES];
                    
                }
                
            }
            NSLog(@"%@", [json valueForKey:@"message"]);
            
            
            
//
//            if ([success isEqualToString:@"Success"]) {
//                if ([self.Crs_EmailDisplayer isEqualToString:@"email"]) {
//
//                    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
//                    [defaults setObject:[json valueForKey:@"user_id"] forKey:@"user_id"];
//                    [defaults setObject:[json valueForKey:@"mobile"] forKey:@"mobile"];
//                    [defaults setObject:[json valueForKey:@"email"] forKey:@"email"];
//
//                    [defaults setObject:[json valueForKey:@"ref_code"] forKey:@"ref_code"];
//
//
//
//                    [defaults synchronize];
//
//
//
//                }
//                else{
//
//
//
//                    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
//                    [defaults setObject:[json valueForKey:@"user_id"] forKey:@"user_id"];
//                    [defaults setObject:[json valueForKey:@"mobile"] forKey:@"mobile"];
//                    [defaults setObject:[json valueForKey:@"email"] forKey:@"email"];
//
//                    [defaults setObject:[json valueForKey:@"ref_code"] forKey:@"ref_code"];
//
//
//
//                    [defaults synchronize];
//
//
//                }
//
//
//
//
//
//                [Crs_sharedvariable sharedMySingleton].crs_userId = [json valueForKey:@"user_id"];
//                [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId = [json valueForKey:@"user_id"];
//
//                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//
//                HomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewControllerSID"];;
//
//                [self.navigationController pushViewController:viewController animated:YES];
//
//            }
           
//            else{
//                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                [alert show];
//
//            }
            
            
            
        });
        
        
    }];
    
    [postDataTask resume];
    
    
}



- (IBAction)Forgot_mpin:(id)sender {
    
    
    
    
    
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    
    
    
    forgot_mpinViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"forgot_mpinViewControllerSID"];
    
    
    
    [self addChildViewController:MenuViewControllerOBJ];
    
    [MenuViewControllerOBJ didMoveToParentViewController:self];
    if ([_Crs_EmailDisplayer isEqualToString:@"email"])
        
    {
        MenuViewControllerOBJ. EmailAndMobileDisplayer = @"email";
        
        
        
    }
    
    
    else{
        MenuViewControllerOBJ. EmailAndMobileDisplayer = @"mobile";
        
        
        
    }
    MenuViewControllerOBJ.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
    [self.view addSubview:MenuViewControllerOBJ.view];
    
}

- (IBAction)Login_Action:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    if ([_pin1.text isEqualToString:@""]||[_pin2.text isEqualToString:@""]||[_pin3.text isEqualToString:@""]||[_pin4.text isEqualToString:@""]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"MPIN should not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    else{
        
        [self post_webservice];
    }
    
    
    
}

- (IBAction)New_user_account:(id)sender {
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    VerifyMobileScreen * viewController = [storyboard instantiateViewControllerWithIdentifier:@"VerifyMobileScreenViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}

- (IBAction)crs_backAction:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    if ([self.Crs_verifyBack isEqualToString:@"forgotBack"]) {
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        VerifyMobileScreen * viewController = [storyboard instantiateViewControllerWithIdentifier:@"VerifyMobileScreenViewControllerSID"];;
        
        [self.navigationController pushViewController:viewController animated:YES];
        
        
    }
    else if ([self.Crs_verifyBack isEqualToString:@"Register"])
        
    {
        
        
        
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}
//
//-(BOOL)textFieldShouldReturn:(UITextField*)textField;
//{
//    [[self view] endEditing:YES];
//    return YES;
//}


- (IBAction)crs_ChangeUser:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
   
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"user_id"];
    // [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"mobile"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    VerifyMobileScreen * viewController = [storyboard instantiateViewControllerWithIdentifier:@"VerifyMobileScreenViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}













-(void)clearNumberPad{
    [_pin1 resignFirstResponder];
    [_pin2 resignFirstResponder];
    [_pin3 resignFirstResponder];
    [_pin4 resignFirstResponder];
    
    self.pin1.text = @"";
    self.pin2.text = @"";
    self.pin3.text = @"";
    self.pin4.text = @"";
    
    
}

-(void)doneWithNumberPad{
    //NSString *numberFromTheKeyboard = self.crs_SelectBranch.text;
    [_pin1 resignFirstResponder];
    [_pin2 resignFirstResponder];
    [_pin3 resignFirstResponder];
    [_pin4 resignFirstResponder];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    
    //
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"MPIN  View controller"];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
}




-(void)GetVersion
{
    
    
    //[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:Crosspay_GetVersion] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            //[MBProgressHUD hideHUDForView:self.view animated:YES];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
            
            if ([version isEqualToString:[json valueForKey:@"currentVersion"]]) {
                
                
            }
            else{
                
                
                self.crs_versionView.hidden = NO;
                
            }
            
        });
        
    }];
    
    [dataTask resume];
    
    
    
    
    
    
    
    
    
}







- (IBAction)crs_Update:(id)sender {
    NSString *iTunesLink = @"https://itunes.apple.com/in/app/crosspay/id1312224710?mt=8";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
    
    
}
- (IBAction)Crs_FingerPrintLogin:(id)sender {
    LAContext *context = [[LAContext alloc] init];
    
    NSError *error = nil;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:@"Are you the device owner?"
                          reply:^(BOOL success, NSError *error) {
                              dispatch_async(dispatch_get_main_queue(), ^{
                                  if (error) {
                                      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                      message:@"There was a problem verifying your identity."
                                                                                     delegate:nil
                                                                            cancelButtonTitle:@"Ok"
                                                                            otherButtonTitles:nil];
                                      [alert show];
                                      return;
                                  }
                                  
                                  if (success) {
                                      
                                      
                                      
                                      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                      message:@"Use touch Id for login"
                                                                                     delegate:nil
                                                                            cancelButtonTitle:@"Ok"
                                                                            otherButtonTitles:nil];
                                      [alert show];
                                      
                                      
                                      
                                  } else {
                                      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                      message:@"You are not the device owner."
                                                                                     delegate:nil
                                                                            cancelButtonTitle:@"Ok"
                                                                            otherButtonTitles:nil];
                                      [alert show];
                                  }
                              });
                          }];
        
    } else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Your device cannot authenticate using TouchID."
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
}
@end

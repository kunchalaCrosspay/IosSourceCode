#import "OtppopupViewController.h"
#import "HomeViewController.h"
#import "crs_sharedmethods.h"
#import "Crs_sharedvariable.h"
#import "loginmpinViewController.h"
#import "MBProgressHUD.h"
#import "VerifyMobileScreen.h"
#import "GlobalUrlsFile.h"
#import "NewRegistrationViewController.h"
#import "Register1ViewController.h"
@interface OtppopupViewController ()
{
    
    
    NSString * RegisterCountryForuk;
}
@end

@implementation OtppopupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    RegisterCountryForuk = self.RegisterCountry;
    
    
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Clear" style:UIBarButtonItemStyleBordered target:self action:@selector(clearNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
   self.Crs_otpvalue.inputAccessoryView = numberToolbar;
  
    
    
    
    
    
    
    
    
    self.crs_verifiactionvew.hidden = YES;
    
    [self.crs_VerifyOut.layer setBorderWidth:3.0];
   [self.crs_VerifyOut.layer setBorderColor:[[UIColor clearColor] CGColor]];

//    [self.crs_VerifyOut.layer setBorderColor:[[UIColor colorWithRed:0.0f/255.0f green:0.0f/0.0f blue:0.0f/0.0f alpha:1.0] CGColor]];
    self.crs_HomeView.hidden = YES;
    
    if ([self.crsVerifiaction isEqualToString:@"Register"]) {
        [self webcallimg];
        self.crs_otpView.hidden = NO;
    }
    else{
        
        self.crs_otpView.hidden = NO;
        
    }
    
    
    
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        
        [alert show];
        
        return ;
    }
    NSLog(@"%@",self.mobileNumber);
    NSLog(@" vekatesh%@",self.otpvalue);
    
    //elf.Crs_otpvalue.text=self.otpvalue;
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)Crs_verify_otp:(id)sender {
    
    
    
    if ([self.Crs_otpvalue.text isEqualToString:@""]) {
     
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"InValid OTP" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
    else{
    
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
    
    if ([self.crsVerifiaction isEqualToString:@"Register"]) {
        
        
        [mapData setObject:_ForOtp forKey:@"mobile"];
        
    }
    else{
        if ([_crs_emailVerifiaction isEqualToString:@"email"]) {
            
            [mapData setObject:_ForOtp forKey:@"email"];
            
            
        }
        
        
        else{
            
            [mapData setObject:_ForOtp forKey:@"mobile"];
             
        }
        
        
        
        
        
        
    }
        
        
        
        
        
    
    
    [mapData setObject:self.Crs_otpvalue.text forKey:@"otp"];
    
    
    
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
            if ([[json valueForKey :@"message" ]isEqualToString:@"Success"]) {
                
                
                [Crs_sharedvariable sharedMySingleton].crs_MobileNumber = _ForOtp;
                [Crs_sharedvariable sharedMySingleton].crs_userId = [json valueForKey:@"user_id"];
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId = [json valueForKey:@"user_id"];
                
               
                if ([self.crsVerifiaction isEqualToString:@"Register"]) {
                    
                    self.crs_verifiactionvew.hidden = NO;
                    
                }
                else{
                    
                    
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    Register1ViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"Register1SID"];;
                    viewController.ForUkRegister = RegisterCountryForuk;
                    [self.navigationController pushViewController:viewController animated:YES];
                }
                
                
                
                
            }
            
            
            
            else {
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"InValid OTP" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                
                
                
                
                
                
                
            }
            
            
            
            
            
        
            
            
            
        });
        
        
    }];
    
    [postDataTask resume];
    
    }
    
    
}



- (IBAction)crs_Ok:(id)sender {
    [self.view removeFromSuperview];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    VerifyMobileScreen * viewController = [storyboard instantiateViewControllerWithIdentifier:@"VerifyMobileScreenViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    
    
}


-(void) webcallimg {
    
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSError * error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_ValidateForgotMpin];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    
    [mapData setObject:self.mobileNumber forKey:@"mobile"];
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_BeforeRedisterMobileNumber forKey:@"mobilenumber"];
    
    [mapData setObject:self.otpvalue forKey:@"otp"];
    
    
    
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
            if ([[json valueForKey :@"message" ]isEqualToString:@"Success"]) {
                
                
                [Crs_sharedvariable sharedMySingleton].crs_MobileNumber = self.mobileNumber;
                [Crs_sharedvariable sharedMySingleton].crs_userId = [json valueForKey:@"user_id"];
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId = [json valueForKey:@"user_id"];
                NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
                [defaults setObject:[json valueForKey:@"user_id"] forKey:@"user_id"];
                [defaults setObject:[Crs_sharedvariable sharedMySingleton].crs_MobileNumber forKey:@"mobile"];
                
                [defaults synchronize];
                NSString * MpinDisplayer = [NSString stringWithFormat:@"Your Pin Number is : %@",[json valueForKey:@"MPIN"]];
                if ([self.crsVerifiaction isEqualToString:@"Register"]) {
                    
                    self.crs_verifiactionvew.hidden = NO;
                    
                }
                else{
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:MpinDisplayer delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    loginmpinViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginmpinViewControllerSID"];;
                    
                    [self.navigationController pushViewController:viewController animated:YES];
                    
                    
                }
                
                
                
                
            }
            
            
            
            else {
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"InValid OTP" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                
                
                
                
                
                
                
            }
            
            
            
            
            
            
            
            
            
        });
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
}


- (IBAction)crs_OkAction:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
   loginmpinViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginmpinViewControllerSID"];;
    
    if ([_crs_emailVerifiaction isEqualToString:@"email"]) {
        viewController.Crs_EmailDisplayer = @"email";
    }
    else
    {
        
        viewController.Crs_EmailDisplayer = @"mobile";
        
        
    }
    viewController.Crs_verifyBack = @"forgotBack";
    
    [self.navigationController pushViewController:viewController animated:YES];
}





-(void) dismissKeyboard { 
    [self.Crs_otpvalue resignFirstResponder];
}

-(void)clearNumberPad{
   [self.Crs_otpvalue resignFirstResponder];
}

-(void)doneWithNumberPad{
  [self.Crs_otpvalue resignFirstResponder];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}


@end

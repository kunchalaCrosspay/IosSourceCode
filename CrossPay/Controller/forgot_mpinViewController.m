//
//  forgot_mpinViewController.m
//  Payment
//
//  Created by saikiran kunchala on 7/30/17.
//  Copyright © 2017 saikiran kunchala. All rights reserved.
//

#import "forgot_mpinViewController.h"
#import "OtppopupViewController.h"
#import "crs_sharedmethods.h"
#import "Crs_sharedvariable.h"
#import "MBProgressHUD.h"
#import "GlobalUrlsFile.h"
//#import <Google/Analytics.h>
#import "loginmpinViewController.h"
#import "VerifyMobileScreen.h"
@interface forgot_mpinViewController ()
{
    NSString * otpvalue;
    NSString * emailComparision;
    NSString *crs_mobile;
    
    NSString * crs_emailForgot;
    
    
    
    
}

@end

@implementation forgot_mpinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //   InterNet Connection Code For Checking net Connection
    
    
    
    
    [self.crs_SendOut.layer setBorderWidth:1.0];
    [self.crs_SendOut.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    
    
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
crs_mobile = [defaults objectForKey:@"mobile"];
   crs_emailForgot = [defaults objectForKey:@"email"];
    //NSString * string = [Crs_sharedvariable sharedMySingleton].crs_ForgotEmailDisplayer;
    NSString *newStr = [crs_emailForgot substringWithRange:NSMakeRange(4, [crs_emailForgot length]-4)];
    
    
    
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackOpaque;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Hide" style:UIBarButtonItemStyleBordered target:self action:@selector(clearNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    _Email.inputAccessoryView = numberToolbar;
_Crs_phonenumber.inputAccessoryView = numberToolbar;
   
    
    
    
    
    
    
    
    
    
    
    self.crs_forgotemail.text
    = [NSString stringWithFormat:@"xxxxx%@",newStr];
    
    
    NSString *newStr1 = [crs_mobile substringWithRange:NSMakeRange(4, [crs_mobile length]-4)];
    self.crs_forgotmobile.text
    = [NSString stringWithFormat:@"xxxxx%@",newStr1];
    
    
    
    
    
    if ([_EmailAndMobileDisplayer isEqualToString:@"email"]) {
        
         emailComparision = @"email";
        self.Crs_phonenumber.hidden=YES;
        //self.Email.hidden = NO;
        self.Email.hidden=NO;
        [self.Email_radio_btn setSelected:NO];
        [self.Mobile_radio_btn setSelected:NO];
    
    }
    else
    {
        
        
         emailComparision = @"mobile";
        
        [self.Email_radio_btn setSelected:YES];
        [self.Mobile_radio_btn setSelected:YES];
        self.Crs_phonenumber.hidden=NO;
        self.Email.hidden=YES;
        
       
    }
    
    
    
    
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
    }
  
    [self.Crs_phonenumber setValue:[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0]
              forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.Email setValue:[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0]
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

- (IBAction)Email_Rd_Act:(id)sender {
   
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    emailComparision = @"email";
    self.Crs_phonenumber.hidden=YES;
    self.Email.hidden=NO;

    
    [self.Email_radio_btn setSelected:NO];
    [self.Mobile_radio_btn setSelected:NO];
//    
//    if ([self.Email.text isEqualToString:@""])  {
//        
//        
//        
//        
//    }
   
    
}

- (IBAction)Mobile_Rd_Act:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    emailComparision = @"mobile";
    [self.Email_radio_btn setSelected:YES];
    [self.Mobile_radio_btn setSelected:YES];
    self.Crs_phonenumber.hidden=NO;
    self.Email.hidden=YES;
//    if ([self.Crs_phonenumber.text isEqualToString:@""])  {
//        
//        
//        
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Phone Number should Not be empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        
//        [alert show];
//        
//    }

}


// Post method Calling action
- (IBAction)Forgot_btn_Act:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    if ([emailComparision isEqualToString: @"email"]&&[self.Email.text isEqualToString:@""]) {
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Email  should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
                [alert show];

        
        
    }
    
    else if ([emailComparision isEqualToString: @"mobile"]&&[self.Crs_phonenumber.text isEqualToString:@""])
    
             
             
             {
             
             
             
UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Mobile Number should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                 
                 [alert show];

             
             
             }
    else if (![crs_mobile isEqualToString: self.Crs_phonenumber.text]&&[emailComparision isEqualToString: @"mobile"])
    
    {
    
    
        
        
    
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Login  Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];

        
    }
    
   // no its not working
    
    
    
    
    
  else if (![crs_emailForgot isEqualToString: self.Email.text]&&[emailComparision isEqualToString: @"email"]) {
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Login Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
      
      
        
    }
    
   
    
    
 
    
//  else if (![crs_mobile isEqualToString: self.Crs_phonenumber.text])
//  {
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Not Registered  with this  Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//    }
//
    
    
    
    else{
        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            return ;
            
            
            
            
            
            
            
            
            
        }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSError *error;
   
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_ForgotMpin];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    if ([emailComparision isEqualToString:@"email"]) {
         [mapData setObject:self.Email.text forKey:@"email"];
    }
    else
    {
     [mapData setObject:self.Crs_phonenumber.text forKey:@"mobile"];
    
    
    }
   
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    
    
    
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
   [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"error %@",error);
        NSLog(@"data %@",data);
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@", json );
        
        NSLog(@"%@", [json valueForKey:@"message"]);
        
        otpvalue=[json valueForKey:@"OTP"];
        
        
            if ([[json valueForKey:@"status"]isEqualToString:@"200"]) {
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                VerifyMobileScreen * viewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginmpinViewControllerSID"];;
                
                [self.navigationController pushViewController:viewController animated:YES];
                
                
//OtppopupViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];
//
//
//
//                [self addChildViewController:MenuViewControllerOBJ];
//                [MenuViewControllerOBJ didMoveToParentViewController:self];
//                // MenuViewControllerOBJ.otpvalue=[json valueForKey:@"OTP"];
//
//                MenuViewControllerOBJ.otpvalue= [json valueForKey:@"OTP"];
//                if ([emailComparision isEqualToString:@"email"]) {
//                     MenuViewControllerOBJ.mobileNumber = self.Email.text;
//                    MenuViewControllerOBJ.crs_emailVerifiaction = @"email";
//                }
//                else
//                {
//                   // [mapData setObject:self.Crs_phonenumber.text forKey:@"mobile"];
//                     MenuViewControllerOBJ.mobileNumber = self.Crs_phonenumber.text;
//                    MenuViewControllerOBJ.crs_emailVerifiaction = @"mobile";
//                }
//
//
//
//                MenuViewControllerOBJ.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
//                [self.view addSubview:MenuViewControllerOBJ.view];
//
                
                
                
               
                
            }
            else{
            
                
                
                
                
UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                
            
            
            
            }
            
            
            
            
            
            
});
        
        
    }];
    
    

    
    
    
    [postDataTask resume];

    }
   
   
 
    
}

-(void)sample
{
   }








- (IBAction)Remove_superview:(id)sender {
    
   [self.view removeFromSuperview];
    
    
    }

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField==self.Crs_phonenumber) {
        if (self.self.Crs_phonenumber.text.length >=100 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            NSString *validRegEx =@"^[0-9.]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            

            
            
            
            return YES;}
        
    }
    
    
    
    
    
    else{
        {return YES;}
        
    }
    
}


-(void)clearNumberPad{
    [_Email resignFirstResponder];
    [_Crs_phonenumber resignFirstResponder];
    self.Email.text = @"";
    self.Crs_phonenumber.text = @"";
    
    
 
}

-(void)doneWithNumberPad{
    //NSString *numberFromTheKeyboard = self.crs_SelectBranch.text;
    [_Email resignFirstResponder];
    [_Crs_phonenumber resignFirstResponder];
   
    
}
-(void)viewWillAppear:(BOOL)animated
{
    
    
//    
//    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
//    [tracker set:kGAIScreenName value:@" Forgot MPIN  View controller"];
//    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
}



@end

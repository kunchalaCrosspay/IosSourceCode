//
//  SettingsViewController.m
//  CrossPay
//
//  Created by sai kiran  on 8/24/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import "SettingsViewController.h"
#import "HistoryViewController.h"
#import "HomeViewController.h"
#import "crs_sharedmethods.h"
#import "notificationViewController.h"
#import "profileViewController.h"
#import "UpdateProfile.h"
#import "Crs_sharedvariable.h"
#import "MBProgressHUD.h"
#import "GlobalUrlsFile.h"
#import "VerifyMobileScreen.h"
#import "NewHomeViewController.h"
//#import <Google/Analytics.h>

@interface SettingsViewController ()
{
    NSString * MobileNumber;
    
    NSString * Country;
}
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.crs_ChangeMpinView.hidden = YES;
    
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Clear" style:UIBarButtonItemStyleBordered target:self action:@selector(clearNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],nil];
    [numberToolbar sizeToFit];
    
       _crs_CreateMpin.inputAccessoryView = numberToolbar;
    _crs_ConformMPIN.inputAccessoryView = numberToolbar;
    _crs_Conformfield.inputAccessoryView = numberToolbar;
    _crs_ConfirmMpin.inputAccessoryView = numberToolbar;
    self.crs_CreateMpin.textColor = [UIColor blackColor];
    self.crs_ConfirmMpin.textColor = [UIColor blackColor];
    
    [self profileDetails];
    
    
    self.crs_ScrollView.contentSize = CGSizeMake(self.view.frame.size.width-30,400);
    self.crs_ScrollView.hidden = YES;
    
    [self.crs_DoneOut.layer setBorderWidth:3.0];
    [self.crs_DoneOut.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}














- (IBAction)crs_ChangeMPIN:(id)sender {
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }else{
        
        self.crs_ChangeMpinView.hidden = NO;
        
    }
  
    
}

- (IBAction)crs_Back:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)crs_Conform:(id)sender {
    
    [self.view endEditing:YES];
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    

    {
        if ([self.crs_CreateMpin.text isEqualToString:@""]){
            
            
            
UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Enter Your Old Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        else if ([self.crs_ConfirmMpin.text isEqualToString:@""]){
            
            
            
    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Enter New Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        


        
        
        else if ([self.crs_Conformfield.text isEqualToString:@""]){
            
            
            
             UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Enter Confirm Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
             
             [alert show];
        }
        
        
        
        else if (![self.crs_ConfirmMpin.text isEqualToString:self.crs_Conformfield.text]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Pin Numbers Should Be Same" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        

        
        
        
        
        
        
        
        
        
        
        else{
            
        
    
        
        
        
            if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                return ;
              
                
            }
        
        
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSError * error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_ChangeMpin];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
            
    
    
    
    [mapData setObject:self.crs_CreateMpin.text forKey:@"mpin"];
    
    [mapData setObject:self.crs_ConfirmMpin.text forKey:@"new_mpin"];
            [mapData setObject:MobileNumber forKey:@"mobile"];
//
//if ([[Crs_sharedvariable sharedMySingleton].crs_EmailId isEqualToString:@"email"]) {
//
//     [mapData setObject:[ Crs_sharedvariable sharedMySingleton] .crs_EmailId forKey:@"email"];
//            }
//            else
//
//
//            {
//
//    [mapData setObject:[ Crs_sharedvariable sharedMySingleton] .crs_MobileNumber forKey:@"mobile"];
//
//            }
//
//            [mapData setObject:[ Crs_sharedvariable sharedMySingleton] .crs_ChangeMpinEmail forKey:@"mobile"];

            NSLog(@" Triple HH %@",mapData);
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
            if ([[json valueForKey :@"message" ]isEqualToString:@"Success"]

                )
            
            
            
            
            
            
            {
                self.crs_ChangeMpinOur.hidden = NO;
                self.crs_ChangeMpinView.hidden = YES;
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Pin Number has Been Changed Successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];

        
                self.crs_CreateMpin.text=@"";
                self.crs_Conformfield.text =@"";
                self.crs_ConfirmMpin.text = @"";
                

                
                
                


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
}

- (IBAction)crs_Profile:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UpdateProfile* viewController = [storyboard instantiateViewControllerWithIdentifier:@"UpdateProfileViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    

    
    
    
    
}

- (IBAction)crs_settings:(id)sender {
}

- (IBAction)crs_History:(id)sender {
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"historyViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];

    
    
    
    
    
}

- (IBAction)crs_Notification:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    notificationViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"notificationViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    
    
    
}

- (IBAction)cts_Home:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}


//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//
//    if (textField==self.crs_CreateMpin) {
//        if (self.self.crs_CreateMpin.text.length >=4 && range.length == 0)
//        {
//
//
//            return NO; // return NO to not change text
//        }
//        else
//        {
//
//
//
//            return YES;}
//
//        NSString *validRegEx =@"^[0-9.]*$"; //change this regular expression as your requirement
//
//        NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
//        BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
//        if (myStringMatchesRegEx)
//            return YES;
//        else
//            return NO;
//
//
//    }
//
//    else if (textField == self.crs_ConfirmMpin)
//    {
//
//        if (self.self.self.crs_ConfirmMpin.text.length >=4 && range.length == 0)
//        {
//            return NO; // return NO to not change text
//        }
//        else
//        {return YES;}
//
//
//    }
//
//    else if (textField == self.crs_Conformfield)
//    {
//
//        if (self.self.self.crs_Conformfield.text.length >=4 && range.length == 0)
//        {
//            return NO; // return NO to not change text
//        }
//        else
//        {return YES;}
//
//
//    }
//
//
//
//
//    else{
//        {return YES;}
//
//    }
//
//}


-(void)viewWillAppear:(BOOL)animated
{
    
    
//    
//    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
//    [tracker set:kGAIScreenName value:@"Change MPIN View controller"];
//    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
//    
}
-(void)profileDetails
{
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_ViewProfile];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
    
    
    
    // [mapData setObject: forKey:@"gender"];
    
    
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
            
            
            //message = [json valueForKey:@"message"];
            if ([[json valueForKey:@"status"]isEqualToString:@"200"])
                
                
            {
                [Crs_sharedvariable sharedMySingleton].crs_EmailId = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"email"];
                [Crs_sharedvariable sharedMySingleton].crs_country = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"country"];
                
                NSMutableArray * crs_ProfileNameArray = [[json valueForKey:@"data"] objectAtIndex:0];
                
                
                NSString * fullName = [NSString stringWithFormat:@"%@ %@ %@ ",[ crs_ProfileNameArray valueForKey:@"first_name"],[ crs_ProfileNameArray valueForKey:@"middle_name"],[ crs_ProfileNameArray valueForKey:@"last_name"]];
                
                [Crs_sharedvariable sharedMySingleton].crs_Name = fullName;
                
                //                UserCatgory = [ crs_ProfileNameArray valueForKey:@"user_category"];
                //                NSLog(@"My Category&%@",UserCatgory);
                
                
                //
                //                CoustmerId = [crs_ProfileNameArray valueForKey:@"customer_id"];
                //                CoustmerId = [NSString stringWithFormat:@"%@",[crs_ProfileNameArray valueForKey:@"customer_id"]];
                
             Country = [ crs_ProfileNameArray valueForKey:@"country"];
                
              
                MobileNumber = [crs_ProfileNameArray valueForKey:@"mobilewithoutcc"];
                NSLog(@"My Number is %@",MobileNumber);
                
                if ([Country isEqualToString:@"UNITED STATES"]||[Country isEqualToString:@"HONG KONG"]) {
                    self.crs_HistoryLabel.hidden = YES;
                    self.crs_HistoryOutlet.hidden = YES;
                    [self.crs_ProfileOutlet setFrame:CGRectMake(165,8,25,25)];
                    [self.crs_profileLbel setFrame:CGRectMake(162,22,60,50)];
                }
                else{
                    
                    self.crs_HistoryLabel.hidden = NO;
                    self.crs_HistoryOutlet.hidden = NO;
                    
                }
                
                
                
                
            }
            else{
                
                
                
                
            }
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
//    if (textField == _crs_CreateMpin) {
//
//
//
//
//
//
//        CGPoint scrollPoint = CGPointMake(0,30);
//        [  self.crs_ScrollView setContentOffset:scrollPoint animated:YES];
//
//
//    }
//
//    else if (textField == _crs_ConfirmMpin)
//
//
//    {
//
//        CGPoint scrollPoint = CGPointMake(0,60);
//        [  self.crs_ScrollView  setContentOffset:scrollPoint animated:YES];
//
//
//
//    }
//
//
//
//    else if (textField == _crs_Conformfield)
//
//
//    {
//
//        CGPoint scrollPoint = CGPointMake(0,90);
//        [  self.crs_ScrollView setContentOffset:scrollPoint animated:YES];
//
//
//
//    }
    
    
   
    
    
}
-(void)clearNumberPad{
    [_crs_CreateMpin resignFirstResponder];
    [_crs_ConformMPIN resignFirstResponder];
    [_crs_Conformfield resignFirstResponder];
    [_crs_ConfirmMpin resignFirstResponder];
    
    
    
    
    
    
}

-(void)doneWithNumberPad{
    //NSString *numberFromTheKeyboard = self.crs_SelectBranch.text;
    [_crs_CreateMpin resignFirstResponder];
    [_crs_ConformMPIN resignFirstResponder];
    [_crs_Conformfield resignFirstResponder];
   [_crs_ConfirmMpin resignFirstResponder];
    
}
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    if(textField==self.crs_CreateMpin)
//    {
//
//        NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@""];
//        for (int i = 0; i < [string length]; i++)
//        {
//            unichar c = [string characterAtIndex:i];
//            if (![myCharSet characterIsMember:c])
//            {
//                return NO;
//            }
//        }
//
//        return YES;
//    }
//
//    return YES;
//}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{

    if (textField==self.crs_CreateMpin) {
         _crs_ChangeMpinOur.hidden = YES;
        if (self.self.crs_CreateMpin.text.length >=4 && range.length == 0)
        {


            return NO; // return NO to not change text
        }
        else
        {



            return YES;}

        NSString *validRegEx =@"^[0-9.]*$"; //change this regular expression as your requirement

        NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
        BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
        if (myStringMatchesRegEx)
            return YES;
        else
            return NO;


    }

    else if (textField == self.crs_ConfirmMpin)
    {

        if (self.self.self.crs_ConfirmMpin.text.length >=4 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {return YES;}


    }

    else if (textField == self.crs_Conformfield)
    {

        if (self.self.self.crs_Conformfield.text.length >=4 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {return YES;}


    }




    else{
        {return YES;}

    }

}

@end

//
//  Register1ViewController.m
//  CrossPay
//
//  Created by sai kiran  on 12/6/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "Register1ViewController.h"
#import "registerViewController.h"
#import "LoginViewController.h"
#import "HomeViewController.h"
#import "loginmpinViewController.h"
#import "VerifyMobileScreen.h"
#import "OtppopupViewController.h"
#import "crs_sharedmethods.h"
#import "InitialViewController.h"
#import "MBProgressHUD.h"
#import "TermsandCondtionsViewController.h"
#import "crs_sharedmethods.h"
#import "GlobalUrlsFile.h"
//#import <Google/Analytics.h>
#import "PrivacyPolicyViewController.h"
#import "NewTermsViewController.h"
#import "Crs_sharedvariable.h"
#import "NationalityTableViewCell.h"
#import "NewHomeViewController.h"

@interface Register1ViewController ()
{
    NSMutableArray * NationalityArray;
    NSString * message;
    
    NSString * Gender;
    NSMutableArray * stdArray;
    
    NSMutableArray * CountryArray;
    
    NSString * NationalityName;
    NSMutableArray * crs_countrylist;
    
    NSString * Hider;
    
    UITapGestureRecognizer * tap;
    
    NSString * ConformHide;
    NSMutableArray * NationalityAlphabets;
    NSMutableArray * PostalCoderray;
    
    NSMutableArray * postalCompressingArray;
    
    // For Storing Country and Postal Code
    
    NSString * CountryPlacer;
    NSString * PostCodePlacer;
    NSArray * FacebookArray;
    
    NSString * check1;
    NSString * check2;
    
    NSMutableArray * searchArray;
    NSString * date1;
    NSString * date2;
    NSString * ForUkregister1;
    NSString * CoustmerNumber;
    NSString * CoustmerUserId;
    
    
    
    BOOL  isFiltered;
}

@end

@implementation Register1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.crs_CountryView.hidden = YES;
    ForUkregister1 = self.ForUkRegister;
    //[self datePick];
    
     self.crs_Search.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    
    CountryPlacer = [Crs_sharedvariable sharedMySingleton].crs_RegisterCountryCode;
    
    CoustmerNumber = [Crs_sharedvariable sharedMySingleton].crs_CoustmerNumber;
    CoustmerUserId = [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId;
    
    
    NSLog(@"my Country Code is %@",CountryPlacer);
    
    
    
    self.crs_DateObirth.textColor = [UIColor whiteColor];
    self.crs_FirstName.textColor = [UIColor whiteColor];
    self.crs_MidddleName.textColor = [UIColor whiteColor];
    self.crs_City.textColor = [UIColor whiteColor];
    self.crs_Address.textColor = [UIColor whiteColor];
    self.crs_PostCode.textColor = [UIColor whiteColor];
    self.crs_ReferalCode.textColor = [UIColor whiteColor];
    self.crs_LastName.textColor = [UIColor whiteColor];
    self.crs_address2.textColor = [UIColor whiteColor];
     self.crs_scrollView.contentSize = CGSizeMake(self.view.frame.size.width-30,700);
    self.crs_ThanksView.hidden = YES;
    self.crs_refferalCode.textColor = [UIColor whiteColor];
    
    
    
    [self.crs_Register1Out.layer setBorderWidth:1.0];
    [self.crs_Register1Out.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Clear" style:UIBarButtonItemStyleBordered target:self action:@selector(clearNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    _crs_FirstName.inputAccessoryView = numberToolbar;
    _crs_MidddleName.inputAccessoryView = numberToolbar;
    _crs_LastName.inputAccessoryView = numberToolbar;
    _crs_PostCode.inputAccessoryView = numberToolbar;
    _crs_City.inputAccessoryView = numberToolbar;
    _crs_Address.inputAccessoryView = numberToolbar;
    _crs_address2.inputAccessoryView = numberToolbar;
    _crs_refferalCode.inputAccessoryView = numberToolbar;
    
    
    
    
}


-(void)datePick{
    
    datePicker=[[UIDatePicker alloc]init];
    datePicker.datePickerMode=UIDatePickerModeDate;
    [self.crs_DateObirth setInputView:datePicker];
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor blackColor]];
    
    
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(ShowSelectedDate)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    [self.crs_DateObirth setInputAccessoryView:toolBar];
    
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:-18];
    NSDate *maxDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
    [comps setYear:-90];
    NSDate *minDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
    
    [datePicker setMaximumDate:maxDate];
    [datePicker setMinimumDate:minDate];
    
}

-(void)ShowSelectedDate
{
    
    
    
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd-MM-YYYY"];
    
    
    NSDateFormatter *Format = [[NSDateFormatter alloc]init];
    [Format setDateFormat:@"YYYY-MM-dd"];
    
    NSLog(@"Hello date%@",[Format stringFromDate:datePicker.date]);
    date1 = [NSString stringWithFormat:@"%@",[Format stringFromDate:datePicker.date]];
    
    self.crs_DateObirth.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
    [self.crs_DateObirth resignFirstResponder];
    
    
    
    
}

-(void)UkValidation{
    
   
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    
    if ([self.crs_FirstName.text isEqualToString:@""])  {
    
    
    
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
            [alert show];
    
        }
    
        else if ([self.crs_LastName.text isEqualToString:@""]){
    
    
    
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
            [alert show];
    
        }
    
    
        else if ([self.crs_PostCode.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Post Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
    
    
    
        else if ([self.crs_Address.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
    
        else if ([self.crs_City.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
    
    
    
    
 
    

//
//        else if ([self.crs_DateObirth.text isEqualToString:@""]){
//
//
//
//            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Date Of Birth should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//            [alert show];
//
//        }
//
//
    
    
    
    
   
    
    
    //    else if ([self.crs_County.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your County" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //    else if ([self.crs_Address.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    //
    //
    //    else if ([self.crs_city.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    //
    //    else if ([self.crs_Adress.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter Post Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    //    else if ([self.crs_confirmMpin.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Confirm your Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    //
    //
    //
    //    else if (self.crs_CreateMPIn.text   != self.crs_confirmMpin.text)
    //
    //
    //    {
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Pin  Numbers  Should Be Same " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //
    //
    //
    //
    //    }
    //
    //
    //
    //    else if (self.crs_CreateMPIn.text.length <4)
    //
    //
    //    {
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //
    //
    //
    //
    //    }
    //
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    else {
        
        
        
        
        
        [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
        
        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            return ;
            
            
            
            
            
            
            
            
            
        }
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_NewRegister1];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
        [mapData setObject:self.crs_FirstName.text forKey:@"firstname"];
        [mapData setObject:self.crs_MidddleName.text forKey:@"middlename"];
        [mapData setObject:self.crs_LastName.text forKey:@"lastname"];
         [mapData setObject:CoustmerNumber forKey:@"customerno"];
        [mapData setObject:CoustmerUserId forKey:@"user_id"];
      [mapData setObject:self.crs_City.text forKey:@"city"];
         [mapData setObject:self.crs_address2.text forKey:@"Address2"];
        [mapData setObject:self.crs_refferalCode.text forKey:@"refcode"];
        
  
        @try {
             [mapData setObject:_MyCoustmerId forKey:@"user_id"];
             [mapData setObject:_MyCoustmerNumber forKey:@"customerno"];
           
        }
        @catch (NSException * e) {
            NSLog(@"Exception: %@", e);
        }
        @finally {
            NSLog(@"finally");
        }
      
        
        
        @try {
           
            [mapData setObject:_verfiyMobileScreenCoustmerNumber forKey:@"customerno"];
        }
        @catch (NSException * e) {
            NSLog(@"Exception: %@", e);
        }
        @finally {
            NSLog(@"finally");
        }
        
        
//[mapData setObject:date1 forKey:@"dateofbirth"];
        
      
       
         [mapData setObject:self.crs_Address.text forKey:@"Address"];
       [mapData setObject:self.crs_PostCode.text forKey:@"Zipcode"];
      
        [mapData setObject:@"IOS" forKey:@"device"];
       
        
        
        ;
        
        NSLog(@"%@",mapData);
        
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
                [Crs_sharedvariable sharedMySingleton].crs_UserDetails = json;
                NSLog(@"%@", [json valueForKey:@"message"]);
                
                message = [json valueForKey:@"message"];
                if ([[json valueForKey:@"status"]isEqualToString:@"200"]) {
                    
                    [Crs_sharedvariable sharedMySingleton].crs_userId = [json valueForKey:@"user_id"];
                    [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId = [json valueForKey:@"user_id"];
                    // create an alert controller with the appearance of an alert view
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Crosspay" message:@"Thank you for Registering With Crosspay" preferredStyle:UIAlertControllerStyleAlert];
                    
                    // create the actions handled by each button
                    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        
                        
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                        
                        NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
                        
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
                
                    self.crs_ThanksView.hidden = NO;
                    
                    

                    
                }
                
                
                
                else{
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                    
                }
                
                
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
        
        
        
        
    }
    
}


- (IBAction)crs_CityAction:(id)sender {
}

- (IBAction)crs_AddressButton:(id)sender {
    NationalityName = @"PostalCode";
    self.crs_CountryView.hidden = NO;
   
    
    [self PostCodeAdress];
    [_crs_CountryTable reloadData];
}

- (IBAction)crs_AddressAction:(id)sender {
}


- (IBAction)crs_Back:(id)sender {
}

-(void)PostCodeAdress {
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    
    
    NSString * CountryCodeChanger ;
    if ([CountryPlacer isEqualToString:@"GBP"]) {
        CountryCodeChanger = @"uk";
    }
   
    
    NSString *str = self.crs_PostCode.text;
    
    str = [str stringByReplacingOccurrencesOfString:@" "withString:@""];;
    NSLog(@"%@ Anusha",str);
    
    NSString * postCodeUrl = [NSString stringWithFormat:@"https://ws.postcoder.com/pcw/PCWBD-CB592-Q66XH-3KQ6R/address/%@/%@?lines=5&format=json",CountryCodeChanger,str];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:postCodeUrl] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            
            @try {
                
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                
                PostalCoderray = json;
                [self.view removeGestureRecognizer:tap];
                postalCompressingArray = [NSMutableArray new];
                postalCompressingArray = json;
            }
            @catch (NSException *exception) {
                
                NSLog(@"Max index manish");
                //                postalCompressingArray = [NSMutableArray new];
                //                postalCompressingArray = 0;
                //                NSLog(@"Max index value",postalCompressingArray.count);
            }
            @finally {
                
                NSLog(@"  Max index is %lu",(unsigned long)postalCompressingArray.count);
            }
            
            
            
            if (postalCompressingArray.count == 0) {
                self.crs_AddressOutlet.hidden = YES;
                self.crs_NewCity.hidden = YES;
                self.crs_Address2.hidden = YES;
                
                self.crs_CountryView.hidden = YES;
                
//                self.crs_AddressOneDropImage.hidden = YES;
//                self.crs_AddressTwoDropDownImage.hidden = YES;
                
                
            }
            else if (![CountryPlacer isEqualToString:@"GBP"]){
                
                self.crs_AddressOutlet.hidden = YES;
                self.crs_NewCity.hidden = YES;
                self.crs_Address2.hidden = YES;
                self.crs_CountryView.hidden = YES;
            }
            else{
                
                
                if ([NationalityName isEqualToString:@"PostalCode1"]) {
                    postalCompressingArray = [NSMutableArray new];
                    for (int i = 0; i<PostalCoderray.count; i++) {
                        
                        
                        
                        [postalCompressingArray addObject:[[PostalCoderray valueForKey:@"addressline2"]objectAtIndex: i] ];
                        
                        
                        
                    }
                    
                    NSString *nullStr = @"nil";
                    [postalCompressingArray removeObject:nullStr];
                    
                    [postalCompressingArray removeObjectIdenticalTo:[NSNull  null  ]];
                }
                
                
                NSLog(@"%lu",(unsigned long)postalCompressingArray.count);
                NSLog(@" sai kiran %lu",(unsigned long)PostalCoderray.count);
                //postalCompressingArray = PostalCoderray;
                NSLog(@"%@ StoneCold steve",postalCompressingArray);
                [self.crs_CountryTable reloadData];
                self.crs_CountryView.hidden = NO;
                //NSLog(@"%@ PostCode",json);
                
                
                
                
                
            }
            
        });
    }];
    
    [dataTask resume];
    
    
    
    
}

-(void)PostCodeAdress1 {
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    
    
    NSString * CountryCodeChanger ;
    if ([CountryPlacer isEqualToString:@"GBP"]) {
        CountryCodeChanger = @"uk";
    }
    
    
    
    else
    {
        
        CountryCodeChanger = @"" ;
        
    }
    NSString *str = self.crs_PostCode.text;
    
    str = [str stringByReplacingOccurrencesOfString:@" "withString:@""];;
    NSLog(@"%@ Anusha",str);
    
    NSString * postCodeUrl = [NSString stringWithFormat:@"https://ws.postcoder.com/pcw/PCWBD-CB592-Q66XH-3KQ6R/address/%@/%@?lines=5&format=json",CountryCodeChanger,str];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:postCodeUrl] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            
            @try {
                
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                
                PostalCoderray = json;
                [self.view removeGestureRecognizer:tap];
                postalCompressingArray = [NSMutableArray new];
                postalCompressingArray = json;
            }
            @catch (NSException *exception) {
                
                NSLog(@"Max index manish");
                //                postalCompressingArray = [NSMutableArray new];
                //                postalCompressingArray = 0;
                //                NSLog(@"Max index value",postalCompressingArray.count);
            }
            @finally {
                
                NSLog(@"  Max index is %lu",(unsigned long)postalCompressingArray.count);
            }
            
            
            
            if (postalCompressingArray.count == 0) {
                self.crs_AddressOutlet.hidden = YES;
                self.crs_CityOutlet.hidden = YES;
                self.crs_Address2.hidden = YES;
                //                self.crs_AddressOneDropImage.hidden = YES;
                //                self.crs_AddressTwoDropDownImage.hidden = YES;
                
                
            }
            else{
                
                
                if ([NationalityName isEqualToString:@"PostalCode1"]) {
                    postalCompressingArray = [NSMutableArray new];
                    for (int i = 0; i<PostalCoderray.count; i++) {
                        
                        
                        
                        [postalCompressingArray addObject:[[PostalCoderray valueForKey:@"addressline2"]objectAtIndex: i] ];
                        
                        
                        
                    }
                    
                    NSString *nullStr = @"nil";
                    [postalCompressingArray removeObject:nullStr];
                    
                    [postalCompressingArray removeObjectIdenticalTo:[NSNull  null  ]];
                }
                
                
                NSLog(@"%lu",(unsigned long)postalCompressingArray.count);
                NSLog(@" sai kiran %lu",(unsigned long)PostalCoderray.count);
                //postalCompressingArray = PostalCoderray;
                NSLog(@"%@ StoneCold steve",postalCompressingArray);
                [self.crs_CountryTable reloadData];
                self.crs_CountryView.hidden = NO;
                //NSLog(@"%@ PostCode",json);
                
                
                
                
                
            }
            
        });
    }];
    
    [dataTask resume];
    
    
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if ([NationalityName isEqualToString:@"nationality"]) {
        
        
        if (!isFiltered) {
            
            return NationalityArray.count;
            
        }
        
        
        else{
            
            
            
            return searchArray.count;
        }
        
    }
    
    
    
    else if ([NationalityName isEqualToString:@"PostalCode"]){
        
        if (!isFiltered) {
            return PostalCoderray.count;
            
            
        }
        
        
        else{
            
            return searchArray.count;
        }
        
    }
    
    else if ([NationalityName isEqualToString:@"PostalCode1"]){
        
        if (!isFiltered) {
             return postalCompressingArray.count;
            
            
        }
        
        
        else{
            
            return searchArray.count;
        }
        
    }
    
    else{
        
        
        if (!isFiltered) {
            
            return postalCompressingArray.count;
        }
        
        
        else{
            
            return searchArray.count;
        }
        
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    
    
    
    NationalityTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"NationalitySID"];
    if ([NationalityName isEqualToString:@"nationality"]) {
        
        if (!isFiltered) {
            
            
             cell.crs_NationalityName.text = [[NationalityArray valueForKey:@"nationality"]objectAtIndex:indexPath.row ];
          
            
        }
        else{
            
            
            
             cell.crs_NationalityName.text = [[searchArray valueForKey:@"nationality"]objectAtIndex:indexPath.row ];
            
        }
        
        
    }
    
    
    
    
    else if ([NationalityName isEqualToString:@"PostalCode"]){
        
        if (!isFiltered) {
            cell.crs_NationalityName.text = [[PostalCoderray valueForKey:@"addressline1"]objectAtIndex:indexPath.row ];
            
        }
        
        else{
            
            
             cell.crs_NationalityName.text = [[searchArray valueForKey:@"addressline1"]objectAtIndex:indexPath.row ];
            
            
        }
        
        
        
        
    }
    
    else if ([NationalityName isEqualToString:@"PostalCode1"]){
        
        if (!isFiltered) {
            cell.crs_NationalityName.text = [[postalCompressingArray valueForKey:@"addressline2"]objectAtIndex:indexPath.row ];
            
        }
        
        else{
            
            
             cell.crs_NationalityName.text = [[searchArray valueForKey:@"addressline2"]objectAtIndex:indexPath.row ];
            
            
        }
        
        
        
        
    }
    
    return cell;
}














-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.crs_CountryView.hidden = YES;
    
    
    
    
    
//
//    if ([NationalityName isEqualToString:@"nationality"]) {
//
//        if (!isFiltered) {
//            self.crs_Nationality.text = [[NationalityArray valueForKey:@"nationality"]objectAtIndex:indexPath.row ];
//
//
//        }
//
//        else{
//
//
//            self.crs_Nationality.text = [[searchArray valueForKey:@"nationality"]objectAtIndex:indexPath.row ];
//
//
//        }
//
//
//
//    }
//
//
    
 if ([NationalityName isEqualToString:@"PostalCode"]){
        if (!isFiltered) {
            
            self.crs_Address.text = [[PostalCoderray valueForKey:@"addressline1"]objectAtIndex:indexPath.row ];
            
            self.crs_City.text = [[PostalCoderray valueForKey:@"posttown"] objectAtIndex:indexPath.row];
            
            
            
        }
        
        else{
            
            
            self.crs_Address.text = [[searchArray valueForKey:@"addressline1"]objectAtIndex:indexPath.row ];
            self.crs_City.text = [[searchArray valueForKey:@"posttown"] objectAtIndex:indexPath.row];
            
            
            
        }
        
        
        
    }
    
    
    
 else if ([NationalityName isEqualToString:@"PostalCode1"]){
     if (!isFiltered) {
         
         self.crs_address2.text = [[postalCompressingArray valueForKey:@"addressline2"]objectAtIndex:indexPath.row ];
         
         self.crs_City.text= [[postalCompressingArray valueForKey:@"posttown"] objectAtIndex:indexPath.row];
         
         
         
     }
     
     else{
         
         
         self.crs_address2.text = [[searchArray valueForKey:@"addressline2"]objectAtIndex:indexPath.row ];
         self.crs_City.text = [[searchArray valueForKey:@"posttown"] objectAtIndex:indexPath.row];
         
         
         
     }
     
     
     
 }
    
    
    
    
    
    
    
    
}
- (IBAction)crs_Nationality:(id)sender {
    NationalityName = @"nationality";
}

- (IBAction)crs_RegisterAction:(id)sender {
    [self UkValidation];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    if(textField == self.crs_FirstName){
        [[self view] endEditing:YES];
        
        
    }
    
    
    
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
        if(nextTag==12)
        {
            
            
            [[self view] endEditing:YES];
            
        }
    }
    
    
    return NO;
    
}



-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == _crs_FirstName) {
        
        
        
        
        
        
        CGPoint scrollPoint = CGPointMake(0,30);
        [  self.crs_scrollView setContentOffset:scrollPoint animated:YES];
        
        
        
    }
   
    else if (textField == _crs_MidddleName){
        
        
        CGPoint scrollPoint = CGPointMake(0,60);
        [  self.crs_scrollView setContentOffset:scrollPoint animated:YES];
        
    }
    
    else if (textField == _crs_LastName){
        
        
        CGPoint scrollPoint = CGPointMake(0,90);
        [  self.crs_scrollView setContentOffset:scrollPoint animated:YES];
        
    }
    
    
    else if (textField == _crs_PostCode){
        
        
        CGPoint scrollPoint = CGPointMake(0,120);
        [  self.crs_scrollView setContentOffset:scrollPoint animated:YES];
        
    }
    
    
    else if (textField == _crs_Address){
        
        
        CGPoint scrollPoint = CGPointMake(0,150);
        [  self.crs_scrollView setContentOffset:scrollPoint animated:YES];
        
    }
    
    else if (textField == _crs_City){
        
        
        CGPoint scrollPoint = CGPointMake(0,180);
        [  self.crs_scrollView setContentOffset:scrollPoint animated:YES];
        
    }
    //Ramjk77@gmail.com
    
    else if (textField == _crs_DateObirth){
        
        
        CGPoint scrollPoint = CGPointMake(0,320);
        [  self.crs_scrollView setContentOffset:scrollPoint animated:YES];
        
    }
    
    
    else if (textField == _crs_refferalCode){
        
        
        CGPoint scrollPoint = CGPointMake(0,210);
        [  self.crs_scrollView setContentOffset:scrollPoint animated:YES];
        
    }
    
    
    
}
- (IBAction)crs_OkAction:(id)sender {
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}
- (IBAction)crs_Register1Action:(id)sender {
    [self UkValidation];
}
- (IBAction)crs_address2Action:(id)sender {
    
    NationalityName = @"PostalCode1";
    self.crs_CountryView.hidden = NO;
    [self PostCodeAdress1];
    [_crs_CountryTable reloadData];
}


-(void)clearNumberPad{
    [_crs_FirstName resignFirstResponder];
     [_crs_MidddleName resignFirstResponder];
     [_crs_LastName resignFirstResponder];
     [_crs_PostCode resignFirstResponder];
     [_crs_Address resignFirstResponder];
     [_crs_Address2 resignFirstResponder];
     [_crs_City resignFirstResponder];
     [_crs_refferalCode resignFirstResponder];
    [_crs_address2 resignFirstResponder];
    _crs_FirstName.text = @"";
    _crs_MidddleName.text = @"";
    _crs_LastName.text = @"";
    _crs_refferalCode.text = @"";
    _crs_Address.text = @"";
    _crs_City.text = @"";
    _crs_PostCode.text = @"";
    
    
  
    
    
    
    
    
}

-(void)doneWithNumberPad{
    //NSString *numberFromTheKeyboard = self.crs_SelectBranch.text;
    [_crs_FirstName resignFirstResponder];
    [_crs_MidddleName resignFirstResponder];
    [_crs_LastName resignFirstResponder];
    [_crs_PostCode resignFirstResponder];
    [_crs_Address resignFirstResponder];
    [_crs_Address2 resignFirstResponder];
    [_crs_City resignFirstResponder];
    [_crs_refferalCode resignFirstResponder];
    [_crs_address2 resignFirstResponder];
}


- (IBAction)crs_NewCityAction:(id)sender {
}

- (IBAction)crs_newAddress2Action:(id)sender {
    NationalityName = @"PostalCode1";
    self.crs_CountryView.hidden = NO;
    [self PostCodeAdress1];
    [_crs_CountryTable reloadData];
}
@end

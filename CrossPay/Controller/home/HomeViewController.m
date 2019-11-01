//
//  HomeViewController.m
//  CrossPay
//
//  Created by Saikiran on 28/07/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//http://ec2-52-11-197-132.us-west-2.compute.amazonaws.com:6099

#import "HomeViewController.h"
#import "menuviewViewController.h"
#import "AddRecieverPage.h"
#import "profileViewController.h"
#import "SelectRecieverViewController.h"
#import "Crs_sharedvariable.h"
#import "crs_sharedmethods.h"
#import "CountryListTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"
#import "GlobalUrlsFile.h"
#import "FingerPrintViewController.h"
//#import <Google/Analytics.h>
#import "RecieverDetailedViewController.h"
#import "UpdateProfileNewViewController.h"
#import "CharityPayViewController.h"
#import <StoreKit/StoreKit.h>
@interface HomeViewController ()
{
    NSMutableArray * crs_CountryList ;
    NSMutableArray * crs_CountryList1 ;
    NSString * crs_CashPickupChanger;
    
    NSString * countryListCompare;
    NSString * country;
    NSString *ReciverCountry;
    
    NSString * sourceisocode;
    NSString * destinationisocode;
    NSMutableArray * searchArray;
    NSString *  sourceCountryCode;
    NSString * destinationCountryCode;
    NSString * TotalDestinationAmount;
    UIActivityIndicatorView *spinner;
    NSTimer *timer;
    
    NSString * UserCatgory;
    NSString * CHarityCountry;
    NSString * CatgoryId;
    NSString * userCatogoryMessage;
    NSString * CoustmerId;
    NSString *iosReview;
    NSString *iosReview1;
    NSString * Status;
    NSString * Text1;
    NSString * Text2;
    NSString * FromCountry;
    BOOL  isFiltered;
    
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.crs_TextField.hidden = YES;
    self.crs_TextField1.hidden = YES;
    CatgoryId = @"";
    
    
    [self CheckCateogory];
    
    self.crs_search.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    
    spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center=self.view.center;
    
    [spinner setColor:[UIColor blackColor]];
    [self.view addSubview:spinner];
    
    self.crs_Updateprofilelabel.text = userCatogoryMessage;
    
    self.crs_UpdateProfile.hidden = YES;
    [self profileDetails];
    
    
    if ([CatgoryId isEqualToString:@"-3"]) {
        self.crs_CharityButtonout.hidden = YES;
    }
    
    
    
    
    [self.crs_TextField setValue:[UIColor lightTextColor]
                      forKeyPath:@"_placeholderLabel.textColor"];
    [self.crs_TextField1 setValue:[UIColor lightTextColor]
                       forKeyPath:@"_placeholderLabel.textColor"];
    
    
    [self.crs_TextField1 setValue:[UIFont fontWithName: @"American Typewriter Bold" size: 30] forKeyPath:@"_placeholderLabel.font"];
    
    [self.crs_TextField setValue:[UIFont fontWithName: @"American Typewriter Bold" size: 30] forKeyPath:@"_placeholderLabel.font"];
    
    
    [self.crs_FirstField setValue:[UIColor lightTextColor]
                       forKeyPath:@"_placeholderLabel.textColor"];
    [self.crs_SecondField setValue:[UIColor lightTextColor]
                        forKeyPath:@"_placeholderLabel.textColor"];
    
    
    [self.crs_FirstField setValue:[UIFont fontWithName: @"American Typewriter Bold" size: 30] forKeyPath:@"_placeholderLabel.font"];
    
    [self.crs_SecondField setValue:[UIFont fontWithName: @"American Typewriter Bold" size: 30] forKeyPath:@"_placeholderLabel.font"];
    
    Text1 = self.crs_FirstField.text;
    Text2 = self.crs_SecondField.text;
    
    
    //[spinner startAnimating];
    
    
    // remove
    //[Crs_sharedvariable sharedMySingleton].crs_userId = @"5";
    
    NSLog(@"");
    
    self.crs_versionview.hidden = YES;
    
    // Do any additional setup after loading the view.// Do any additional setup after loading the view.
    [self GetVersion];
    [self webservice];
    //self.crs_KickLabelCommision.text = @"Kick Start Here";
    isFiltered=NO;
    
    
    if ([self.crs_TextField.text isEqualToString:@""]) {
        self.crs_TextField1.text = @"";
    }
    else if ([self.crs_TextField1.text isEqualToString:@""]){
        
        self.crs_TextField.text = @"";
        
    }
    
    
    
    
    
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Clear" style:UIBarButtonItemStyleBordered target:self action:@selector(clearNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    _crs_TextField.inputAccessoryView = numberToolbar;
    _crs_TextField1.inputAccessoryView = numberToolbar;
    _crs_search.inputAccessoryView = numberToolbar;
    
    
    
    
    
    
    [Crs_sharedvariable sharedMySingleton].crs_selectedCoutryCurrencyCode = @"INR";
    
    ReciverCountry = @"INDIA";
    
    
    [self.crs_ProceddOut.layer setBorderWidth:1.0];
    [self.crs_ProceddOut.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    
    
    [self.crs_remindoutlet.layer setBorderWidth:1.0];
    [self.crs_remindoutlet.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    
    [self.crs_UpdateOutlet.layer setBorderWidth:1.0];
    [self.crs_UpdateOutlet.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:3.0] CGColor]];
    
    
    
    
    [self.crs_search addTarget:self action:@selector(textFieldDidChanges:) forControlEvents:UIControlEventEditingChanged];
    
    
    
    
    
    [self.crs_TextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    [self.crs_TextField1 addTarget:self action:@selector(textFieldDidChange1:) forControlEvents:UIControlEventEditingChanged];
    
    
    
    //   InterNet Connection Code For Checking net Connection
    
    self.crs_Countrycode1.text=@"";
    self.crs_CountryCode.text=@"";
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    
    
    
    crs_CountryList = [NSMutableArray new];
    crs_CountryList1 = [NSMutableArray new];
    self.crs_CountryListView.hidden=YES;
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:Crosspay_getCountry] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        crs_CountryList = [json valueForKey: @"country"];
        crs_CountryList1 = [json valueForKey: @"country"];
        //[self.crs_CountryListTableView reloadData];
        NSLog(@"%@", crs_CountryList);
        
        for (int i=0; i<crs_CountryList.count;i++) {
            
            if ([[[crs_CountryList valueForKey:@"country_code"]objectAtIndex:i]isEqualToString:@"GBP"]) {
                
                [Crs_sharedvariable sharedMySingleton].crs_source1 =[[crs_CountryList valueForKey:@"countryisocode"]objectAtIndex:i];
                
                
                
                
                
            }
        }
        
        
        
        for (int i=0; i<crs_CountryList1.count;i++) {
            
            if ([[[crs_CountryList1 valueForKey:@"country_code"]objectAtIndex:i]isEqualToString:@"INR"]) {
                
                [Crs_sharedvariable sharedMySingleton].crs_destination1 =[[crs_CountryList1 valueForKey:@"countryisocode"]objectAtIndex:i];
                
                
                
                
                
            }
        }
        
        
        
        
        
        
    }];
    
    [dataTask resume];
    
    
    
    
    
    
    
    
    
    
    
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
                
                
                
                CoustmerId = [crs_ProfileNameArray valueForKey:@"customer_id"];
                CoustmerId = [NSString stringWithFormat:@"%@",[crs_ProfileNameArray valueForKey:@"customer_id"]];
                iosReview = [NSString stringWithFormat:@"%@",[crs_ProfileNameArray valueForKey:@"IOSREVIEW"]];
                
                
                NSLog(@"My Review is%@",iosReview);
                //                if ([iosReview isEqualToString:@"1"]) {
                //                    self.crs_Skipout1.hidden = NO;
                //                }
                //
                //                else{
                //
                //                    self.crs_Skipout1.hidden = YES;
                //
                //                }
                CHarityCountry = [ crs_ProfileNameArray valueForKey:@"country"];
                if ([CHarityCountry isEqualToString:@"UNITED KINGDOM"]) {
                    //self.crs_CharityButtonout.hidden = NO;
                }
                else{
                    
                    //self.crs_CharityButtonout.hidden = YES;
                    
                }
                
                
                
                
            }
            else{
                
                
                
                
            }
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)textFieldDidChange :(UITextField *)theTextField{
    NSLog( @"text changed: %@", theTextField.text);
    
    if ([_crs_CountryCode.text isEqualToString:@""]) {
        self.crs_TextField1.text = @"";
    }
    
    [Crs_sharedvariable sharedMySingleton].crs_Reverse = @"Direct";
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    
    [spinner startAnimating];
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_GetExchangeRate];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    [mapData setObject: self.crs_CountryCode.text forKey:@"ccyfrom"];
    
    [mapData setObject:self.crs_Countrycode1.text forKey:@"ccyto"];
    
    [mapData setObject:theTextField.text forKey:@"fromvalue"];
    
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [spinner stopAnimating];
            NSLog(@"error %@",error);
            NSLog(@"data %@",data);
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json );
            
            
            if([[json valueForKey:@"message"]isEqualToString:@"Success"])
            {
                
                NSString * totalRate = [NSString stringWithFormat:@"%@",[json valueForKey:@"TotalRate1"]];
                if ([totalRate isEqualToString:@"(null)"]||[totalRate isEqualToString:@""]) {
                    NSLog(@"Venkatesh");
                    totalRate = [totalRate stringByReplacingOccurrencesOfString:@"(null)"withString:@""];;
                    NSLog(@"%@ Anusha",totalRate);
                    
                    
                }
                self.crs_TextField1.text = [NSString stringWithFormat:@"%@",totalRate];
                NSLog(@"%@",[json valueForKey:@"TotalRate1"]);
                
                //                if ([[json valueForKey:@"ccyto"]isEqualToString:@"VND"]||[[json valueForKey:@"ccyto"]isEqualToString:@"SLR"]) {
                //
                //
                //                    NSString * totalRate = [NSString stringWithFormat:@"%@",[json valueForKey:@"TotalRate"]];
                //
                //                    self.crs_TextField1.text = [NSString stringWithFormat:@"%.02f",[totalRate floatValue]];
                //
                //
                //
                //
                //                }
                
                
                
                
                
                
                
                NSString * crs_CommisionRate = [NSString stringWithFormat:@"Account Credit: %@ %@",[json valueForKey:@"commission"],[json valueForKey:@"ccyfrom"]];
                
                [Crs_sharedvariable sharedMySingleton].crs_FromCountry1 = [json valueForKey:@"ccyfrom"];
                
                self.crs_CommisionChargeLabel.text = crs_CommisionRate;
                
                
                [Crs_sharedvariable sharedMySingleton ].crs_CommisionRate = [json valueForKey:@"commission"];
                [Crs_sharedvariable sharedMySingleton].crs_PayInAmount    = totalRate;
                [Crs_sharedvariable sharedMySingleton].crs_PayOUtAmount    = theTextField.text;
                
                float f1=[[json valueForKey:@"INR"]floatValue];
                NSString *Crs_rate=[NSString stringWithFormat:@"%.2f",f1];
                
                self.Crs_RateLabel.text=[NSString stringWithFormat:@"Rate: 1 %@ = %@ %@ ",[json valueForKey:@"ccyfrom"],Crs_rate,[json valueForKey:@"ccyto"]];
                
                [Crs_sharedvariable sharedMySingleton].crs_selectedCoutryCurrencyCode = [json valueForKey:@"ccyto"];
                
                [Crs_sharedvariable sharedMySingleton].crs_RateDisplayingMethod = [NSString stringWithFormat:@"1 %@ = %@ %@ ",[json valueForKey:@"ccyfrom"],Crs_rate,[json valueForKey:@"ccyto"]];
                
                if ([[json valueForKey:@"ccyto"]isEqualToString:@"USD"]||[[json valueForKey:@"ccyto"]isEqualToString:@"EUR"]||[[json valueForKey:@"ccyto"]isEqualToString:@"AUD"]||[[json valueForKey:@"ccyto"]isEqualToString:@"GBP"]||[[json valueForKey:@"ccyto"]isEqualToString:@"NOK"]||[[json valueForKey:@"ccyto"]isEqualToString:@"DKK"]||[[json valueForKey:@"ccyto"]isEqualToString:@"SEK"]||[[json valueForKey:@"ccyto"]isEqualToString:@"SLL"] ) {
                    
                    self.crs_KickLabelCommision.text = @"Cash Pick-Up :N/A";
                    
                    
                }
                else if ([[json valueForKey:@"ccyto"]isEqualToString:@"KES"]||[[json valueForKey:@"ccyto"]isEqualToString:@"TZS"]||[[json valueForKey:@"ccyto"]isEqualToString:@"UGX"]||[[json valueForKey:@"ccyto"]isEqualToString:@"GHS"]||[[json valueForKey:@"ccyto"]isEqualToString:@"NGN"]||[[json valueForKey:@"ccyto"]isEqualToString:@"RWF"]){
                    
                    self.crs_KickLabelCommision.text = [NSString stringWithFormat:@"Mobile Wallet: %@ %@", [json valueForKey:@"Walletcommission"],[json valueForKey:@"ccyfrom"]];
                    [Crs_sharedvariable sharedMySingleton].crs_WalletCommision = [json valueForKey:@"Walletcommission"];
                }
                else{
                    self.crs_KickLabelCommision.text = [NSString stringWithFormat:@"Cash Pick-Up: %@ %@", [json valueForKey:@"cashcommission"],[json valueForKey:@"ccyfrom"]];
                }
                self.crs_cashComission.text = [NSString stringWithFormat:@"Transfer Comission: %@",[json valueForKey:@"commission"]];
                [Crs_sharedvariable sharedMySingleton].crs_CashPayCommison = [json valueForKey:@"cashcommission"];
                [Crs_sharedvariable sharedMySingleton].crs_WalletCommision = [json valueForKey:@"Walletcommission"];
                
            }
            else{
                self.crs_TextField1.text=@"";
                NSString * crs_CommisionRate = [NSString stringWithFormat:@"Account Credit: 0 "];
                self.crs_KickLabelCommision.text = [NSString stringWithFormat:@"Cash Pick-Up: 0 "];
                self.crs_CommisionChargeLabel.text = crs_CommisionRate;
                
                [Crs_sharedvariable sharedMySingleton ].crs_CommisionRate = @"";
                [Crs_sharedvariable sharedMySingleton].crs_PayInAmount    = @"";
                [Crs_sharedvariable sharedMySingleton].crs_PayOUtAmount    = @"";
                
                //
                
                self.Crs_RateLabel.text=[NSString stringWithFormat:@""];
                [Crs_sharedvariable sharedMySingleton].crs_RateDisplayingMethod = [NSString stringWithFormat:@""];
                
                
                
                
                //self.crs_KickLabelCommision.text = [NSString stringWithFormat:@"Kick Start Here"];
                self.crs_cashComission.text = @"";
                [Crs_sharedvariable sharedMySingleton].crs_CashPayCommison = @"";
                [Crs_sharedvariable sharedMySingleton].crs_WalletCommision = @"";
                
                
                
                
                
                
            }
            
            NSLog(@"%@", [json valueForKey:@"message"]);
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}




-(void)textFieldDidChange1 :(UITextField *)theTextField{
    NSLog( @"text changed: %@", theTextField.text);
    
    if ([_crs_Countrycode1.text isEqualToString:@""]) {
        self.crs_TextField.text = @"";
    }
    [Crs_sharedvariable sharedMySingleton ].crs_Reverse = @"Reverse";
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    [spinner startAnimating];
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_GetExchangeReverese];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    
    
    
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    
    
    
    [mapData setObject: self.crs_Countrycode1.text forKey:@"ccyto"];
    
    [mapData setObject: self.crs_CountryCode.text forKey:@"ccyfrom"];
    
    [mapData setObject:theTextField.text forKey:@"tovalue"];
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [spinner stopAnimating];
            NSLog(@"error %@",error);
            NSLog(@"data %@",data);
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json );
            
            
            if([[json valueForKey:@"message"]isEqualToString:@"Success"])
            {
                NSString * totalRate = [NSString stringWithFormat:@"%@",[json valueForKey:@"TotalRate1"]];
                if ([totalRate isEqualToString:@"(null)"]||[totalRate isEqualToString:@""]) {
                    NSLog(@"Venkatesh");
                    totalRate = [totalRate stringByReplacingOccurrencesOfString:@"(null)"withString:@""];;
                    NSLog(@"%@ Anusha",totalRate);
                    
                    
                }
                self.crs_TextField.text = totalRate;
                NSLog(@"%@",[json valueForKey:@"TotalRate1"]);
                
                
                //                if ([[json valueForKey:@"ccyto"]isEqualToString:@"VND"]||[[json valueForKey:@"ccyto"]isEqualToString:@"SLR"]) {
                //
                //
                //                    NSString * totalRate = [NSString stringWithFormat:@"%@",[json valueForKey:@"TotalRate"]];
                //
                //                    self.crs_TextField1.text = [NSString stringWithFormat:@"%.f",[totalRate floatValue]];
                //
                //
                //
                //
                //                }
                
                
                
                NSString * crs_CommisionRate = [NSString stringWithFormat:@"Account Credit:%@ %@",[json valueForKey:@"commission"],[json valueForKey:@"ccyfrom"]];
                [Crs_sharedvariable sharedMySingleton].crs_selectedCoutryCurrencyCode = [json valueForKey:@"ccyto"];
                
                [Crs_sharedvariable sharedMySingleton].crs_FromCountry1 = [json valueForKey:@"ccyfrom"];
                
                
                self.crs_CommisionChargeLabel.text = crs_CommisionRate;
                
                
                [Crs_sharedvariable sharedMySingleton ].crs_CommisionRate = [json valueForKey:@"commission"];
                [Crs_sharedvariable sharedMySingleton].crs_PayInAmount    = theTextField.text;
                [Crs_sharedvariable sharedMySingleton].crs_PayOUtAmount    = totalRate;
                
                float f1=[[json valueForKey:@"INR"]floatValue];
                NSString *Crs_rate=[NSString stringWithFormat:@"%.2f",f1];
                
                self.Crs_RateLabel.text=[NSString stringWithFormat:@"Rate: 1 %@ = %@ %@",[json valueForKey:@"ccyfrom"],Crs_rate,[json valueForKey:@"ccyto"]];
                [Crs_sharedvariable sharedMySingleton].crs_RateDisplayingMethod = [NSString stringWithFormat:@"1%@ = %@ %@",[json valueForKey:@"ccyfrom"],Crs_rate,[json valueForKey:@"ccyto"]];
                if ([[json valueForKey:@"ccyto"]isEqualToString:@"USD"]||[[json valueForKey:@"ccyto"]isEqualToString:@"EUR"]||[[json valueForKey:@"ccyto"]isEqualToString:@"AUD"]||[[json valueForKey:@"ccyto"]isEqualToString:@"GBP"]||[[json valueForKey:@"ccyto"]isEqualToString:@"NOK"]||[[json valueForKey:@"ccyto"]isEqualToString:@"DKK"]||[[json valueForKey:@"ccyto"]isEqualToString:@"SEK"]||[[json valueForKey:@"ccyto"]isEqualToString:@"SLL"]) {
                    
                    self.crs_KickLabelCommision.text = @"Cash Pick-Up :N/A";
                    
                    
                }
                else if ([[json valueForKey:@"ccyto"]isEqualToString:@"KES"]||[[json valueForKey:@"ccyto"]isEqualToString:@"TZS"]||[[json valueForKey:@"ccyto"]isEqualToString:@"UGX"]||[[json valueForKey:@"ccyto"]isEqualToString:@"GHS"]||[[json valueForKey:@"ccyto"]isEqualToString:@"NGN"]||[[json valueForKey:@"ccyto"]isEqualToString:@"RWF"]){
                    
                    self.crs_KickLabelCommision.text = [NSString stringWithFormat:@"Mobile Wallet: %@ %@", [json valueForKey:@"Walletcommission"],[json valueForKey:@"ccyfrom"]];
                    [Crs_sharedvariable sharedMySingleton].crs_WalletCommision = [json valueForKey:@"Walletcommission"];
                }
                else{
                    self.crs_KickLabelCommision.text = [NSString stringWithFormat:@"Cash Pick-Up: %@ %@", [json valueForKey:@"cashcommission"],[json valueForKey:@"ccyfrom"]];
                }
                self.crs_cashComission.text = [NSString stringWithFormat:@"Transfer Comission: %@",[json valueForKey:@"commission"]];
                [Crs_sharedvariable sharedMySingleton].crs_CashPayCommison = [json valueForKey:@"cashcommission"];
            }
            
            
            
            else{
                self.crs_TextField.text=@"";
                NSString * crs_CommisionRate = [NSString stringWithFormat:@"Account Credit:0 "];
                self.crs_KickLabelCommision.text = [NSString stringWithFormat:@"Cash Pick-Up: 0 "];
                self.crs_CommisionChargeLabel.text = crs_CommisionRate;
                
                
                
                [Crs_sharedvariable sharedMySingleton ].crs_CommisionRate  =  @"";
                [Crs_sharedvariable sharedMySingleton].crs_PayInAmount     =  @"";
                [Crs_sharedvariable sharedMySingleton].crs_PayOUtAmount    =  @"";
                
                self.Crs_RateLabel.text=[NSString stringWithFormat:@""];
                
                [Crs_sharedvariable sharedMySingleton].crs_RateDisplayingMethod = [NSString stringWithFormat:@""];
                
                //self.crs_KickLabelCommision.text = [NSString stringWithFormat:@"Kick Start Here"];
                self.crs_cashComission.text = @"";
                [Crs_sharedvariable sharedMySingleton].crs_CashPayCommison = @"";
                [Crs_sharedvariable sharedMySingleton].crs_WalletCommision = @"";
            }
            
            NSLog(@"%@", [json valueForKey:@"message"]);
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}
















- (IBAction)menuAction:(id)sender {
    self.crs_UpdateProfile.hidden = YES;
    [self.view endEditing:YES];
    
    
    menuviewViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"MenuViewControllerSID"];
    
    
    
    [self addChildViewController:MenuViewControllerOBJ];
    [MenuViewControllerOBJ didMoveToParentViewController:self];
    MenuViewControllerOBJ.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
    [self.view addSubview:MenuViewControllerOBJ.view];
    
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == _crs_CountryListTableView) {
        
        if (!isFiltered) {
            return crs_CountryList.count;
        }
        else{
            
            return searchArray.count;
            
        }
        
    }
    else
    {
        
        
        
        return 10;
        
    }
    
    
}

//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
//{
//    return 10;
//}



-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _crs_CountryListTableView) {
        
        
        
        
        
        
        
        CountryListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LOGIN_CELL"];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:@"DashboardSID"];
        }
        if (!isFiltered) {
            cell.countryName.text = [[crs_CountryList valueForKey:@"country_name" ]  objectAtIndex:indexPath.row];
            
            
            NSString *urlStTemp =[NSString stringWithFormat:@"%@",[[crs_CountryList valueForKey:@"country_image" ]  objectAtIndex:indexPath.row]];
            
            NSURL *urlim    = [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlStTemp]];
            
            [cell.countryImage sd_setImageWithURL:urlim];
            
            
        }
        else{
            
            
            cell.countryName.text = [[searchArray valueForKey:@"country_name" ]  objectAtIndex:indexPath.row];
            
            
            NSString *urlStTemp =[NSString stringWithFormat:@"%@",[[searchArray valueForKey:@"country_image" ]  objectAtIndex:indexPath.row]];
            
            NSURL *urlim    = [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlStTemp]];
            
            [cell.countryImage sd_setImageWithURL:urlim];
            
            
        }
        
        
        
        //tableView.tableFooterView=[[UIView alloc]init];
        
        
        return cell;
        
        
        
    }
    else{
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DashboardSID"];
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:@"DashboardSID"];
            
            
            
            
        }
        
        
        
        
        
        
        
        //tableView.tableFooterView=[[UIView alloc]init];
        
        
        return cell;
        
        
        
        
    }
    
    
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (tableView == _crs_CountryListTableView) {
        
        if ([countryListCompare isEqualToString:@"CountryNames"]) {
            //            self.crs_TextField.text = @"";
            //            self.crs_TextField1.text = @"";
            self.Crs_RateLabel.text = @"";
            self.crs_CountryListView.hidden=YES;
            
            
            
            if (!isFiltered) {
                NSString *urlStTemp =[NSString stringWithFormat:@"%@",[[crs_CountryList valueForKey:@"country_image" ]  objectAtIndex:indexPath.row]];
                
                NSURL *urlim    = [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlStTemp]];
                
                [ self.crs_CountryImage sd_setImageWithURL : urlim ];
                
                self.crs_Countrycode1.text = [[crs_CountryList valueForKey:@"country_code" ]  objectAtIndex:indexPath.row];
                ReciverCountry = [[crs_CountryList valueForKey:@"country_name" ]  objectAtIndex:indexPath.row];
                [Crs_sharedvariable sharedMySingleton].crs_FromIsoCode =[[crs_CountryList valueForKey:@"countryisocode"]objectAtIndex:indexPath.row];
                
                NSLog(@"My From Iso Code is %@ ",[Crs_sharedvariable sharedMySingleton].crs_FromIsoCode);
                
                self.crs_DestinationOut.hidden = YES;
                self.crs_SelectDestinationLabel.hidden = YES;
                self.crs_Destination2.hidden = YES;
                self.line1.hidden = YES;
                self.crs_SecondField.hidden = YES;
                self.crs_TextField1.hidden = NO;
                [self excatValue:_crs_TextField.text];
                
                
            }
            
            else{
                NSString *urlStTemp =[NSString stringWithFormat:@"%@",[[searchArray valueForKey:@"country_image" ]  objectAtIndex:indexPath.row]];
                
                NSURL *urlim    = [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlStTemp]];
                
                [ self.crs_CountryImage sd_setImageWithURL : urlim ];
                
                
                self.crs_Countrycode1.text = [[searchArray valueForKey:@"country_code" ]  objectAtIndex:indexPath.row];
                ReciverCountry = [[searchArray valueForKey:@"country_name" ]  objectAtIndex:indexPath.row];
                
                [Crs_sharedvariable sharedMySingleton].crs_FromIsoCode =[[searchArray valueForKey:@"countryisocode"]objectAtIndex:indexPath.row];
                
                self.crs_Destination2.hidden = YES;
                self.crs_DestinationOut.hidden = YES;
                self.crs_SelectDestinationLabel.hidden = YES;
                self.line1.hidden = YES;
                self.crs_SecondField.hidden = YES;
                self.crs_TextField1.hidden = NO;
                [self excatValue:_crs_TextField.text];
                
                [self.view endEditing:YES];
                
            }
            
        }
        
        else if ([countryListCompare isEqualToString:@"CountryNames1"]) {
            //            self.crs_TextField.text = @"";
            //            self.crs_TextField1.text = @"";
            self.Crs_RateLabel.text = @"";
            self.crs_CountryListView.hidden=YES;
            
            
            
            if (!isFiltered) {
                NSString *urlStTemp =[NSString stringWithFormat:@"%@",[[crs_CountryList valueForKey:@"country_image" ]  objectAtIndex:indexPath.row]];
                
                NSURL *urlim    = [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlStTemp]];
                
                [ self.crs_CountryImage1 sd_setImageWithURL : urlim ];
                
                self.crs_CountryCode.text = [[crs_CountryList valueForKey:@"country_code" ]  objectAtIndex:indexPath.row];
                
                FromCountry = [[crs_CountryList valueForKey:@"country_name" ]  objectAtIndex:indexPath.row];
                
                [Crs_sharedvariable sharedMySingleton].crs_SourceIsoCode =[[crs_CountryList valueForKey:@"countryisocode"]objectAtIndex:indexPath.row];
                
                
                NSLog(@"Hi My source code is @@@ %@", [Crs_sharedvariable sharedMySingleton].crs_SourceIsoCode);
                
                self.crs_SourceCountryOut.hidden = YES;
                self.crs_SelectSourceLabel.hidden = YES;
                self.crs_Source2.hidden = YES;
                self.line2.hidden = YES;
                self.crs_FirstField.hidden = YES;
                self.crs_TextField.hidden = NO;
                [self excatValue:_crs_TextField.text];
                
                
            }
            
            else{
                NSString *urlStTemp =[NSString stringWithFormat:@"%@",[[searchArray valueForKey:@"country_image" ]  objectAtIndex:indexPath.row]];
                
                NSURL *urlim    = [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlStTemp]];
                
                [ self.crs_CountryImage1 sd_setImageWithURL : urlim ];
                
                
                self.crs_CountryCode.text = [[searchArray valueForKey:@"country_code" ]  objectAtIndex:indexPath.row];
                FromCountry = [[searchArray valueForKey:@"country_name" ]  objectAtIndex:indexPath.row];
                [Crs_sharedvariable sharedMySingleton].crs_SourceIsoCode =[[searchArray valueForKey:@"countryisocode"]objectAtIndex:indexPath.row];
                
                self.crs_SelectSourceLabel.hidden = YES;
                self.crs_Source2.hidden = YES;
                self.crs_FirstField.hidden = YES;
                [self excatValue:_crs_TextField.text];
                self.crs_SourceCountryOut.hidden = YES;
                self.crs_TextField.hidden = NO;
                self.line2.hidden = YES;
                [self.view endEditing:YES];
                
            }
            
        }
        else
        {
            
            
            self.crs_CountryListView.hidden=YES;
            NSString *urlStTemp =[NSString stringWithFormat:@"%@",[[crs_CountryList valueForKey:@"country_image" ]  objectAtIndex:indexPath.row]];
            
            NSURL *urlim    = [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlStTemp]];
            
            [ self.crs_CountryImage1 sd_setImageWithURL : urlim ];
            
            self.crs_CountryCode.text = [[crs_CountryList valueForKey:@"country_code" ]  objectAtIndex:indexPath.row];
            //            [Crs_sharedvariable sharedMySingleton].crs_source1 =[[crs_CountryList valueForKey:@"countryisocode"]objectAtIndex:indexPath.row];
            //
            
            // Dont Delete These ..
            // [self excatValue1:_crs_TextField.text];
            
            self.crs_DestinationOut.hidden = YES;
            [self excatValue:_crs_TextField.text];
            
        }
        
        
        
    }
    
    else{
        
        
        
        
    }
    
    
    isFiltered=NO;
    
}
//
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//
//
//    //1. Setup the CATransform3D structure
//    CATransform3D rotation;
//    rotation = CATransform3DMakeRotation( (12.0*M_PI)/80, 0.0, 16, 0.4);
//    rotation.m34 = 1/ 100;
//
//
//    //2. Define the initial state (Before the animation)
//    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//    cell.alpha = 0;
//
//    cell.layer.transform = rotation;
//    cell.layer.anchorPoint = CGPointMake(0, 10);
//
//
//    //3. Define the final state (After the animation) and commit the animation
//    [UIView beginAnimations:@"rotation" context:NULL];
//    [UIView setAnimationDuration:1.0];
//    cell.layer.transform = CATransform3DIdentity;
//    cell.alpha = 1;
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//    [UIView commitAnimations];
//
//}

//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    cell.layer.shadowOffset = CGSizeMake(5, 5);
//    cell.alpha = 0;
//
//    //2. Define the final state (After the animation) and commit the animation
//    [UIView beginAnimations:@"rotation" context:NULL];
//    [UIView setAnimationDuration:0.5];
//    cell.transform = CGAffineTransformMakeTranslation(0.f, 0);
//    cell.alpha = 1;
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//    [UIView commitAnimations];
//}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 1;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"DashboardCollectionviewSID";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    
    return cell;
    
}








- (IBAction)crs_ProceedAction:(id)sender {
    [self.view endEditing:YES];
    
    //  timer = [NSTimer scheduledTimerWithTimeInterval:0.10 target:self selector:@selector(Crs_WebCallOk) userInfo:nil repeats:YES];
    
    //[self performSelector:@selector(Crs_WebCallOk) withObject:nil afterDelay:0.0];
    if ([CHarityCountry isEqualToString:@"UNITED STATES"]||[CHarityCountry isEqualToString:@"HONG KONG"]||[CHarityCountry isEqualToString:@"GHANA"]) {
        [self.view endEditing:YES];
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Money Transfer currently not available in your location" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    else{
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [self CheckCateogory];
        [self Crs_WebCallOk];
    }
    
    
}
- (IBAction)crs_SelectCountry:(id)sender {
    
    
    _crs_CountryListView.hidden = NO;
    _crs_CountryListView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    
    [self.view addSubview:_crs_CountryListView];
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        _crs_CountryListView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            _crs_CountryListView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                _crs_CountryListView.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    self.crs_search.text = @"";
    [self.view endEditing:YES];
    
    crs_CountryList=crs_CountryList1;
    
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"country_name" ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:descriptor];
    
    // here you will get sorted array in 'sortedArray'
    crs_CountryList = [[crs_CountryList sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
    NSMutableArray * Ary=[NSMutableArray new];
    
    for (int i=0; i<crs_CountryList.count; i++) {
        if ([[[crs_CountryList valueForKey:@"country_status"]objectAtIndex:i]isEqualToString:@"2"]||[[[crs_CountryList valueForKey:@"country_status"]objectAtIndex:i]isEqualToString:@"3"]) {
            
            
            NSMutableDictionary * dict=[NSMutableDictionary new];
            dict =[crs_CountryList objectAtIndex:i];
            [Ary addObject:dict];
        }
        
        
        
    }
    
    
    
    
    
    crs_CountryList =Ary;
    
    countryListCompare = @"CountryNames1";
    self.crs_CountryListView.hidden=NO;
    [self.crs_CountryListTableView reloadData];
    
    
    
    
    
}

- (IBAction)crs_SelectCountry1:(id)sender {
    
    _crs_CountryListView.hidden = NO;
    _crs_CountryListView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    
    [self.view addSubview:_crs_CountryListView];
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        _crs_CountryListView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            _crs_CountryListView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                _crs_CountryListView.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    self.crs_search.text = @"";
    [self.view endEditing:YES];
    //crs_CountryList=crs_CountryList1;
    
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"country_name" ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:descriptor];
    
    // here you will get sorted array in 'sortedArray'
    crs_CountryList = [[crs_CountryList1 sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
    
    NSLog(@"%@",crs_CountryList);
    
    
    
    
    
    
    
    
    
    NSMutableArray * Ary;
    Ary=[NSMutableArray new];
    for (int i=0; i<crs_CountryList.count; i++) {
        
        @try {
            if ([[[crs_CountryList valueForKey:@"country_status"]objectAtIndex:i]isEqualToString:@"2"]||[[[crs_CountryList valueForKey:@"country_status"]objectAtIndex:i]isEqualToString:@"1"]) {
                
                
                NSMutableDictionary * dict=[NSMutableDictionary new];
                dict =[crs_CountryList objectAtIndex:i];
                [Ary addObject:dict];
            }
            
        } @catch (NSException *exception) {
            NSLog(@"Excp%@",exception);
        } @finally {
            
        }
        
        
        
        
        
        
    }
    
    crs_CountryList =Ary;
    
    
    
    
    
    countryListCompare = @"CountryNames";
    self.crs_CountryListView.hidden=NO;
    [self.crs_CountryListTableView reloadData];
    
    
    
}


-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    
    [[self view] endEditing:YES];
    return YES;
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}

-(void)excatValue:(NSString * )str{
    [Crs_sharedvariable sharedMySingleton].crs_Reverse = @"Direct";
    
    if ([_crs_CountryCode.text isEqualToString:@""]) {
        self.crs_TextField1.text = @"";
    }
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
    }
    [spinner startAnimating];
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_GetExchangeRate];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    [mapData setObject: self.crs_CountryCode.text forKey:@"ccyfrom"];
    
    [mapData setObject:self.crs_Countrycode1.text forKey:@"ccyto"];
    
    [mapData setObject:str forKey:@"fromvalue"];
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [spinner stopAnimating];
            
            NSLog(@"error %@",error);
            NSLog(@"data %@",data);
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json );
            
            
            if([[json valueForKey:@"message"]isEqualToString:@"Success"])
            {
                NSString * totalRate = [NSString stringWithFormat:@"%@",[json valueForKey:@"TotalRate1"]];
                if ([totalRate isEqualToString:@"(null)"]||[totalRate isEqualToString:@""]) {
                    NSLog(@"Venkatesh");
                    totalRate = [totalRate stringByReplacingOccurrencesOfString:@"(null)"withString:@""];;
                    NSLog(@"%@ Anusha",totalRate);
                    
                    
                }
                self.crs_TextField1.text = totalRate;
                NSLog(@"%@",[json valueForKey:@"TotalRate1"]);
                
                
                //                if ([[json valueForKey:@"ccyto"]isEqualToString:@"VND"]||[[json valueForKey:@"ccyto"]isEqualToString:@"SLR"]) {
                //
                //
                //                    NSString * totalRate = [NSString stringWithFormat:@"%@",[json valueForKey:@"TotalRate"]];
                //
                //                    self.crs_TextField1.text = [NSString stringWithFormat:@"%.f",[totalRate floatValue]];
                //
                //
                //
                //
                //                }
                //
                
                
                
                NSString * crs_CommisionRate = [NSString stringWithFormat:@"Account Credit: %@ %@",[json valueForKey:@"commission"],[json valueForKey:@"ccyfrom"]];
                
                
                [Crs_sharedvariable sharedMySingleton].crs_FromCountry1 = [json valueForKey:@"ccyfrom"];
                
                
                self.crs_CommisionChargeLabel.text = crs_CommisionRate;
                [Crs_sharedvariable sharedMySingleton].crs_selectedCoutryCurrencyCode = [json valueForKey:@"ccyto"];
                
                [Crs_sharedvariable sharedMySingleton ].crs_CommisionRate = [json valueForKey:@"commission"];
                [Crs_sharedvariable sharedMySingleton].crs_PayInAmount    = totalRate;
                [Crs_sharedvariable sharedMySingleton].crs_PayOUtAmount    = str;
                
                float f1=[[json valueForKey:@"INR"]floatValue];
                NSString *Crs_rate=[NSString stringWithFormat:@"%.2f",f1];
                
                self.Crs_RateLabel.text=[NSString stringWithFormat:@"Rate: 1 %@ = %@ %@ ",[json valueForKey:@"ccyfrom"],Crs_rate,[json valueForKey:@"ccyto"]];
                
                [Crs_sharedvariable sharedMySingleton].crs_RateDisplayingMethod = [NSString stringWithFormat:@"1 %@ = %@ %@ ",[json valueForKey:@"ccyfrom"],Crs_rate,[json valueForKey:@"ccyto"]];
                
                if ([[json valueForKey:@"ccyto"]isEqualToString:@"USD"]||[[json valueForKey:@"ccyto"]isEqualToString:@"EUR"]||[[json valueForKey:@"ccyto"]isEqualToString:@"AUD"]||[[json valueForKey:@"ccyto"]isEqualToString:@"GBP"]||[[json valueForKey:@"ccyto"]isEqualToString:@"NOK"]||[[json valueForKey:@"ccyto"]isEqualToString:@"SEK"]||[[json valueForKey:@"ccyto"]isEqualToString:@"DKK"]) {
                    
                    self.crs_KickLabelCommision.text = @"Cash Pick-Up :N/A";
                    
                    
                }
                
                else if ([[json valueForKey:@"ccyto"]isEqualToString:@"KES"]||[[json valueForKey:@"ccyto"]isEqualToString:@"TZS"]||[[json valueForKey:@"ccyto"]isEqualToString:@"UGX"]||[[json valueForKey:@"ccyto"]isEqualToString:@"GHS"]||[[json valueForKey:@"ccyto"]isEqualToString:@"NGN"]||[[json valueForKey:@"ccyto"]isEqualToString:@"RWF"]){
                    
                    self.crs_KickLabelCommision.text = [NSString stringWithFormat:@"Mobile Wallet: %@ %@", [json valueForKey:@"Walletcommission"],[json valueForKey:@"ccyfrom"]];
                    [Crs_sharedvariable sharedMySingleton].crs_WalletCommision = [json valueForKey:@"Walletcommission"];
                }
                
                else{
                    self.crs_KickLabelCommision.text = [NSString stringWithFormat:@"Cash Pick-Up: %@ %@", [json valueForKey:@"cashcommission"],[json valueForKey:@"ccyfrom"]];
                }
                self.crs_cashComission.text = [NSString stringWithFormat:@"Transfer Comission: %@",[json valueForKey:@"commission"]];
                [Crs_sharedvariable sharedMySingleton].crs_CashPayCommison = [json valueForKey:@"cashcommission"];
                
            }
            else{
                self.crs_TextField1.text=@"";
                NSString * crs_CommisionRate = [NSString stringWithFormat:@"Account Credit: 0 "];
                self.crs_KickLabelCommision.text = [NSString stringWithFormat:@"Cash Pick-Up: 0 "];
                self.crs_CommisionChargeLabel.text = crs_CommisionRate;
                
                [Crs_sharedvariable sharedMySingleton ].crs_CommisionRate = @"";
                [Crs_sharedvariable sharedMySingleton].crs_PayInAmount    = @"";
                [Crs_sharedvariable sharedMySingleton].crs_PayOUtAmount    = @"";
                
                
                
                self.Crs_RateLabel.text=[NSString stringWithFormat:@""];
                [Crs_sharedvariable sharedMySingleton].crs_RateDisplayingMethod = [NSString stringWithFormat:@""];
                
                
                
                
                //self.crs_KickLabelCommision.text = [NSString stringWithFormat:@"Kick Start Here"];
                self.crs_cashComission.text = @"";
                [Crs_sharedvariable sharedMySingleton].crs_CashPayCommison = @"";
                [Crs_sharedvariable sharedMySingleton].crs_WalletCommision = @"";
                
            }
            
            NSLog(@"%@", [json valueForKey:@"message"]);
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
}


-(void)excatValue1:(NSString * )str{
    [Crs_sharedvariable sharedMySingleton].crs_Reverse = @"Reverse";
    if ([_crs_Countrycode1.text isEqualToString:@""]) {
        self.crs_TextField1.text = @"";
    }
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    
    
    
    [spinner startAnimating];
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_GetExchangeReverese];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    
    
    
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    [mapData setObject: self.crs_Countrycode1.text forKey:@"ccyto"];
    
    [mapData setObject: self.crs_CountryCode.text forKey:@"ccyfrom"];
    
    [mapData setObject:str forKey:@"tovalue"];
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [spinner stopAnimating];
            
            NSLog(@"error %@",error);
            NSLog(@"data %@",data);
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json );
            
            
            if([[json valueForKey:@"message"]isEqualToString:@"Success"])
            {
                NSString * totalRate = [NSString stringWithFormat:@"%@",[json valueForKey:@"TotalRate1"]];
                
                
                if ([totalRate isEqualToString:@"(null)"]||[totalRate isEqualToString:@""]) {
                    NSLog(@"Venkatesh");
                    totalRate = [totalRate stringByReplacingOccurrencesOfString:@"(null)"withString:@""];;
                    NSLog(@"%@ Anusha",totalRate);
                    
                    
                }
                
                self.crs_TextField.text = totalRate;
                NSLog(@"%@",[json valueForKey:@"TotalRate1"]);
                
                //                if ([[json valueForKey:@"ccyto"]isEqualToString:@"VND"]||[[json valueForKey:@"ccyto"]isEqualToString:@"SLR"]) {
                //
                //
                //                    NSString * totalRate = [NSString stringWithFormat:@"%@",[json valueForKey:@"TotalRate"]];
                //
                //                    self.crs_TextField1.text = [NSString stringWithFormat:@"%.f",[totalRate floatValue]];
                //
                //
                //
                //
                //                }
                //
                
                
                NSString * crs_CommisionRate = [NSString stringWithFormat:@"Account Credit:%@ %@",[json valueForKey:@"commission"],[json valueForKey:@"ccyfrom"]];
                [Crs_sharedvariable sharedMySingleton].crs_FromCountry1 = [json valueForKey:@"ccyfrom"] ;
                [Crs_sharedvariable sharedMySingleton].crs_selectedCoutryCurrencyCode = [json valueForKey:@"ccyto"];
                
                self.crs_CommisionChargeLabel.text = crs_CommisionRate;
                
                
                [Crs_sharedvariable sharedMySingleton ].crs_CommisionRate = [json valueForKey:@"commission"];
                [Crs_sharedvariable sharedMySingleton].crs_PayInAmount    = totalRate;
                [Crs_sharedvariable sharedMySingleton].crs_PayOUtAmount    = str;
                
                float f1=[[json valueForKey:@"INR"]floatValue];
                NSString *Crs_rate=[NSString stringWithFormat:@"%.2f",f1];
                
                self.Crs_RateLabel.text=[NSString stringWithFormat:@"Rate: 1 %@ = %@ %@",[json valueForKey:@"ccyfrom"],Crs_rate,[json valueForKey:@"ccyto"]];
                [Crs_sharedvariable sharedMySingleton].crs_RateDisplayingMethod = [NSString stringWithFormat:@"1%@ = %@ %@",[json valueForKey:@"ccyfrom"],Crs_rate,[json valueForKey:@"ccyto"]];
                if ([[json valueForKey:@"ccyto"]isEqualToString:@"USD"]||[[json valueForKey:@"ccyto"]isEqualToString:@"EUR"]||[[json valueForKey:@"ccyto"]isEqualToString:@"AUD"]||[[json valueForKey:@"ccyto"]isEqualToString:@"GBP"]||[[json valueForKey:@"ccyto"]isEqualToString:@"NOK"]||[[json valueForKey:@"ccyto"]isEqualToString:@"SEK"]||[[json valueForKey:@"ccyto"]isEqualToString:@"DKK"]||[[json valueForKey:@"ccyto"]isEqualToString:@"SLL"]) {
                    
                    self.crs_KickLabelCommision.text = @"Cash Pick-Up :N/A";
                    
                    
                }
                else if ([[json valueForKey:@"ccyto"]isEqualToString:@"KES"]||[[json valueForKey:@"ccyto"]isEqualToString:@"TZS"]||[[json valueForKey:@"ccyto"]isEqualToString:@"UGX"]||[[json valueForKey:@"ccyto"]isEqualToString:@"GHS"]||[[json valueForKey:@"ccyto"]isEqualToString:@"NGN"]||[[json valueForKey:@"ccyto"]isEqualToString:@"RWF"]){
                    
                    self.crs_KickLabelCommision.text = [NSString stringWithFormat:@"Mobile Wallet: %@ %@", [json valueForKey:@"Walletcommission"],[json valueForKey:@"ccyfrom"]];
                    [Crs_sharedvariable sharedMySingleton].crs_WalletCommision = [json valueForKey:@"Walletcommission"];
                }
                else{
                    self.crs_KickLabelCommision.text = [NSString stringWithFormat:@"Cash Pick-Up: %@ %@",[json valueForKey:@"cashcommission"],[json valueForKey:@"ccyfrom"]];
                    
                    
                    
                    
                }
                self.crs_cashComission.text = [NSString stringWithFormat:@"Transfer Comission: %@",[json valueForKey:@"commission"]];
                [Crs_sharedvariable sharedMySingleton].crs_CashPayCommison = [json valueForKey:@"cashcommission"];
            }
            else{
                self.crs_TextField.text=@"";
                NSString * crs_CommisionRate = [NSString stringWithFormat:@"Account Credit:0 "];
                self.crs_KickLabelCommision.text = [NSString stringWithFormat:@"Cash Pick-Up:0 "];
                self.crs_CommisionChargeLabel.text = crs_CommisionRate;
                
                
                
                [Crs_sharedvariable sharedMySingleton ].crs_CommisionRate  =  @"";
                [Crs_sharedvariable sharedMySingleton].crs_PayInAmount     =  @"";
                [Crs_sharedvariable sharedMySingleton].crs_PayOUtAmount    =  @"";
                
                self.Crs_RateLabel.text=[NSString stringWithFormat:@""];
                
                [Crs_sharedvariable sharedMySingleton].crs_RateDisplayingMethod = [NSString stringWithFormat:@""];
                
                //self.crs_KickLabelCommision.text = [NSString stringWithFormat:@"Kick Start Here"];
                self.crs_cashComission.text = @"";
                [Crs_sharedvariable sharedMySingleton].crs_CashPayCommison = @"";
                [Crs_sharedvariable sharedMySingleton].crs_WalletCommision = @"";
            }
            
            NSLog(@"%@", [json valueForKey:@"message"]);
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
    
}

-(void)webservice{
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:@"https://ws.crosspaymt.com/Crosspayprod/beneficiary/viewbycountry"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    
    
    
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    [mapData setObject: self.crs_Countrycode1.text forKey:@"country_name"];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId
                forKey:@"user_id"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
    
    
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            
            NSLog(@"error %@",error);
            NSLog(@"data %@",data);
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json );
            
            
            
            
            NSLog(@"%@", [json valueForKey:@"message"]);
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
    
    
    
}


-(void)clearNumberPad{
    [_crs_TextField1 resignFirstResponder];
    [_crs_TextField resignFirstResponder];
    
    [_crs_TextField1 becomeFirstResponder];
    _crs_TextField1.text = @"";
    _crs_TextField.text = @"";
    _crs_search.text = @"";
    [_crs_search resignFirstResponder];
    
    
}

-(void)doneWithNumberPad{
    //NSString *numberFromTheKeyboard = self.crs_SelectBranch.text;
    [_crs_TextField1 resignFirstResponder];
    [_crs_TextField resignFirstResponder];
    [_crs_search resignFirstResponder];
    
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
            iosReview1 = [NSString stringWithFormat:@"%@",[json valueForKey:@"IOSREVIEW"]];
            
            if ([iosReview1 isEqualToString:@"1"]) {
                self.crs_Skipout1.hidden = NO;
            } else {
                self.crs_Skipout1.hidden = YES;
            }
            
            if ([version isEqualToString:[json valueForKey:@"currentVersion"]]) {
                NSLog(@"My Version is %@",version);
                
            }
            else{
                
                
                self.crs_versionview.hidden = NO;
                
            }
            
        });
        
    }];
    
    [dataTask resume];
    
    
    
    
    
    
    
    
    
}


- (IBAction)crs_UpdateVersion:(id)sender {
    NSString *iTunesLink = @"https://itunes.apple.com/in/app/crosspay/id1312224710?mt=8";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
    
    
    
    
}

- (IBAction)crs_Remind:(id)sender {
    
    self.crs_versionview.hidden = YES;
    
}


-(void)viewWillAppear:(BOOL)animated
{
    
    
    //
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"Home View controller"];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    //
}



#pragma mark -Searchmethod

-(void)textFieldDidChanges:(UITextField *)textField
{
    self.searchTextString=textField.text;
    [self updateSearchArray:self.searchTextString];
    
    
    
    
}

-(void)updateSearchArray:(NSString *)searchText
{
    searchArray = [NSMutableArray new];
    
    if(searchText.length==0)
    {
        isFiltered=NO;
        searchArray = crs_CountryList;
        NSLog(@"%@",searchArray);
        [self.crs_CountryListTableView reloadData ];
    }
    else
    {
        isFiltered=YES;
        
        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in crs_CountryList){
            NSString * string= [NSString stringWithFormat:@"%@",[dic valueForKey:@"country_name"]] ;
            
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                
                // NSString * Ary_id=[dic valueForKey:@"id"];
                
                [searchArray addObject:dic];
                
                NSLog(@"search %@",searchArray);
                
            }
        }
        
        
        
        /// historyArray = searchArray;
        [self.crs_CountryListTableView reloadData ];
        
        
    }
    
    
    
}
-(void)PromoCode{
    
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_Promo];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    
    NSDate *date1 = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    // [format setDateFormat:@"yyyy-MM-dd"];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSString* finalDateString = [format stringFromDate:date1];
    
    
    //[mapData setObject:finalDateString forKey:@"date"];
    NSLog(@"Hello%@",finalDateString);
    
    
    
    //[mapData setObject:theTextField.text forKey:@"fromvalue"];
    
    
    
    
    
    // {"user_id":"5","ccycode":"GBP","accountccycode":"INR","date":"2018-06-05","amount":"10"}
    
    
    
    
    
    NSLog(@" Kunchala Promo %@",mapData);
    
    [Crs_sharedvariable sharedMySingleton].crs_PromoDictionary = mapData;
    
    [mapData setObject: self.crs_TextField.text forKey:@"amount"];
    [mapData setObject: self.crs_CountryCode.text forKey:@"ccycode"];
    [mapData setObject:self.crs_Countrycode1.text forKey:@"accountccycode"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
    [mapData setObject:finalDateString forKey:@"date"];
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [[crs_sharedmethods sharedMySingleton].Ary_view_LoadingBg removeFromSuperview];
            
            NSLog(@"error %@",error);
            NSLog(@"data %@",data);
            NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json );
            
            NSLog(@"%@", [json valueForKey:@"message"]);
            [Crs_sharedvariable sharedMySingleton].crs_PromoPassing = json;
            
            Status =  [NSString stringWithFormat:@"%@", [json valueForKey:@"status"]];
            if ([Status isEqualToString:@"200"]) {
                
                
                
                
                //             RecieverDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"RecieverDetailedViewControllerSID"];;
                //                viewController. = self.Crs_CashComparsion;
                //                viewController.Crs_banktransfercountry=self.crs_CountryField.text;
                //                viewController.TotalAmountPassing = [NSString stringWithFormat:@"%.2f",x+y];
                //                viewController.Purposecode1 = PurposeCode;
                //                viewController.Remitance1 = RemitanceCode;
                //                [self.navigationController pushViewController:viewController animated:YES];
            }
            
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
    
    
    
    
}

-(void)Crs_WebCallOk{
    [self.view endEditing:YES];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    //    [_crs_TextField1 becomeFirstResponder];
    //    [_crs_TextField becomeFirstResponder];
    
    [self PromoCode];
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    
    //
    // if ([_crs_Countrycode1.text isEqualToString:@"HKD"]||[_crs_CountryCode.text  isEqualToString:@"HKD"]||[_crs_Countrycode1.text isEqualToString:@"USD"]||[_crs_CountryCode.text isEqualToString:@"USD"])  {
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Money Transfer currently not available in your location" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //     [self.view endEditing:YES];
    //
    //
    //
    //
    //    }
    
    if ([_crs_CountryCode.text isEqualToString:@"HKD"]||[_crs_CountryCode.text isEqualToString:@"USD"])  {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Money Transfer currently not available in your location" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        [self.view endEditing:YES];
        
        
    }
    
    
    
    
    //
    //    else if ([_crs_Countrycode1.text isEqualToString:@"LKR"]||[_crs_Countrycode1.text isEqualToString:@"USD"]||[_crs_Countrycode1.text isEqualToString:@"HKD"]||[_crs_Countrycode1.text isEqualToString:@"LKR"]||[_crs_Countrycode1.text isEqualToString:@"SEK"]||[_crs_Countrycode1.text isEqualToString:@"CHF"]||[_crs_Countrycode1.text isEqualToString:@"TZS"]||[_crs_Countrycode1.text isEqualToString:@"TRY"]||[_crs_Countrycode1.text isEqualToString:@"INR"]||[_crs_Countrycode1.text isEqualToString:@"EUR"]||[_crs_Countrycode1.text isEqualToString:@"VND"]||[_crs_Countrycode1.text isEqualToString:@"USD"]||[_crs_Countrycode1.text isEqualToString:@"GBP"]||[_crs_Countrycode1.text isEqualToString:@"AED"]||([_crs_Countrycode1.text isEqualToString:@"SLL"]||[_crs_Countrycode1.text isEqualToString:@"SAR"]||[_crs_Countrycode1.text isEqualToString:@"RYN"]||[_crs_Countrycode1.text isEqualToString:@"QAR"]||[_crs_Countrycode1.text isEqualToString:@"PHP"]||[_crs_Countrycode1.text isEqualToString:@"PKR"]||[_crs_Countrycode1.text isEqualToString:@"NOK"]||[_crs_Countrycode1.text isEqualToString:@"NPR"]||[_crs_Countrycode1.text isEqualToString:@"MXN"]||[_crs_Countrycode1.text isEqualToString:@"KWD"]||[_crs_Countrycode1.text isEqualToString:@"KES"]||[_crs_Countrycode1.text isEqualToString:@"ILS"]||[_crs_Countrycode1.text isEqualToString:@"DKK"]||[_crs_Countrycode1.text isEqualToString:@"CNY"]||[_crs_Countrycode1.text isEqualToString:@"BGN"]||[_crs_Countrycode1.text isEqualToString:@"BHD"]||[_crs_Countrycode1.text isEqualToString:@"AUD"]||[_crs_Countrycode1.text isEqualToString:@"CHF"]||[_crs_Countrycode1.text isEqualToString:@"CHF"]||[_crs_CountryCode.text isEqualToString:@"HKD"]||[_crs_CountryCode.text isEqualToString:@"USD"]))  {
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Money Transfer currently not available in your location" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //        [_crs_TextField1 becomeFirstResponder];
    //        [_crs_TextField becomeFirstResponder];
    //
    // }
    //
    
    else if ([self.crs_TextField.text isEqualToString:@""]||[self.crs_TextField.text isEqualToString:@"0"]||[self.crs_TextField.text isEqualToString:@"0.00"]||[self.crs_TextField.text isEqualToString:@"(null)"])  {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please select from/to country and  enter correct send or receive amount to proceed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        [_crs_TextField1 becomeFirstResponder];
        [_crs_TextField becomeFirstResponder];
        
    }
    
    
    
    
    
    else if ([self.crs_TextField1.text isEqualToString:@"0"]||[self.crs_TextField1.text isEqualToString:@"0.00"]||[self.crs_TextField1.text isEqualToString:@"(null)"]||[self.crs_TextField1.text isEqualToString:@""])  {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please select from/to country and  enter correct send or receive amount to proceed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        [_crs_TextField1 becomeFirstResponder];
        [_crs_TextField becomeFirstResponder];
        
    }
    else if ([CoustmerId isEqualToString: @""]&&[_crs_Countrycode1.text isEqualToString:@"PKR"]&&[CHarityCountry isEqualToString:@"UNITED KINGDOM"])  {
        self.crs_UpdateProfile.hidden = NO;
        
        _crs_UpdateProfile.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
        
        [self.view addSubview:_crs_UpdateProfile];
        
        [UIView animateWithDuration:0.3/1.5 animations:^{
            _crs_UpdateProfile.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                _crs_UpdateProfile.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.3/2 animations:^{
                    _crs_UpdateProfile.transform = CGAffineTransformIdentity;
                }];
            }];
        }];
        
        
        self.crs_Updateprofilelabel.text = @"Sender ID details mandatory for this transaction.To continue, please update your profile.";
        
        
        
        
    }
    
    
    
    
    
    else{
        if ([CatgoryId isEqualToString:@"0"]||[CatgoryId isEqualToString:@"1"])
            
            
        {
            NSLog(@"Hi There");
            self.crs_UpdateProfile.hidden = YES;
            
            
            [Crs_sharedvariable sharedMySingleton].crs_DispalayingCountryCurrency = self.crs_Countrycode1.text;
            
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            
            SelectRecieverViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"SelectRecieverViewControllerSID"];;
            
            viewController.crs_PassingFromHome = ReciverCountry;
            
            [self.navigationController pushViewController:viewController animated:YES];
            
            
            
        }
        
        
        
        else{
            
            
            self.crs_UpdateProfile.hidden = NO;
            _crs_UpdateProfile.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
            
            [self.view addSubview:_crs_UpdateProfile];
            
            [UIView animateWithDuration:0.3/1.5 animations:^{
                _crs_UpdateProfile.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.3/2 animations:^{
                    _crs_UpdateProfile.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.3/2 animations:^{
                        _crs_UpdateProfile.transform = CGAffineTransformIdentity;
                    }];
                }];
            }];
            
            
            self.crs_Updateprofilelabel.text = userCatogoryMessage;
            
        }
        
        
        
        //        [Crs_sharedvariable sharedMySingleton].crs_DispalayingCountryCurrency = self.crs_Countrycode1.text;
        //
        //        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        //
        //        SelectRecieverViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"SelectRecieverViewControllerSID"];;
        //
        //
        //        viewController.crs_PassingFromHome = ReciverCountry;
        //
        //
        //        [self.navigationController pushViewController:viewController animated:YES];
        //
        //
        
    }
    
    
    
    
}
-(void)CheckCateogory
{
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    
    //[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [spinner startAnimating];
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_CatgoryCheck];
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
            [self->spinner stopAnimating];
            // [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"error %@",error);
            NSLog(@"data %@",data);
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json );
            NSLog(@"MY MESSAGE      %@", [json valueForKey:@"user_category_messgae"]);
            //message = [json valueForKey:@"message"];
            if ([[json valueForKey:@"status"] isEqualToString:@"200"]) {
                self->CatgoryId = [json valueForKey:@"usercategory"];
                self->userCatogoryMessage = [json valueForKey:@"user_category_messgae"];
                
                self->UserCatgory = [json valueForKey:@"usercategory"];
                NSLog(@"My Catogory is@@@%@",self->CatgoryId);
                
                
                if (![self->CHarityCountry isEqualToString:@"UNITED KINGDOM"]){
                    
                    
                    self->userCatogoryMessage = [json valueForKey:@"user_category_messgae"];
                }
                else if ([self->UserCatgory isEqualToString:@"-3"]) {
                    self.crs_Updateprofilelabel.text = [json valueForKey:@"user_category_messgae"];
                }
                
                else if ([self->ReciverCountry isEqualToString:@"PAKISTAN"]&&[self->CHarityCountry isEqualToString:@"UNITED KINGDOM"]) {
                    self.crs_Updateprofilelabel.text = @"Sender ID details mandatory for this transaction.To continue, please update your profile.";
                }
                
                else if ([self->UserCatgory isEqualToString:@"4"]){
                    
                    
                    self->userCatogoryMessage = [json valueForKey:@"user_category_messgae"];
                }
                else if ([self->UserCatgory isEqualToString:@"0"]){
                    
                    
                    self.crs_UpdateProfile.hidden = YES;
                }
                else{
                    
                    self.crs_Updateprofilelabel.text = self->userCatogoryMessage;
                    
                }
            }
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}

- (IBAction)crs_Update:(id)sender {
    
    [self.view endEditing:YES];
    if ([UserCatgory isEqualToString:@"-3"]) {
        
        
        // self.crs_GbUpdateOut.hidden = YES;
        self.crs_GbButtonOut.hidden = NO;
        self.crs_UpdateProfile.hidden = YES;
    }
    
    
    else if ([CoustmerId isEqualToString:@""]){
        
        
        self.crs_GbUpdateOut.hidden = NO;
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UpdateProfileNewViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"upDateProfileSID"];
        viewController.RecieversCountry = _crs_Countrycode1.text;
        viewController.sendersCountry = _crs_CountryCode.text;
        
        // viewController.crs_ProfileDetails =
        [self.navigationController pushViewController:viewController animated:YES];
        
    }
    else{
        // self.crs_GbButtonOut.hidden = YES;
        self.crs_GbUpdateOut.hidden = NO;
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UpdateProfileNewViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"upDateProfileSID"];
        viewController.RecieversCountry = _crs_Countrycode1.text;
        viewController.sendersCountry = _crs_CountryCode.text;
        
        // viewController.crs_ProfileDetails =
        [self.navigationController pushViewController:viewController animated:YES];
        
    }
    
}
- (IBAction)crs_CharityAction:(id)sender {
    
    [self.view endEditing:YES ];
    //[self CheckCateogory];
    if ([UserCatgory isEqualToString:@""]) {
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:userCatogoryMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
    }
    
    
    
    else if ([UserCatgory isEqualToString:@""]){
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:userCatogoryMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
    }
    else if ([CHarityCountry isEqualToString:@"UNITED KINGDOM"]){
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        CharityPayViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityPayViewControllerSID"];
        // viewController.crs_ProfileDetails =
        [self.navigationController pushViewController:viewController animated:YES];
    }
    else if ([CHarityCountry isEqualToString:@"SPAIN"]||[CHarityCountry isEqualToString:@"DENMARK"]||[CHarityCountry isEqualToString:@"SWEDEN"]||[CHarityCountry isEqualToString:@"ITALY"]||[CHarityCountry isEqualToString:@"IRELAND"]||[CHarityCountry isEqualToString:@"NORWAY"]||[CHarityCountry isEqualToString:@"AUSTRIA"]||[CHarityCountry isEqualToString:@"FRANCE"]||[CHarityCountry isEqualToString:@"NETHERLANDS"]||[CHarityCountry isEqualToString:@"BELGIUM"]||[CHarityCountry isEqualToString:@"GERMANY"]){
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"" message:@"Coming Soon" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        return;
    }
    
    
    
    
    else{
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        CharityPayViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityPayViewControllerSID"];
        // viewController.crs_ProfileDetails =
        [self.navigationController pushViewController:viewController animated:YES];
    }
    
    
    
    
    
}

- (IBAction)crs_HideUpdate:(id)sender {
    [self.view endEditing:YES];
    self.crs_UpdateProfile.hidden = YES;
}

//
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex == 0)
//    {
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        UpdateProfileNewViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"upDateProfileSID"];
//        // viewController.crs_ProfileDetails =
//        [self.navigationController pushViewController:viewController animated:YES];
//    }
//    if (buttonIndex == 1)
//    {
//
//
//    }
//}

- (IBAction)Crs_GbButton:(id)sender {
    self.crs_UpdateProfile.hidden = YES;
    [self CheckCateogory];
    
}
- (IBAction)crs_skup:(id)sender {
    self.crs_versionview.hidden = YES;
}
- (IBAction)crs:(id)sender {
}

- (IBAction)crs_Close:(id)sender {
    
    self.crs_UpdateProfile.hidden = YES;
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField==self.crs_search)
    {
        [_crs_search setFrame:CGRectMake(10, 20, 280, 30)];
        self.crs_searchImage.hidden = YES;
        NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ"];
        for (int i = 0; i < [string length]; i++)
        {
            unichar c = [string characterAtIndex:i];
            if (![myCharSet characterIsMember:c])
            {
                return NO;
            }
        }
        
        return YES;
    }
    
    return YES;
}
- (IBAction)crs_cancelAction:(id)sender {
    [_crs_search setFrame:CGRectMake(10, 20, 390, 30)];
    self.crs_searchImage.hidden = NO;
    [self.view endEditing:YES];
}
- (IBAction)crs_SourceAction:(id)sender {
    _crs_CountryListView.hidden = NO;
    _crs_CountryListView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    
    [self.view addSubview:_crs_CountryListView];
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        _crs_CountryListView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            _crs_CountryListView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                _crs_CountryListView.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    self.crs_search.text = @"";
    [self.view endEditing:YES];
    countryListCompare = @"CountryNames1";
    crs_CountryList=crs_CountryList1;
    
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"country_name" ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:descriptor];
    
    // here you will get sorted array in 'sortedArray'
    crs_CountryList = [[crs_CountryList sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
    NSMutableArray * Ary=[NSMutableArray new];
    
    for (int i=0; i<crs_CountryList.count; i++) {
        if ([[[crs_CountryList valueForKey:@"country_status"]objectAtIndex:i]isEqualToString:@"2"]||[[[crs_CountryList valueForKey:@"country_status"]objectAtIndex:i]isEqualToString:@"3"]) {
            
            
            NSMutableDictionary * dict=[NSMutableDictionary new];
            dict =[crs_CountryList objectAtIndex:i];
            [Ary addObject:dict];
        }
        
        
        
    }
    
    
    
    
    
    crs_CountryList =Ary;
    
    countryListCompare = @"CountryNames1";
    self.crs_CountryListView.hidden=NO;
    [self.crs_CountryListTableView reloadData];
    
}
- (IBAction)crs_DestinationAction:(id)sender {
    _crs_CountryListView.hidden = NO;
    _crs_CountryListView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    
    [self.view addSubview:_crs_CountryListView];
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        _crs_CountryListView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            _crs_CountryListView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                _crs_CountryListView.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    self.crs_search.text = @"";
    [self.view endEditing:YES];
    //crs_CountryList=crs_CountryList1;
    countryListCompare = @"CountryNames";
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"country_name" ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:descriptor];
    
    // here you will get sorted array in 'sortedArray'
    crs_CountryList = [[crs_CountryList1 sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
    
    NSLog(@"%@",crs_CountryList);
    
    
    
    
    
    
    
    
    
    NSMutableArray * Ary;
    Ary=[NSMutableArray new];
    for (int i=0; i<crs_CountryList.count; i++) {
        
        @try {
            if ([[[crs_CountryList valueForKey:@"country_status"]objectAtIndex:i]isEqualToString:@"2"]||[[[crs_CountryList valueForKey:@"country_status"]objectAtIndex:i]isEqualToString:@"1"]) {
                
                
                NSMutableDictionary * dict=[NSMutableDictionary new];
                dict =[crs_CountryList objectAtIndex:i];
                [Ary addObject:dict];
            }
            
        } @catch (NSException *exception) {
            NSLog(@"Excp%@",exception);
        } @finally {
            
        }
        
        
        
        
        
        
    }
    
    crs_CountryList =Ary;
    
    
    
    
    
    countryListCompare = @"CountryNames";
    self.crs_CountryListView.hidden=NO;
    [self.crs_CountryListTableView reloadData];
}


@end

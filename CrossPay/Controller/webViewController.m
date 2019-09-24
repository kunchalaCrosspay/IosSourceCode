//
//  webViewController.m
//  CrossPay
//
//  Created by sai kiran  on 10/4/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import "webViewController.h"
#import "HomeViewController.h"
#import "Crs_sharedvariable.h"
#import "HistoryViewController.h"
#import "MBProgressHUD.h"
#import "crs_sharedmethods.h"
#import "GlobalUrlsFile.h"
#import "RecieverDetailedViewController.h"
@interface webViewController ()
{
    
    NSTimer *crs_WebCller;
    UIActivityIndicatorView *spinner;
    NSString * promo1;
    NSString * checkBalance;
    NSString * WebHider;
    NSString * FirstName;
    NSString * LastName;
    NSString * MiddleName;
    NSString * houseNo;
    NSString * County;
    NSString * PostCode;
    NSString * EmailAddress;
    NSString * Mobile;
    NSString * Country;
    
}
@end

@implementation webViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.crs_webViewView.hidden = YES;
    
    NSLog(@"%@",self.passingData);
    
    self.crs_transactionCompletedView.hidden = YES;
    
    [self ForUserDetails];
    
    self.crs_RatingView.hidden = YES;
    
    
    
    [self.crs_RateNowOutlet.layer setBorderWidth:1.0];
    [self.crs_RateNowOutlet.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    //
    //    [self.crs_SkipOut.layer setBorderWidth:1.0];
    //    [self.crs_SkipOut.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    //
    //
    
    
    
    
    self.webview.delegate = self;
    
    NSString * stringUrl = [NSString stringWithFormat:@"%@?mainamount=%@&currencyiso3a=%@&sitereference=%@&orderreference=%@&version=%@&stprofile=blue",[self.passingData valueForKey:@"link"],[self.passingData valueForKey:@"mainamount"],[self.passingData  valueForKey:@"currencyiso3a"] ,[self.passingData valueForKey:@"sitereference"],[self.passingData valueForKey:@"orderreference"],[self.passingData valueForKey:@"version"]] ;
    
    
    
    NSURL * url = [NSURL URLWithString:stringUrl];
    NSURLRequest * requestUrl = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:requestUrl];
    
    
    
    
    Country = [self.passingData valueForKey:@"billingcountry"];
    
    if ([Country isEqualToString:@"UNITED KINGDOM"]) {
        Country = @"UK";
        NSLog(@"HI MY COUNTRY COSE IS %@",Country);
    }
    
    
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    ////
    //
    //spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    //    [spinner setCenter:CGPointMake(180,300)];
    //[self.view addSubview:spinner];
    // [spinner startAnimating];
    
    
    
    
    
    
    
    [spinner startAnimating];NSLog(@"start");
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    //[spinner stopAnimating];
    
   
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSString* doc = [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.outerHTML"];
    NSLog(@"document  = %@",doc);
 
    if([doc containsString:@"Successful"]){
        [self crs_historyRoute];
    }
    
   [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('st-block-deliverydetailsdiv').style.display = 'none'"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"(labelcopybillingaddress).style.display = 'none'"];
    

    NSString * FirstName = [NSString stringWithFormat:@"document.getElementById('st-billingfirstname-textfield').value = '%@'",[self.passingData valueForKey:@"billingfirstname"]];
    
[webView stringByEvaluatingJavaScriptFromString:FirstName];
    


    NSString * LastName = [NSString stringWithFormat:@"document.getElementById('st-billinglastname-textfield').value = '%@'",[self.passingData valueForKey:@"billinglastname"]];
    
    [webView stringByEvaluatingJavaScriptFromString:LastName];
    
    
    NSString * posCode = [NSString stringWithFormat:@"document.getElementById('st-billingpostcode-textfield').value = '%@'",[self.passingData valueForKey:@"billingpincode"]];
   
    [webView stringByEvaluatingJavaScriptFromString:posCode];
    
    NSString * city = [NSString stringWithFormat:@"document.getElementById('st-billingtown-textfield').value = '%@'",[self.passingData valueForKey:@"billingcity"]];
    
    [webView stringByEvaluatingJavaScriptFromString:city];
    
    NSString * Country1 =  [NSString stringWithFormat:@"document.getElementById('st-billingcountryiso2a-dropdown').value = '%@'",Country];
    
    
    
    
 
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('st-billingemail-textfield').value = 'Kunchalasai@gmail.com'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('st-billingtelephone-textfield').value = '9959944273'"];
//      [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('st-billingtown-textfield').value = 'Cardiff'"];
//    
     [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('st-billingcountryiso2a-dropdown').value = 'IN'"];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('st-billingpostcode-textfield').value = '89088'"];
   
    
    
}


-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"Error for WEBVIEW: %@", [error description]);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)crs_HomeAction:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    self.crs_webViewView.hidden = NO;
    
    
    
}
- (IBAction)crs_YesAction:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"historyViewControllerSID"];;
    viewController.crs_BackToHome = @"Home";
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}


- (IBAction)crs_NoAction:(id)sender {
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    self.crs_webViewView.hidden = YES;
    // [self crs_historyRoute];
    
}

-(void)crs_historyRoute
{
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSError * error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_CapturePayment];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_BenificiaryNo forKey:@"beneficiary_no"];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
     [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
    [mapData setObject:[self.passingData valueForKey:@"currencyiso3a"] forKey:@"payeccyCode"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_TotalPayingAmount forKey:@"totalpayingamount"];
    
    
    
    
    
    // [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_PayInAmount forKey:@"count"];
    [mapData setObject:[self.passingData valueForKey:@"orderreference"] forKey:@"order_id"];
    @try {
        
        
        
        [mapData setObject:_promoGetter forKey:@"PromoCode"];
        
    }
    @catch (NSException * e) {
        NSLog(@" HELLO THERE Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    NSLog(@"%@ sai Kiran Kunchala",mapData);
    
    
    
    
    
    
    
    
    
    
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                          {
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  [MBProgressHUD hideHUDForView:self.view animated:YES];
                                                  NSLog(@"error %@",error);
                                                  NSLog(@"data %@",data);
                                                  NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                  NSLog(@"  rambo %@", json );
                                                  
                                                  NSLog(@"%@", [json valueForKey:@"message"]);
                                                  // crs_PassingToWebview = [json valueForKey:@"message"];
                                                  if ([[json valueForKey:@"status"]isEqualToString:@"200"]) {
                                                      
                                                      self.crs_transactionCompletedView.hidden = YES;
                                                      
                                                      self.crs_webViewView.hidden = NO;
                                                      
                                                      self.crs_NameChanger.text = @"Your transaction has been successful.";
                                                      
    crs_WebCller = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(Crs_WebCallOk) userInfo:nil repeats:YES];
                                                      
                                                      
                                                      
                                                  }
                                                  
                                                  
                                                  
                                                  //                      else if ([[json valueForKey:@"status"]isEqualToString:@"300"]){
                                                  //
                                                  //                          self.crs_transactionCompletedView.hidden = YES;
                                                  //
                                                  //                          self.crs_webViewView.hidden = NO;
                                                  ////
                                                  ////                          self.crs_NameChanger.text = @"Sorry, your transaction has not been successful.";
                                                  //
                                                  //                      }
                                                  
                                                  else{
                                                      
                                                      self.crs_webViewView.hidden=YES;
                                                      self.crs_transactionCompletedView.hidden = NO;
                                                      
                                                      self.crs_NameChanger.text = @"Are you sure you want to cancel your transaction?";
                                                      
                                                  }
                                                  
                                                  
                                                  
                                              });
                                              
                                              
                                          }];
    
    
    
    
    
    
    [postDataTask resume];
    
    
}


- (IBAction)Crs_Exit:(id)sender {
    
    //self.crs_transactionCompletedView.hidden = NO;
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    if ([[self.passingData valueForKey:@"currencyiso3a"]isEqualToString:@""]) {
        
        
        
        
    }
    else{
        
        
        
        
        
        
        [self crs_historyRoute];
        
        
        
        
        
        
    }
    
}

int count =0;
-(void)Crs_WebCallOk{
    
    count++;
    if (count>2) {
        [crs_WebCller invalidate];
        NSUserDefaults* defaults1 = [NSUserDefaults standardUserDefaults];
        NSString * Thanks  =    [defaults1 objectForKey:@"Thanks"];
        if ([Thanks isEqualToString:@"Thanks"]) {
            self.crs_RatingView.hidden = NO
            ;
        }
        
        
        else{
            
            self.crs_RatingView.hidden = YES;
            
        }
        //[self crs_YesAction:nil];
    }
    
    
}


- (IBAction)rs_Ok:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    RecieverDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"RecieverDetailedViewControllerSID"];;
    viewController.Crs_BackToRecieverDetails = @"Reciever";
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}

- (IBAction)crs_Back:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    self.crs_webViewView.hidden = NO;
    self.crs_transactionCompletedView.hidden = YES;
    
}

- (IBAction)crs_ViewHider:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    self.crs_transactionCompletedView.hidden = YES;
    
}
-(void)viewWillAppear:(BOOL)animated
{
    
    
    //
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"Secure Trading   View controller"];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    //
}
- (IBAction)crs_RateNow:(id)sender {
    NSString *iTunesLink = @"https://itunes.apple.com/in/app/crosspay/id1312224710?mt=8";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
}
- (IBAction)crs_Skip:(id)sender {
    
    NSString *valueToSave = @"NoThanks";
    [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"Thanks"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    self.crs_RatingView.hidden = YES;
}
- (IBAction)crs_RemindMe:(id)sender {
    
    self.crs_RatingView.hidden = YES;
}

-(void)ForUserDetails
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
           
            //NSLog(@" My profile Details @@@@@@@@ %@");
            NSLog(@"MY MESSAGE      %@", [json valueForKey:@"user_category_messgae"]);
            
            if ([[json valueForKey:@"status"] isEqualToString:@"200"]) {
                FirstName = [json valueForKey:@"first_name"];
                MiddleName = [json valueForKey:@"middle_name"];
                LastName = [json valueForKey:@"last_name"];
                Mobile = [json valueForKey:@"mobile"];
                
                
            }
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}
@end

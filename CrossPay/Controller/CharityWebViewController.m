//
//  CharityWebViewController.m
//  CrossPay
//
//  Created by sai kiran  on 6/11/19.
//  Copyright © 2019 CrossPay. All rights reserved.
//

#import "CharityWebViewController.h"
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
#import "CharityWebViewController.h"
#import "NewHomeViewController.h"
@interface CharityWebViewController ()
{
    
    NSString * UrlSTring;
    NSString * UserId;
    NSString * CoustmerId;
    NSString * firstName;
    NSString * mobile;
    NSString * devieCode;
    UIActivityIndicatorView *spinner;
    
    NSString * Success;
    NSString * back;
    NSTimer *_timer;
}
@end

@implementation CharityWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    devieCode = @"555";
    back = @"";
    
    [self profileDetails];
    NSLog(@"My Passing Data is%@",_passingData);
    
    self.crs_Loading.hidden = YES;
    
    self.crs_Back2out.hidden = YES;
   
    
    
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
                
                
                
//           https://www.crosspaymt.com/charitypay?username=411&devicecode=555&firstname=SAI&mobile=9959944273&category=0&usercountry=UK&customerid=45874585
                
                
        UrlSTring = [NSString stringWithFormat:@"http://54.200.111.119:6099/CrosspayCustomer/charitypay?username=%@&devicecode=%@&firstname=%@&mobile=%@&category=%@&usercountry=%@",[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"user_id"],devieCode,[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"first_name"],[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"mobile"],[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"usercategory"],[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"countryisocode2"]];
                
                NSLog(@"Helo My Url is %@",self->UrlSTring);
                
               
                
                self.crs_CharityWebView.delegate = self;
                
                NSURL * url = [NSURL URLWithString:UrlSTring];
                NSURLRequest * requestUrl = [NSURLRequest requestWithURL:url];
                [self.crs_CharityWebView loadRequest:requestUrl];
                
                
                
                
//                country = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"country"];
                
               
                NSMutableArray * crs_ProfileNameArray = [[json valueForKey:@"data"] objectAtIndex:0];
                
                
                NSString * fullName = [NSString stringWithFormat:@"%@ %@ %@ ",[ crs_ProfileNameArray valueForKey:@"first_name"],[ crs_ProfileNameArray valueForKey:@"middle_name"],[ crs_ProfileNameArray valueForKey:@"last_name"]];
                
                [Crs_sharedvariable sharedMySingleton].crs_Name = fullName;
                
                //                UserCatgory = [ crs_ProfileNameArray valueForKey:@"user_category"];
                //                NSLog(@"My Category&%@",UserCatgory);
                
                
//
//                CoustmerId = [crs_ProfileNameArray valueForKey:@"customer_id"];
//                CoustmerId = [NSString stringWithFormat:@"%@",[crs_ProfileNameArray valueForKey:@"customer_id"]];
//                iosReview = [NSString stringWithFormat:@"%@",[crs_ProfileNameArray valueForKey:@"IOSREVIEW"]];
//
                
               // NSLog(@"My Review is%@",iosReview);
                //                if ([iosReview isEqualToString:@"1"]) {
                //                    self.crs_Skipout1.hidden = NO;
                //                }
                //
                //                else{
                //
                //                    self.crs_Skipout1.hidden = YES;
                //
//                //                }
//               // CHarityCountry = [ crs_ProfileNameArray valueForKey:@"country"];
//                if ([CHarityCountry isEqualToString:@"UNITED KINGDOM"]) {
//                    //self.crs_CharityButtonout.hidden = NO;
//                }
//                else{
//
//                    //self.crs_CharityButtonout.hidden = YES;
//
//                }
                
                
                
                
            }
            else{
                
                
                
                
            }
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView {
    ////
//    //
//    spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    spinner.center=self.view.center;
//    [self.view addSubview:spinner];
//    //[spinner startAnimating];
//    NSLog(@"start");
//
//    if (!_timer) {
//        _timer = [NSTimer scheduledTimerWithTimeInterval:200.0f
//                                                  target:self
//                                                selector:@selector(_timerFired:)
//                                                userInfo:nil
//                                                 repeats:YES];
//    }
      self.crs_Loading.hidden = NO;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    //[spinner stopAnimating];
    NSLog(@"stop");
    
    
    NSString* doc = [_crs_CharityWebView stringByEvaluatingJavaScriptFromString:@"document.documentElement.outerHTML"];
    
    NSString * NewDoc = [_crs_CharityWebView stringByEvaluatingJavaScriptFromString:@"document.getElementByid(page-wrapper).HTML"];
    NSLog(@"Hello NewDoc is %@",NewDoc);
//    NSString * Hello = [_crs_CharityWebView stringByEvaluatingJavaScriptFromString:@"document.getElementById(page-wrapper).innerHTML"];
  
     NSString * Hello = [_crs_CharityWebView stringByEvaluatingJavaScriptFromString:@"document.getAll(page-wrapper).innerHTML"];
    
   // document.getElementById("demo").innerHTML = "Hello World";
    
    NSLog(@"Hello SAi %@",Hello);
    
    NSLog(@"document  = %@",doc);
    
    
    if ([doc containsString:@"Tax relief when you donate to a charity: Gift Aid - GOV.UK"]) {
        self.crs_Back2out.hidden = NO;
        self.crs_BackOut.hidden = YES;
        NSLog(@"yes iam working@@@@@@@@@");
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
        
        [self.navigationController pushViewController:viewController animated:YES];
        
    }
    
    
    else if ([doc containsString:@"telephone=no"]){
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
        
        [self.navigationController pushViewController:viewController animated:YES];
        self.crs_Back2out.hidden = NO;
        self.crs_BackOut.hidden = YES;
        NSLog(@"yes iam working@@@@@@@ tooo");
    }
    
    
    
    
    
    else if ([doc containsString:@"Communications between us are to be in English."]){
        
        self.crs_Back2out.hidden = NO;
        self.crs_BackOut.hidden = YES;
        NSLog(@"yes iam working@@@@@@@ tooo");
    }
    
    else if ([doc containsString:@"DISCLOSURE OF YOUR INFORMATION"]){
        self.crs_Back2out.hidden = NO;
        self.crs_BackOut.hidden = YES;
        NSLog(@"yes iam working@@@@@@@ tooo");
        
        
    }
    else{
        self.crs_Back2out.hidden = YES;
        self.crs_BackOut.hidden = NO;
        
    }
    
    
     self.crs_Loading.hidden = YES;
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"Error for WEBVIEW: %@", [error description]);
}


- (IBAction)crs_Back:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Crosspay" message:@"Are you sure do you want to cancel your Charity Transaction?" preferredStyle:UIAlertControllerStyleAlert];
    
    // create the actions handled by each button
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
        
        [self.navigationController pushViewController:viewController animated:YES];
        
        
        NSLog(@"User said DEFO!");
    }];
    
                        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            NSLog(@"User said NEVER!");
//                            
//                            self.crs_CharityWebView.delegate = self;
//                            
//                            NSURL * url = [NSURL URLWithString:UrlSTring];
//                            NSURLRequest * requestUrl = [NSURLRequest requestWithURL:url];
//                            [self.crs_CharityWebView loadRequest:requestUrl];
                            
                        }];
    
    // add actions to our alert
    [alert addAction:action1];
    [alert addAction:action2];
    
    // display the alert controller
    [self presentViewController:alert animated:YES completion:nil];
    
}
- (void)_timerFired:(NSTimer *)timer {
    NSLog(@"ping");
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}
- (IBAction)crs_Back2:(id)sender {
    self.crs_CharityWebView.delegate = self;
    
    NSURL * url = [NSURL URLWithString:UrlSTring];
    NSURLRequest * requestUrl = [NSURLRequest requestWithURL:url];
    [self.crs_CharityWebView loadRequest:requestUrl];
}
@end

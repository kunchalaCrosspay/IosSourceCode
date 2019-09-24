//
//  SecureTradingCharityViewController.m
//  CrossPay
//
//  Created by sai kiran  on 9/11/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "SecureTradingCharityViewController.h"
#import "HomeViewController.h"
#import "Crs_sharedvariable.h"
#import "HistoryViewController.h"
#import "MBProgressHUD.h"
#import "crs_sharedmethods.h"
#import "GlobalUrlsFile.h"
#import "RecieverDetailedViewController.h"
#import "CharitypayHistoryViewController.h"
#import "CharityPayViewController.h"
#import "CharitypayHistoryViewController.h"

@interface SecureTradingCharityViewController ()
{
NSTimer *crs_WebCller;
UIActivityIndicatorView *spinner;
NSString * promo1;
NSString * checkBalance;
    NSString * MyLink;
    
    NSString * TotalPayongAmount;
    NSString * CurrencyCode;
    NSString * SiteRefrence;
    NSString * orderId;
    NSString * Version;
    
}
@end

@implementation SecureTradingCharityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"My Link%@",_passingData);
    
    
    
    [self.crs_TransactionNoOut.layer setBorderWidth:1.0];
    [self.crs_TransactionNoOut.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    
    [self.crs_TransactioncancelYesOut.layer setBorderWidth:1.0];
    [self.crs_TransactioncancelYesOut.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    
    
    
    self.crs_SuccessfullTransactionView.hidden = YES;
    self.crs_transactionCompletedView.hidden = YES;
    self.crs_TransactionCancel.hidden = YES;
  
    self.crs_SecureTrading.delegate = self;
    
    NSString * stringUrl =  [NSString stringWithFormat:@"%@?mainamount=%@&currencyiso3a=%@&sitereference=%@&orderreference=%@&version=%@&stprofile=blue",[self.passingData valueForKey:@"link"],[self.passingData valueForKey:@"amount"],[self.passingData  valueForKey:@"currencyCode"] ,[self.passingData valueForKey:@"sitereference"],[self.passingData valueForKey:@"orderreference"],[self.passingData valueForKey:@"version"]] ;
    
   
    
    @try {
        NSURL * url = [NSURL URLWithString:stringUrl];
        NSURLRequest * requestUrl = [NSURLRequest requestWithURL:url];
        [self.crs_SecureTrading loadRequest:requestUrl];
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
}


-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"Error for WEBVIEW: %@", [error description]);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)crs_BackAction:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    self.crs_SecureTrading.hidden = NO;
    self.crs_transactionCompletedView.hidden = YES;
    self.crs_TransactionCancel.hidden = NO;
}
- (IBAction)crs_YesAction:(id)sender {
}

- (IBAction)crs_NoAction:(id)sender {
    
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
    NSURL *url = [NSURL URLWithString:Crosspay_CharitysecureTradingCapture];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
  
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
   
    [mapData setObject:_crs_CHARITYCurrencyCode forKey:@"payeccyCode"];
    [mapData setObject:_crs_CHARITYAmount forKey:@"totalpayingamount"];
    [mapData setObject:_crs_CHARITYOrderId forKey:@"referenceNo"];
    
    
   
    
   // order_id,user_id,payeccyCode,totalpayingamount,referenceNo,
    [mapData setObject:_crs_CHARITYOrderId forKey:@"order_id"];
   
    
    
    
    
    
    
    
    
    
    
    
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

                            self.crs_SuccessfullTransactionView.hidden = NO;

                self.crs_NameChanger.text = @"Your transaction has been successful.";
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        CharitypayHistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityhistoryViewControllerSID"];;
            viewController.crs_BackToHome = @"Home";
        [self.navigationController pushViewController:viewController animated:YES];
                                                      
//                        crs_WebCller = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(Crs_WebCallOk) userInfo:nil repeats:YES];
//
                                                      
                                                      
                                                  }
                                                  
                                                  
                                                  
                        else if ([[json valueForKey:@"status"]isEqualToString:@"300"]){
                                                  
                        self.crs_transactionCompletedView.hidden = YES;
                                                  
                            self.crs_SuccessfullTransactionView.hidden = NO;
                    self.crs_NameChanger.text = @"Sorry, your transaction has not been successful.";
                            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                            CharityPayViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityPayViewControllerSID"];
                            // viewController.crs_ProfileDetails =
                            [self.navigationController pushViewController:viewController animated:YES];
                                                                        }
                                                  
                                                  else{
                                                      
//                                                      self.crs_.hidden=YES;
//                                                      self.crs_transactionCompletedView.hidden = NO;
//
            self.crs_NameChanger.text = @"Are you sure you want to cancel your transaction?";
                                                      
                                                  }
                                                  
                                                  
                                                  
                                              });
                                              
                                              
                                          }];
    
    
    
    
    
    
    [postDataTask resume];
    
    
}


- (IBAction)crs_TransactionCancelYes:(id)sender {
    
    [self crs_historyRoute];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CharityPayViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityPayViewControllerSID"];
    // viewController.crs_ProfileDetails =
    [self.navigationController pushViewController:viewController animated:YES];
    
}
- (IBAction)crs_TransactionNoAction:(id)sender {
    self.crs_TransactionCancel.hidden = YES;
}
@end

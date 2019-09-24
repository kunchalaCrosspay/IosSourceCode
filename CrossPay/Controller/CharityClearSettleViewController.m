//
//  CharityClearSettleViewController.m
//  CrossPay
//
//  Created by sai kiran  on 9/7/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "CharityClearSettleViewController.h"
#import "MBProgressHUD.h"
#import "Crs_sharedvariable.h"
#import "GlobalUrlsFile.h"
#import "crs_sharedmethods.h"
#import "RecieverDetailedViewController.h"
#import "HistoryViewController.h"
#import "HomeViewController.h"
#import "CharityPayViewController.h"
#import "CharitypayHistoryViewController.h"
#import "TermsandCondtionsViewController.h"
#import "PrivacyPolicyViewController.h"
@interface CharityClearSettleViewController (){
NSString * TransactioId;
NSString * status;
NSString * ReferenceId;
NSString * message;
UIActivityIndicatorView *spinner;

NSTimer *crs_WebCller;

NSString * Clears;
}
@end

@implementation CharityClearSettleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.crs_TransactionCancelViewForBackaction.hidden = YES;
    self.crs_TransactionDeclinedView.hidden = YES;
    self.crs_BackCancelView.hidden = YES;
    self.crs_SucceessfullView.hidden = YES;
    
    [self ClearSettleForUrl];
    
    Clears = @"CallBack";
    
    [self.crs_TransactionDeclinedOk.layer setBorderWidth:1.0];
    [self.crs_TransactionDeclinedOk.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    
    
    [self.crs_BackNoOut.layer setBorderWidth:1.0];
    [self.crs_BackNoOut.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    [self.crs_BackYesOu.layer setBorderWidth:1.0];
    [self.crs_BackYesOu.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    [self.crs_SuccessfullOkOut.layer setBorderWidth:1.0];
    [self.crs_SuccessfullOkOut.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    
    
    
    
    NSHTTPCookieStorage *jar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *cookies = jar.cookies;
    for (NSHTTPCookie *cookie in cookies) {
        [jar deleteCookie:cookie];
        
        NSLog(@"%@Daiel Cook",jar);
    }
    
    
    
    
    
    
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ClearSettle{
    
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_CharityClearsettle];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    //{"user_id":"5","ccycode":"GBP","accountccycode":"PHP","date":"2018-06-05","amount":"10","servicetype":"CP","promocode":"CPAYFREE"}
    //
    //    [mapData setObject: self.crs_TextField1.text forKey:@"amount"];
    //    [mapData setObject: self.crs_CountryCode.text forKey:@"ccycode"];
    //    [mapData setObject:self.crs_Countrycode1.text forKey:@"accountccycode"];
    //    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
    //
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
      [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
      [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
    [mapData setObject:[_passingData valueForKey:@"customerno"] forKey:@"customerno"];
    [mapData setObject:_crs_CHARITYCurrencyCode forKey:@"payeccyCode"];
    [mapData setObject:_crs_CHARITYAmount forKey:@"totalpayingamount"];
    [mapData setObject:[_passingData valueForKey:@"order_id"] forKey:@"order_id"];
     [mapData setObject:[_passingData valueForKey:@"referenceNo"] forKey:@"referenceNo"];
    [mapData setObject:_crs_CHARITYOrderId forKey:@"referenceNo"];
    
    
    
    
    
    
    
//    
//    keys -  customerno,user_id ,payeccyCode ,totalpayingamount, order_id,referenceNo
//    
////    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_BenificiaryNo forKey:@"beneficiary_no"];
////    [mapData setObject:[_passingData valueForKey:@"Txn_no"] forKey:@"Txn_no"];
////
////
    
    
    
    
    
    
    
    
    
    
    
    NSLog(@"Clearsettle %@",mapData);
    
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
            
            if ([[json valueForKey:@"message"]isEqualToString:@"Internal Server Error"]) {
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Internal Server Error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                
                
            }
            else{
                
                
                NSString *fullURL = [json valueForKey:@"purchaseUrl"];
                NSURL *url = [NSURL URLWithString:fullURL];
                NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
                [_crs_CharityWebviw loadRequest:requestObj];
                
            }
            
            
            
            
            
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
    
    
    
    
}

-(void)ClearSettleForUrl{
    
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_CharityClearSeetleUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
 
   
  
    
    
     [mapData setObject:_crs_CHARITYCoustmerNo forKey:@"customerno"];
    [mapData setObject:_crs_CHARITYCurrencyCode forKey:@"currencyCode"];
    [mapData setObject:_crs_CHARITYAmount forKey:@"amount"];
   
   [mapData setObject:_crs_CHARITYOrganisationCode forKey:@"organisationCode"];
    [mapData setObject:_crs_CHARITYPurposeCode forKey:@"purposeCode"];
     [mapData setObject:_crs_CHARITYCardType forKey:@"cardType"];
    [mapData setObject:_crs_CHARITYTransactionNumber forKey:@"txnno"];
 [mapData setObject:_crs_CHARITYOrderId forKey:@"referenceNo"];
    
    
    //organisationCode,purposeCode,amount,currencyCode,cardType,customerno,txnno
    
    
    
    
    
    
    
    NSLog(@"Clearsettle %@",mapData);
    
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
            
            if ([[json valueForKey:@"message"]isEqualToString:@"Internal Server Error"]) {
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Internal Server Error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                
                
            }
            else{
                
                
                NSString *fullURL = [json valueForKey:@"purchaseUrl"];
                NSURL *url = [NSURL URLWithString:fullURL];
                NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
                [_crs_CharityWebviw loadRequest:requestObj];
                
            }
            
            
            
            
            
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
    
    
    
    
}




-(void)webViewDidStartLoad:(UIWebView *)webView {
    ////
    //
    spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center=self.view.center;
    [self.view addSubview:spinner];
    [spinner startAnimating];
    NSLog(@"start");
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [spinner stopAnimating];
    
    NSString* doc = [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.outerHTML"];
    NSLog(@"document  = %@",doc);
    
    
    
    
    
    TransactioId = [_crs_CharityWebviw stringByEvaluatingJavaScriptFromString:@"document.getElementsByName('transactionId')[0].value"];
    
    ReferenceId = [_crs_CharityWebviw stringByEvaluatingJavaScriptFromString:@"document.getElementsByName('referenceNo')[0].value"];
    
    
    status = [_crs_CharityWebviw stringByEvaluatingJavaScriptFromString:@"document.getElementsByName('status')[0].value"];
    NSLog(@"ClearSettle%@====",status);
    message = [_crs_CharityWebviw stringByEvaluatingJavaScriptFromString:@"document.getElementsByName('message')[0].value"];
    NSLog(@"DAddy=====%@",message);
    NSString * Asa = [_crs_CharityWebviw stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('button is-primary is-success')[0].innerHTML"];
    NSLog(@"Amair khan89======%@",Asa);
    
    
    
    if ([status isEqualToString:@"APPROVED"]) {
        
        if ([Clears isEqualToString:@"CallBack"]) {
            [spinner stopAnimating];
            Clears = @"NotCallBack";
            [self crs_historyRoute];
            self.crs_SucceessfullView.hidden = NO;
            self.crs_TransactionDeclinedView.hidden = YES;
        }
        
        
    }
    else if ([status isEqualToString:@"DECLINED"]){
        [spinner stopAnimating];
        [self crs_historyRoute];
        self.crs_SucceessfullView.hidden = YES;
        self.crs_TransactionDeclinedView.hidden = NO;
        
    }
    
    
}













-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"Error for WEBVIEW: %@", [error description]);
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
    NSURL *url = [NSURL URLWithString:Crosspay_CharityClearSettleCapture];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
  
    [mapData setObject:ReferenceId forKey:@"referenceNo"];
   
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
      [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
     [mapData setObject:_crs_CHARITYCoustmerNo forKey:@"customerno"];
     [mapData setObject:_crs_CHARITYOrderId forKey:@"order_id"];
    [mapData setObject:_crs_CHARITYCurrencyCode forKey:@"payeccyCode"];
    [mapData setObject:_crs_CHARITYAmount forKey:@"totalpayingamount"];
     
    
  
    
    //order_id,user_id,payeccyCode,totalpayingamount,referenceNo,
    
    if  ([status isEqualToString:@""]) {
         [mapData setObject:_crs_CHARITYOrderId forKey:@"referenceNo"];
    }
    
    
   //order_id,user_id,payeccyCode,totalpayingamount,referenceNo,
    
 
    
    // customerno,user_id ,payeccyCode ,totalpayingamount, order_id,referenceNo
    
    
    
    
    
    
    
    
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
                    if ([[json valueForKey:@"status"]isEqualToString:@"200"])
                                                  {
                                                      
                        self.crs_BackOut.userInteractionEnabled = NO;
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                      
                    CharitypayHistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityhistoryViewControllerSID"];;
                        viewController.crs_BackToHome = @"Home";
                    [self.navigationController pushViewController:viewController animated:YES];
                                                      
                                                      
                                                  }
            else if ([[json valueForKey:@"status"]isEqualToString:@"300"]){
                                                      
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                CharityPayViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityPayViewControllerSID"];
                // viewController.crs_ProfileDetails =
                [self.navigationController pushViewController:viewController animated:YES];
                self.crs_BackOut.userInteractionEnabled = NO;
                                                      
                                                  }
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                              });
                                              
                                              
                                          }];
    
    
    
    
    
    
    [postDataTask resume];
    
    
}







- (IBAction)crs_BackActio:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
   
}

- (IBAction)crs_CharityBack:(id)sender {
      self.crs_TransactionCancelViewForBackaction.hidden = NO;
}
- (IBAction)crs_BackNoAction:(id)sender {
    
}
- (IBAction)crs_SuccessAction:(id)sender {
}
- (IBAction)crs_TransactionDeclinedOk:(id)sender {
}

- (IBAction)crs_TransactionYesAction:(id)sender {
}

- (IBAction)crs_CharityYesAction:(id)sender {
    self.crs_TransactionCancelViewForBackaction.hidden = NO;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CharityPayViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityPayViewControllerSID"];
    // viewController.crs_ProfileDetails =
    [self.navigationController pushViewController:viewController animated:YES];
   
}
- (IBAction)crs_CharityNoAction:(id)sender {
     self.crs_TransactionCancelViewForBackaction.hidden = YES;
}
@end

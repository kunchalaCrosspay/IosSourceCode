//
//  ClearSettleViewController.m
//  CrossPay
//
//  Created by sai kiran  on 7/18/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "ClearSettleViewController.h"
#import "MBProgressHUD.h"
#import "Crs_sharedvariable.h"
#import "GlobalUrlsFile.h"
#import "crs_sharedmethods.h"
#import "RecieverDetailedViewController.h"
#import "HistoryViewController.h"
#import "HomeViewController.h"
@interface ClearSettleViewController ()<UIWebViewDelegate>
{
    NSString * TransactioId;
    NSString * status;
    NSString * ReferenceId;
    NSString * message;
    UIActivityIndicatorView *spinner;
    
    NSTimer *crs_WebCller;
    
    NSString * Clears;
    
    
}
@end

@implementation ClearSettleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self ClearSettle];
    self.crs_TransactionCancelView.hidden = YES;
    
    self.crs_TransactionView.hidden = YES;
    
    _crs_TransactionDeclined.hidden = YES;
    
    Clears = @"CallBack";
    
    [self.crs_YesOutlet.layer setBorderWidth:1.0];
    [self.crs_YesOutlet.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    
    
    [self.crs_NoOutlet.layer setBorderWidth:1.0];
    [self.crs_NoOutlet.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    NSHTTPCookieStorage *jar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *cookies = jar.cookies;
    for (NSHTTPCookie *cookie in cookies) {
        [jar deleteCookie:cookie];
        
        NSLog(@"%@Daiel Cook",jar);
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ClearSettle{
    
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_ClearSettle];
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
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_BenificiaryNo forKey:@"beneficiary_no"];
    [mapData setObject:[_passingData valueForKey:@"Txn_no"] forKey:@"Txn_no"];
    
    
    
    
    
    
    
    
    
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
            NSString * Message;
            Message = [json valueForKey:@"message"];
            
            if ([[json valueForKey:@"message"]isEqualToString:@"Please update the Application to use our Latest Services."]) {
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:Message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                
                
            }
            
            else if (![[json valueForKey:@"status"]isEqualToString:@"200"]){
                
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:Message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
            }
            
            
            else{
                
                
                NSString *fullURL = [json valueForKey:@"purchaseUrl"];
                NSURL *url = [NSURL URLWithString:fullURL];
                NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
                [_crs_Clearsettle loadRequest:requestObj];
                
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
    
    
    
    
    
    TransactioId = [_crs_Clearsettle stringByEvaluatingJavaScriptFromString:@"document.getElementsByName('transactionId')[0].value"];
    
    ReferenceId = [_crs_Clearsettle stringByEvaluatingJavaScriptFromString:@"document.getElementsByName('referenceNo')[0].value"];
    
    
    status = [_crs_Clearsettle stringByEvaluatingJavaScriptFromString:@"document.getElementsByName('status')[0].value"];
    NSLog(@"ClearSettle Status %@====",status);
    message = [_crs_Clearsettle stringByEvaluatingJavaScriptFromString:@"document.getElementsByName('message')[0].value"];
    NSLog(@"Clear Settle Message=====%@",message);
    NSString * Asa = [_crs_Clearsettle stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('button is-primary is-success')[0].innerHTML"];
    NSLog(@"Claer settle ======%@",Asa);
    
    
    
    if ([status isEqualToString:@"APPROVED"]) {
        
        if ([Clears isEqualToString:@"CallBack"]) {
            [spinner stopAnimating];
            Clears = @"NotCallBack";
            [self crs_historyRoute];
            self.crs_TransactionView.hidden = NO;
            self.crs_TransactionDeclined.hidden = YES;
        }
        
        
    }
    else if ([status isEqualToString:@"DECLINED"]){
        [self crs_historyRoute];
        self.crs_TransactionDeclined.hidden = NO;
        
    }
    
    
    else if ([status isEqualToString:@"CANCELED"]){
        [self crs_historyRoute];
        self.crs_TransactionDeclined.hidden = NO;
        
    }
    
    else if ([status isEqualToString:@"PENDING"]){
        [self crs_historyRoute];
        self.crs_TransactionDeclined.hidden = NO;
        
    }
    else if ([status isEqualToString:@"WAITING"]){
        [self crs_historyRoute];
        self.crs_TransactionDeclined.hidden = NO;
        
    }
    else if ([status isEqualToString:@"ERROR"]){
        [self crs_historyRoute];
        self.crs_TransactionDeclined.hidden = NO;
        
    }
    
}













-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"Error for WEBVIEW: %@", [error description]);
}







- (IBAction)crs_BackClearsEttle:(id)sender {
    
    self.crs_TransactionCancelView.hidden = NO;
    
    
    
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
    NSURL *url = [NSURL URLWithString:Crosspay_CaptureClearSettle];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_BenificiaryNo forKey:@"beneficiary_no"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_Direct forKey:@"checkstatus"];
    [mapData setObject:ReferenceId forKey:@"referenceNo"];
    [mapData setObject:TransactioId forKey:@"transactionId"];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
     [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_TotalPayingAmount forKey:@"totalpayingamount"];
    
    [mapData setObject:_crs_orderid forKey:@"order_id"];
    [mapData setObject:[self.passingData valueForKey:@"currencyiso3a"] forKey:@"payeccyCode"];
    
    [mapData setObject:status forKey:@"status"];
    [mapData setObject:TransactioId forKey:@"transactionId"];
    
    
    
    if  ([status isEqualToString:@""]) {
      [mapData setObject:[_passingData valueForKey:@"Txn_no"] forKey:@"referenceNo "];
    }
    
    
    
    
    
    
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
                if ([[json valueForKey:@"status"]isEqualToString:@"200"])
                                                  {
                                                      
                self.crs_BackClearSettleOut.userInteractionEnabled = NO;
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                HistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"historyViewControllerSID"];;
              viewController.crs_BackToHome = @"Home";
             [self.navigationController pushViewController:viewController animated:YES];
                                                      
                                                      
                                                  }
            else if ([[json valueForKey:@"status"]isEqualToString:@"300"]){
                                                      
                                                      
        self.crs_BackClearSettleOut.userInteractionEnabled = NO;
                                                      
                                                  }
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                              });
                                              
                                              
                                          }];
    
    
    
    
    
    
    [postDataTask resume];
    
    
}



- (IBAction)crs_YesAction:(id)sender {
    
    
    //[self crs_historyRoute];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    RecieverDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"RecieverDetailedViewControllerSID"];;
    viewController.Crs_BackToRecieverDetails = @"Reciever";
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}

- (IBAction)crs_NoAction:(id)sender {
    self.crs_TransactionCancelView.hidden = YES;
    [self crs_historyRoute];
}
- (IBAction)crs_TrsansactionAction:(id)sender {
    
    [self crs_historyRoute];
    
}





- (IBAction)crs_TransactionDeclined:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    RecieverDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"RecieverDetailedViewControllerSID"];;
    viewController.Crs_BackToRecieverDetails = @"Reciever";
    [self.navigationController pushViewController:viewController animated:YES];
    
}
@end

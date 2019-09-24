//
//  SecureTradingViewController.m
//  CrossPay
//
//  Created by sai kiran  on 9/7/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "SecureTradingViewController.h"
#import "HomeViewController.h"
#import "Crs_sharedvariable.h"
#import "HistoryViewController.h"
#import "MBProgressHUD.h"
#import "crs_sharedmethods.h"
#import "GlobalUrlsFile.h"
#import "RecieverDetailedViewController.h"
@interface SecureTradingViewController ()
{
    
    
    NSTimer *crs_WebCller;
    UIActivityIndicatorView *spinner;
    NSString * promo1;
    NSString * checkBalance;
    NSString * Links;
    NSMutableArray * historyArray;
    
}
@end

@implementation SecureTradingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     historyArray = [NSMutableArray new];
    
Links = [_crs_SecureTradingLink valueForKey:@"link"];
    NSLog(@"My Link%@",Links);
    
    @try {
       Links= [_crs_SecureTradingLink valueForKey:@"link"];
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    
    
    self.crs_SecureTradingWeb.delegate = self;
    
    NSString * stringUrl = [NSString stringWithFormat:@"%@?mainamount=%@&currencyiso3a=%@&sitereference=%@&orderreference=%@&version=%@&stprofile=blue",[_crs_SecureTradingLink valueForKey:@"link"],[self.crs_CHARITYAmount valueForKey:@"totalpayingamount"],[self.crs_CHARITYCurrencyCode  valueForKey:@"payeccyCode"] ,[self.crs_CHARITYSiteReference valueForKey:@"sitereference"],[self.crs_CHARITYOrderId valueForKey:@"orderreference"],[self.crs_CHARITYVersion valueForKey:@"version"]] ;
    
//    
//    [self.passingData valueForKey:@"mainamount"],[self.passingData  valueForKey:@"currencyiso3a"] ,[self.passingData valueForKey:@"sitereference"],[self.passingData valueForKey:@"orderreference"],[self.passingData valueForKey:@"version"]] ;
    
    
    
    
    
   // order_id,user_id,payeccyCode,totalpayingamount,referenceNo,
    
    NSURL * url = [NSURL URLWithString:stringUrl];
    NSURLRequest * requestUrl = [NSURLRequest requestWithURL:url];
    [self.crs_SecureTradingWeb loadRequest:requestUrl];
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    //[mapData setObject:ReferenceId forKey:@"referenceNo"];
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
  [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
    [mapData setObject:_crs_CHARITYOrderId forKey:@"order_id"];
    [mapData setObject:_crs_CHARITYCurrencyCode forKey:@"payeccyCode"];
    [mapData setObject:_crs_CHARITYAmount forKey:@"otalpayingamount"];
    
    [mapData setObject:_crs_CHARITYOrganisationCode forKey:@"organisationCode"];
    
    
    //order_id,user_id,payeccyCode,totalpayingamount,referenceNo,
   
    
    //order_id,user_id,payeccyCode,totalpayingamount,referenceNo,
    
    
    
    
    
    
    
    
    
    
    
    
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
                                                      
                                    //self.crs_BackOut.userInteractionEnabled = NO;
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            HistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"historyViewControllerSID"];;
            viewController.crs_BackToHome = @"Home";
            [self.navigationController pushViewController:viewController animated:YES];
                                                      
                                                      
                                                  }
                    else if ([[json valueForKey:@"status"]isEqualToString:@"300"]){
                                                      
                                                      
                                                      //self.crs_BackOut.userInteractionEnabled = NO;
                                                      
                                                  }
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                              });
                                              
                                              
                                          }];
    
    
    
    
    
    
    [postDataTask resume];
    
    
}

- (IBAction)crs_sucessfullYesAction:(id)sender {
}
- (IBAction)crs_NoAction:(id)sender {
}



- (void)History_WebService {
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSError * error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_TransactionHistory];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
    
    
    
    
    
    
    
    
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
                                                  
                                                  NSLog(@"%@", [json valueForKey:@"data"]);
                                                  
                                                  
                                                  if ([[json valueForKey:@"status"] isEqualToString:@"200"]) {
                                                      
                                                      
                                                      historyArray = [json valueForKey:@"data"];
                                                      // historyArray = [[[historyArray reverseObjectEnumerator] allObjects] mutableCopy];
                                                      //  NSInteger *i=0;
                                                      
                                                      
                                                  }
                                                  
                                                  
                                                  else if ([[json valueForKey:@"status"] isEqualToString:@"201"]){
                                                      
                                                      
                                                      UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"No Transactions Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                      
                                                      [alert show];
                                                  }
                                                  
                                                  
                                                  
                                                  else{
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      
                                                  }
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                              });
                                              
                                              
                                          }];
    
    
    
    
    
    
    [postDataTask resume];
    
}
@end

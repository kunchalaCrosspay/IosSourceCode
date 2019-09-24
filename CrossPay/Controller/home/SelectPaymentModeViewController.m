//
//  SelectPaymentModeViewController.m
//  CrossPay
//
//  Created by sai kiran  on 9/22/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import "SelectPaymentModeViewController.h"
#import "RecieverDetailedViewController.h"
#import "Crs_sharedvariable.h"
#import "webViewController.h"
#import "HistoryDetailedViewController.h"
#import "HomeViewController.h"
#import "MBProgressHUD.h"
#import "HistoryViewController.h"
#import "crs_sharedmethods.h"
#import "GlobalUrlsFile.h"
//#import <Google/Analytics.h>
#import "TermsandCondtionsViewController.h"
#import "NewTermsViewController.h"
#import "PrivacyPolicyViewController.h"
#import "ClearSettleViewController.h"
#import "NewSEcureTradingViewController.h"
#import "UpdateProfile.h"
#import "Crs_sharedvariable.h"
#import "MBProgressHUD.h"
#import "GlobalUrlsFile.h"
#import "VerifyMobileScreen.h"
#import "NewHomeViewController.h"
#import "SettingsViewController.h"
@interface SelectPaymentModeViewController ()
{
    NSString * cardType;
    NSString * Crs_OrderID;
    NSMutableDictionary * crs_PassingToWebview;
    NSMutableDictionary * crs_PassingToWebview1;
    NSString * click1;
    NSString * click2;
    NSString * promo1;
    NSString * promoBalnce1;
    NSString * Rates;
    NSString*ClearSettleCard;
    NSMutableArray * historyArray;
    NSString * CurrencyRate;
    NSString * SourceCurrencyCode;
    NSString * PayOutAmount;
    NSString*PayinAmount;
    NSString * TransfeRfee;
    NSString * PaymentType;
    NSString * CurrencyDisplayer1;
    
}
@end

@implementation SelectPaymentModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self webserviceClearSettle];
    
    self.crs_RecepitView.hidden = YES;
    self.crs_AccountView.hidden = YES;
    click1 = @"Checkout";
    click2 = @"Checkout";
    Rates = @"Rates1";
    
    [self ForUserDetails];
    self.crs_paymentdispalayingoption.hidden = YES;
    
    self.crs_PopView1.hidden = YES;
    
    self.crs_limitLabel.hidden = YES;
    self.crs_RateView.hidden = YES;
    
    
    
    if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"NOK"]){
        self.crs_BankAccount.hidden = YES;
        self.crs_BankTransferLabel.hidden = YES;
        self.crs_NorwayLbl.text = @"Viktig: Avsender kan ikke bruke en annen persons kort.Kortet som skal belastes må ha samme navn som bruker id på Crosspaymt.";
        self.Crs_CleraSettleOutlet.hidden = YES;
        self.crs_CleardettleLabel.hidden = YES;
        self.crs_secureTradingLabel.text = @"DEBIT CARD";
    }
    
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"SEK"]||[[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"DKK"]){
        
        self.crs_BankAccount.hidden = YES;
        self.crs_BankTransferLabel.hidden = YES;
        self.crs_NorwayLbl.text = @"Note: We do not accept funds from third party accounts or cards";
        self.Crs_CleraSettleOutlet.hidden = YES;
        self.crs_CleardettleLabel.hidden = YES;
        self.crs_Credit.hidden = NO;
        self.crs_secureTradingLabel.hidden = NO;
        self.crs_secureTradingLabel.text = @"DEBIT CARD";
    }
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"EUR"]){
        
        self.crs_BankAccount.hidden = NO;
        self.crs_BankTransferLabel.hidden = NO;
        self.crs_NorwayLbl.text = @"Note: We do not accept funds from third party accounts or cards";
        
    }
    
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"GBP"]){
        self.Crs_CleraSettleOutlet.hidden = YES;
        self.crs_CleardettleLabel.hidden = YES;
        self.crs_BankAccount.hidden = NO;
        self.crs_BankTransferLabel.hidden = NO;
        self.crs_Credit.hidden = NO;
        self.crs_secureTradingLabel.text = @"DEBIT CARD";
        self.crs_NorwayLbl.text = @"Note: We do not accept funds from third party accounts or cards";
        
    }
    else{
        
        
        self.crs_BankAccount.hidden = NO;
        self.crs_BankTransferLabel.hidden = NO;
        self.crs_NorwayLbl.text = @"Note: We do not accept funds from third party accounts or cards";
    }
    
    
    NSLog(@"venkatesh ************%@",self.Crs_banktransfercountry);
    
    [self.crs_ProceedOut.layer setBorderWidth:1.0];
    [self.crs_ProceedOut.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    [self.crs_hidetheviewoutlet.layer setBorderWidth:1.0];
    [self.crs_hidetheviewoutlet.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    self.crs_ViewHider.hidden = YES;
    
    NSLog(@"Ivanka Trump%@",_TotalAmountPassing);
    
    
    crs_PassingToWebview  = [NSMutableDictionary new];
    crs_PassingToWebview1  = [NSMutableDictionary new];
    self.crs_TxnNumber.textColor = [UIColor whiteColor];
    
    
    [self.crs_paymentout.layer setBorderWidth:3.0];
    [self.crs_paymentout.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    
    
    
    
    
    
    
    self.crs_SuperView.hidden = YES;
    
    NSLog(@" Dimbu %@",self.crs_CashPayComparsion);
    NSLog(@"venkatesh %@",[Crs_sharedvariable sharedMySingleton].crs_CommisionRate);
    NSLog(@" %@",[Crs_sharedvariable sharedMySingleton].crs_PayOUtAmount);
    NSLog(@" %@",[Crs_sharedvariable sharedMySingleton].crs_PayInAmount);
    NSLog(@" sai %@", [Crs_sharedvariable sharedMySingleton].crs_CashPayCommison);
    // Do any additional setup after loading the view.
    self.crs.hidden = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)cashPayWebservice
{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
    }
    NSError * error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate: self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_InitiateCashTransaction];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_AgentCode forKey:@"agent_code"];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_BenificiaryNo forKey:@"beneficiary_no"];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
    //[mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_PromoBalance forKey:@"promobalance"];
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_FromCountry1
                forKey:@"ccycode"];
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_FromCountry1
                forKey:@"payeccyCode"];
    
    [mapData setObject:@"0" forKey:@"paymentmode"];
    [mapData setObject:@"IOS" forKey:@"device"];
    //    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_Direct forKey:@"checkstatus"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_Reverse forKey:@"checkstatus"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_PayInAmount forKey:@"totalpayingamount"];
    
    
    // source of fund
    [mapData setObject:_Remitance1 forKey:@"porcode"];
    [mapData setObject:_Purposecode1 forKey:@"sofcode"];
    //[mapData setObject:_PromoBalance forKey:@"PromoCodeBalance"];
    
    
    @try {
        [mapData setObject:_PromoBalance forKey:@"PromoCodeBalance"];
        
        
    }
    @catch (NSException * e) {
        NSLog(@" HELLO THERE Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    
    
    //    else if (promoBalance == (id)[NSNull null] || promoBalance.length == 0){
    //
    //
    //        promoBalance = 0;
    //
    //    }
    //
    //
    
    
    @try {
        
        [mapData setObject:_PromoCode forKey:@"PromoCode"];;
        
        
    }
    @catch (NSException * e) {
        NSLog(@" HELLO THERE Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    
    
    
    //[mapData setObject:_PromoCode forKey:@"PromoCode"];
    
    
    
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_selectedCoutryCurrencyCode forKey:@"accountccycode"];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton ].crs_SourceIsoCode forKey:@"sourcecountryisocode"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton ].crs_FromIsoCode forKey:@"destinationcountryisocode"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_TotalPayingAmount forKey:@"count"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton ].crs_CashPayCommison forKey:@"commission"];
    NSLog(@"%@",mapData);
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                          {
                                              
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  [MBProgressHUD hideHUDForView:self.view animated:YES];
                                                  NSLog(@"error %@",error);
                                                  NSLog(@"data %@",data);
                                                  NSMutableDictionary * json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                  NSLog(@"Sai %@", json );
                                                  
                                                  NSLog(@"%@", [json valueForKey:@"message"]);
                                                  crs_PassingToWebview = json;
                                                  Crs_OrderID = [json valueForKey:@"orderreference"];
                                                  
                                                  
                                                  if ([[json valueForKey:@"message"]isEqualToString:@"success"]) {
                                                      
                                                      if ([cardType isEqualToString:@"DebitCard"]) {
                                                          
                                                          
                                                          
                                                          UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                          
                                                          ClearSettleViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"ClearSettleSID"];;
                                                          viewController.crs_orderid = Crs_OrderID;
                                                          viewController.passingData = crs_PassingToWebview;
                                                          viewController.promoGetter = self.PromoCode;
                                                          [self.navigationController pushViewController:viewController animated:YES];
                                                          
                                                      }
                                                      else{
                                                          UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                          NewSEcureTradingViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewSecureTradingSID"];;
                                                          viewController.OrderId = Crs_OrderID;
                                                          viewController.passingData = crs_PassingToWebview;
                                                          viewController.promoGetter = self.PromoCode ;
                                                          [self.navigationController pushViewController:viewController animated:YES];
                                                          
                                                      }
                                                  }
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  else {
                                                      
                                                      UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                      
                                                      [alert show];
                                                      return ;
                                                      
                                                      
                                                  }
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                              });
                                              
                                              
                                          }];
    
    
    
    
    
    
    [postDataTask resume];
    
}


- (IBAction)crs_back:(id)sender {
}

- (IBAction)crs_ProceedToPayment:(id)sender {
    
    [self.view endEditing:YES];
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    if (![_crs_Credit isSelected]&&![_crs_BankAccount isSelected]&&![_Crs_CleraSettleOutlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Any One Option To Proceed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    
    if (![_crs_checkoutOutlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please accept Terms and Conditions  to Proceed " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
        
        
        
    }
    
    if (![_crs_checkouttwooutlet isSelected]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please accept Privacy Policy to Proceed " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
        
    }
    
    
    
    
    
    
    
    
    //self.crs_SuperView.hidden = NO;
    
    if ([cardType isEqualToString:@"accountTransfer"]) {
        
        
        
        
        if ([self.crs_TxnNumber.text isEqualToString:@""])  {
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Mobile Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        
        
        
        
        else {
            if ([self.crs_CashPayComparsion isEqualToString:@"CashPay"])
            {
                if ([self.Crs_banktransfercountry isEqualToString:@"PHILIPPINES"]) {
                    
                    float f3 = [[Crs_sharedvariable sharedMySingleton].crs_PayInAmount floatValue];
                    if (f3>=50000) {
                        
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"The Total Pay-Out Amount should not exceed  50000 PHP" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        
                    }
                    
                    else{
                        [self cashAccountTransfer];
                        
                        
                    }
                    
                }
                
                else
                {
                    
                    [self cashAccountTransfer];
                    
                }
                
                
                
                
            }
            else
            {
                
                [self cashAccountTransfer];
                
            }
            
        }
        
        
    }
    else if ([self.crs_CashPayComparsion isEqualToString:@"MOBILEWALLET"]){
        [self WalletService];
        
    }
    else{
        
        
        if ([self.crs_CashPayComparsion isEqualToString:@"CashPay"]) {
            
            if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"GBP"]) {
                float f1 = [self.TotalAmountPassing floatValue];
                if (f1>10000000) {
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"The Total Pay-In Amount should not exceed  1000 GBP" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                
                
                
                
                
                
                
                
                
                
                
                else{
                    
                    [self cashPayWebservice];
                    
                    
                    
                }
                
            }
            else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"SEK"])
                
            {
                
                
                float f1 = [self.TotalAmountPassing floatValue];
                if (f1>=3000000000) {
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"The Total Pay-In Amount should not exceed  30000 SEK" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                else{
                    
                    [self cashPayWebservice];
                    
                    
                    
                }
                
                
            }
            
            else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"EUR"])
                
            {
                
                
                float f1 = [self.TotalAmountPassing floatValue];
                if (f1>10000000) {
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"The Total Pay-In Amount should not exceed  1000 EUR" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                else{
                    
                    [self cashPayWebservice];
                    
                    
                    
                }
                
                
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"DKK"])
                
            {
                
                
                float f1 = [self.TotalAmountPassing floatValue];
                if (f1>=3000000000) {
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"The Total Pay-In Amount should not exceed  30000 DKK" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                else{
                    
                    [self cashPayWebservice];
                    
                    
                    
                }
                
                
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            else{
                
                float f1 = [self.TotalAmountPassing floatValue];
                if (f1>=3000009909090) {
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"The Total Pay-In Amount should not exceed  30000 NOK" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                else{
                    
                    [self cashPayWebservice];
                    
                    
                    
                }
                
                
                
            }
        }
        else{
            
            
            if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"GBP"]) {
                float f1 = [self.TotalAmountPassing floatValue];
                if (f1>10000000) {
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"The Total Pay-In Amount should not exceed  1000 GBP" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                else{
                    
                    [self webservice];
                    
                    
                    
                }
                
            }
            
            else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"SEK"]){
                
                
                float f1 = [self.TotalAmountPassing floatValue];
                if (f1>=300000000) {
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"The Total Pay-In Amount should not exceed  30000 SEK" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                else{
                    
                    [self webservice];
                    
                    
                    
                }
                
                
            }
            else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"DKK"]){
                
                
                float f1 = [self.TotalAmountPassing floatValue];
                if (f1>=300000000) {
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"The Total Pay-In Amount should not exceed  30000 DKK" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                else{
                    
                    [self webservice];
                    
                    
                    
                }
                
                
            }
            
            else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"EUR"]){
                
                
                float f1 = [self.TotalAmountPassing floatValue];
                if (f1>10000000) {
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"The Total Pay-In Amount should not exceed  1000 EUR" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                else{
                    
                    [self webservice];
                    
                    
                    
                }
                
                
            }
            
            
            
            
            
            else{
                
                float f1 = [self.TotalAmountPassing floatValue];
                if (f1>=30009090909090) {
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"The Total Pay-In Amount should not exceed  30000 NOK" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                else{
                    
                    [self webservice];
                    
                    
                    
                }
                
                
                
            }
            
            
        }
        
        
        
        
        
        
        
    }
    
    
    
    
    
}
- (IBAction)crs_Debit:(id)sender {
    cardType = @"CreditCard";
    self.crs_PopView1.hidden = YES;
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"GBP"]) {
        
        self.crs_paymentdispalayingoption.hidden = NO;
        self.crs_limitLabel.hidden = NO;
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount £1000 over a 30 day period )";
        self.crs_limitLabel.text = @"No Limit for Bank Transfers";
        
    }
    
    
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"EUR"]){
        
        self.crs_paymentdispalayingoption.hidden = NO;
        
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 1000 EUR over a 30 day period)";
        
        
    }
    
    
    
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"SEK"]){
        
        self.crs_paymentdispalayingoption.hidden = NO;
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 30,000 SEK over a 30 day period)";
        self.crs_BankAccount.hidden = YES;
        self.crs_BankTransferLabel.hidden = YES;
        
        
    }
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"DKK"]){
        
        self.crs_paymentdispalayingoption.hidden = NO;
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 30,000 DKK over a 30 day period)";
        self.crs_BankAccount.hidden = YES;
        self.crs_BankTransferLabel.hidden = YES;
        
        
    }
    
    
    
    else{
        
        self.crs_paymentdispalayingoption.hidden = NO;
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 30,000 NOK over a 30 day period)";
        self.crs_BankAccount.hidden = YES;
        self.crs_BankTransferLabel.hidden = YES;
    }
    
    cardType  = @"CeditCard";
    self.crs_SuperView.hidden = YES;
    [self.crs_Credit setSelected:YES];
    [self.crs_BankAccount setSelected:NO];
    [self.Crs_CleraSettleOutlet setSelected:NO];
    self.crs_SuperView.hidden = YES;
    
    
    if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"GBP"]) {
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount £1000 over a 30 day period)";
        self.crs_limitLabel.text = @"No Limit for Bank Transfers";
        self.crs_limitLabel.hidden = NO;
        
    }
    
    
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"SEK"]){
        
        
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 30,000 SEK over a 30 day period)";
        
    }
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"DKK"]){
        
        
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 30,000 DKK over a 30 day period)";
        
    }
    
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"EUR"]){
        
        
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 1OOO EUR over a 30 day period)";
        
    }
    
    
    
    else{
        
        
        
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 30,000 NOK over a 30 day period)";
        
    }
}

- (IBAction)crs_AccountTransfer:(id)sender {
    
    
    
    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please transfer the total pay-in amount to the account details mentioned on this page." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
    
    self.crs_PopView1.hidden = NO;
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"GBP"]) {
        self.crs_paymentdispalayingoption.hidden = NO;
        self.crs_limitLabel.hidden = NO;
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount £1000 over a 30 day period)";
        self.crs_limitLabel.text = @"No Limit for Bank Transfers";
        
        
    }
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"EUR"]){
        
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 1000 EUR over a 30 day period)";
        self.crs_paymentdispalayingoption.hidden = NO;
        
    }
    
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"SEK"]){
        
        
        self.crs_paymentdispalayingoption.hidden = NO;
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 30,000 SEK over a 30 day period)";
        self.crs_BankAccount.hidden = YES;
        self.crs_BankTransferLabel.hidden = YES;
        
    }
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"DKK"]){
        
        
        self.crs_paymentdispalayingoption.hidden = NO;
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 30,000 DKK over a 30 day period)";
        self.crs_BankAccount.hidden = YES;
        self.crs_BankTransferLabel.hidden = YES;
        
    }
    
    
    else{
        
        self.crs_paymentdispalayingoption.hidden = NO;
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 30,000 NOK over a 30 day period)";
        self.crs_BankAccount.hidden = YES;
        self.crs_BankTransferLabel.hidden = YES;
    }
    
    
    if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"GBP"]) {
        self.crs_AccountNumber.text = @"Account Number : 20272848";
        self.crs_SortingCode.text = @" Sort Code : 23-05-80";
        self.crs_IbanLabel.hidden = YES;
        self.crs_limitLabel.hidden = YES;
    }
    
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"EUR"]){
        
        self.crs_paymentdispalayingoption.hidden = NO;
        self.crs_AccountNumber.text = @"Account Number : 20984457";
        self.crs_SortingCode.hidden = NO;
        self.crs_SortingCode.text =@"IBAN : GB47MYMB23058020984457";
        
        self.crs_IbanLabel.hidden = YES;
        
        
        
        
        
    }
    
    
    else
    {
        
        self.crs_AccountNumber.text = @"Account Number : 21279919";
        self.crs_SortingCode.text = @" Sort Code : 23-05-80";
        self.crs_IbanLabel.hidden = NO;
        self.crs_IbanLabel.text = @"IBAN : GB47MYMB23058021279919";
        
    }
    
    
    
    cardType  = @"accountTransfer";
    
    [self.crs_Credit setSelected:NO];
    [self.Crs_CleraSettleOutlet setSelected:NO];
    [self.crs_BankAccount setSelected:YES];
    self.crs_SuperView.hidden = NO;
    self.crs.hidden = NO;
    self.crs_paymentdispalayingoption.text = @"The transaction will be authorised on receipt of cleared funds in our bank account.";
}

- (IBAction)crs_SelectedBack:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

/// Where we have to call these Api  http://ec2-52-11-197-132.us-west-2.compute.amazonaws.com:6099/Crosspaydev/initiateTransaction
// where http://ec2-52-11-197-132.us-west-2.compute.amazonaws.com:6099/Crosspaydev/initiateCashTransaction
// After sucessfull transaction how is it going to history
// After suceesfull Bank Transfer  whre ewe have to redirect

-(void)webservice
{
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Pls Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    
    UITextField * textFieldIndustry = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 465, 68)];
    textFieldIndustry.font = [UIFont systemFontOfSize:17.0];
    textFieldIndustry.placeholder = @"Tap to..";
    textFieldIndustry.textAlignment = NSTextAlignmentCenter;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSError * error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_InitiateTransaction];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_BenificiaryNo forKey:@"beneficiary_no"];
    // sravathi sgestion
    
    //
    [mapData setObject:_Remitance1 forKey:@"porcode"];
    [mapData setObject:_Purposecode1 forKey:@"sofcode"];
    //[mapData setObject:_PromoBalance forKey:@"PromoCodeBalance"];
    
    
    @try {
        
        [mapData setObject:_PromoCode forKey:@"PromoCode"];;
        
        
    }
    @catch (NSException * e) {
        NSLog(@" HELLO THERE Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    @try {
        [mapData setObject:_PromoBalance forKey:@"PromoCodeBalance"];
        
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    
    // [mapData setObject:_PromoCode forKey:@"PromoCode"];
    
    [mapData setObject:@"IOS" forKey:@"device"];
    // [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_Direct forKey:@"checkstatus"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_Reverse forKey:@"checkstatus"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_PromoPassing forKey:@"PromoCode"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_FromCountry1
                forKey:@"payeccyCode"];
    
    //[mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_PromoBalance forKey:@"promobalance"];
    
    
    // [mapData setObject:@"GBP" forKey:@"ccycode"];
    
    
    [mapData setObject:@"1" forKey:@"paymentmode"];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_TotalPayingAmount forKey:@"count"];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_selectedCoutryCurrencyCode forKey:@"accountccycode"];
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_PayInAmount forKey:@"totalpayingamount"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton ].crs_CommisionRate forKey:@"commission"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton ].crs_SourceIsoCode forKey:@"sourcecountryisocode"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton ].crs_FromIsoCode forKey:@"destinationcountryisocode"];
    NSLog(@"%@",mapData);
    
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
                                                  
                                                  
                                                  if ([[json valueForKey:@"message"]isEqualToString:@"success"]) {
                                                      
                                                      
                                                      
                                                      if ([cardType isEqualToString:@"DebitCard"]) {
                                                          
                                                          crs_PassingToWebview = json;
                                                          
                                                          Crs_OrderID = [json valueForKey:@"orderreference"];
                                                          UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                          ClearSettleViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"ClearSettleSID"];;
                                                          viewController.crs_orderid = Crs_OrderID;
                                                          viewController.passingData = crs_PassingToWebview;
                                                          viewController.promoGetter = self.PromoCode;
                                                          [self.navigationController pushViewController:viewController animated:YES];
                                                          
                                                      }
                                                      
                                                      else{
                                                          
                                                          crs_PassingToWebview = json;
                                                          
                                                          Crs_OrderID = [json valueForKey:@"orderreference"];
                                                          
                                                          
                                                          UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                          NewSEcureTradingViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewSecureTradingSID"];;
                                                          viewController.OrderId = Crs_OrderID;
                                                          viewController.passingData = crs_PassingToWebview;
                                                          viewController.promoGetter = self.PromoCode;
                                                          [self.navigationController pushViewController:viewController animated:YES];
                                                      }
                                                      
                                                  } else {
                                                      
                                                      UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                      
                                                      [alert show];
                                                      return ;
                                                  }
                                                  
                                                  
                                                  // When Commision matched Unhide these code
                                                  
                                                  
                                              });
                                              
                                              
                                          }];
    
    
    
    
    
    
    [postDataTask resume];
    
}

- (IBAction)crs_DismissAction:(id)sender {
    
    
    
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}


-(BOOL) textFieldShouldReturn: (UITextField *) textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(void)cashAccountTransfer
{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
    }
    NSError * error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate: self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_YesBank];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_BenificiaryNo forKey:@"beneficiary_no"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_PromoPassing forKey:@"PromoCode"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
    [mapData setObject:_Remitance1 forKey:@"porcode"];
    [mapData setObject:_Purposecode1 forKey:@"sofcode"];
    // [mapData setObject:_PromoBalance forKey:@"PromoCodeBalance"];
    
    
    @try {
        
        [mapData setObject:_PromoCode forKey:@"PromoCode"];;
        
        
    }
    @catch (NSException * e) {
        NSLog(@" HELLO THERE Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    
    
    @try {
        [mapData setObject:_PromoBalance forKey:@"PromoCodeBalance"];
        
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    
    // [mapData setObject:_PromoBalance1 forKey:@"PromoCodeBalance"];
    // [mapData setObject:_PromoCode forKey:@"PromoCode"];
    
    
    
    // Sravanthi suggestion
    
    [mapData setObject:@"IOS" forKey:@"device"];
    
    //[mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_Direct forKey:@"checkstatus"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_Reverse forKey:@"checkstatus"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_FromCountry1
                forKey:@"ccycode"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_FromCountry1
                forKey:@"payeccyCode"];
    if ([self.crs_CashPayComparsion isEqualToString:@"CashPay"]) {
        [mapData setObject:@"0" forKey:@"paymentmode"];
        
        [mapData setObject:[Crs_sharedvariable sharedMySingleton ].crs_CashPayCommison forKey:@"commission"];
        
        
        [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_AgentCode forKey:@"agent_code"];
        
        // [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_PromoBalance forKey:@"promobalance"];
        
    }
    
    else if ([self.crs_CashPayComparsion isEqualToString:@"MOBILEWALLET"]){
        [mapData setObject:@"2" forKey:@"paymentmode"];
        [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_Mobilewallet forKey:@"agent_code"];
        [mapData setObject:[Crs_sharedvariable sharedMySingleton ].crs_WalletCommision forKey:@"commission"];
    }
    
    else{
        [mapData setObject:@"1" forKey:@"paymentmode"];
        [mapData setObject:[Crs_sharedvariable sharedMySingleton ].crs_CommisionRate forKey:@"commission"];
        [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_AgentCode forKey:@"agent_code"];
    }
    
    
    //[mapData setObject:@"reverse" forKey:@"checkstatus"];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_PayInAmount forKey:@"totalpayingamount"];
    //[mapData setObject:@"INR" forKey:@"accountccycode"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_selectedCoutryCurrencyCode forKey:@"accountccycode"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton ].crs_SourceIsoCode forKey:@"sourcecountryisocode"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton ].crs_FromIsoCode forKey:@"destinationcountryisocode"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_TotalPayingAmount forKey:@"count"];
    [mapData setObject:self.crs_TxnNumber.text forKey:@"txnno"];
    // [mapData setObject:@"1" forKey:@"count"];
    
    NSLog(@"%@",mapData);
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                          {
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  [MBProgressHUD hideHUDForView:self.view animated:YES];;
                                                  NSLog(@"error %@",error);
                                                  NSLog(@"data %@",data);
                                                  NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                  NSLog(@" Rambo %@ ", json );
                                                  
                                                  NSLog(@"%@", [json valueForKey:@"message"]);
                                                  
                                                  Crs_OrderID = [json valueForKey:@"orderreference"];
                                                  
                                                  
                                                  
                                                  if ([[json valueForKey:@"status"]isEqualToString:@"200"])  {
                                                      
                                                      
                                                      NSString* str = @"";
                                                      if([[[json valueForKey:@"message"] lowercaseString] isEqualToString:@"success"]){
                                                          str = @"Your transaction has been successful.";
                                                      }
                                                      
                                                      
                                                      
                                                      UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Crosspay" message:str preferredStyle:UIAlertControllerStyleAlert];
                                                      
                                                      [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction* action){
                                                          
                                                          
                                                          
                                                          NSUserDefaults* defaults1 = [NSUserDefaults standardUserDefaults];
                                                          NSString * Thanks  =    [defaults1 objectForKey:@"Thanks"];
                                                          if ([Thanks isEqualToString:@"Thanks"]) {
                                                              self.crs_RateView.hidden = NO
                                                              ;
                                                          }
                                                          
                                                          
                                                          else{
                                                              
                                                              [self HistoryView];   self.crs_RateView.hidden = YES;
                                                              
                                                              
                                                              self.crs_RecepitView.hidden = NO;
                                                              //                                                              UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                              //
                                                              //                                                              HistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"historyViewControllerSID"];;
                                                              //                                                              viewController.crs_BackToHome = @"Home";
                                                              //                                                              [self.navigationController pushViewController:viewController animated:YES];
                                                          }
                                                          
                                                          
                                                      }]];
                                                      
                                                      
                                                      [self presentViewController:alert animated:YES completion:nil];
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      
                                                  }
                                                  
                                                  else
                                                      
                                                  {
                                                      
                                                      
                                                      
                                                      UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                      
                                                      [alert show];
                                                      
                                                      
                                                  }
                                                  
                                                  
                                                  
                                                  
                                              });
                                              
                                              
                                          }];
    
    
    
    
    
    
    [postDataTask resume];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    //
    //
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"Select payment Mode  View controller"];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    //
}
- (IBAction)crs_checkoutAction:(id)sender {
    
    
    if ([click1 isEqualToString:@"Checkout"]) {
        [_crs_checkoutOutlet setSelected:YES];
        click1 = @"checkin";
        
        
    }
    else{
        
        [_crs_checkoutOutlet setSelected:NO];
        click1 = @"Checkout";
    }
    
    
}
- (IBAction)crs_checkouttwoaction:(id)sender {
    
    if ([click2 isEqualToString:@"Checkout"]) {
        [_crs_checkouttwooutlet setSelected:YES];
        click2 = @"checkin";
        
        
    }
    else{
        
        [_crs_checkouttwooutlet setSelected:NO];
        click2 = @"Checkout";
    }
    
}
- (IBAction)crs_link1:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NewTermsViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"TermsandConditionsViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)crs_link2:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    PrivacyPolicyViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"PrivacyViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}
- (IBAction)crs_HideTheView:(id)sender {
    
    self.crs_PopView1.hidden = YES;
}
- (IBAction)crs_RateAction:(id)sender {
    NSString *iTunesLink = @"https://itunes.apple.com/in/app/crosspay/id1312224710?mt=8";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
    
    
    
}
- (IBAction)crs_RemindMe:(id)sender {
    
    self.crs_RateView.hidden = YES;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"historyViewControllerSID"];;
    viewController.crs_BackToHome = @"Home";
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)crs_NoThanks:(id)sender {
    
    
    
    NSString *valueToSave = @"NoThanks";
    [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"Thanks"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    self.crs_RateView.hidden = YES;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"historyViewControllerSID"];;
    viewController.crs_BackToHome = @"Home";
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)Crs_ClearSEttleAction:(id)sender {
    
    cardType = @"DebitCard";
    self.crs_PopView1.hidden = YES;
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"GBP"]) {
        
        self.crs_paymentdispalayingoption.hidden = NO;
        self.crs_limitLabel.hidden = NO;
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount £1000 over a 30 day period )";
        self.crs_limitLabel.text = @"No Limit for Bank Transfers";
        
        
        
        
    }
    
    
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"EUR"]){
        
        self.crs_paymentdispalayingoption.hidden = NO;
        
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 1000 EUR over a 30 day period)";
        
        
    }
    
    
    
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"SEK"]){
        
        self.crs_paymentdispalayingoption.hidden = NO;
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 30,000 SEK over a 30 day period)";
        self.crs_BankAccount.hidden = YES;
        self.crs_BankTransferLabel.hidden = YES;
        
        
    }
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"DKK"]){
        
        self.crs_paymentdispalayingoption.hidden = NO;
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 30,000 DKK over a 30 day period)";
        self.crs_BankAccount.hidden = YES;
        self.crs_BankTransferLabel.hidden = YES;
        
        
    }
    
    
    
    else{
        
        self.crs_paymentdispalayingoption.hidden = NO;
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 30,000 NOK over a 30 day period)";
        self.crs_BankAccount.hidden = YES;
        self.crs_BankTransferLabel.hidden = YES;
    }
    
    //cardType  = @"creditCard";
    self.crs_SuperView.hidden = YES;
    [self.Crs_CleraSettleOutlet setSelected:YES];
    [self.crs_Credit setSelected:NO];
    [self.crs_BankAccount setSelected:NO];
    self.crs_SuperView.hidden = YES;
    
    if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"GBP"]) {
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount £1000 over a 30 day period)";
        self.crs_limitLabel.text = @"No Limit for Bank Transfers";
        self.crs_limitLabel.hidden = NO;
        
    }
    
    
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"SEK"]){
        
        
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 30,000 SEK over a 30 day period)";
        
    }
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"DKK"]){
        
        
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 30,000 DKK over a 30 day period)";
        
    }
    
    else if ([[Crs_sharedvariable sharedMySingleton].crs_FromCountry1 isEqualToString:@"EUR"]){
        
        
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 1OOO EUR over a 30 day period)";
        
    }
    
    
    
    else{
        
        
        
        self.crs_paymentdispalayingoption.text = @"(Maximum payment amount 30,000 NOK over a 30 day period)";
        
    }
}





-(void)webserviceClearSettle{
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Pls Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    
    UITextField * textFieldIndustry = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 465, 68)];
    textFieldIndustry.font = [UIFont systemFontOfSize:17.0];
    textFieldIndustry.placeholder = @"Tap to..";
    textFieldIndustry.textAlignment = NSTextAlignmentCenter;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSError * error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_InitiateTransaction];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_BenificiaryNo forKey:@"beneficiary_no"];
    // sravathi sgestion
    
    //
    [mapData setObject:_Remitance1 forKey:@"porcode"];
    [mapData setObject:_Purposecode1 forKey:@"sofcode"];
    //[mapData setObject:_PromoBalance forKey:@"PromoCodeBalance"];
    
    
    @try {
        
        [mapData setObject:_PromoCode forKey:@"PromoCode"];;
        
        
    }
    @catch (NSException * e) {
        NSLog(@" HELLO THERE Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    @try {
        [mapData setObject:_PromoBalance forKey:@"PromoCodeBalance"];
        
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    
    // [mapData setObject:_PromoCode forKey:@"PromoCode"];
    
    [mapData setObject:@"IOS" forKey:@"device"];
    //[mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_Direct forKey:@"checkstatus"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_Reverse forKey:@"checkstatus"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_PromoPassing forKey:@"PromoCode"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_FromCountry1
                forKey:@"payeccyCode"];
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_FromCountry1
                forKey:@"ccycode"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_FromCountry1
                forKey:@"payeccyCode"];
    
    
    
    
    
    [mapData setObject:@"1" forKey:@"paymentmode"];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_TotalPayingAmount forKey:@"count"];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_selectedCoutryCurrencyCode forKey:@"accountccycode"];
    
    
    
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_PayInAmount forKey:@"totalpayingamount"];
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton ].crs_CommisionRate forKey:@"commission"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton ].crs_SourceIsoCode forKey:@"sourcecountryisocode"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton ].crs_FromIsoCode forKey:@"destinationcountryisocode"];
    
    NSLog(@"%@",mapData);
    
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
                                                  
                                                  
                                                  if ([[json valueForKey:@"message"]isEqualToString:@"success"]) {
                                                      
                                                      crs_PassingToWebview = json;
                                                      
                                                      Crs_OrderID = [json valueForKey:@"orderreference"];
                                                      
                                                      
                                                      UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                      
                                                      ClearSettleViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"ClearSettleSID"];;
                                                      //            viewController.OrderId = Crs_OrderID;
                                                      //            viewController.passingData = crs_PassingToWebview;
                                                      viewController.promoGetter = self.PromoCode;
                                                      [self.navigationController pushViewController:viewController animated:YES];
                                                      
                                                      
                                                  }
                                                  else {
                                                      
                                                      UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                      
                                                      [alert show];
                                                      return ;
                                                  }
                                                  
                                                  
                                                  
                                                  
                                                  
                                              });
                                              
                                              
                                          }];
    
    
    
    
    
    
    [postDataTask resume];
    
}

//{"device":"customer","beneficiary_no":"1153","user_id":5,"payeccyCode":"GBP","paymentmode":"2","totalpayingamount":3108.29,"count":"23.63","accountccycode":"KES","porcode":"2","sofcode":"5","checkstatus":"direct","sourcecountryisocode":"GBR","destinationcountryisocode":"KEN","commission":0,"wallet_code":"TPTELKOM"}


-(void)WalletService
{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
    }
    NSError * error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate: self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_KenyaWalletService];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_AgentCode forKey:@"wallet_code"];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_BenificiaryNo forKey:@"beneficiary_no"];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
    //[mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_PromoBalance forKey:@"promobalance"];
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_FromCountry1
                forKey:@"ccycode"];
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_FromCountry1
                forKey:@"payeccyCode"];
    
    [mapData setObject:@"2" forKey:@"paymentmode"];
    [mapData setObject:@"IOS" forKey:@"device"];
    //    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_Direct forKey:@"checkstatus"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_Reverse forKey:@"checkstatus"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_PayInAmount forKey:@"totalpayingamount"];
    
    
    // source of fund
    [mapData setObject:_Remitance1 forKey:@"porcode"];
    [mapData setObject:_Purposecode1 forKey:@"sofcode"];
    //[mapData setObject:_PromoBalance forKey:@"PromoCodeBalance"];
    
    
    @try {
        [mapData setObject:_PromoBalance forKey:@"PromoCodeBalance"];
        
        
    }
    @catch (NSException * e) {
        NSLog(@" HELLO THERE Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    
    
    //    else if (promoBalance == (id)[NSNull null] || promoBalance.length == 0){
    //
    //
    //        promoBalance = 0;
    //
    //    }
    //
    //
    
    
    @try {
        
        [mapData setObject:_PromoCode forKey:@"PromoCode"];;
        
        
    }
    @catch (NSException * e) {
        NSLog(@" HELLO THERE Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    
    
    
    //[mapData setObject:_PromoCode forKey:@"PromoCode"];
    
    
    
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_selectedCoutryCurrencyCode forKey:@"accountccycode"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton ].crs_FromIsoCode forKey:@"destinationcountryisocode"];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton ].crs_SourceIsoCode forKey:@"sourcecountryisocode"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_TotalPayingAmount forKey:@"count"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton ].crs_WalletCommision forKey:@"commission"];
    NSLog(@"%@",mapData);
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                          {
                                              
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  [MBProgressHUD hideHUDForView:self.view animated:YES];
                                                  NSLog(@"error %@",error);
                                                  NSLog(@"data %@",data);
                                                  NSMutableDictionary * json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                  NSLog(@"Sai %@", json );
                                                  
                                                  NSLog(@"%@", [json valueForKey:@"message"]);
                                                  crs_PassingToWebview = json;
                                                  Crs_OrderID = [json valueForKey:@"orderreference"];
                                                  
                                                  
                                                  if ([[json valueForKey:@"message"]isEqualToString:@"success"]) {
                                                      
                                                      if ([cardType isEqualToString:@"DebitCard"]) {
                                                          
                                                          
                                                          
                                                          UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                          
                                                          ClearSettleViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"ClearSettleSID"];;
                                                          viewController.crs_orderid = Crs_OrderID;
                                                          viewController.passingData = crs_PassingToWebview;
                                                          viewController.promoGetter = self.PromoCode;
                                                          [self.navigationController pushViewController:viewController animated:YES];
                                                          
                                                      }
                                                      else{
                                                          UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                          NewSEcureTradingViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewSecureTradingSID"];;
                                                          viewController.OrderId = Crs_OrderID;
                                                          viewController.passingData = crs_PassingToWebview;
                                                          viewController.promoGetter = self.PromoCode ;
                                                          [self.navigationController pushViewController:viewController animated:YES];
                                                          
                                                      }
                                                  }
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  else {
                                                      
                                                      UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                      
                                                      [alert show];
                                                      return ;
                                                      
                                                      
                                                  }
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                              });
                                              
                                              
                                          }];
    
    
    
    
    
    
    [postDataTask resume];
    
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
            crs_PassingToWebview1 = json;
            NSLog(@" My profile Details @@@@@@@@ %@",crs_PassingToWebview1);
            NSLog(@"MY MESSAGE      %@", [json valueForKey:@"user_category_messgae"]);
            
            if ([[json valueForKey:@"status"] isEqualToString:@"200"]) {
                
                
                
            }
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}
- (IBAction)CRS_HOME:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
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

- (IBAction)crs_history:(id)sender {
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    SettingsViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewControllerSid"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    
    
}


-(void)HistoryView{
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    
    
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
        NSURL *url = [NSURL URLWithString:Crosspay_HistoryView];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
        //      {"user_id":701,"order_id":"order556281377","payeccyCode":"GBP","totalpayingamount":919.38,"beneficiary_no":"699","checkstatus":"direct","transactionreference":"7-9-4041581"}
        
        @try {
            
            
            [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
            [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
            //            [mapData setObject:[self.passingData valueForKey:@"orderreference"] forKey:@"order_no"];
            //
            
            
            [mapData setObject:Crs_OrderID forKey:@"order_no"];
            ;
        }
        @catch (NSException * e) {
            NSLog(@"Exception: %@", e);
        }
        @finally {
            NSLog(@"finally");
        }
        
        
        
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
                
                NSLog(@"%@", [json valueForKey:@"message"]);
                // message = [json valueForKey:@"message"];
                if ([[json valueForKey:@"status"]isEqualToString:@"200"]) {
                    
                    
                    //self.Reciept.hidden = YES;
                    PaymentType = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"accout_type"];
                    
                    if ([PaymentType isEqualToString:@"Account Credit"]) {
                        self.crs_CashView.hidden = YES;
                        self.crs_AccountView.hidden = NO;
                        
                    }
                    else{
                        
                        self.crs_AccountView.hidden = YES;
                        self.crs_CashView.hidden = NO;
                    }
                    
                    
                    self.crs_RecieverName.text = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"name"];
                    self.crs_TransactionNumber.text = [self transactionseparter:[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"txn_no"]];
                    self.crs_CountryName.text = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"country"];
                    
                    if ([ self.crs_CountryName.text  isEqualToString:@"VIETNAM"]) {
                        
                        NSString *str = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"city"];
                        
                        NSArray * arr = [str componentsSeparatedByString:@"EWAY"];
                        
                        self.crs_City.text  = [arr objectAtIndex:1];
                        
                    }
                    else{
                        
                        self.crs_City.text = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"city"];
                        
                        
                    }
                    
                    self.crs_IfscNumber.text= [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"sofcode"];
                    self.crs_TransactionDate.text = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"txn_date"];
                    CurrencyRate = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"account_ccycode"];
                    SourceCurrencyCode = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"payin_ccycode"];
                    PayOutAmount = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"payee_amount"];
                    PayinAmount = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"payin_amount"];
                    
                    self.crs_PayOutAmount.text = [NSString stringWithFormat:@"%@ %@",self->PayOutAmount,CurrencyRate];
                    
                    NSString * Hello = @"1";
                    NSString * HelloThre = @"=";
                    CurrencyDisplayer1 = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"rate"];
                    self.crs_Rate.text = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",Hello,SourceCurrencyCode,HelloThre,CurrencyDisplayer1,CurrencyRate];
                    
                    
                    self.crs_PayinAmount.text = [NSString stringWithFormat:@"%@ %@",PayinAmount,SourceCurrencyCode];
                    self.crs_TransferFee.text = [NSString stringWithFormat:@"%@ %@",[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"commission"],SourceCurrencyCode];
                    self.crs_OrderAmount.text = [NSString stringWithFormat:@"%@ %@",[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"total_amount"],SourceCurrencyCode];
                    
                    
                    
                    
                    //Account
                    if ([self.crs_CountryName.text isEqualToString:@"INDIA"]) {
                        self.crs_IfscTextChanger.text = @"IFSC";
                    }
                    
                    
                    
                    
                    else if ([self.crs_CountryName.text isEqualToString:@"IRELAND"]||[self.crs_CountryName.text isEqualToString:@"FINLAND"]||[self.crs_CountryName.text isEqualToString:@"SPAIN"]||[self.crs_CountryName.text isEqualToString:@"GERMANY"]||[self.crs_CountryName.text isEqualToString:@"GREECE"]||[self.crs_CountryName.text isEqualToString:@"ITALY"]||[self.crs_CountryName.text isEqualToString:@"FRANCE"]||[self.crs_CountryName.text isEqualToString:@"NETHERLANDS"]||[self.crs_CountryName.text isEqualToString:@"AUSTRIA"]||[self.crs_CountryName.text isEqualToString:@"BELGIUM"]||[self.crs_CountryName.text isEqualToString:@"CYPRUS"]||[self.crs_CountryName.text isEqualToString:@"CZECH REPUBLIC"]||[self.crs_CountryName.text isEqualToString:@"ESTONIA"]||[self.crs_CountryName.text isEqualToString:@"HUNGARY"]||[self.crs_CountryName.text isEqualToString:@"ESTONIA"]||[self.crs_CountryName.text isEqualToString:@"SWEDEN"]||[self.crs_CountryName.text isEqualToString:@"NORWAY"]||[self.crs_CountryName.text isEqualToString:@"DENMARK"]||[self.crs_CountryName.text isEqualToString:@"UNITED KINGDOM"]||[self.crs_CountryName.text isEqualToString:@"LITHUANIA"]||[self.crs_CountryName.text isEqualToString:@"MALTA"]||[self.crs_CountryName.text isEqualToString:@"LUXEMBOURG"]||[self.crs_CountryName.text isEqualToString:@"HUNGARY"]||[self.crs_CountryName.text isEqualToString:@"LATVIA"]||[self.crs_CountryName.text isEqualToString:@"SLOVENIA"]||[self.crs_CountryName.text isEqualToString:@"SLOVAKIA"]){
                        
                        
                        self.crs_IfscTextChanger.text = @"Swift Code";
                        self.crs_AccAccountNumber.text = @"IBAN / Account Number";
                        
                    }
                    
                    
                    else if ([self.crs_CountryName.text isEqualToString:@"ISRAEL"]||[self.crs_CountryName.text isEqualToString:@"POLAND"]||[self.crs_CountryName.text isEqualToString:@"BAHRAIN"]||[self.crs_CountryName.text isEqualToString:@"CROATIA"]||[self.crs_CountryName.text isEqualToString:@"SWITZERLAND"]||[self.crs_CountryName.text isEqualToString:@"TURKEY"]||[self.crs_CountryName.text isEqualToString:@"SAUDI ARABIA"]||[self.crs_CountryName.text isEqualToString:@"UNITED ARAB EMIRATES"]||[self.crs_CountryName.text isEqualToString:@"QATAR"]||[self.crs_CountryName.text isEqualToString:@"KUWAIT"]||[self.crs_CountryName.text isEqualToString:@"ROMANIA"]||[self.crs_CountryName.text isEqualToString:@"BULGARIA"]){
                        
                        
                        
                        self.crs_IfscTextChanger.text = @"Swift Code";
                        self.crs_AccAccountNumber.text = @"IBAN";
                    }
                    
                    
                    
                    
                    else if ([self.crs_CountryName.text isEqualToString:@"THAILAND"]||[self.crs_CountryName.text isEqualToString:@"NEW ZEALAND"]||[self.crs_CountryName.text isEqualToString:@"SOUTH AFRICA"]||[self.crs_CountryName.text isEqualToString:@"OMAN"]||[self.crs_CountryName.text isEqualToString:@"JAPAN"]||[self.crs_CountryName.text isEqualToString:@"HONG KONG"]||[self.crs_CountryName.text isEqualToString:@"SINGAPORE"]){
                        
                        
                        
                        self.crs_IfscTextChanger.text = @"Swift Code";
                        self.crs_AccAccountNumber.text = @"Account Number";
                    }
                    
                    else if ([self.crs_CountryName.text isEqualToString:@"AUSTRALIA"]||[self.crs_CountryName.text isEqualToString:@"SIERRA LEONE"]||[self.crs_CountryName.text isEqualToString:@"CANADA"]||[self.crs_CountryName.text isEqualToString:@"UNITED STATES"]){
                        
                        
                        
                        self.crs_IfscTextChanger.text = @"Swift Code";
                        //self.crs_AccAccountNumber.text = @"Account Number";
                    }
                    
                    
                    
                    else if ([self.crs_CountryName.text isEqualToString:@"SRI LANKA"]||[self.crs_CountryName.text isEqualToString:@"PAKISTAN"]){
                        
                        
                        
                        self.crs_IfscTextChanger.text = @"Branch Code";
                        //self.crs_AccAccountNumber.text = @"Account Number";
                    }
                    
                    
                    else if ([self.crs_CountryName.text isEqualToString:@"NEPAL"]||[self.crs_CountryName.text isEqualToString:@"PHILIPPINES"]||[self.crs_CountryName.text isEqualToString:@"VIETNAM"]){
                        
                        
                        
                        self.crs_IfscTextChanger.text = @"Branch Name";
                        self.crs_Ifsclabe.text = @"Account Number";
                    }
                    
                    //                    else if ([[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"NEPAL"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"PHILIPPINES"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"])
                    //
                    //                    {
                    //
                    //                        self.crs_IfscCoder.text = @"Branch Name";
                    //                        self.act_Ifsc.text =   [NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"branch_name"]];
                    //
                    //                    }
                    
                    //                    else if ([[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"SINGAPORE"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"HONG KONG"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"JAPAN"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"OMAN"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"SOUTH AFRICA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"NEW ZEALAND"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"THAILAND"]){
                    //
                    //                        self.crs_IfscCoder.text = @"Swift Code";
                    //
                    //                        self.crs_ActNumber.text = @"Account Number";
                    //
                    //                    }
                    //
                    
                    
                    
                    
                    
                    
                    self.crs_AccTransactionNumber.text = [self transactionseparter:[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"txn_no"]];
                    self.crs_AccRecieverName.text = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"name"];
                    self.crs_AccCountryName.text = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"country"];
                    
                    if ([ self.crs_CountryName.text  isEqualToString:@"VIETNAM"]) {
                        
                        NSString *str = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"city"];
                        
                        NSArray * arr = [str componentsSeparatedByString:@"EWAY"];
                        
                        self.crs_CityName.text  = [arr objectAtIndex:1];
                        
                    }
                    else{
                        
                        self.crs_CityName.text = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"city"];
                        
                        
                    }
                    self.crs_AccAccountNumber.text = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"accout_num"];
                    self.crs_Ifsclabe.text = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"ifsc"];
                    self.crs_AccTransactionDate.text = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"txn_date"];
                    self.crs_AccPayOutAmount.text = [NSString stringWithFormat:@"%@ %@",self->PayOutAmount,CurrencyRate];
                    self.crs_AccRate.text = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",Hello,SourceCurrencyCode,HelloThre,CurrencyDisplayer1,CurrencyRate];
                    self.crs_AccPayinAmount.text = [NSString stringWithFormat:@"%@ %@",PayinAmount,SourceCurrencyCode];
                    self.crs_AccTransferFee.text = [NSString stringWithFormat:@"%@ %@",[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"commission"],SourceCurrencyCode];
                    
                    self.crs_AccOrderAmount.text = [NSString stringWithFormat:@"%@ %@",[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"total_amount"],SourceCurrencyCode];
                    if ([self.crs_CountryName.text isEqualToString:@"NEPAL"]||[self.crs_CountryName.text isEqualToString:@"PHILIPPINES"]||[self.crs_CountryName.text isEqualToString:@"VIETNAM"]){
                        
                        
                        
                        self.crs_IfscTextChanger.text = @"Branch Name";
                        self.crs_Ifsclabe.text = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"branch_name"];
                    }
                    
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
- (IBAction)home:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}
- (IBAction)profile:(id)sender {
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UpdateProfile* viewController = [storyboard instantiateViewControllerWithIdentifier:@"UpdateProfileViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

- (IBAction)settings:(id)sender {
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    SettingsViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewControllerSid"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}

- (IBAction)history:(id)sender {
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"historyViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)crs_DashBack:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

-(NSString*)transactionseparter:(NSString*)aNumber
{
    NSMutableString *s = [aNumber mutableCopy];
    
    for(int p=0; p<[s length]; p++)
    {
        if(p%5==0)
        {
            [s insertString:@" " atIndex:p];
        }
    }
    NSLog(@"%@",s);
    return s;
}
@end

































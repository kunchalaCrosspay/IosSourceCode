//
//  CharitySecuretrading1ViewController.m
//  CrossPay
//
//  Created by sai kiran  on 12/27/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "CharitySecuretrading1ViewController.h"
#import "HomeViewController.h"
#import "Crs_sharedvariable.h"
#import "HistoryViewController.h"
#import "MBProgressHUD.h"
#import "crs_sharedmethods.h"
#import "GlobalUrlsFile.h"
#import "RecieverDetailedViewController.h"
#import "SecureTradingCardDetailsaTableViewCell.h"
#import "CharitypayHistoryViewController.h"
#import "CharityPayViewController.h"
@interface CharitySecuretrading1ViewController ()
{
    NSString * CurrencyDisplayer;
    NSString * CurrencyWithAmount;
    NSString * Amount;
    NSString * CurrencyCode;
    NSString * date1;
    NSString * date2;
    NSString * TransactionReference;
    NSString * paymentType;
    BOOL  isFiltered;
    NSString * GetcardDetails;
    NSString * CardNumber;
    NSString * ExpiryDate;
    NSMutableArray* CardArray;
    NSMutableArray * years;
    
    NSMutableArray * btnselection;
    
    NSString * BackendCard;
    
    NSString * YearCompresion;
    
    NSString  * Crs_StrYear;
    NSString * Crs_StrMonth;
    NSString * BackEndYear;
    NSString * BackEndMonth;
    NSString * BackEndDate;
    NSString * BackEndSlash;
    NSString * TransactionNumber1;
    NSString * CardType;
    NSTimer *crs_Timer;
    NSString *MyCard;
    NSString *Hider;
}
@end

@implementation CharitySecuretrading1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self datePick];
    NSLog(@"My Link%@",_passingData);
    Hider = @"Show";
    self.crs_SuccesfullView.hidden = YES;
    self.crs_CancelView.hidden = YES;
    
    //self.Crs_Month_YearPicker.hidden=YES;
    [self.crs_PaySecurelyout.layer setBorderWidth:1.0];
    [self.crs_PaySecurelyout.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    [self.crs_SecondPayout.layer setBorderWidth:1.0];
    [self.crs_SecondPayout.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
   
    [_crs_SavedDetailsOut setFrame:CGRectMake(11, 275, 20, 20)];
    [_crs_SavedCradsOut2 setFrame:CGRectMake(-20, 271, 208, 30)];
    [_crs_movingView setFrame:CGRectMake(5, 40, 364, 209)];
    
    UIDevice *aDevice = [UIDevice currentDevice];
    NSLog(@"My Device is %@",aDevice);
    
    self.Crs_Picker_View.hidden =YES;
    self.crs_CardDetailsView.hidden = YES;
    paymentType = @"Selected";
    BackendCard =@"0";
    self.Carddetails_View.hidden =YES;
    self.crs_BackView.hidden = YES;
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarButtonItemStylePlain;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:@selector(clearNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    _crs_CardNumber.inputAccessoryView = numberToolbar;
    _crs_Month.inputAccessoryView = numberToolbar;
    _crs_Year.inputAccessoryView = numberToolbar;
    _crs_Cvv.inputAccessoryView = numberToolbar;
    _Crs_CardCvv.inputAccessoryView = numberToolbar;
    
    
    NSLog(@"Hi Details are %@",_passingData);
    self.crs_OrderReferenceLabel.text = [self.passingData valueForKey:@"orderreference"];
    self.crs_SecondOrder.text = [self.passingData valueForKey:@"orderreference"];
   
   
    
    
    CurrencyWithAmount = [NSString stringWithFormat:@"%@ %@",[self.passingData valueForKey:@"amount"],[self.passingData valueForKey:@"currencyCode"]];
    self.crs_AmountLabel.text = CurrencyWithAmount;
     self.crs_SecondAmount.text = CurrencyWithAmount;
    self.crs_SecureTradingScroll.contentSize = CGSizeMake(self.view.frame.size.width-30,780);
    self.crs_Scroll2.contentSize = CGSizeMake(self.view.frame.size.width-30,100);
    
    Amount = [self.passingData valueForKey:@"amount"];
    CurrencyCode = [self.passingData valueForKey:@"currencyCode"];
    if ([_TrustGetter isEqualToString:@"NoTrust"]) {
        self.crs_MerchantName.text = _CharityOrganisationName;
        self.crs_MerchantName1.text = _CharityOrganisationName;
    }
    else if ([_TrustGetter isEqualToString:@"Trust"])
    {
        
        self.crs_MerchantName.text = _CharityOrganisationName1;
        self.crs_MerchantName1.text = _CharityOrganisationName1;
    }
    
    CardArray = [NSMutableArray new];
    
    
    //    UIToolbar *toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,320,44)];
    //    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    //    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
    //                                                                      style:UIBarButtonItemStyleBordered target:self action:@selector(changeDateFromLabel:)];
    //    toolBar.items = @[barButtonDone];
    //   // barButtonDone.tintColor=[UIColor blackColor];
    //    [self.Crs_Month_YearPicker addSubview:toolBar];
    
    
    
    
}
-(void)datePick{
    
    datePicker =[[UIDatePicker alloc]init];
    datePicker.datePickerMode =UIDatePickerModeDate;
    [self.crs_Year setInputView:datePicker];
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor blackColor]];
    
    
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(ShowSelectedDate)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    [self.crs_Month setInputAccessoryView:toolBar];
    
    
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
    [formatter setDateFormat:@"MM-YYYY"];
    
    
    NSDateFormatter *Format = [[NSDateFormatter alloc]init];
    [Format setDateFormat:@"MM-YYYY"];
    
    NSLog(@"Hello date%@",[Format stringFromDate:datePicker.date]);
    date1 = [NSString stringWithFormat:@"%@",[Format stringFromDate:datePicker.date]];
    
    self.crs_Year.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
    [self.crs_Year resignFirstResponder];
    
    
    
    
}

- (IBAction)crs_BackAction:(id)sender {
    
    // create an alert controller with the appearance of an alert view
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Crosspay" message:@"Are you sure you want to cancel your transaction" preferredStyle:UIAlertControllerStyleAlert];
    
    // create the actions handled by each button
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self BackButton];
        
        NSLog(@"User Pressed Back");
    }];
    
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"User said NEVER!");
        }];
    
    // add actions to our alert
    [alert addAction:action1];
   [alert addAction:action2];
    
    // display the alert controller
    [self presentViewController:alert animated:YES completion:nil];
    
    self.crs_CancelView.hidden = YES;
}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}


-(void)clearNumberPad{
    [_crs_Cvv resignFirstResponder];
    [_crs_Year resignFirstResponder];
    [_crs_CardNumber resignFirstResponder];
    [_crs_Month resignFirstResponder];
    [_Crs_CardCvv resignFirstResponder];
    
    
    
    
    
    
    
    
    
    
}

-(void)doneWithNumberPad{
    //NSString *numberFromTheKeyboard = self.crs_SelectBranch.text;
    [_crs_Cvv resignFirstResponder];
    [_crs_Year resignFirstResponder];
    [_crs_CardNumber resignFirstResponder];
    [_crs_Month resignFirstResponder];
    [_Crs_CardCvv resignFirstResponder];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == _crs_CardNumber) {
        
        
        
        
        _Crs_Picker_View.hidden = YES;
        
        CGPoint scrollPoint = CGPointMake(0,190);
        [  self.crs_SecureTradingScroll setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    else if (textField == _crs_Month){
        
        
        CGPoint scrollPoint = CGPointMake(0,200);
        [  self.crs_SecureTradingScroll setContentOffset:scrollPoint animated:YES];
        
    }
    
    else if (textField == _crs_Year){
        
        
        CGPoint scrollPoint = CGPointMake(0,200);
        [  self.crs_SecureTradingScroll setContentOffset:scrollPoint animated:YES];
        
    }
    
    
    else if (textField == _crs_Cvv){
        
        
        CGPoint scrollPoint = CGPointMake(0,220);
        [  self.crs_SecureTradingScroll setContentOffset:scrollPoint animated:YES];
        self.Crs_Picker_View.hidden = YES;
    }
    else if (textField == _Crs_CardCvv){
        
        
        CGPoint scrollPoint = CGPointMake(0,70);
        [  self.crs_Scroll2 setContentOffset:scrollPoint animated:YES];
       
    }
    
    
    
    
}
-(void)SecureCall{
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    
    if ([self.crs_CardNumber.text isEqualToString:@""])  {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Card Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    else if (self.crs_CardNumber.text.length<16){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Valid Card Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
   
    else if ([self.crs_Month.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Month Cannot be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    else if ([self.crs_Year.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Year Cannot be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
    else if ([self.crs_Cvv.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter CVV Number/Security Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    else if (self.crs_Cvv.text.length<3){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter  CVV Number/SecurityCode" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
//    else if ([MyCard isEqualToString:@"61"]||[MyCard isEqualToString:@"85"]||[MyCard isEqualToString:@"71"]) {
//        
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please use VISA/mastercard for the payment" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        
//        [alert show];
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
        NSURL *url = [NSURL URLWithString:Crosspay_CharitySecureCall];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
        //
        //        "user_id":701,
        //        "expirydate":"10/2020",
        //        "pan":"4111111111111111",
        //        "securitycode":"123",
        //        "amount":"20",
        //        "currencycode":"GBP",
        //        "credentialsonfile":"1"
        //
        
        
        [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
        [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
        NSString *CardNumber;//your url string.
        
        CardNumber = [self.crs_CardNumber.text stringByReplacingOccurrencesOfString:@"-" withString:@""];
        
        NSLog(@"My Card number is %@",CardNumber);
        CardType = CardNumber;
        
        CardType = [CardType substringToIndex:1];
        
        if ([CardType isEqualToString:@"4"]) {
            
            CardType = [CardType stringByReplacingOccurrencesOfString:@"4" withString:@"VISA"];
        }
        

        else if ([CardType isEqualToString:@"5"]){
            
            
            
            CardType = [CardType stringByReplacingOccurrencesOfString:@"5" withString:@"MASTERCARD"];
        }
        

        else if (![CardType isEqualToString:@"4"]||[CardType isEqualToString:@"5"]){

            CardType = @"NONE";
        }
        
        MyCard = [NSString stringWithFormat:@"%@",CardType];
        
        [mapData setObject:CardNumber forKey:@"pan"];
        [mapData setObject:self.crs_Cvv.text forKey:@"securitycode"];
        [mapData setObject:BackendCard forKey:@"credentialsonfile"];
        [mapData setObject:Amount forKey:@"amount"];
        [mapData setObject:CurrencyCode forKey:@"currencycode"];
        [mapData setObject:CardType forKey:@"cardtype"];
        BackEndMonth = self.crs_Month.text;
        if ([BackEndMonth isEqualToString:@"1"]) {
            BackEndMonth = @"01";
        }
        else if ([BackEndMonth isEqualToString:@"2"]){
            
             BackEndMonth = @"02";
            
        }
        else if ([BackEndMonth isEqualToString:@"3"]){
            
            BackEndMonth = @"03";
            
        }
        else if ([BackEndMonth isEqualToString:@"4"]){
            
            BackEndMonth = @"04";
            
        }
        else if ([BackEndMonth isEqualToString:@"5"]){
            
            BackEndMonth = @"05";
            
        }
        else if ([BackEndMonth isEqualToString:@"6"]){
            
            BackEndMonth = @"06";
            
        }
        else if ([BackEndMonth isEqualToString:@"7"]){
            
            BackEndMonth = @"07";
            
        }
        else if ([BackEndMonth isEqualToString:@"8"]){
            
            BackEndMonth = @"08";
            
        }
        else if ([BackEndMonth isEqualToString:@"9"]){
            
            BackEndMonth = @"09";
            
        }
        
        
        BackEndYear = self.crs_Year.text;
        BackEndSlash = @"/";
        BackEndDate = [NSString stringWithFormat:@"%@%@%@",BackEndMonth,BackEndSlash,BackEndYear];
        NSLog(@"My Date is %@",BackEndDate);
        
        
        [mapData setObject:BackEndDate forKey:@"expirydate"];
        
        @try {
            [mapData setObject:_crs_CHARITYOrderId forKey:@"order_id"];
             [mapData setObject:[self.passingData valueForKey:@"sitereference"] forKey:@"sitereference"];
            //[mapData setObject:_CharityReference forKey:@"sitereference"];
        }
        @catch (NSException * e) {
            NSLog(@"Exception: %@", e);
        }
        @finally {
            NSLog(@"finally");
        }
        
        
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
                
                NSLog(@"%@", [json valueForKey:@"message"]);
                // message = [json valueForKey:@"message"];
                
                NSString * Status;
                Status = [NSString stringWithFormat:@"%@",[json valueForKey:@"status"]];
                if ([Status isEqualToString:@"500"]) {
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                
               
                
                @try {
                    
                    
                    
                    if ([[json valueForKey:@"status"]isEqualToString:@"200"]) {
                        
                        TransactionReference = [json valueForKey:@"transactionreference"];
                        
                        
                        [self capturePayment];
                        
                        
                    }
                    else{
                        
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        
                        
                        
                        
                        
                    }
                    
                }
                @catch (NSException * e) {
                    NSLog(@"Exception: %@", e);
                }
                @finally {
                    NSLog(@"finally");
                }
        
                
               
                
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
        
        
        
        
    }
    
}
- (IBAction)crs_PayNow:(id)sender {
    [self SecureCall];;
    NSLog(@"Yes you Have Tapped ");
    
    
}



-(void)capturePayment{
    
    
    
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
        NSURL *url = [NSURL URLWithString:Crosspay_NewCharityCapture];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
//
//        {
//            "beneficiary_no" : "",
//            "order_id" : "400000000718",
//            "payeccyCode" : "GBP",
//            "transactionreference" : "3-9-4366093",
//            "totalpayingamount" : "109",
//            "user_id" : "411"
//        }
//
        @try {
           [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
            [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
            
            [mapData setObject:_crs_CHARITYCurrencyCode forKey:@"payeccyCode"];
            [mapData setObject:_crs_CHARITYAmount forKey:@"totalpayingamount"];
           
            
            
            [mapData setObject:TransactionReference forKey:@"transactionreference"];
            
            // order_id,user_id,payeccyCode,totalpayingamount,referenceNo,
            [mapData setObject:_crs_CHARITYOrderId forKey:@"order_id"];
            
//
//                [mapData setObject:_CharityReference forKey:@"sitereference"];
            
          [mapData setObject:[self.passingData valueForKey:@"sitereference"] forKey:@"sitereference"];
            
            
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
                    
                    // create an alert controller with the appearance of an alert view
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Crosspay" message:@"Your transaction has been successful." preferredStyle:UIAlertControllerStyleAlert];
                    
                    // create the actions handled by each button
                    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                        CharitypayHistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityhistoryViewControllerSID"];;
                        viewController.crs_BackToHome = @"Home";
                        [self.navigationController pushViewController:viewController animated:YES];
                        
                        
                    }];
                    
//                    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Never!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                        NSLog(@"User said NEVER!");
//                    }];
                    
                    // add actions to our alert
                    [alert addAction:action1];
                    //[alert addAction:action2];
                    
                    // display the alert controller
                    [self presentViewController:alert animated:YES completion:nil];
                    self.crs_SuccesfullView.hidden = YES;
                    
                }
                
//        else if ([[json valueForKey:@"status"]isEqualToString:@"200"]){
//                    
//                    
//                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                    
//                    [alert show];
//                    
//                    
//                }
                
                else{
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                    
                }
                
                
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
        
        
        
        
    }
    
}
- (IBAction)crs_OkAction:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CharitypayHistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityhistoryViewControllerSID"];;
    viewController.crs_BackToHome = @"Home";
    [self.navigationController pushViewController:viewController animated:YES];
    
}
- (IBAction)crs_CancelYes:(id)sender {
    [self BackButton];
    
}

- (IBAction)crs_CancelNo:(id)sender {
    self.crs_CancelView.hidden = YES;
}

//- (BOOL)                textField:(UITextField *)textField
//    shouldChangeCharactersInRange:(NSRange)range
//                replacementString:(NSString *)string {
//
//    // All digits entered
//    if (range.location == 19) {
//        return NO;
//    }
//
//    // Reject appending non-digit characters
//    if (range.length == 0 &&
//        ![[NSCharacterSet decimalDigitCharacterSet] characterIsMember:[string characterAtIndex:0]]) {
//        return NO;
//    }
//
//    // Auto-add hyphen before appending 4rd or 7th digit
//    if (range.length == 0 &&
//        (range.location == 4 || range.location == 9||range.location ==14||range.location == 19)) {
//        textField.text = [NSString stringWithFormat:@"%@-%@", textField.text, string];
//        return NO;
//    }
//
//    // Delete hyphen when deleting its trailing digit
//    if (range.length == 1 &&
//        (range.location == 4 || range.location == 9||range.location ==14||range.location == 19))  {
//        range.location--;
//        range.length = 2;
//        textField.text = [textField.text stringByReplacingCharactersInRange:range withString:@""];
//        return NO;
//    }
//    else if (textField == self.crs_Cvv)
//    {
//
//        if (self.self.self.crs_Cvv.text.length >=3 && range.length == 0)
//        {
//            return NO; // return NO to not change text
//        }
//        else
//        {
//
//
//
//
//            NSString *validRegEx =@"^[0-9.]*$"; //change this regular expression as your requirement
//            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
//            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
//            if (myStringMatchesRegEx)
//                return YES;
//            else
//                return NO;
//
//
//
//
//            return YES;}
//
//    }else if (textField == self.Crs_CardCvv)
//    {
//
//        if (self.self.self.Crs_CardCvv.text.length >=3 && range.length == 0)
//        {
//            return NO; // return NO to not change text
//        }
//        else
//        {
//
//
//
//
//            NSString *validRegEx =@"^[0-9.]*$"; //change this regular expression as your requirement
//            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
//            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
//            if (myStringMatchesRegEx)
//                return YES;
//            else
//                return NO;
//
//
//
//
//            return YES;}
//
//    }
//
//    return YES;
//}
- (IBAction)crs_SavedDetailsAction:(id)sender {
    paymentType = @"Selected";
    [self TransactionQuery];
    self.crs_paymentDetailsView.hidden = YES;
    [_crs_SavedDetailsOut setSelected:YES];
    [_crs_NewCardoutlet setSelected:YES];
    
    self.crs_savedCardsFuturelabel.hidden = YES;
    self.Crs_SaveCardOulet.hidden = YES;
    self.crs_CvvLabel.hidden = YES;
    self.crs_cvvImage.hidden = YES;
    self.crs_MonthOutlet.hidden = YES;
    self.crs_YearOutlet.hidden = YES;
    self.crs_expiryYearLabel.hidden = YES;
    self.crs_expirymonthLabel.hidden = YES;
    self.crs_CharityCardLabel.hidden = YES;
    self.crs_CardNumber.hidden = YES;
    self.crs_Month.hidden = YES;
    self.crs_Year.hidden = YES;
    self.crs_Cvv.hidden = YES;
    
    [_crs_SavedDetailsOut setFrame:CGRectMake(8, 60, 20, 20)];
    [_crs_SavedCradsOut2 setFrame:CGRectMake(-25, 56, 208, 30)];
    [_crs_PaySecurelyout setFrame:CGRectMake(120, 120, 120, 30)];
    [_crs_PaymentDetailsOut setFrame:CGRectMake(-38, 54, 256, 30)];
    [_crs_NewCardoutlet setFrame:CGRectMake(6, 50, 20, 20)];
//    self.crs_Cvv.hidden = YES;
//    self.crs_Month.hidden = YES;
//    self.crs_Year.hidden = YES;
//    self.crs_CardNumber.hidden = YES;
     self.crs_SecureTradingScroll.contentSize = CGSizeMake(self.view.frame.size.width-30,0);
}
- (IBAction)crs_NewCardAction:(id)sender {
    paymentType = @"NotSelected";
    [_crs_SavedDetailsOut setSelected:NO];
    [_crs_NewCardoutlet setSelected:NO];
    
    self.crs_savedCardsFuturelabel.hidden = NO;
    self.Crs_SaveCardOulet.hidden = NO;
    self.crs_CvvLabel.hidden = NO;
    self.crs_cvvImage.hidden = NO;
    self.crs_MonthOutlet.hidden = NO;
    self.crs_YearOutlet.hidden = NO;
    self.crs_expiryYearLabel.hidden = NO;
    self.crs_expirymonthLabel.hidden = NO;
    self.crs_CharityCardLabel.hidden = NO;
    self.crs_CardNumber.hidden = NO;
    self.crs_Month.hidden = NO;
    self.crs_Year.hidden = NO;
    self.crs_Cvv.hidden = NO;
    [_crs_SavedDetailsOut setFrame:CGRectMake(11, 275, 20, 20)];
    [_crs_SavedCradsOut2 setFrame:CGRectMake(-20, 271, 208, 30)];
    [_crs_PaySecurelyout setFrame:CGRectMake(120, 320, 120, 30)];
    
}

- (IBAction)crs_SavedDetailsButton:(id)sender {
    
    [self TransactionQuery];
    
    self.crs_SecureTradingScroll.hidden = NO;
    [_crs_SavedDetailsOut setSelected:YES];
    [_crs_NewCardoutlet setSelected:YES];
    self.crs_savedCardsFuturelabel.hidden = YES;
    self.Crs_SaveCardOulet.hidden = YES;
    self.crs_CvvLabel.hidden = YES;
    self.crs_cvvImage.hidden = YES;
    self.crs_MonthOutlet.hidden = YES;
    self.crs_YearOutlet.hidden = YES;
    self.crs_expiryYearLabel.hidden = YES;
    self.crs_expirymonthLabel.hidden = YES;
    self.crs_CharityCardLabel.hidden = YES;
    self.crs_CardNumber.hidden = YES;
    self.crs_Month.hidden = YES;
    self.crs_Year.hidden = YES;
    self.crs_Cvv.hidden = YES;
    [_crs_SavedDetailsOut setFrame:CGRectMake(8, 60, 20, 20)];
    [_crs_SavedCradsOut2 setFrame:CGRectMake(-20, 56, 208, 30)];
    [_crs_PaySecurelyout setFrame:CGRectMake(120, 120, 120, 30)];
    
}

- (IBAction)crs_PaymentDetails:(id)sender {
    paymentType = @"NotSelected";
    self.crs_paymentDetailsView.hidden = NO;
    [_crs_SavedDetailsOut setSelected:NO];
    [_crs_NewCardoutlet setSelected:NO];
    self.crs_savedCardsFuturelabel.hidden = NO;
    self.Crs_SaveCardOulet.hidden = NO;
    self.crs_CvvLabel.hidden = NO;
    self.crs_cvvImage.hidden = NO;
    self.crs_MonthOutlet.hidden = NO;
    self.crs_YearOutlet.hidden = NO;
    self.crs_expiryYearLabel.hidden = NO;
    self.crs_expirymonthLabel.hidden = NO;
    self.crs_CharityCardLabel.hidden = NO;
    self.crs_CardNumber.hidden = NO;
    self.crs_Month.hidden = NO;
    self.crs_Year.hidden = NO;
    self.crs_Cvv.hidden = NO;
    [_crs_SavedDetailsOut setFrame:CGRectMake(11, 275, 20, 20)];
    [_crs_SavedCradsOut2 setFrame:CGRectMake(-20, 271, 208, 30)];
    [_crs_PaySecurelyout setFrame:CGRectMake(120, 320, 120, 30)];
    
    
}

- (IBAction)crs_MorepaymentoptionsButton:(id)sender {
    self.crs_CardDetailsView.hidden = YES;
    self.crs_CardDetailsView.hidden = YES;
    self.crs_paymentDetailsView.hidden = NO;
    [_crs_SavedDetailsOut setSelected:NO];
    [_crs_NewCardoutlet setSelected:NO];
    self.crs_savedCardsFuturelabel.hidden = NO;
    self.Crs_SaveCardOulet.hidden = NO;
    self.crs_CvvLabel.hidden = NO;
    self.crs_cvvImage.hidden = NO;
    self.crs_MonthOutlet.hidden = NO;
    self.crs_YearOutlet.hidden = NO;
    self.crs_expiryYearLabel.hidden = NO;
    self.crs_expirymonthLabel.hidden = NO;
    self.crs_CharityCardLabel.hidden = NO;
    self.crs_CardNumber.hidden = NO;
    self.crs_Month.hidden = NO;
    self.crs_Year.hidden = NO;
    self.crs_Cvv.hidden = NO;
    [_crs_SavedDetailsOut setFrame:CGRectMake(11, 275, 20, 20)];
    [_crs_SavedCradsOut2 setFrame:CGRectMake(-20, 271, 208, 30)];
    [_crs_PaySecurelyout setFrame:CGRectMake(120, 320, 120, 30)];
}

-(void)TransactionQuery{
    
    
    
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
        NSURL *url = [NSURL URLWithString:Crosspay_CharityTransactionQuery];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
        
        
        
        [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
        [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
        
        [mapData setObject:[self.passingData valueForKey:@"currencyCode"] forKey:@"payeccyCode"];
        
        [mapData setObject:[self.passingData valueForKey:@"orderreference"] forKey:@"order_id"];
        
        [mapData setObject:[self.passingData valueForKey:@"sitereference"] forKey:@"sitereference"];
        
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
                
                NSLog(@"%@", [json valueForKey:@"message"]);
                NSString * message;
                message = [json valueForKey:@"message"];
                if ([[json valueForKey:@"status"]isEqualToString:@"200"]) {
                    
                    CardArray =[NSMutableArray new];
                    CardArray = [json valueForKey:@"data"];
                    
                    btnselection =[NSMutableArray new];
                    for (int k=0; k<CardArray.count; k++) {
                        
                        NSMutableDictionary * dict =[NSMutableDictionary new];
                        [dict setObject:@"0" forKey:@"selection"];
                        [btnselection addObject:dict];
                    }
                    
                    
                    paymentType = @"Selected";
                    [_crs_SavedDetailsOut setSelected:YES];
                    [_crs_NewCardoutlet setSelected:YES];
                    self.crs_CardDetailsView.hidden = NO;
                    [self.crs_SecureTradingTable reloadData];
                    
                    
                    
                    NSLog(@"My Card SArray is %@",CardArray);
                    ExpiryDate = [json valueForKey:@"expirdate"];
                    CardNumber = [json valueForKey:@"pan"];
                    
                }
                
                else if ([[json valueForKey:@"status"]isEqualToString:@"201"]){
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"No Saved Cards  to Proceed the Transaction,Please Enter the Card details in Payment Details" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return CardArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    
    
    
    SecureTradingCardDetailsaTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SecureTradingSID"];
    cell.crs_SecureTradingCardNumber.text = [[CardArray valueForKey:@"pan"] objectAtIndex:indexPath.row];
    cell.crs_secureTradingOutlet.tag =indexPath.row;
    [cell.crs_secureTradingOutlet addTarget:self
                                     action:@selector(myradiobtn:)
                           forControlEvents:UIControlEventTouchUpInside];
    if ([[[btnselection valueForKey:@"selection"]objectAtIndex:indexPath.row]isEqualToString:@"0"]) {
        cell.crs_secureTradingOutlet.selected =NO;
    }
    else
    {
        cell.crs_secureTradingOutlet.selected =YES;
    }
    
    
    
    return cell;
}














-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    
    for (int k=0; k<btnselection.count; k++) {
        if (indexPath.row==k) {
            NSMutableDictionary * dict  =[NSMutableDictionary new];
            [dict setObject:@"1" forKey:@"selection"];
            [btnselection replaceObjectAtIndex:indexPath.row withObject:dict];
        }
        else
        {
            NSMutableDictionary * dict  =[NSMutableDictionary new];
            [dict setObject:@"0" forKey:@"selection"];
            [btnselection replaceObjectAtIndex:k withObject:dict];
            
        }
        
        
    }
    
    
    [tableView reloadData];
    
    
    self.Carddetails_View.hidden =NO;
    
    self.Crs_CardnumberDetails.text =[[CardArray valueForKey:@"pan"] objectAtIndex:indexPath.row];
    
    NSString * expirydate = [[CardArray valueForKey:@"expirdate"] objectAtIndex:indexPath.row];
    TransactionReference = [[CardArray valueForKey:@"transactionreference"] objectAtIndex:indexPath.row];
    NSLog(@"My Transaction Reference is %@",TransactionReference);
    NSArray * tempAry =[expirydate componentsSeparatedByString:@"/"];
    
    self.Crs_CardMonth.text =[NSString stringWithFormat:@"%@",[tempAry objectAtIndex:0]];
    self.Crs_CardYear.text=[NSString stringWithFormat:@"%@",[tempAry objectAtIndex:1]];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (IBAction)CardDetails_BackAction:(id)sender {
    self.Carddetails_View.hidden =YES;
}
- (IBAction)Crs_SaveCardAction:(id)sender {
    
    if (self.Crs_SaveCardOulet.selected) {
        self.Crs_SaveCardOulet.selected =NO;
        BackendCard =@"0";
    }
    else
    {
        self.Crs_SaveCardOulet.selected =YES;
        BackendCard =@"1";
    }
    
}



- (NSInteger)numberOfComponentsInPickerView: (UIPickerView*)thePickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
{
    return [years count];
}
- (NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [years objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component;
{
    if ([YearCompresion isEqualToString:@"year"]) {
        Crs_StrYear = [years objectAtIndex:row];
        
    }
    else
    {
        Crs_StrMonth=[years objectAtIndex:row];
        
    }
}





- (IBAction)Month_Picker_Action:(id)sender {
    
    [self.view endEditing:YES];
    CGPoint scrollPoint = CGPointMake(0,220);
    [  self.crs_SecureTradingScroll setContentOffset:scrollPoint animated:YES];
    //Create Years Array from 1960 to This year
    years = [[NSMutableArray alloc] init];
    for (int i=1; i<=12; i++) {
        [years addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    YearCompresion=@"month";
    //self.Crs_Month_YearPicker.hidden=NO;
    self.Crs_Picker_View.hidden =NO;
    [self.Crs_Month_YearPicker reloadAllComponents];
}

- (IBAction)Year_Picker_Action:(id)sender {
     [self.view endEditing:YES];
    CGPoint scrollPoint = CGPointMake(0,220);
    [  self.crs_SecureTradingScroll setContentOffset:scrollPoint animated:YES];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    int i2  = [[formatter stringFromDate:[NSDate date]] intValue];
    
    
    //Create Years Array from 1960 to This year
    years = [[NSMutableArray alloc] init];
    for (int i=i2; i<=i2+20; i++) {
        [years addObject:[NSString stringWithFormat:@"%d",i]];
    }
    YearCompresion=@"year";
    // self.Crs_Month_YearPicker.hidden=NO;
    
    self.Crs_Picker_View.hidden =NO;
    
    [self.Crs_Month_YearPicker reloadAllComponents];
}


-(void)changeDateFromLabel:(id)sender
{
    
    // self.Crs_Month_YearPicker.hidden=YES;
}

- (IBAction)Crs_Picker_Done:(id)sender {
    self.Crs_Picker_View.hidden =YES;
    if ([YearCompresion isEqualToString:@"year"]) {
        self.crs_Year.text = Crs_StrYear;
        
    }
    else
    {
        self.crs_Month.text = Crs_StrMonth;
        
    }
}
- (IBAction)crs_SecondpaymentButton:(id)sender {
    [self SecureCall1];
}




-(void)SecureCall1{
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    
    if ([self.Crs_CardnumberDetails.text isEqualToString:@""])  {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Card Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    else if (self.Crs_CardnumberDetails.text.length<16){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Valid Card Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    else if ([self.Crs_CardMonth.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Month Cannot be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    else if ([self.Crs_CardYear.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Year Cannot be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
    else if ([self.Crs_CardCvv.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter CVV Number/Security Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    else if (self.Crs_CardCvv.text.length<3){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter  CVV Number/Security Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
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
        NSURL *url = [NSURL URLWithString:Crosspay_CharitySecureCall];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
       
        
        
        [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
        [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
        //        NSString *CardNumber;//your url string.
        //
        //        CardNumber = [self.crs_CardNumber.text stringByReplacingOccurrencesOfString:@"-" withString:@""];
        //
        //        NSLog(@"My Card number is %@",CardNumber);
        
        [mapData setObject:self.Crs_CardnumberDetails.text forKey:@"pan"];
        [mapData setObject:self.Crs_CardCvv.text forKey:@"securitycode"];
        //
        
        NSString * Credintials = @"2";
        NSString * Creduntiasl = [NSString stringWithFormat:@"%@",Credintials];
        [mapData setObject:Creduntiasl forKey:@"credentialsonfile"];
        
        [mapData setObject:Amount forKey:@"amount"];
        [mapData setObject:CurrencyCode forKey:@"currencycode"];
      
        [mapData setObject:TransactionReference forKey:@"transactionreference"];
        [mapData setObject:[self.passingData valueForKey:@"orderreference"] forKey:@"order_id"];
        
        @try {
           
            [mapData setObject:[self.passingData valueForKey:@"sitereference"] forKey:@"sitereference"];
             //[mapData setObject:_CharityReference forKey:@"sitereference"];
        }
        @catch (NSException * e) {
            NSLog(@"Exception: %@", e);
        }
        @finally {
            NSLog(@"finally");
        }
        BackEndMonth = self.Crs_CardMonth.text;
        BackEndYear = self.Crs_CardYear.text;
        BackEndSlash = @"/";
        BackEndDate = [NSString stringWithFormat:@"%@%@%@",BackEndMonth,BackEndSlash,BackEndYear];
        NSLog(@"My Date is %@",BackEndDate);
        
        [mapData setObject:@"" forKey:@"cardtype"];
        [mapData setObject:BackEndDate forKey:@"expirydate"];
       
        
        
        
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
                
                TransactionNumber1 = [json valueForKey:@"transactionreference"];
                NSLog(@"My Transaction reference Number is %@",TransactionNumber1);
                NSLog(@"%@", [json valueForKey:@"message"]);
                // message = [json valueForKey:@"message"];
                if ([[json valueForKey:@"status"]isEqualToString:@"200"]) {
                    
                    
                    
                    [self capturePayment1];
                    
                    
                }
                
                else if ([[json valueForKey:@"status"]isEqualToString:@"500"])
                {
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Internal Server Error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
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





-(void)capturePayment1{
    
    
    
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
        NSURL *url = [NSURL URLWithString:Crosspay_NewCharityCapture];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
    
        @try {
            [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
            [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
            
            [mapData setObject:_crs_CHARITYCurrencyCode forKey:@"payeccyCode"];
            [mapData setObject:_crs_CHARITYAmount forKey:@"totalpayingamount"];
            
            
            
            [mapData setObject:TransactionNumber1 forKey:@"transactionreference"];
            
            // order_id,user_id,payeccyCode,totalpayingamount,referenceNo,
            [mapData setObject:_crs_CHARITYOrderId forKey:@"order_id"];
            
            
            
    
                [mapData setObject:_crs_CHARITYOrderId forKey:@"order_id"];
               // [mapData setObject:_CharityReference forKey:@"sitereference"];
         
         [mapData setObject:[self.passingData valueForKey:@"sitereference"] forKey:@"sitereference"];
            
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
                    
                    
                    
                    // create an alert controller with the appearance of an alert view
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Crosspay" message:@"Your transaction has been successful." preferredStyle:UIAlertControllerStyleAlert];
                    
                    // create the actions handled by each button
                    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                        CharitypayHistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityhistoryViewControllerSID"];;
                        viewController.crs_BackToHome = @"Home";
                        [self.navigationController pushViewController:viewController animated:YES];
                        
                        
                    }];
                    
                    //                    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Never!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    //                        NSLog(@"User said NEVER!");
                    //                    }];
                    
                    // add actions to our alert
                    [alert addAction:action1];
                    //[alert addAction:action2];
                    
                    // display the alert controller
                    [self presentViewController:alert animated:YES completion:nil];
                    self.crs_SuccesfullView.hidden = YES;
                    
                }
                
                else if ([[json valueForKey:@"status"]isEqualToString:@"200"]){
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
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

-(void)BackButton{
    
    
    
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
        NSURL *url = [NSURL URLWithString:Crosspay_BackButton1];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
        
        @try {
            [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
            [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
            
            [mapData setObject:_crs_CHARITYCurrencyCode forKey:@"payeccyCode"];
            [mapData setObject:_crs_CHARITYAmount forKey:@"totalpayingamount"];
            
             [mapData setObject:_crs_CHARITYOrderId forKey:@"order_id"];
            
            [mapData setObject:@"" forKey:@"transactionreference"];
            
           
     [mapData setObject:[self.passingData valueForKey:@"sitereference"] forKey:@"sitereference"];
            
               // [mapData setObject:_CharityReference forKey:@"sitereference"];
        
           
            
            
            
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
                if ([[json valueForKey:@"status"]isEqualToString:@"300"]) {
                    
                    
                    self.crs_BackView.hidden = YES;
                    self.crs_CancelView.hidden = YES;
                    self.crs_SuccesfullView.hidden = YES;
                    self.crs_BackLabel.text = [json valueForKey:@"message"];
                    
                    // create an alert controller with the appearance of an alert view
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Crosspay" message:[json valueForKey:@"message"] preferredStyle:UIAlertControllerStyleAlert];
                    
                    // create the actions handled by each button
                UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    CharityPayViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityPayViewControllerSID"];
                    // viewController.crs_ProfileDetails =
                    [self.navigationController pushViewController:viewController animated:YES];
                        
                        NSLog(@"User said DEFO!");
                    }];
                    
//                    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Never!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                        NSLog(@"User said NEVER!");
//                    }];
                    
                    // add actions to our alert
                    [alert addAction:action1];
                   // [alert addAction:action2];
                    
                    // display the alert controller
                    [self presentViewController:alert animated:YES completion:nil];
                    
                }
                
                else if ([[json valueForKey:@"status"]isEqualToString:@"406"]){
                    
                    self.crs_BackView.hidden = NO;
                    self.crs_CancelView.hidden = YES;
                    self.crs_SuccesfullView.hidden = YES;
                    self.crs_BackLabel.text = [json valueForKey:@"message"];
                    
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
- (IBAction)Crs_BackToHome:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CharityPayViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityPayViewControllerSID"];
    // viewController.crs_ProfileDetails =
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)crs_TableBack:(id)sender {
    
    self.Carddetails_View.hidden =YES;
//    self.Carddetails_View.hidden =YES;
//    self.crs_CardDetailsView.hidden = YES;
//    self.crs_paymentDetailsView.hidden = NO;
//   
//    [_crs_SavedDetailsOut setSelected:NO];
//    [_crs_NewCardoutlet setSelected:NO];
}

- (IBAction)crs_Radio1action:(id)sender {
    [_crs_Radio1Outlet setSelected:NO];
    [_crs_Radio2Out setSelected:NO];
}
- (IBAction)crs_TableSaved:(id)sender {
    [_crs_Radio1Outlet setSelected:YES];
    [_crs_Radio2Out setSelected:YES];
    
}
- (IBAction)crs_radio2Action:(id)sender {
    self.Carddetails_View.hidden =YES;
    self.crs_CardDetailsView.hidden = YES;
    self.crs_savedCardsFuturelabel.hidden = NO;
    self.Crs_SaveCardOulet.hidden = NO;
    self.crs_CvvLabel.hidden = NO;
    self.crs_cvvImage.hidden = NO;
    self.crs_MonthOutlet.hidden = NO;
    self.crs_YearOutlet.hidden = NO;
    self.crs_expiryYearLabel.hidden = NO;
    self.crs_expirymonthLabel.hidden = NO;
    self.crs_CharityCardLabel.hidden = NO;
    self.crs_CardNumber.hidden = NO;
    self.crs_Month.hidden = NO;
    self.crs_Year.hidden = NO;
    self.crs_Cvv.hidden = NO;
    [_crs_SavedDetailsOut setFrame:CGRectMake(11, 275, 20, 20)];
    [_crs_SavedCradsOut2 setFrame:CGRectMake(-20, 271, 208, 30)];
    [_crs_PaySecurelyout setFrame:CGRectMake(120, 320, 120, 30)];
    
}

- (IBAction)crs_TablePayments:(id)sender {
    self.Carddetails_View.hidden =YES;
    self.crs_CardDetailsView.hidden = YES;
    [_crs_SavedDetailsOut setSelected:NO];
    [_crs_NewCardoutlet setSelected:NO];
    [_crs_SavedDetailsOut setSelected:NO];
    [_crs_NewCardoutlet setSelected:NO];
    self.crs_savedCardsFuturelabel.hidden = NO;
    self.Crs_SaveCardOulet.hidden = NO;
    self.crs_CvvLabel.hidden = NO;
    self.crs_cvvImage.hidden = NO;
    self.crs_MonthOutlet.hidden = NO;
    self.crs_YearOutlet.hidden = NO;
    self.crs_expiryYearLabel.hidden = NO;
    self.crs_expirymonthLabel.hidden = NO;
    self.crs_CharityCardLabel.hidden = NO;
    self.crs_CardNumber.hidden = NO;
    self.crs_Month.hidden = NO;
    self.crs_Year.hidden = NO;
    self.crs_Cvv.hidden = NO;
    [_crs_SavedDetailsOut setFrame:CGRectMake(11, 275, 20, 20)];
    [_crs_SavedCradsOut2 setFrame:CGRectMake(-20, 271, 208, 30)];
    [_crs_PaySecurelyout setFrame:CGRectMake(120, 320, 120, 30)];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField==self.crs_CardNumber) {
        if (self.self.crs_CardNumber.text.length >=16 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            
            
            
            NSString *validRegEx =@"^[A-Z a-z 0-9.]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            
            
            
            
            return YES;}
        
    }
    else if (textField == self.crs_Cvv)
    {
        
        if (self.self.self.crs_Cvv.text.length >=3 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            
            NSString *validRegEx =@"^[0-9.]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            return YES;}
        
    }else if (textField == self.Crs_CardCvv)
    {
        
        if (self.self.self.Crs_CardCvv.text.length >=3 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            
            NSString *validRegEx =@"^[0-9.]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            return YES;}
        
    }
    
    return YES;
    
}
-(void)myradiobtn:(UIButton*)sender
{
    for (int k=0; k<btnselection.count; k++) {
        if (sender.tag==k) {
            NSMutableDictionary * dict  =[NSMutableDictionary new];
            [dict setObject:@"1" forKey:@"selection"];
            [btnselection replaceObjectAtIndex:sender.tag withObject:dict];
        }
        else
        {
            NSMutableDictionary * dict  =[NSMutableDictionary new];
            [dict setObject:@"0" forKey:@"selection"];
            [btnselection replaceObjectAtIndex:k withObject:dict];
            
        }
        
        
    }
    
    
    [self.crs_SecureTradingTable reloadData];
    
    
    self.Carddetails_View.hidden =NO;
    
    self.Crs_CardnumberDetails.text =[[CardArray valueForKey:@"pan"] objectAtIndex:sender.tag];
    
    NSString * expirydate = [[CardArray valueForKey:@"expirdate"] objectAtIndex:sender.tag];
    TransactionReference = [[CardArray valueForKey:@"transactionreference"] objectAtIndex:sender.tag];
    NSLog(@"My Transaction Reference is %@",TransactionReference);
    NSArray * tempAry =[expirydate componentsSeparatedByString:@"/"];
    
    self.Crs_CardMonth.text =[NSString stringWithFormat:@"%@",[tempAry objectAtIndex:0]];
    self.Crs_CardYear.text=[NSString stringWithFormat:@"%@",[tempAry objectAtIndex:1]];
    
}
- (IBAction)crs_Hide:(id)sender {
    if ([Hider isEqualToString:@"Show"]) {
        self.crs_CardNumber.secureTextEntry = YES;
        
        Hider = @"hide";
        [_crs_HideOut setSelected:YES];
    } else {
         self.crs_CardNumber.secureTextEntry = NO;
        [_crs_HideOut setSelected:NO];
        Hider = @"Show";
    }
    
}
@end



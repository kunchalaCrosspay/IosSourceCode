//
//  NewSEcureTradingViewController.m
//  CrossPay
//
//  Created by sai kiran  on 12/21/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "NewSEcureTradingViewController.h"
#import "HomeViewController.h"
#import "Crs_sharedvariable.h"
#import "HistoryViewController.h"
#import "MBProgressHUD.h"
#import "crs_sharedmethods.h"
#import "GlobalUrlsFile.h"
#import "RecieverDetailedViewController.h"
#import "SecureTradingCardDetailsaTableViewCell.h"
#import "NewHomeViewController.h"
#import "UpdateProfile.h"
#import "SettingsViewController.h"
@interface NewSEcureTradingViewController ()
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
    NSString * CardName;
    NSString * CardSelection;
    NSString * TableCard;
    NSString *MyCard;
    NSTimer *_timer;
    NSString * Hider;
    NSMutableArray * historyArray;
    NSString * CurrencyRate;
    NSString * SourceCurrencyCode;
    NSString * PayOutAmount;
    NSString*PayinAmount;
    NSString * TransfeRfee;
    NSString * PaymentType;
    NSString * CurrencyDisplayer1;
    NSString * TransactionNumber;
    NSString *  stringByAddingSpace;
}


@end

@implementation NewSEcureTradingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.crs_CashView.hidden = NO;
    self.Reciept.hidden = YES;
    self.crs_AccountView.hidden = YES;
    self.crs_RecepitView.hidden = YES;
    //[self datePick];
//    if (!_timer) {
//        _timer = [NSTimer scheduledTimerWithTimeInterval:10.0f
//                                                  target:self
//                                                selector:@selector(_timerFired:)
//                                                userInfo:nil
//                                                 repeats:YES];
//    }
    
    self.crs_SuccesfullView.hidden = YES;
    self.crs_CancelView.hidden = YES;
   
    [self.crs_PaySecureout.layer setBorderWidth:1.0];
    [self.crs_PaySecureout.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    [self.crs_secondpayoutlet.layer setBorderWidth:1.0];
    [self.crs_secondpayoutlet.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    [self.crs_DashBoard.layer setBorderWidth:1.0];
    [self.crs_DashBoard.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    //self.Crs_Month_YearPicker.hidden=YES;
    
    self.crs_BackView.hidden = YES;
    self.Crs_Picker_View.hidden =YES;
    self.crs_CardDetailsView.hidden = YES;
    paymentType = @"Selected";
    BackendCard =@"0";
    self.Carddetails_View.hidden =YES;
   Hider = @"show";
    [_crs_SavedDetailsOut setFrame:CGRectMake(11, 300, 20, 20)];
    [_crs_SavedCardsOutlet2 setFrame:CGRectMake(-20, 296, 208, 30)];
    [_crs_MovingView setFrame:CGRectMake(5, 40, 364, 209)];
    [_crs_PaySecureout setFrame:CGRectMake(120, 360, 120, 30)];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        switch ((int)[[UIScreen mainScreen] nativeBounds].size.height) {
            case 1136:
                printf("iPhone 5 or 5S or 5C");
                break;
                
            case 1334:
                printf("iPhone 6/6S/7/8");
                break;
                
            case 1920:
                printf("iPhone 6+/6S+/7+/8+");
                break;
                
            case 2436:
                printf("iPhone X, XS");
                break;
                
            case 2688:
                printf("iPhone XS Max");
                break;
                
            case 1792:
                printf("iPhone XR");
                break;
                
            default:
                printf("Unknown");
                break;
        }
    }
    
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
    
    CurrencyWithAmount = [NSString stringWithFormat:@"%@ %@",[self.passingData valueForKey:@"mainamount"],[self.passingData valueForKey:@"currencyiso3a"]];
    self.crs_AmountLabel.text = CurrencyWithAmount;
    
    self.crs_SecureTradingScroll.contentSize = CGSizeMake(self.view.frame.size.width-30,800);
     self.crs_Scroll2.contentSize = CGSizeMake(self.view.frame.size.width-30,100);
    
    Amount = [self.passingData valueForKey:@"mainamount"];
    CurrencyCode = [self.passingData valueForKey:@"currencyiso3a"];
    
    self.crs_SecondAmountLabel.text =  CurrencyWithAmount;
    self.crs_secondOrderreference.text = [self.passingData valueForKey:@"orderreference"];
    
    CardArray = [NSMutableArray new];
    
    
//    UIToolbar *toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,320,44)];
//    [toolBar setBarStyle:UIBarStyleBlackOpaque];
//    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
//                                                                      style:UIBarButtonItemStyleBordered target:self action:@selector(changeDateFromLabel:)];
//    toolBar.items = @[barButtonDone];
//   // barButtonDone.tintColor=[UIColor blackColor];
//    [self.Crs_Month_YearPicker addSubview:toolBar];
//
//    CardSelection = @"NewCard";
//    if ([CardSelection isEqualToString:@"NewCard"]) {
//        [_crs_SavedDetailsOut setFrame:CGRectMake(11, 353, 20, 20)];
//        [_crs_SavedCardsOutlet2 setFrame:CGRectMake(-9, 353, 208, 30)];
//
//    } else {
//
//    }
//
//    if ([TableCard isEqualToString:@"Payment"]) {
//        [_crs_SavedDetailsOut setSelected:NO];
//        [_crs_NewCardoutlet setSelected:NO];
//    }
//    else{
//
//        [_crs_SavedDetailsOut setSelected:YES];
//        [_crs_NewCardoutlet setSelected:YES];
//    }
//
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
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
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

- (IBAction)crs_BackToHome:(id)sender {
}

- (IBAction)crs_BacktoReciever:(id)sender {
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
        
        
        
        
        self.Crs_Picker_View.hidden = YES;
        
        CGPoint scrollPoint = CGPointMake(0,220);
        [  self.crs_SecureTradingScroll setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    else if (textField == _crs_Month){
        
        
        CGPoint scrollPoint = CGPointMake(0,240);
        [  self.crs_SecureTradingScroll setContentOffset:scrollPoint animated:YES];
        
    }
    
    else if (textField == _crs_Year){
        
        
        CGPoint scrollPoint = CGPointMake(0,240);
        [  self.crs_SecureTradingScroll setContentOffset:scrollPoint animated:YES];
        
    }
    
    
    else if (textField == _crs_Cvv){
        
        
        CGPoint scrollPoint = CGPointMake(0,270);
        [  self.crs_SecureTradingScroll setContentOffset:scrollPoint animated:YES];
        self.Crs_Picker_View.hidden = YES;
    }
    
    else if (textField == _Crs_CardCvv){
        
        
        CGPoint scrollPoint = CGPointMake(0,40);
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
        NSURL *url = [NSURL URLWithString:Crosspay_SecureCall];
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
        @try {
           
            [mapData setObject:[self.passingData valueForKey:@"orderreference"] forKey:@"order_id"];
        }
        @catch (NSException * e) {
            NSLog(@"Exception: %@", e);
        }
        @finally {
            NSLog(@"finally");
        }
        
        [mapData setObject:_crs_CardNumber.text forKey:@"pan"];
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
                
                
                if ([[json valueForKey:@"status"]isEqualToString:@"200"]) {
                    
        TransactionReference = [json valueForKey:@"transactionreference"];
                    
                    
                    [self capturePayment];
                    
                    
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
- (IBAction)crs_PayNow:(id)sender {
    [self SecureCall];;
    NSLog(@"Yes you Have Tapped ");
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
    NSLog(@"Timer Stoped");
    
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
        NSURL *url = [NSURL URLWithString:Crosspay_NewCapturePayment];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
//      {"user_id":701,"order_id":"order556281377","payeccyCode":"GBP","totalpayingamount":919.38,"beneficiary_no":"699","checkstatus":"direct","transactionreference":"7-9-4041581"}
        
        @try {
            [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_BenificiaryNo forKey:@"beneficiary_no"];
            
            [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
            [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
            
            [mapData setObject:[self.passingData valueForKey:@"orderreference"] forKey:@"order_id"];
            
            [mapData setObject:@"IOS" forKey:@"device"];
            [mapData setObject:TransactionReference forKey:@"transactionreference"];
            [mapData setObject:[self.passingData valueForKey:@"currencyiso3a"] forKey:@"payeccyCode"];
            [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_TotalPayingAmount forKey:@"totalpayingamount"];
            
     
        }
        @catch (NSException * e) {
            NSLog(@"Exception: %@", e);
        }
        @finally {
            NSLog(@"finally");
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
                    
                       self.crs_RecepitView.hidden = NO;
                   
//                    if ([_timer isValid]) {
//                        [_timer invalidate];
//                    }
//                    _timer = nil;
//                    NSLog(@"Timer Stoped");
                    self.crs_RecepitView.hidden = YES;
                   
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Crosspay" message:@"Your transaction has been successful" preferredStyle:UIAlertControllerStyleAlert];

                    // create the actions handled by each button
                    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        
                        self.crs_RecepitView.hidden = NO;
                        
                        [self HistoryView];

                        NSLog(@"User Pressed Back");
                    }];

//                    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
////                        NSLog(@"User said NEVER!");
////                    }];
////
//                    // add actions to our alert
                    [alert addAction:action1];
//                   // [alert addAction:action2];
//
//                    // display the alert controller
                    [self presentViewController:alert animated:YES completion:nil];
//
//                    self.crs_SuccesfullView.hidden = YES;
                    
                }
                
//                else if ([[json valueForKey:@"status"]isEqualToString:@"200"]){
//
//
//                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//                    [alert show];
//
//
//                }
                
                else{
                    
                    if ([_timer isValid]) {
                        [_timer invalidate];
                    }
                    _timer = nil;
                    NSLog(@"Timer Stoped");
                    
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
    
    HistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"historyViewControllerSID"];;
    viewController.crs_BackToHome = @"Home";
    [self.navigationController pushViewController:viewController animated:YES];
    
}
- (IBAction)crs_CancelYes:(id)sender {
    [self BackButton];
    
}

- (IBAction)crs_CancelNo:(id)sender {
    self.crs_CancelView.hidden = YES;
}
- (IBAction)crs_SavedDetailsAction:(id)sender {
    
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
    NSLog(@"Timer Stoped");
    paymentType = @"Selected";
    [self TransactionQuery];
    self.crs_SecureTradingScroll.hidden = NO;
    self.crs_paymentDetailsView.hidden = NO;
    [_crs_SavedDetailsOut setSelected:YES];
    [_crs_NewCardoutlet setSelected:YES];
   
    [_crs_SavedDetailsOut setFrame:CGRectMake(14, 45, 20, 20)];
    [_crs_SavedCardsOutlet2 setFrame:CGRectMake(-11, 41, 208, 30)];
    [_crs_PaySecureout setFrame:CGRectMake(120, 85, 120, 30)];
   
    self.crs_CvvImage.hidden = YES;
    self.crs_CvvLabel.hidden = YES;
    self.Crs_SaveCardOulet.hidden = YES;
    self.crs_CardNumberLabel.hidden = YES;
    self.crs_ExpiryYearlabl.hidden = YES;
    self.crs_ExpiryMonthLabel.hidden = YES;
    self.crs_ExpiryMonthOutlet.hidden = YES;
    self.crs_ExpiryButtonOutelet.hidden = YES;
    self.crs_savedCardsLabel.hidden = YES;
    self.crs_CardNumber.hidden = YES;
    self.crs_Month.hidden = YES;
    self.crs_Year.hidden = YES;
    self.crs_Cvv.hidden = YES;
}
- (IBAction)crs_NewCardAction:(id)sender {
    
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
    NSLog(@"Timer Stoped");
    paymentType = @"NotSelected";
    [_crs_SavedDetailsOut setSelected:NO];
    [_crs_NewCardoutlet setSelected:NO];
    [_crs_PaySecureout setFrame:CGRectMake(120, 360, 120, 30)];
    [_crs_SavedDetailsOut setFrame:CGRectMake(11, 300, 20, 20)];
    [_crs_SavedCardsOutlet2 setFrame:CGRectMake(-20, 296, 208, 30)];
    self.crs_CvvImage.hidden = NO;
    self.crs_CvvLabel.hidden = NO;
    self.Crs_SaveCardOulet.hidden = NO;
    self.crs_CardNumberLabel.hidden = NO;
    self.crs_ExpiryYearlabl.hidden = NO;
    self.crs_ExpiryMonthLabel.hidden = NO;
    self.crs_ExpiryMonthOutlet.hidden = NO;
    self.crs_ExpiryButtonOutelet.hidden = NO;
    self.crs_savedCardsLabel.hidden = NO;
    self.crs_CardNumber.hidden = NO;
    self.crs_Month.hidden = NO;
    self.crs_Year.hidden = NO;
    self.crs_Cvv.hidden = NO;
}

- (IBAction)crs_SavedDetailsButton:(id)sender {
    
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
    NSLog(@"Timer Stoped");
     [self TransactionQuery];
    self.crs_paymentDetailsView.hidden = NO;
    self.crs_SecureTradingScroll.hidden = NO;
    [_crs_SavedDetailsOut setSelected:YES];
    [_crs_NewCardoutlet setSelected:YES];
    [_crs_SavedDetailsOut setFrame:CGRectMake(14, 45, 20, 20)];
    [_crs_SavedCardsOutlet2 setFrame:CGRectMake(-11, 41, 208, 30)];
    [_crs_PaySecureout setFrame:CGRectMake(120, 85, 120, 30)];
    
    
    self.crs_CvvImage.hidden = YES;
    self.crs_CvvLabel.hidden = YES;
    self.Crs_SaveCardOulet.hidden = YES;
    self.crs_CardNumberLabel.hidden = YES;
    self.crs_ExpiryYearlabl.hidden = YES;
    self.crs_ExpiryMonthLabel.hidden = YES;
    self.crs_ExpiryMonthOutlet.hidden = YES;
    self.crs_ExpiryButtonOutelet.hidden = YES;
    self.crs_savedCardsLabel.hidden = YES;
    self.crs_CardNumber.hidden = YES;
    self.crs_Month.hidden = YES;
    self.crs_Year.hidden = YES;
    self.crs_Cvv.hidden = YES;
    
    
}

- (IBAction)crs_PaymentDetails:(id)sender {
    
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
    NSLog(@"Timer Stoped");
    paymentType = @"NotSelected";
    self.crs_paymentDetailsView.hidden = NO;
    [_crs_SavedDetailsOut setSelected:NO];
    [_crs_NewCardoutlet setSelected:NO];
    //[_view7 setFrame:CGRectMake(28, 500, 261, 250)];
    [_crs_SavedDetailsOut setFrame:CGRectMake(11, 300, 20, 20)];
    [_crs_SavedCardsOutlet2 setFrame:CGRectMake(-20, 296, 208, 30)];
     [_crs_PaySecureout setFrame:CGRectMake(120, 360, 120, 30)];
    [_crs_MovingView setFrame:CGRectMake(5, 40, 364, 209)];
    self.crs_CvvImage.hidden = NO;
    self.crs_CvvLabel.hidden = NO;
    self.Crs_SaveCardOulet.hidden = NO;
    self.crs_CardNumberLabel.hidden = NO;
    self.crs_ExpiryYearlabl.hidden = NO;
    self.crs_ExpiryMonthLabel.hidden = NO;
    self.crs_ExpiryMonthOutlet.hidden = NO;
    self.crs_ExpiryButtonOutelet.hidden = NO;
    self.crs_savedCardsLabel.hidden = NO;
    self.crs_CardNumber.hidden = NO;
    self.crs_Month.hidden = NO;
    self.crs_Year.hidden = NO;
    self.crs_Cvv.hidden = NO;
}

- (IBAction)crs_MorepaymentoptionsButton:(id)sender {
   
    
    
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
    NSLog(@"Timer Stoped");
    self.crs_CardDetailsView.hidden = YES;
    self.crs_paymentDetailsView.hidden = NO;
    [_crs_SavedDetailsOut setSelected:NO];
    [_crs_NewCardoutlet setSelected:NO];
    [_crs_PaySecureout setFrame:CGRectMake(120, 360, 120, 30)];
    [_crs_SavedDetailsOut setFrame:CGRectMake(11, 300, 20, 20)];
    [_crs_SavedCardsOutlet2 setFrame:CGRectMake(-20, 296, 208, 30)];
    self.crs_CvvImage.hidden = NO;
    self.crs_CvvLabel.hidden = NO;
    self.Crs_SaveCardOulet.hidden = NO;
    self.crs_CardNumberLabel.hidden = NO;
    self.crs_ExpiryYearlabl.hidden = NO;
    self.crs_ExpiryMonthLabel.hidden = NO;
    self.crs_ExpiryMonthOutlet.hidden = NO;
    self.crs_ExpiryButtonOutelet.hidden = NO;
    self.crs_savedCardsLabel.hidden = NO;
    self.crs_CardNumber.hidden = NO;
    self.crs_Month.hidden = NO;
    self.crs_Year.hidden = NO;
    self.crs_Cvv.hidden = NO;
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
        NSURL *url = [NSURL URLWithString:Crosspay_TransactionQuery];
        NSLog(@"Ny url is %@",url);
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
       
        
        
        [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
        [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
       
          [mapData setObject:[self.passingData valueForKey:@"currencyiso3a"] forKey:@"payeccyCode"];
       
          [mapData setObject:[self.passingData valueForKey:@"orderreference"] forKey:@"order_id"];
        
        
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
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"No Saved  Cards to Proceed the Transaction,Please Enter the Card details in Payment Details" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
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
    
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
    NSLog(@"Timer Stoped");
    self.Carddetails_View.hidden =YES;
}
- (IBAction)Crs_SaveCardAction:(id)sender {
    
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
    NSLog(@"Timer Stoped");
    
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
    
    
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
    NSLog(@"Timer Stoped");
    [self.view endEditing:YES];
    CGPoint scrollPoint = CGPointMake(0,250);
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
    
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
    NSLog(@"Timer Stoped");
    [self.view endEditing:YES];
    CGPoint scrollPoint = CGPointMake(0,250);
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
    
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
    NSLog(@"Timer Stoped");
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
    
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
    NSLog(@"Timer Stoped");
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
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Valid CVV Number/Security Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
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
        NSURL *url = [NSURL URLWithString:Crosspay_SecureCall];
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
        [mapData setObject:@"" forKey:@"cardtype"];
        [mapData setObject:Amount forKey:@"amount"];
        [mapData setObject:CurrencyCode forKey:@"currencycode"];
        [mapData setObject:TransactionReference forKey:@"transactionreference"];
        [mapData setObject:[self.passingData valueForKey:@"orderreference"] forKey:@"order_id"];
        BackEndMonth = self.Crs_CardMonth.text;
        BackEndYear = self.Crs_CardYear.text;
        BackEndSlash = @"/";
        BackEndDate = [NSString stringWithFormat:@"%@%@%@",BackEndMonth,BackEndSlash,BackEndYear];
        NSLog(@"My Date is %@",BackEndDate);
        
        
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
                    
                    
                    
                    if ([_timer isValid]) {
                        [_timer invalidate];
                    }
                    _timer = nil;
                    NSLog(@"Timer Stoped");
                    [self capturePayment1];
                    
                    
                }
                
                else if ([[json valueForKey:@"status"]isEqualToString:@"500"])
                {
                    
                    if ([_timer isValid]) {
                        [_timer invalidate];
                    }
                    _timer = nil;
                    NSLog(@"Timer Stoped");
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
        NSURL *url = [NSURL URLWithString:Crosspay_NewCapturePayment];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
        //      {"user_id":701,"order_id":"order556281377","payeccyCode":"GBP","totalpayingamount":919.38,"beneficiary_no":"699","checkstatus":"direct","transactionreference":"7-9-4041581"}
        
        @try {
            [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_BenificiaryNo forKey:@"beneficiary_no"];
            
            [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
            [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
            
            [mapData setObject:[self.passingData valueForKey:@"orderreference"] forKey:@"order_id"];
            
            [mapData setObject:@"IOS" forKey:@"device"];
            [mapData setObject:TransactionNumber1 forKey:@"transactionreference"];
            [mapData setObject:[self.passingData valueForKey:@"currencyiso3a"] forKey:@"payeccyCode"];
            [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_TotalPayingAmount forKey:@"totalpayingamount"];
            
            ;
        }
        @catch (NSException * e) {
            NSLog(@"Exception: %@", e);
        }
        @finally {
            NSLog(@"finally");
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
                    
                    
                    if ([_timer isValid]) {
                        [_timer invalidate];
                    }
                    _timer = nil;
                    NSLog(@"Timer Stoped");
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Crosspay" message:@"Your transaction has been successful." preferredStyle:UIAlertControllerStyleAlert];
                    
                    // create the actions handled by each button
                    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        self.crs_RecepitView.hidden = NO;
                        [self HistoryView];
//
//                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//
//                        HistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"historyViewControllerSID"];;
//                        viewController.crs_BackToHome = @"Home";
//                        [self.navigationController pushViewController:viewController animated:YES];
//
//                        NSLog(@"User Pressed Back");
                    }];
                    
                    //                    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    //                        NSLog(@"User said NEVER!");
                    //                    }];
                    //
                    // add actions to our alert
                    [alert addAction:action1];
                    // [alert addAction:action2];
                    
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
        NSURL *url = [NSURL URLWithString:Crosspay_BackButton];
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

            [mapData setObject:[self.passingData valueForKey:@"orderreference"] forKey:@"order_id"];

            [mapData setObject:@"IOS" forKey:@"device"];
            [mapData setObject:TransactionNumber1 forKey:@"transactionreference"];
            [mapData setObject:[self.passingData valueForKey:@"currencyiso3a"] forKey:@"payeccyCode"];
            [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_TotalPayingAmount forKey:@"totalpayingamount"];

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
                if ([[json valueForKey:@"status"]isEqualToString:@"300"]) {

//                    self.crs_BackLabel.text = [json valueForKey:@"message"];
//                    self.crs_SuccesfullView.hidden = YES;
//                    self.crs_BackView.hidden = NO;
//                    self.crs_CancelView.hidden = YES;
                    
                    
                    if ([_timer isValid]) {
                        [_timer invalidate];
                    }
                    _timer = nil;
                    NSLog(@"Timer Stoped");
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Crosspay" message:[json valueForKey:@"message"] preferredStyle:UIAlertControllerStyleAlert];
                    
                    // create the actions handled by each button
                    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                        
                      
                        RecieverDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"RecieverDetailedViewControllerSID"];;
                        viewController.Crs_BackToRecieverDetails = @"Reciever";
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

- (IBAction)crs_BacktoAction:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    RecieverDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"RecieverDetailedViewControllerSID"];;
    viewController.Crs_BackToRecieverDetails = @"Reciever";
    [self.navigationController pushViewController:viewController animated:YES];
}
- (IBAction)crs_CardDetailsAction:(id)sender {
    
    
}

- (IBAction)crs_savedCardsAction1:(id)sender {
}
- (IBAction)crs_PaymentDetailsAction:(id)sender {
    
    
}
- (IBAction)crs_cardDetailsactionForTable:(id)sender {
    
    
}

- (IBAction)crs_SavedCardsActionForTableview:(id)sender {
    
    
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
    NSLog(@"Timer Stoped");
    [_crs_Radio1out setSelected:YES];
    [_crs_Radio2Outelet setSelected:YES];
}
- (IBAction)crs_SavedCardsActionForTableView:(id)sender {
}
- (IBAction)crs_PaymentsAction:(id)sender {
    
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
    NSLog(@"Timer Stoped");
    self.Carddetails_View.hidden =YES;
    self.crs_CardDetailsView.hidden = YES;
    self.crs_paymentDetailsView.hidden = NO;
    [_crs_Radio1out setSelected:NO];
    [_crs_Radio2Outelet setSelected:NO];
    [_crs_SavedDetailsOut setSelected:NO];
    [_crs_NewCardoutlet setSelected:NO];
    [_crs_PaySecureout setFrame:CGRectMake(105, 360, 120, 30)];
    [_crs_SavedDetailsOut setFrame:CGRectMake(11, 300, 20, 20)];
    [_crs_SavedCardsOutlet2 setFrame:CGRectMake(-20, 296, 208, 30)];
    self.crs_CvvImage.hidden = NO;
    self.crs_CvvLabel.hidden = NO;
    self.Crs_SaveCardOulet.hidden = NO;
    self.crs_CardNumberLabel.hidden = NO;
    self.crs_ExpiryYearlabl.hidden = NO;
    self.crs_ExpiryMonthLabel.hidden = NO;
    self.crs_ExpiryMonthOutlet.hidden = NO;
    self.crs_ExpiryButtonOutelet.hidden = NO;
    self.crs_savedCardsLabel.hidden = NO;
    self.crs_CardNumber.hidden = NO;
    self.crs_Month.hidden = NO;
    self.crs_Year.hidden = NO;
    self.crs_Cvv.hidden = NO;
   
}

- (IBAction)crs_CardDetailsBackAction:(id)sender {
    
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
    NSLog(@"Timer Stoped");
    self.Carddetails_View.hidden =YES;
}



- (IBAction)crs_Radio2Action:(id)sender {
    
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
    NSLog(@"Timer Stoped");
    [_crs_Radio1out setSelected:NO];
    [_crs_Radio2Outelet setSelected:NO];
   
    
}
- (IBAction)crs_Radio1Action:(id)sender {
    
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
    NSLog(@"Timer Stoped");
    
    [_crs_Radio1out setSelected:YES];
    [_crs_Radio2Outelet setSelected:YES];
    [_crs_PaySecureout setFrame:CGRectMake(105, 360, 120, 30)];
    [_crs_SavedDetailsOut setFrame:CGRectMake(11, 300, 20, 20)];
    [_crs_SavedCardsOutlet2 setFrame:CGRectMake(-20, 296, 208, 30)];
    self.crs_CvvImage.hidden = NO;
    self.crs_CvvLabel.hidden = NO;
    self.Crs_SaveCardOulet.hidden = NO;
    self.crs_CardNumberLabel.hidden = NO;
    self.crs_ExpiryYearlabl.hidden = NO;
    self.crs_ExpiryMonthLabel.hidden = NO;
    self.crs_ExpiryMonthOutlet.hidden = NO;
    self.crs_ExpiryButtonOutelet.hidden = NO;
    self.crs_savedCardsLabel.hidden = NO;
    self.crs_CardNumber.hidden = NO;
    self.crs_Month.hidden = NO;
    self.crs_Year.hidden = NO;
    self.crs_Cvv.hidden = NO;
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


// Timer Call
- (void)_timerFired:(NSTimer *)timer {
    [self BackButton1];
    NSLog(@"Hello sai");
}

-(void)BackButton1{
    
    
    
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
        NSURL *url = [NSURL URLWithString:Crosspay_BackButton];
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
            
            [mapData setObject:[self.passingData valueForKey:@"orderreference"] forKey:@"order_id"];
            
            [mapData setObject:@"IOS" forKey:@"device"];
            [mapData setObject:TransactionNumber1 forKey:@"transactionreference"];
            [mapData setObject:[self.passingData valueForKey:@"currencyiso3a"] forKey:@"payeccyCode"];
            [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_TotalPayingAmount forKey:@"totalpayingamount"];
            
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
                if ([[json valueForKey:@"status"]isEqualToString:@"300"]) {
                    
                    
                    
                    if ([_timer isValid]) {
                        [_timer invalidate];
                    }
                    _timer = nil;
                    NSLog(@"Timer Stoped");
                    
                    //                    self.crs_BackLabel.text = [json valueForKey:@"message"];
                    //                    self.crs_SuccesfullView.hidden = YES;
                    //                    self.crs_BackView.hidden = NO;
                    //                    self.crs_CancelView.hidden = YES;
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Crosspay" message:@"Session  Expired, Please Try Again" preferredStyle:UIAlertControllerStyleAlert];
                    
                    // create the actions handled by each button
                    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                        
                        RecieverDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"RecieverDetailedViewControllerSID"];;
                        viewController.Crs_BackToRecieverDetails = @"Reciever";
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
- (IBAction)crs_Hide:(id)sender {
    
    if ([Hider isEqualToString:@"show"]) {
        
        self.crs_CardNumber.secureTextEntry = YES;
        
        Hider = @"hide";
        [_crs_HideOut setSelected:YES];
        
    }
    
    else
    {
        
        
        self.crs_CardNumber.secureTextEntry = NO;
        [_crs_HideOut setSelected:NO];
        Hider = @"show";
    }
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
    NSURL *url = [NSURL URLWithString:Crosspay_HistoryView];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    
    
    
    
    
    
    
    
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
                                                      
                                                      self.crs_RecieverName.text = [[json valueForKey:@"data"] valueForKey:@"name"];
                                                      NSLog(@"My Name is%@",self.crs_RecieverName.text);
                                                      
                                                      
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
            [mapData setObject:[self.passingData valueForKey:@"orderreference"] forKey:@"order_no"];
            
            
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
                    
                    self.crs_RecepitView.hidden = NO;
                    self.Reciept.hidden = YES;
                    paymentType = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"accout_type"];
                    
                    if ([paymentType isEqualToString:@"Account Credit"]) {
                        self.crs_CashView.hidden = YES;
                        self.crs_AccountView.hidden = NO;
                         self.crs_RecepitView.hidden = NO;
                    }
                    else{
                        
                        self.crs_AccountView.hidden = YES;
                        self.crs_CashView.hidden = NO;
                         self.crs_RecepitView.hidden = NO;
                    }
                    
                    
                    self.crs_RecieverName.text = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"name"];
                  
                   self.crs_TransactionNumber.text =  [self transactionseparter:[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"txn_no"]];
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
                        self.crs_NewAccountLabel.text = @"IBAN / Account Number";
                        
                    }
                    
                    
                    else if ([self.crs_CountryName.text isEqualToString:@"ISRAEL"]||[self.crs_CountryName.text isEqualToString:@"POLAND"]||[self.crs_CountryName.text isEqualToString:@"BAHRAIN"]||[self.crs_CountryName.text isEqualToString:@"CROATIA"]||[self.crs_CountryName.text isEqualToString:@"SWITZERLAND"]||[self.crs_CountryName.text isEqualToString:@"TURKEY"]||[self.crs_CountryName.text isEqualToString:@"SAUDI ARABIA"]||[self.crs_CountryName.text isEqualToString:@"UNITED ARAB EMIRATES"]||[self.crs_CountryName.text isEqualToString:@"QATAR"]||[self.crs_CountryName.text isEqualToString:@"KUWAIT"]||[self.crs_CountryName.text isEqualToString:@"ROMANIA"]||[self.crs_CountryName.text isEqualToString:@"BULGARIA"]){
                        
                        
                        
                        self.crs_IfscTextChanger.text = @"Swift Code";
                        self.crs_NewAccountLabel.text = @"IBAN";
                    }
                    
                    
                   
                    
                    else if ([self.crs_CountryName.text isEqualToString:@"THAILAND"]||[self.crs_CountryName.text isEqualToString:@"NEW ZEALAND"]||[self.crs_CountryName.text isEqualToString:@"SOUTH AFRICA"]||[self.crs_CountryName.text isEqualToString:@"OMAN"]||[self.crs_CountryName.text isEqualToString:@"JAPAN"]||[self.crs_CountryName.text isEqualToString:@"HONG KONG"]||[self.crs_CountryName.text isEqualToString:@"SINGAPORE"]){
                        
                        
                        
                        self.crs_IfscTextChanger.text = @"Swift Code";
                        self.crs_NewAccountLabel.text = @"Account Number";
                    }
                    
                    else if ([self.crs_CountryName.text isEqualToString:@"AUSTRALIA"]||[self.crs_CountryName.text isEqualToString:@"SIERRA LEONE"]||[self.crs_CountryName.text isEqualToString:@"CANADA"]||[self.crs_CountryName.text isEqualToString:@"UNITED STATES"]){
                        
                        
                        
                        self.crs_IfscTextChanger.text = @"Swift Code";
                       self.crs_NewAccountLabel.text = @"Account Number";
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
                    
                    
                    self.crs_CityName.text = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"city"];
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
                    else if ([self.crs_CountryName.text isEqualToString:@"SRI LANKA"]){
                        self.crs_IfscTextChanger.text = @"Branch Code";
                         self.crs_Ifsclabe.text = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"branchcode"];
                    }
                    else if ([self.crs_CountryName.text isEqualToString:@"PAKISTAN"]){
                        self.crs_IfscTextChanger.text = @"Branch Code";
                        self.crs_Ifsclabe.text = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"ifsc"];
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
- (IBAction)crs_DashBack:(id)sender {
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}
- (IBAction)crs_DashOutAction:(id)sender {
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}
- (IBAction)crs_Home:(id)sender {
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
    
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

- (IBAction)crs_settings:(id)sender {
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    SettingsViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewControllerSid"];;
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}

- (IBAction)History:(id)sender {
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"historyViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}
- (IBAction)crs_History:(id)sender {
  
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



//
//  RecieverDetailedViewController.m
//  CrossPay
//
//  Created by sai kiran  on 8/13/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import "RecieverDetailedViewController.h"
#import "UpdateProfile.h"
#import "SelectRecieverViewController.h"
#import "HomeViewController.h"
#import "HistoryViewController.h"
#import "notificationViewController.h"
#import "profileViewController.h"
#import "Crs_sharedvariable.h"
#import "SettingsViewController.h"
#import "SelectPaymentModeViewController.h"
#import "recieverDetailedTableViewCell.h"
#import "MBProgressHUD.h"
#import "GlobalUrlsFile.h"
#import "crs_sharedmethods.h"
//#import <Google/Analytics.h>
@interface RecieverDetailedViewController ()
{

float x ;
float y ;
float z ;
    NSMutableArray * purposeOfFund;
    NSMutableArray *  remitanceOfFund;
    NSString * purpose;
    
    NSString*PurposeCode;
    NSString*RemitanceCode;
    NSString * OverPaymentarray;
    
    NSMutableArray * searchArray;
    NSString * promoBalance;
     NSString *promoCode;
    NSString * Applied;
    NSString * citys;
    BOOL  isFiltered;
}
@end

@implementation RecieverDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
      [self.crs_search addTarget:self action:@selector(textFieldDidChanges:) forControlEvents:UIControlEventEditingChanged];
    
     self.crs_search.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    
    
    self.crs_RemitanceFundLabel.text = [Crs_sharedvariable sharedMySingleton].crs_RemitanceFundLabel;
    RemitanceCode = [Crs_sharedvariable sharedMySingleton].crs_RemitanceFundid;
    self.crs_SourceofFundLabel.text = [Crs_sharedvariable sharedMySingleton].crs_SourceofFundLabel;
    PurposeCode = [Crs_sharedvariable sharedMySingleton].crs_SourceofFundid;

   self.Crs_CashComparsion = [Crs_sharedvariable sharedMySingleton].Crs_CashComparsion890 ;

    self.Crs_str_BankName = [Crs_sharedvariable sharedMySingleton].Crs_str_BankName890;
  self.crs_Ary_CashPayDetails = [Crs_sharedvariable sharedMySingleton].crs_Ary_CashPayDetails890;
  _crs_DictionarybankDetails =   [Crs_sharedvariable sharedMySingleton].crs_DictionarybankDetails890 ;


    
    
    
    
    
    
    
    
    
    
    
    Applied =@"Apply";
    NSString * commission;
    if ([self.Crs_CashComparsion isEqualToString:@"CashPay"]) {
       
        commission = [NSString stringWithFormat:@"%@", [Crs_sharedvariable sharedMySingleton].crs_CashPayCommison];
        
    }
    else if ([self.Crs_CashComparsion isEqualToString:@"MOBILEWALLET"]){
        
         commission = [NSString stringWithFormat:@"%@", [Crs_sharedvariable sharedMySingleton].crs_WalletCommision];
        NSLog(@"My wallet Commision is ======%@",commission);
    }
    
    else{
     commission = [NSString stringWithFormat:@"%@",[Crs_sharedvariable sharedMySingleton].crs_CommisionRate];
    
    }
    if ([[[Crs_sharedvariable sharedMySingleton ].crs_PromoPassing valueForKey:@"message"]isEqualToString:@"PROMOCOE IS AVAILABLE"]) {
       
        if ([commission isEqualToString:@"0"]||[commission isEqualToString:@"0.0"]) {
            
            self.crs_HideTheView.hidden = YES;
            self.crs_PromoCodeFiels.hidden = YES;
            self.crs_PromoOutlet.hidden = YES;
            self.crs_PromoLine.hidden = YES;
            self.crs_PromoOutlet1.hidden = YES;
            self.crs_PromoHolder.hidden = YES;
            self.crs_ApplyOut.hidden = YES;
        }
        else{
            
            
            self.crs_PromoCodeFiels.hidden = NO;
            self.crs_PromoLine.hidden = NO;
            self.crs_HideTheView.hidden = NO;
            self.crs_PromoOutlet1.hidden = NO;
            self.crs_PromoHolder.hidden = NO;
            self.crs_ApplyOut.hidden = NO;
            promoCode =[[Crs_sharedvariable sharedMySingleton ].crs_PromoPassing valueForKey:@"promocode"];
            
            self.crs_PromoCodeDisplayer.text = promoCode;
            
        }
     
    }
    
    else
    {
        self.crs_HideTheView.hidden = YES;
             self.crs_PromoCodeFiels.hidden = YES;
        self.crs_PromoOutlet.hidden = YES;
        self.crs_PromoLine.hidden = YES;
          self.crs_PromoOutlet1.hidden = YES;
        self.crs_PromoHolder.hidden = YES;
        self.crs_ApplyOut.hidden = YES;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
 isFiltered=NO;
    
   
    // For Promo Code
    
 self.crs_PromoView.hidden = YES;
    
    self.crs_PromoCodeFiels.textColor = [UIColor whiteColor];
 
    if ([[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"ISRAEL"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"UNITED STATES"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"AUSTRALIA"]||
        [[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SRI LANKA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"INDIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"PAKISTAN"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SIERRA LEONE"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"CANADA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"PHILIPPINES"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"NEPAL"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"UNITED STATES"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"GAMBIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"IRELAND"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"GERMANY"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"POLAND"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"FRANCE"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"PORTUGAL"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"LATVIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"ITALY"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"FINLAND"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"FRANCE"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"LITHUANIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"LUXEMBOURG"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"MALTA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"ESTONIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SLOVENIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"HUNGARY"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"BULGARIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"CYPRUS"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"AUSTRIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"ROMANIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SLOVAKIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"GREECE"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"NETHERLANDS"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"PORTUGAL"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"POLAND"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SPAIN"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"BELGIUM"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"CZECH REPUBLIC"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"UNITED KINGDOM"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"NORWAY"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SWEDEN"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"DENMARK"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"BULGARIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"ROMANIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"KUWAIT"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"QATAR"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"UNITED ARAB EMIRATES"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SAUDI ARABIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"TURKEY"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SWITZERLAND"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"CROATIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"BAHRAIN"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"POLAND"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SINGAPORE"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"HONG KONG"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"JAPAN"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"OMAN"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SOUTH AFRICA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"NEW ZEALAND"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"KENYA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"INDIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"THAILAND"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"GHANA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"RWANDA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"NIGERIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"UGANDA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"ZAMBIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"ZIMBABWE"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"BANGLADESH"])
    {
        
//        BULGARIA,ROMANIA, ISREAL, KUWAIT,QATAR,UNITED ARAB EMIRATES,SAUDI ARABIA
//
//        TURKEY,SWITZERLAND,CROATIA,BAHRAIN,POLAND
// SINGAPORE,HONKONG, THAILAND,JAPAN,NEW ZEALAND,OMAN,SOUTH AFRICA
        
       }
    
    
    else{
        self.crs_IfscCash.hidden = YES;
        self.Crs_ifsc_code.hidden = YES;
        self.crs_IfscLine.hidden = YES;
        CGRect r = [self.crs_mainView frame];
        r.origin.y = -53.0f;
        [self.crs_mainView setFrame:r];
        
    }
   
    
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Clear" style:UIBarButtonItemStyleBordered target:self action:@selector(clearNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],nil];
    [numberToolbar sizeToFit];
    
    self.crs_search.inputAccessoryView = numberToolbar;
    self.crs_PromoCodeFiels.inputAccessoryView = numberToolbar;
    
    
    
    self.crs_SourceView.hidden = YES;
    
    
    remitanceOfFund = [NSMutableArray new];
    purposeOfFund = [NSMutableArray new];
    
     [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:Crosspay_GetPurposeOfTransfer] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            remitanceOfFund = [json valueForKey: @"data"];
  NSLog(@"King%@",remitanceOfFund);
        });
    }];
    
    [dataTask resume];
    
   
    
        [self secondtablevIew];
    

    self.crs_Scrollview.contentSize = CGSizeMake(self.view.frame.size.width-30, 1000);
    
    
    // Placeholde cOlour
    
    
    
    
    
    [self.crs_ProceedPic.layer setBorderWidth:1.0];
    [self.crs_ProceedPic.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    

    
    [self.crs_PromoOutlet1.layer setBorderWidth:1.0];
    [self.crs_PromoOutlet1.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //
    
    if ([[self.crs_Ary_CashPayDetails valueForKey:@"middle_name"]isEqualToString:@""]) {
        
        self.Crs_name.text = [NSString stringWithFormat:@"%@ %@",[self.crs_Ary_CashPayDetails valueForKey:@"first_name"],[self.crs_Ary_CashPayDetails valueForKey:@"last_name"]];
        

        
        self.crs_Name1Label.text = [NSString stringWithFormat:@"%@ %@",[self.crs_Ary_CashPayDetails valueForKey:@"first_name"],[self.crs_Ary_CashPayDetails valueForKey:@"last_name"]];
        
    }
    
    else{
    
        
        self.Crs_name.text = [NSString stringWithFormat:@"%@ %@ %@",[self.crs_Ary_CashPayDetails valueForKey:@"first_name"],[self.crs_Ary_CashPayDetails valueForKey:@"middle_name"],[self.crs_Ary_CashPayDetails valueForKey:@"last_name"]];
        
        
        self.crs_Name1Label.text = [NSString stringWithFormat:@"%@ %@ %@",[self.crs_Ary_CashPayDetails valueForKey:@"first_name"],[self.crs_Ary_CashPayDetails valueForKey:@"middle_name"],[self.crs_Ary_CashPayDetails valueForKey:@"last_name"]];
        

    
    
    }
    
    
    
    
    
    
    
    if ([self.Crs_CashComparsion isEqualToString:@"CashPay"]) {
        self.Crs_ServiceChanger.text = @"Cash Payment";
      
        
        
      
        
        
        @try {
            
            if ([[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]) {
                
                NSString *str = [self.crs_Ary_CashPayDetails valueForKey:@"city"];
                
                NSArray * arr = [str componentsSeparatedByString:@"EWAY"];
                
                self.Crs_ifsc_code.text  = [arr objectAtIndex:1];;
                
                
                
            }
            else{
                
                
                 self.Crs_ifsc_code.text=[self.crs_Ary_CashPayDetails valueForKey:@"city"];
            }
            
           
            
            
            
            
        }
        @catch (NSException * e) {
            NSLog(@" HELLO THERE Exception: %@", e);
        }
        @finally {
            NSLog(@"finally");
        }
        
        
      
        
        self.Crs_Banknumber.text=[self.crs_Ary_CashPayDetails valueForKey:@"mobile"];
        self.crs_MobileNumber.text = self.Crs_str_BankName;
        
        self.crs_IfscCash.text = @"City";
        self.crs_AccountNoCash.text = @"Mobile Number";
        self.crs_MobilenoCash.text = @"Payout-Network";
        
      
         y = [[Crs_sharedvariable sharedMySingleton].crs_CashPayCommison floatValue];
//        float f1=[[json valueForKey:@"INR"]floatValue];
//        NSString *Crs_rate=[NSString stringWithFormat:@"%.3f",f1];
        self.crs_CommisionLabel.text = [NSString stringWithFormat:@"%@ %@",[Crs_sharedvariable sharedMySingleton].crs_CashPayCommison,[Crs_sharedvariable sharedMySingleton].crs_FromCountry1];
    }
    
    else if ([self.Crs_CashComparsion isEqualToString:@"MOBILEWALLET"]){
        
        
        self.Crs_ServiceChanger.text = @"Mobile Wallet";
        
        
        
        
        
        
        @try {
            
            if ([[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]) {
                
                NSString *str = [self.crs_Ary_CashPayDetails valueForKey:@"city"];
                
                NSArray * arr = [str componentsSeparatedByString:@"EWAY"];
                
                self.Crs_ifsc_code.text  = [arr objectAtIndex:1];;
                
                
                
            }
            else{
                
                
                self.Crs_ifsc_code.text=[self.crs_Ary_CashPayDetails valueForKey:@"city"];
            }
            
            
            
            
            
            
        }
        @catch (NSException * e) {
            NSLog(@" HELLO THERE Exception: %@", e);
        }
        @finally {
            NSLog(@"finally");
        }
        
        
        
        
        self.Crs_Banknumber.text=[self.crs_Ary_CashPayDetails valueForKey:@"mobile"];
        self.crs_MobileNumber.text = self.Crs_str_BankName;
        
        self.crs_IfscCash.text = @"City";
        self.crs_AccountNoCash.text = @"Mobile Number";
        self.crs_MobilenoCash.text = @"Wallet Name";
        
        
        y = [[Crs_sharedvariable sharedMySingleton].crs_WalletCommision floatValue];
        //        float f1=[[json valueForKey:@"INR"]floatValue];
        //        NSString *Crs_rate=[NSString stringWithFormat:@"%.3f",f1];
        self.crs_CommisionLabel.text = [NSString stringWithFormat:@"%@ %@",[Crs_sharedvariable sharedMySingleton].crs_WalletCommision,[Crs_sharedvariable sharedMySingleton].crs_FromCountry1];
        
        
    }
    
    else{
        self.Crs_ServiceChanger.text = @"Bank Details";
        
        self.crs_CommisionLabel.text = [NSString stringWithFormat:@"%@ %@",[Crs_sharedvariable sharedMySingleton].crs_CommisionRate,[Crs_sharedvariable sharedMySingleton].crs_FromCountry1
];
        y = [[Crs_sharedvariable sharedMySingleton].crs_CommisionRate floatValue];
        
        
        if ([[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"IRELAND"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"GERMANY"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"FRANCE"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"PORTUGAL"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"LATVIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"ITALY"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"FINLAND"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"FRANCE"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"LITHUANIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"LUXEMBOURG"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"MALTA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"ESTONIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SLOVENIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"HUNGARY"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"CYPRUS"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"AUSTRIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SLOVAKIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"GREECE"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"NETHERLANDS"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"PORTUGAL"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SPAIN"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"BELGIUM"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"CZECH REPUBLIC"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"UNITED KINGDOM"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"NORWAY"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SWEDEN"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"DENMARK"]) {
            self.crs_IfscCash.text = @"Swift Code";
            self.crs_AccountNoCash.text = @"IBAN/Account Number";
        }
        
        

        
        
        
        else if ([[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"UNITED STATES"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"AUSTRALIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SIERRA LEONE"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"CANADA"]){
            
            
            self.crs_IfscCash.text = @"Swift Code";
            self.crs_AccountNoCash.text = @"Account Number";
        }
        
        
        else if ([[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"PAKISTAN"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SRI LANKA"]){
            
            
            self.crs_IfscCash.text = @"Branch Code";
            self.crs_AccountNoCash.text = @"Account Number";
        }
        
        else if ([[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"KENYA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"TANZANIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"GHANA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"RWANDA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"NIGERIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"UGANDA"]){
            
            
            self.crs_IfscCash.text = @"Bank Name";
            self.crs_AccountNoCash.text = @"Account Number";

            self.Crs_ifsc_code.text = [NSString stringWithFormat:@"%@",[self.crs_DictionarybankDetails valueForKey:@"bank"]];
        }
        
        else if ([[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"ZAMBIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"ZIMBABWE"]){
            
            
            self.crs_IfscCash.text = @"Bank Name";
            self.crs_AccountNoCash.text = @"Account Number";
            
            self.Crs_ifsc_code.text = [NSString stringWithFormat:@"%@",[self.crs_DictionarybankDetails valueForKey:@"bank_name"]];
        }
        
        
        else if ([[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"PHILIPPINES"]){
            
            
            self.crs_IfscCash.text = @"Branch Name";
            self.crs_AccountNoCash.text = @"Account Number";
        }
        
        else if ([[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]){
            
            
            self.crs_IfscCash.text = @"Branch Name";
            self.crs_AccountNoCash.text = @"Account Number";
            
            
        }
        
        
        else if ([[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"ROMANIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"KUWAIT"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"QATAR"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"UNITED ARAB EMIRATES"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SAUDI ARABIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"TURKEY"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SWITZERLAND"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"CROATIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"BAHRAIN"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"POLAND"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@""]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@""]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@""]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@""]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@""]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"BULGARIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"ISRAEL"]){
            
            self.crs_IfscCash.text = @"Swift Code";
            
            self.crs_AccountNoCash.text = @"IBAN";
           
        }
        
        else if ([[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SINGAPORE"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"HONG KONG"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"JAPAN"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"OMAN"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"SOUTH AFRICA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"NEW ZEALAND"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"THAILAND"]){
            
            self.crs_IfscCash.text = @"Swift Code";
            
            self.crs_AccountNoCash.text = @"Account Number";
            
        }
        
        
        
        
        
        
        
        else if ([[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"NEPAL"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"BANGLADESH"]){
            
            
            self.crs_IfscCash.text = @"Branch Name";
            self.crs_AccountNoCash.text = @"Account Number";
        }
        
        
        
        else if ([[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"INDIA"]){
            
            
            self.crs_IfscCash.text = @"IFSC";
            
            self.crs_AccountNoCash.text = @"Account Number";
            
            
        }
        
        
        
        
        
        else 
        {
            
            self.crs_IfscCash.text = @"Branch Name";
            
            self.crs_AccountNoCash.text = @" IBAN/Account Number";

        }
        
        
        
        
//        self.Crs_ifsc_code.text=[self.crs_Ary_CashPayDetails valueForKey:@"ifsc"];
//         self.Crs_Banknumber.text=[self.crs_Ary_CashPayDetails valueForKey:@"account_num"];
        
       // self.crs_TransactionNumber.text = [self transactionseparter:[self.crs_HistoryDetails valueForKey:@"txn_no"]];
        
        
        //[self transactionseparter:[self.crs_HistoryDetails valueForKey:@"txn_no"]];
        
        
        
       self.crs_MobileNumber.text = [self.crs_Ary_CashPayDetails valueForKey:@"mobile"];
        
                                     
        NSLog(@" abtttt  %@",self.crs_DictionarybankDetails);
        
        self.Crs_ifsc_code.text = [self.crs_DictionarybankDetails valueForKey:@"ifsc"];
        
        
        if ([[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"PHILIPPINES"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"NEPAL"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"BANGLADESH"]) {
            
              self.Crs_ifsc_code.text = [self.crs_DictionarybankDetails valueForKey:@"branch_name"];
        }
        else if ([[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"KENYA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"TANZANAIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"GHANA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"RWANDA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"NIGERIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"UGANDA"]){
            
            
     self.Crs_ifsc_code.text = [NSString stringWithFormat:@"%@",[self.crs_DictionarybankDetails valueForKey:@"bank"]];
             // self.Crs_ifsc_code.text = [self.crs_DictionarybankDetails valueForKey:@"bank_name"];
        }
        
        else if ([[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"KENYA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"TANZANAIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"GHANA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"RWANDA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"NIGERIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"UGANDA"]){
            
            
           // self.Crs_ifsc_code.text = [self.crs_Ary_CashPayDetails valueForKey:@"bank_name"];
             self.Crs_ifsc_code.text = [NSString stringWithFormat:@"%@",[self.crs_DictionarybankDetails valueForKey:@"bank"]];
        }
        
        
        
        else if ([[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"ZAMBIA"]||[[self.crs_Ary_CashPayDetails valueForKey:@"country"]isEqualToString:@"ZIMBABWE"]){
            
            
            self.crs_IfscCash.text = @"Bank Name";
            self.crs_AccountNoCash.text = @"Account Number";
            
            self.Crs_ifsc_code.text = [NSString stringWithFormat:@"%@",[self.crs_DictionarybankDetails valueForKey:@"bank_name"]];
        }
        
        
        
        
        self.Crs_Banknumber.text = [self transactionseparter:[self.crs_DictionarybankDetails valueForKey:@"account"]];
        
        
        
        
        
        
        // self.crs_br.text = [self.crs_DictionarybankDetails valueForKey:@"ifsc"];
    }
  x = [[Crs_sharedvariable sharedMySingleton].crs_PayOUtAmount floatValue];
   // z = x + y ;
    
   // NSString * floatDisplayer = [NSString stringWithFormat: @"%d",];
    //float f2 = [floatDisplayer floatValue];
    
    
    float f5 = x+y;
    NSNumber * price13 = [NSNumber numberWithFloat:f5];
    NSNumberFormatter *nf1 = [[NSNumberFormatter alloc] init];
    [nf1 setNumberStyle:NSNumberFormatterCurrencyStyle];
    [nf1 setCurrencySymbol:@""]; // <-- this
    //NSDecimalNumber* number = [NSDecimalNumber decimalNumberWithString:[textField text]];
    NSString *price12 = [nf1 stringFromNumber:price13];
    
    
    self.crs_TotalPayingAmount.text = [NSString stringWithFormat:@"%.2f %@",f5,[Crs_sharedvariable sharedMySingleton].crs_FromCountry1];
    
    NSLog(@"%@=====Reciever Amount",self.crs_TotalPayingAmount.text);
    
    [Crs_sharedvariable sharedMySingleton ].crs_TotalPayingAmount = [NSString stringWithFormat:@"%@",[Crs_sharedvariable sharedMySingleton].crs_PayOUtAmount];
    
   
    
    
    
    [self.crs_ProceedOut.layer setBorderWidth:3.0];
    [self.crs_ProceedOut.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    NSLog(@"%@", _Addreciverdetails);
    
    NSLog(@" Hemanth %@",[Crs_sharedvariable sharedMySingleton].crs_CommisionRate);
    NSLog(@"======= ==Kiran %@",[Crs_sharedvariable sharedMySingleton].crs_PayOUtAmount);
    NSLog(@" venkatesh %@",[Crs_sharedvariable sharedMySingleton].crs_PayInAmount);
    self.crs_CurrencyDisplayer.text = [Crs_sharedvariable sharedMySingleton].crs_DispalayingCountryCurrency;
       
    NSLog(@"Hello Gbp %@",self.crs_CurrencyDisplayer.text);
    if ([self.Crs_Comparsion isEqualToString:@"proceed"]) {
        
        self.crs_Proceedoul.hidden = YES;
        
        
        
        
    }
    
    
    
    
    
//    
//    
//    
//    NSString * first_lastname=[NSString stringWithFormat:@"%@ %@",[self.Addreciverdetails valueForKey:@"first_name"],[self.Addreciverdetails valueForKey:@"last_name"]];
//    
    
    NSLog(@"%@",self.crs_Ary_CashPayDetails);
    
  
    self.Crs_counrty.text =[self.crs_Ary_CashPayDetails valueForKey:@"country"];
self.crs_CountryField.text = [self.crs_Ary_CashPayDetails valueForKey:@"country"];
    
   
    float f3 = [[Crs_sharedvariable sharedMySingleton].crs_PayOUtAmount floatValue];
    
   
    NSNumber * price14 = [NSNumber numberWithFloat:f3];
    NSNumberFormatter *nf3 = [[NSNumberFormatter alloc] init];
    [nf3 setNumberStyle:NSNumberFormatterCurrencyStyle];
    [nf3 setCurrencySymbol:@""]; // <-- this
    //NSDecimalNumber* number = [NSDecimalNumber decimalNumberWithString:[textField text]];
    NSString *price15 = [nf3 stringFromNumber:price14];
    
    NSLog(@"HELLO CROSSPAY %@",price15);
    
    
    self.crs_PayInAmountLabel.text =  [NSString stringWithFormat:@"%.2f  %@",f3,[Crs_sharedvariable sharedMySingleton].crs_FromCountry1];
    
    float f1 = [[Crs_sharedvariable sharedMySingleton].crs_PayInAmount floatValue];
    NSNumber * price1 = [NSNumber numberWithFloat:f1];
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    [nf setNumberStyle:NSNumberFormatterCurrencyStyle];
    [nf setCurrencySymbol:@""]; // <-- this
    //NSDecimalNumber* number = [NSDecimalNumber decimalNumberWithString:[textField text]];
    //NSString *price = [nf stringFromNumber:price1];
    
    
    
    self.crs_PayOutLabel.text = [NSString stringWithFormat:@"%@ %@",[Crs_sharedvariable sharedMySingleton].crs_PayInAmount,[Crs_sharedvariable sharedMySingleton].crs_DispalayingCountryCurrency];

  
    
//    self.crs_TotalPayingAmount.text = ([@"%@ %@ %@"]);
    
    self.crs_RateDisplay.text = [Crs_sharedvariable sharedMySingleton].crs_RateDisplayingMethod;
    
    
    

    
    
    
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
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)crs_HistoryAction:(id)sender {
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"historyViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

- (IBAction)crs_ProfileAction:(id)sender {
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UpdateProfile* viewController = [storyboard instantiateViewControllerWithIdentifier:@"UpdateProfileViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];

}

- (IBAction)crs_NotificationAction:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    notificationViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"notificationViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}


-(void)secondtablevIew{
    
    
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:Crosspay_GetSurceofFunds] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
       purposeOfFund = [json valueForKey: @"data"];
        NSLog(@"sai%@", purposeOfFund);
        
      
        // [self.countryList_TableView reloadData];
    }];
    
    [dataTask resume];
    
    
    
    
    
    
    
    
    
}





// Pending settings action

- (IBAction)crs_SettingsAction:(id)sender {
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    SettingsViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewControllerSid"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    
    
}
- (IBAction)crs_BackAction:(id)sender {
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    if ([self.Crs_BackToRecieverDetails isEqualToString:@"Reciever"]) {
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        HomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewControllerSID"];;
        
        [self.navigationController pushViewController:viewController animated:YES];
        
        
    }
    
    else{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    }
    
}
- (IBAction)crs_ProceedAction:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    if ([self.crs_SourceofFundLabel.text isEqualToString:@""]){
        

        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Select Source Of Fund" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
    
  else if ([self.crs_RemitanceFundLabel.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Select Purpose Of  Remittance" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
    
    
    else{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
   SelectPaymentModeViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"SelctPaymentModeSid"];;
    viewController.crs_CashPayComparsion = self.Crs_CashComparsion;
    viewController.Crs_banktransfercountry=self.crs_CountryField.text;
        viewController.TotalAmountPassing = [NSString stringWithFormat:@"%.2f",x+y];
        viewController.Purposecode1 = PurposeCode;
        viewController.Remitance1 = RemitanceCode;
        viewController.PromoBalance = promoBalance;
        viewController.PromoCode = self.crs_PromoCodeFiels.text ;
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    }
    
    
}
- (IBAction)crs_SourceofFundButton:(id)sender {
    
    [self.view endEditing:YES];
    _crs_SourceView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    
    [self.view addSubview:_crs_SourceView];
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        _crs_SourceView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            _crs_SourceView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                _crs_SourceView.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    isFiltered = NO;
    self.crs_search.text = @"";
    self.crs_search.placeholder = @"Search For Source Of Fund";
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
   purpose = @"PurposeOfRemitance";
    self.crs_SourceView.hidden = NO;
    [self.crs_recieverTableview reloadData];
    
}


- (IBAction)crs_PurposeOfRemitanceaction:(id)sender {
    [self.view endEditing:YES];
    _crs_SourceView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    
    [self.view addSubview:_crs_SourceView];
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        _crs_SourceView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            _crs_SourceView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                _crs_SourceView.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    isFiltered = NO;
    self.crs_search.text = @"";
    self.crs_search.placeholder = @"Search For Purpose Of Remittance";
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
     purpose = @"purposeOfFunds";
    self.crs_SourceView.hidden = NO;
    [self.crs_recieverTableview reloadData];
    
}





- (IBAction)crs_sourceHider:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    self.crs_SourceView.hidden = YES;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if ([purpose isEqualToString:@"purposeOfFunds" ]) {
        
        
        if (!isFiltered) {
           
               return remitanceOfFund.count;
            
        }
        
        
        else{
            
            
            
            return searchArray.count;
        }
      
    }
    
    else{
        if (!isFiltered) {
            
             return purposeOfFund.count;
        }
        
        
        else{
            
            return searchArray.count;
        }
    }
   
    
    
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    recieverDetailedTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"RecieverDetailedSID"];
        if ([purpose isEqualToString:@"purposeOfFunds" ]) {
        
            if (!isFiltered) {
                
                cell.crs_purposeLabel.text = [[remitanceOfFund valueForKey:@"por_description"]objectAtIndex:indexPath.row ];
                
                
            }
            else{
                
                
                
                cell.crs_purposeLabel.text = [[searchArray valueForKey:@"por_description"]objectAtIndex:indexPath.row ];
                
            }
          

    }
    
        else{   if (!isFiltered) {
              cell.crs_purposeLabel.text = [[purposeOfFund valueForKey:@"sof_description"]objectAtIndex:indexPath.row ];
            
        }
            
        else{
           
            
              cell.crs_purposeLabel.text = [[searchArray valueForKey:@"sof_description"]objectAtIndex:indexPath.row ];
            
            
        }
            
        }
    
    return cell;
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.crs_SourceView.hidden = YES;
    if ([purpose isEqualToString:@"purposeOfFunds" ]) {
        
        if (!isFiltered) {
            self.crs_RemitanceFundLabel.text = [[remitanceOfFund valueForKey:@"por_description"]objectAtIndex:indexPath.row ];
            
            [Crs_sharedvariable sharedMySingleton].crs_RemitanceFundLabel = [[remitanceOfFund valueForKey:@"por_description"]objectAtIndex:indexPath.row ];
           
            RemitanceCode = [[remitanceOfFund valueForKey:@"por_code"]objectAtIndex:indexPath.row ];
            
             [Crs_sharedvariable sharedMySingleton].crs_RemitanceFundid = [[remitanceOfFund valueForKey:@"por_code"]objectAtIndex:indexPath.row ];
            [self.view endEditing:YES];
        }
        
        else{
            
            
            
            self.crs_RemitanceFundLabel.text = [[searchArray valueForKey:@"por_description"]objectAtIndex:indexPath.row ];
            
            [Crs_sharedvariable sharedMySingleton].crs_RemitanceFundLabel = [[searchArray valueForKey:@"por_description"]objectAtIndex:indexPath.row ];
            
            RemitanceCode = [[searchArray valueForKey:@"por_code"]objectAtIndex:indexPath.row ];
            
            
            [Crs_sharedvariable sharedMySingleton].crs_RemitanceFundid = [[searchArray valueForKey:@"por_code"]objectAtIndex:indexPath.row ];
            [self.view endEditing:YES];
        }

        
        
    }

    
    else
    {
        if (!isFiltered) {
            
            self.crs_SourceofFundLabel.text = [[purposeOfFund valueForKey:@"sof_description"]objectAtIndex:indexPath.row ];
            
            [Crs_sharedvariable sharedMySingleton].crs_SourceofFundLabel = [[purposeOfFund valueForKey:@"sof_description"]objectAtIndex:indexPath.row ];
            
            
            PurposeCode=  [[purposeOfFund valueForKey:@"sof_code"]objectAtIndex:indexPath.row ];
            
            
             [Crs_sharedvariable sharedMySingleton].crs_SourceofFundid = [[purposeOfFund valueForKey:@"sof_code"]objectAtIndex:indexPath.row ];
            [self.view endEditing:YES];
        }
        
        else{
            
            
            self.crs_SourceofFundLabel.text = [[searchArray valueForKey:@"sof_description"]objectAtIndex:indexPath.row ];
            
            
            [Crs_sharedvariable sharedMySingleton].crs_SourceofFundLabel = [[searchArray valueForKey:@"sof_description"]objectAtIndex:indexPath.row ];
            
            
            PurposeCode=  [[searchArray valueForKey:@"sof_code"]objectAtIndex:indexPath.row ];
            
            [Crs_sharedvariable sharedMySingleton].crs_SourceofFundid = [[searchArray valueForKey:@"sof_code"]objectAtIndex:indexPath.row ];
            [self.view endEditing:YES];
        }
        
    }
    
   
    
    
}
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//
//
//    //1. Setup the CATransform3D structure
//    CATransform3D rotation;
//    rotation = CATransform3DMakeRotation( (55.0*M_PI)/180, 0.0, 10.4, 0.4);
//    rotation.m34 = 20.0/ 1000;
//
//
//    //2. Define the initial state (Before the animation)
//    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    cell.layer.shadowOffset = CGSizeMake(10, 10);
//    cell.alpha = 0;
//
//    cell.layer.transform = rotation;
//    cell.layer.anchorPoint = CGPointMake(0, 0.5);
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


-(void)viewWillAppear:(BOOL)animated
{
    
    
//    
//    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
//    [tracker set:kGAIScreenName value:@"Reciever Detailed  View controller"];
//    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
//    
}
#pragma mark -Searchmethod

-(void)textFieldDidChanges:(UITextField *)textField
{
    self.searchTextString=textField.text;
    if ([purpose isEqualToString:@"purposeOfFunds" ])
    {
        [self updateSearchArray:self.searchTextString];
        
    }
    else {
        
        
        [self updateSearchArrays:self.searchTextString];
    }
    
}

-(void)updateSearchArray:(NSString *)searchText
{
    searchArray = [NSMutableArray new];
    
    if(searchText.length==0)
    {
        isFiltered=NO;
        searchArray = remitanceOfFund;
        NSLog(@"%@",searchArray);
        [self.crs_recieverTableview reloadData ];
    }
    else
    {
        isFiltered=YES;
        
        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in remitanceOfFund){
            NSString * string=[dic valueForKey:@"por_description"];
            
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                
                // NSString * Ary_id=[dic valueForKey:@"id"];
                
                [searchArray addObject:dic];
                
                NSLog(@"search %@",searchArray);
                
            }
        }
        
        
        
        /// historyArray = searchArray;
        [self.crs_recieverTableview reloadData ];
        
        
    }
}
-(void)updateSearchArrays:(NSString *)searchText
{
    searchArray = [NSMutableArray new];
    
    if(searchText.length==0)
    {
        isFiltered=NO;
        searchArray = purposeOfFund;
        NSLog(@"%@",searchArray);
        [self.crs_recieverTableview reloadData ];
    }
    else
    {
        isFiltered=YES;
        
        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in purposeOfFund){
            NSString * string=[dic valueForKey:@"sof_description"];
            
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                
                // NSString * Ary_id=[dic valueForKey:@"id"];
                
                [searchArray addObject:dic];
                
                NSLog(@"search %@",searchArray);
                
            }
        }
        
        
        
        /// historyArray = searchArray;
        [self.crs_recieverTableview reloadData ];
        
        
    }
}
-(void)clearNumberPad{
    [_crs_search resignFirstResponder];
    [_crs_PromoCodeFiels resignFirstResponder];
    
    
    
    
    
    
    
    
}

-(void)doneWithNumberPad{
    //NSString *numberFromTheKeyboard = self.crs_SelectBranch.text;
 
    [_crs_search resignFirstResponder];
      [_crs_PromoCodeFiels resignFirstResponder];
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
    
    
    //{"user_id":"5","ccycode":"GBP","accountccycode":"PHP","date":"2018-06-05","amount":"10","servicetype":"CP","promocode":"CPAYFREE"}
//
//    [mapData setObject: self.crs_TextField1.text forKey:@"amount"];
//    [mapData setObject: self.crs_CountryCode.text forKey:@"ccycode"];
//    [mapData setObject:self.crs_Countrycode1.text forKey:@"accountccycode"];
//    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
//
    
    self.crs_TotalPayingAmount.text = [NSString stringWithFormat:@"%@", [Crs_sharedvariable sharedMySingleton].crs_FromCountry1];
    
    self.crs_PayOutLabel.text = [NSString stringWithFormat:@"%@", [Crs_sharedvariable sharedMySingleton].crs_DispalayingCountryCurrency];

    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
     [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
    NSDate *date1 = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSString* finalDateString = [format stringFromDate:date1];
    [mapData setObject:finalDateString forKey:@"date"];
    
    //[mapData setObject:finalDateString forKey:@"date"];
    NSLog(@"Hello%@",finalDateString);
    
    
    
    
    
    
    
    
    
    //[mapData setObject:theTextField.text forKey:@"fromvalue"];
    
    
    
    
    
    // {"user_id":"5","ccycode":"GBP","accountccycode":"INR","date":"2018-06-05","amount":"10"}
    
    
    
    
    
    
    
    
    
    NSLog(@" Promo %@",mapData);
    
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
            
            
            
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
    
    
    
    
}







- (IBAction)crs_PromoActionHider:(id)sender {
    self.crs_HideTheView.hidden = YES;
    
    
}
- (IBAction)crs_PromoApplyButton:(id)sender {
    
    if ([self.crs_PromoCodeFiels.text isEqualToString:@""]) {
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Promo Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
    }
    
  
    
    
    if ([Applied isEqualToString:@"Apply"]) {
       
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_ApplyPromo];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
        
        
        
        
        
        //[mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_PromoBalance forKey:@"promobalance"];
        //  [mapData setObject:[[Crs_sharedvariable sharedMySingleton].crs_PromoDictionary valueForKey:@"PromoCode"]  forKey:@"PromoCode"];
        [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
         [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
        [mapData setObject:[[Crs_sharedvariable sharedMySingleton].crs_PromoDictionary valueForKey:@"ccycode"]  forKey:@"ccycode"];
        
        [mapData setObject:[[Crs_sharedvariable sharedMySingleton].crs_PromoDictionary valueForKey:@"accountccycode"]  forKey:@"accountccycode"];
        [mapData setObject:[[Crs_sharedvariable sharedMySingleton].crs_PromoDictionary valueForKey:@"amount"]  forKey:@"amount"];
        
        [mapData setObject:[[Crs_sharedvariable sharedMySingleton].crs_PromoDictionary valueForKey:@"date"]  forKey:@"date"];
        
        [mapData setObject:self.crs_PromoCodeFiels.text  forKey:@"promocode"];
        
        
        
        if ([self.Crs_CashComparsion isEqualToString:@"CashPay"]) {
            [mapData setObject:@"CP"forKey:@"servicetype"];
            
        }
        else if ([self.Crs_CashComparsion isEqualToString:@"MOBILEWALLET"]){
            
            [mapData setObject:@"WP"forKey:@"servicetype"];
        }
        
        else{
            
            [mapData setObject:@"AC"forKey:@"servicetype"];
            
        }
        
        
        
        
        NSDate *date1 = [NSDate date];
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy-MM-dd"];
        [format setDateFormat:@"yyyy-MM-dd"];
        NSString* finalDateString = [format stringFromDate:date1];
        [mapData setObject:finalDateString forKey:@"date"];
        
        
        NSLog(@"Hello%@",finalDateString);
        
        
        
        
        
        
        NSLog(@" Promo %@",mapData);
        
        // [Crs_sharedvariable sharedMySingleton].crs_PromoDictionary = mapData;
        
        
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
                //[Crs_sharedvariable sharedMySingleton].crs_PromoPassing = json;
                if ([[json valueForKey:@"status"] isEqualToString:@"200"]) {
                     Applied = @"notApplied";
                    [self.crs_ApplyOut setTitle:@"Applied" forState:UIControlStateNormal];
                                       promoBalance = [json valueForKey:@"promobalance"];
                    
                    x = [[Crs_sharedvariable sharedMySingleton].crs_PayOUtAmount floatValue];
                    
                    float f5 = x+y;
//                    NSNumber * price13 = [NSNumber numberWithFloat:f5];
//                    NSNumberFormatter *nf1 = [[NSNumberFormatter alloc] init];
//                    [nf1 setNumberStyle:NSNumberFormatterCurrencyStyle];
//                    [nf1 setCurrencySymbol:@""];
//
//                    NSString *price12 = [nf1 stringFromNumber:price13];
//                    int amount = [price12 intValue];
//                    float amount1 = [price12 floatValue];
//                    NSInteger l = [price12 integerValue];
      float m = [[json valueForKey:@"promobalance"] floatValue];
                    
                   
                    if ([self.Crs_CashComparsion isEqualToString:@"CashPay"]) {
                         y = [[Crs_sharedvariable sharedMySingleton].crs_CashPayCommison floatValue]-m;
                    }
                    else if ([self.Crs_CashComparsion isEqualToString:@"MOBILEWALLET"]){
                        
                         y = [[Crs_sharedvariable sharedMySingleton].crs_WalletCommision floatValue]-m;
                    }
                    
                    else
                    {
                          y = [[Crs_sharedvariable sharedMySingleton].crs_CommisionRate floatValue]-m;
                    }

                   
                  
                    //y =  [[Crs_sharedvariable sharedMySingleton].crs_ floatValue]
                    int euroValues = y;
                
                    
                    
                    
                    NSString* formattedNumber = [NSString stringWithFormat:@"%.2d", euroValues];
                    self.crs_CommisionLabel.text =[NSString stringWithFormat:@"%@ %@",formattedNumber,[Crs_sharedvariable sharedMySingleton].crs_FromCountry1];
                
                
                    
                    self.crs_TotalPayingAmount.text = [NSString stringWithFormat:@"%.2f %@",f5-m,[Crs_sharedvariable sharedMySingleton].crs_FromCountry1];
                    
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                   
                    
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

    
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    if(textField == self.crs_search){
        [[self view] endEditing:YES];
        
    }
    
    
    
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
        if(nextTag==2)
        {
            
            
            [[self view] endEditing:YES];
            
        }
    }
    
    
    return NO;
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}


-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == _crs_JustForScroll) {
        
        
        
        
        
        
        CGPoint scrollPoint = CGPointMake(0,30);
        [  self.crs_Scrollview setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    
    
    else if  (textField == _crs_PromoCodeFiels) {
        
        
        
        CGPoint scrollPoint = CGPointMake(0,500);
        [  self.crs_Scrollview setContentOffset:scrollPoint animated:YES];
        
        
        
    }
}

- (IBAction)crs_home:(id)sender {
}

- (IBAction)crs_History:(id)sender {
}

- (IBAction)crs_Profile:(id)sender {
}

- (IBAction)crs_Settings:(id)sender {
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField==self.crs_search)
    {
        [_crs_search setFrame:CGRectMake(10, 20, 280, 30)];
        //self.crs_searchImage.hidden = YES;
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
@end

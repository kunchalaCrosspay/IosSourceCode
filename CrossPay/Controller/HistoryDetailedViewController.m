//
//  HistoryDetailedViewController.m
//  CrossPay
//
//  Created by sai kiran  on 10/17/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import "HistoryDetailedViewController.h"
#import "notificationViewController.h"
#import "UpdateProfile.h"
#import "SettingsViewController.h"
#import "HistoryViewController.h"
#include "SettingsViewController.h"
#import "HomeViewController.h"
#import "crs_sharedmethods.h"
#import "NewHomeViewController.h"
//#import <Google/Analytics.h>
@interface HistoryDetailedViewController ()
{
    
    NSString *  stringByAddingSpace;
    
    
    
}
@end

@implementation HistoryDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.crs_EuropeView.hidden = YES;
    
    
    
    if ([[self.crs_HistoryDetails valueForKey:@"accout_num"]isEqualToString:@"Bank Transfer"]||[[self.crs_HistoryDetails valueForKey:@"accout_num"]isEqualToString:@"Cash Transaction"]||[[self.crs_HistoryDetails valueForKey:@"accout_num"]isEqualToString:@"Wallet Transaction"])  {
        self.crs_accountView.hidden = YES;
        self.crs_CashView.hidden = NO;
        
        
        
        
        self.Crs_PayoutAmountCurrencyDisplayer.text = [NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"account_ccycode"]];
        self.crs_RateDisplayer.text = [NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"account_ccycode"]];
        
        self.crs_PayinAmountDisplayer.text = [NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"payin_ccycode"]];
        self.crs_TransferFeeLabel.text = [NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"payin_ccycode"]];
        self.crs_TransferFeeLabel.text = [NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"payin_ccycode"]];
        
        
        self.crs_serviceType.text = [self.crs_HistoryDetails valueForKey:@"accout_type"];
        NSLog(@"%@",self.crs_HistoryDetails);
        
        self.crs_RecieverName.text = [NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"name"]];
        
        self.crs_City.text = [NSString stringWithFormat:@" 1 %@ = %.2f %@",[self.crs_HistoryDetails valueForKey:@"payin_ccycode"],[[self.crs_HistoryDetails valueForKey:@"rate"]floatValue],[self.crs_HistoryDetails valueForKey:@"account_ccycode"]];
        
        self.crs_Country.text =  [NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"country"]];
        
        //        self.crs_TransactionNumber.text =  [NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"txn_no"]];
        self.crs_TransactionNumber.text = [self transactionseparter:[self.crs_HistoryDetails valueForKey:@"txn_no"]];
        
        NSString *myString = [self.crs_HistoryDetails valueForKey:@"txn_date"];// @"2012-11-22 10:19:04";
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"dd-MM-yyyy HH:mm";
        NSDate *yourDate = [dateFormatter dateFromString:myString];
        dateFormatter.dateFormat = @"dd-MMM-yyyy  HH:mm";
        NSLog(@"%@",[dateFormatter stringFromDate:yourDate]);
        
        
        self.crs_TransactionDate.text = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:yourDate]];
        
        float f1 = [[self.crs_HistoryDetails valueForKey:@"payin_amount"]floatValue];
        NSNumber * price1 = [NSNumber numberWithFloat:f1];
        NSNumberFormatter *nf1 = [[NSNumberFormatter alloc] init];
        [nf1 setNumberStyle:NSNumberFormatterCurrencyStyle];
        [nf1 setCurrencySymbol:@""]; // <-- this
        //NSDecimalNumber* number = [NSDecimalNumber decimalNumberWithString:[textField text]];
        NSString *payinAmount = [nf1 stringFromNumber:price1];
        
        self.crs_PayinSAmount.text =   [NSString stringWithFormat:@"%@ %@",payinAmount,[NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"payin_ccycode"]]];
        
        
        float f2 = [[self.crs_HistoryDetails valueForKey:@"total_amount"]floatValue];
        NSNumber * price2 = [NSNumber numberWithFloat:f2];
        NSNumberFormatter *nf2 = [[NSNumberFormatter alloc] init];
        [nf2 setNumberStyle:NSNumberFormatterCurrencyStyle];
        [nf2 setCurrencySymbol:@""]; // <-- this
        //NSDecimalNumber* number = [NSDecimalNumber decimalNumberWithString:[textField text]];
        NSString *payinAmount2 = [nf1 stringFromNumber:price2];
        
        self.crs_OrderAmount.text =  [NSString stringWithFormat:@"%@ %@",payinAmount2,[self.crs_HistoryDetails valueForKey:@"payin_ccycode"]];
        
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        [nf setNumberStyle:NSNumberFormatterCurrencyStyle];
        [nf setCurrencySymbol:@""]; // <-- this
        //NSDecimalNumber* number = [NSDecimalNumber decimalNumberWithString:[textField text]];
        NSString *price = [nf stringFromNumber:[self.crs_HistoryDetails valueForKey:@"payee_amount"]];
        
        // NSString *formattedString = [numberFormatter stringFromNumber:[self.crs_HistoryDetails valueForKey:@"payee_amount"]];
        
        
        
        self.Crs_Payeeamount.text = [NSString stringWithFormat:@"%@ %@",[self.crs_HistoryDetails valueForKey:@"payee_amount"],[NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"account_ccycode"]]];
        
        //        self.crs_PayoutAmount.text =  [NSString stringWithFormat:@"%@ %@",[self.crs_HistoryDetails valueForKey:@"payin_amount"],[NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"account_ccycode"]]];
        //
        self.crs_TransferFee.text =  [NSString stringWithFormat:@"%.2f %@",[[self.crs_HistoryDetails valueForKey:@"commission"]floatValue],[NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"payin_ccycode"]]];
        if ([[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]) {
            
            NSString *str = [self.crs_HistoryDetails valueForKey:@"city"];
            
            NSArray * arr = [str componentsSeparatedByString:@"EWAY"];
            
            self.crs_Newcity.text  = [arr objectAtIndex:1];
            
        }
        else{
            
            self.crs_Newcity.text = [NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"city"]];
            
            
        }
        
        
        //        self.Crs_Payeeamount.text =   self.Crs_PayoutAmountCurrencyDisplayer.text = [NSString stringWithFormat:@"%@ %@",[self.crs_HistoryDetails valueForKey:@"account_ccycode"],[NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"payin_ccycode"]]];
        
        
        
        
        
    }
    
    
    else
    {  self.crs_accountView.hidden = NO;
        self.crs_CashView.hidden = YES;
        
        
        if ([[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"AUSTRALIA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"SIERRA LEONE"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"CANADA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"UNITED STATES"]) {
            self.crs_IfscCoder.text = @"Swift Code";
            
        }
        else if ([[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"IRELAND"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"FINLAND"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"SPAIN"]
                 ||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"GERMANY"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"GREECE"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@""]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"ITALY"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"FRANCE"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"NETHERLANDS"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"AUSTRIA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"BELGIUM"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"CYPRUS"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"CZECH REPUBLIC"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"ESTONIA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"HUNGARY"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"LATVIA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"SLOVENIA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"SLOVAKIA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"PORTUGAL"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"MALTA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"LUXEMBOURG"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"LITHUANIA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"DENMARK"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"UNITED KINGDOM"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"NORWAY"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"SWEDEN"])
            
        {
            
            self.crs_IfscCoder.text = @"Swift Code";
            self.crs_ActNumber.text = @"IBAN / Account Number";
            
        }
        
        
        else if ([[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"ROMANIA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"KUWAIT"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"QATAR"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"UNITED ARAB EMIRATES"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"SAUDI ARABIA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"TURKEY"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"SWITZERLAND"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"CROATIA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"BAHRAIN"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"POLAND"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"ISRAEL"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"BULGARIA"]){
            
            self.crs_IfscCoder.text = @"Swift Code";
            
           self.crs_ActNumber.text =@"IBAN";
            
        }
        else if ([[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"SINGAPORE"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"HONG KONG"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"JAPAN"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"OMAN"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"SOUTH AFRICA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"NEW ZEALAND"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"THAILAND"]){
            
           self.crs_IfscCoder.text = @"Swift Code";
            
           self.crs_ActNumber.text = @"Account Number";
            
        }
        
        else if ([[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"INDIA"])
            
        {
            
            self.crs_IfscCoder.text = @"IFSC";
            
            
        }
        
        else if ([[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"PAKISTAN"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"SRI LANKA"])
            
        {
            
            self.crs_IfscCoder.text = @"Branch Code";
            
            
        }
        
        else if ([[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"NEPAL"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"PHILIPPINES"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"BANGLADESH"])
            
        {
            
            self.crs_IfscCoder.text = @"Branch Name";
            self.act_Ifsc.text =   [NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"branch_name"]];
            
        }  else if ([[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"TANZANAIA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"KENYA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"UGANDA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"GHANA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"RWANDA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"NIGERIA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"ZAMBIA"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"ZIMBABWE"])
            
        {
            
            self.crs_IfscCoder.text = @"Bank Name";
            self.act_Ifsc.text =   [NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"branch_name"]];
            
        }
        
        if ([[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"SRI LANKA"]) {
            
            
            self.act_Ifsc.text =   [NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"branchcode"]];
        }
        
        else if ([[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"NEPAL"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"PHILIPPINES"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]||[[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"BANGLADESH"])
            
        {
            
            
            self.act_Ifsc.text =   [NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"branch_name"]];
            
        }
        
        
        else{
            
            self.act_Ifsc.text =   [NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"ifsc"]];
            
        }
        
        
        
        if ([[self.crs_HistoryDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]) {
            
            NSString *str = [self.crs_HistoryDetails valueForKey:@"city"];
            
            NSArray * arr = [str componentsSeparatedByString:@"EWAY"];
            
            self.act_city.text  = [arr objectAtIndex:1];
            
        }
        
        else{
            
            self.act_city.text =   [NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"city"]];
            
            
        }
        
        self.act_rate.text = [NSString stringWithFormat:@"1 %@ = %.2f %@ ",[self.crs_HistoryDetails valueForKey:@"payin_ccycode"],[[self.crs_HistoryDetails valueForKey:@"rate"]floatValue],[self.crs_HistoryDetails valueForKey:@"account_ccycode"]];
        
        
        self.act_Countrt.text = [NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"country"]];
        
        NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
        [nf setNumberStyle:NSNumberFormatterCurrencyStyle];
        [nf setCurrencySymbol:@""]; // <-- this
        //NSDecimalNumber* number = [NSDecimalNumber decimalNumberWithString:[textField text]];
        //      NSString *price = [nf stringFromNumber:[self.crs_HistoryDetails valueForKey:@"payee_amount"]];
        //      NSLog(@"Reciever Amount");
        //
        //
        self.act_payput.text = [NSString stringWithFormat:@"%@ %@ ",[self.crs_HistoryDetails valueForKey:@"payee_amount"],[NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"account_ccycode"]]];
        
        
        self.act_orderAmunt.text =  [NSString stringWithFormat:@"%.2f %@",[[self.crs_HistoryDetails valueForKey:@"total_amount"]floatValue],[self.crs_HistoryDetails valueForKey:@"payin_ccycode"]];
        
        NSString *myString = [self.crs_HistoryDetails valueForKey:@"txn_date"];// @"2012-11-22 10:19:04";
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"dd-MM-yyyy HH:mm";
        NSDate *yourDate = [dateFormatter dateFromString:myString];
        dateFormatter.dateFormat = @"dd-MMM-yyyy HH:mm";
        //NSLog(@"%@",[dateFormatter stringFromDate:yourDate]);
        
        self.act_TransacationDate.text = [NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:yourDate]];
        
        // NSString * transactionView = [self transactionseparter:[self.crs_HistoryDetails valueForKey:@"txn_no"]];
        
        self.act_TransactionNumber.text = [self transactionseparter:[self.crs_HistoryDetails valueForKey:@"txn_no"]];
        
        
        self.act_RecieverNme.text = [NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"name"]];
        
        self.actAccountNo.text = [self transactionseparter:[self.crs_HistoryDetails valueForKey:@"accout_num"]];
        
        
        self.act_serviceType.text = [self.crs_HistoryDetails valueForKey:@"accout_type"];
        self.act_transferFee.text = [NSString stringWithFormat:@"%.2f %@",[[self.crs_HistoryDetails valueForKey:@"commission"]floatValue],[self.crs_HistoryDetails valueForKey:@"payin_ccycode"]];
        
        
        self.act_payinamount.text
        = [NSString stringWithFormat:@"%.2f %@",[[self.crs_HistoryDetails valueForKey:@"payin_amount"]floatValue],[NSString stringWithFormat:@"%@",[self.crs_HistoryDetails valueForKey:@"payin_ccycode"]]];
        
        
        
        
        
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)crs_BackButton:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)crs_HomeActin:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
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

- (IBAction)crs_Notification:(id)sender {
    
}

- (IBAction)crs_Notifiaction:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    notificationViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"notificationViewControllerSID"];;
    
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
-(NSString*)separter:(float)sau{
    
    
    
    NSNumberFormatter *indCurrencyFormatter = [[NSNumberFormatter alloc] init];
    [indCurrencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [indCurrencyFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@""]];
    NSString *formattedString =  [indCurrencyFormatter stringFromNumber:[NSNumber numberWithFloat:sau]];
    
    
    NSLog(@"%@",formattedString);
    
    
    return formattedString;
}






-(void)viewWillAppear:(BOOL)animated
{
    
    
    //
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"History Detailed   View controller"];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    //
}






@end

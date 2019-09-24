//
//  SelectPaymentModeViewController.h
//  CrossPay
//
//  Created by sai kiran  on 9/22/17.
//  Copyright © 2017 CrossPay. All rights reserved.


#import <UIKit/UIKit.h>
#import "HoshiTextField.h"
@interface SelectPaymentModeViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *crs_ViewHider;

@property (strong, nonatomic) IBOutlet UILabel *crs_AccountNumber;

@property (strong, nonatomic) IBOutlet UILabel *crs_Bank;
@property (strong, nonatomic) IBOutlet UILabel *crs_SortingCode;
@property (strong, nonatomic) IBOutlet UILabel *crs_ReferenceNumber;

@property (strong, nonatomic) IBOutlet UIView *crs;
@property (strong,nonatomic) NSString * crs_CashPayComparsion;

@property (strong, nonatomic) IBOutlet UIButton *crs_paymentout;

- (IBAction)crs_back:(id)sender;


- (IBAction)crs_ProceedToPayment:(id)sender;



// outlets for Radio Buttons
@property (strong, nonatomic) IBOutlet UIButton *crs_Credit;



@property (strong, nonatomic) IBOutlet UIButton *crs_BankAccount;


// actions for Radio Buttons


- (IBAction)crs_Debit:(id)sender;

- (IBAction)crs_AccountTransfer:(id)sender;


- (IBAction)crs_SelectedBack:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *crs_SuperView;
- (IBAction)crs_DismissAction:(id)sender;

//@property (strong, nonatomic) IBOutlet UITextField *crs_ReferenceNumber;

@property (strong, nonatomic) IBOutlet UITextField *crs_TxnNumber;
@property (strong, nonatomic) IBOutlet UILabel *crs_IbanLabel;


@property (strong, nonatomic) IBOutlet UIButton *crs_ProceedOut;

@property (weak,nonatomic)NSString * Crs_banktransfercountry;
@property (strong, nonatomic) IBOutlet UILabel *crs_paymentdispalayingoption;
@property(strong,nonatomic)NSString * Purposecode1;
@property(strong,nonatomic)NSString * Remitance1;
@property(strong,nonatomic)NSString * TotalAmountPassing;
// For changing Bank name and account Number For Norway

@property (strong, nonatomic) IBOutlet UILabel *crs_NorwayLbl;


@property (strong, nonatomic) IBOutlet UILabel *crs_BankTransferLabel;


- (IBAction)crs_checkoutAction:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *crs_checkoutOutlet;


- (IBAction)crs_checkouttwoaction:(id)sender;



@property (strong, nonatomic) IBOutlet UIButton *crs_checkouttwooutlet;


- (IBAction)crs_link1:(id)sender;




- (IBAction)crs_link2:(id)sender;



@property (strong, nonatomic) IBOutlet UIView *crs_hideView;

@property (strong, nonatomic) IBOutlet UIView *crs_PopView1;


- (IBAction)crs_HideTheView:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_hidetheviewoutlet;
@property (strong, nonatomic) IBOutlet UILabel *crs_limitLabel;
@property(strong,nonatomic)NSString * PromoBalance;
@property(strong,nonatomic)NSString * PromoCode;

@property (strong, nonatomic) IBOutlet UIView *crs_RateView;


- (IBAction)crs_RateAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_RateOutlet;

- (IBAction)crs_RemindMe:(id)sender;


- (IBAction)crs_NoThanks:(id)sender;


- (IBAction)Crs_ClearSEttleAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *Crs_CleraSettleOutlet;

@property (strong, nonatomic) IBOutlet UILabel *crs_CleardettleLabel;

@property (strong, nonatomic) IBOutlet UILabel *crs_secureTradingLabel;
- (IBAction)CRS_HOME:(id)sender;
- (IBAction)crs_History:(id)sender;
- (IBAction)crs_Profile:(id)sender;
- (IBAction)crs_history:(id)sender;


@property (strong, nonatomic) IBOutlet UIView *crs_RecepitView;
@property (strong, nonatomic) IBOutlet UILabel *crs_TransactionNumber;
@property (strong, nonatomic) IBOutlet UILabel *crs_RecieverName;
@property (strong, nonatomic) IBOutlet UILabel *crs_CountryName;
@property (strong, nonatomic) IBOutlet UILabel *crs_City;
//@property (strong, nonatomic) IBOutlet UILabel *crs_AccountNumber;
@property (strong, nonatomic) IBOutlet UILabel *crs_IfscNumber;
@property (strong, nonatomic) IBOutlet UILabel *crs_TransactionDate;
@property (strong, nonatomic) IBOutlet UILabel *crs_PayOutAmount;
@property (strong, nonatomic) IBOutlet UILabel *crs_Rate;
@property (strong, nonatomic) IBOutlet UILabel *crs_PayinAmount;
@property (strong, nonatomic) IBOutlet UILabel *crs_TransferFee;
@property (strong, nonatomic) IBOutlet UILabel *crs_OrderAmount;
- (IBAction)crs_DashBack:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_DashBoard;
- (IBAction)crs_DashOutAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *crs_CashView;
@property (strong, nonatomic) IBOutlet UILabel *crs_AccTransactionNumber;
@property (strong, nonatomic) IBOutlet UILabel *crs_AccRecieverName;
@property (strong, nonatomic) IBOutlet UILabel *crs_AccCountryName;
@property (strong, nonatomic) IBOutlet UILabel *crs_CityName;
@property (strong, nonatomic) IBOutlet UILabel *crs_AccAccountNumber;
@property (strong, nonatomic) IBOutlet UILabel *crs_Ifsclabe;
@property (strong, nonatomic) IBOutlet UILabel *crs_IfscTextChanger;
@property (strong, nonatomic) IBOutlet UILabel *crs_AccTransactionDate;
@property (strong, nonatomic) IBOutlet UILabel *crs_AccPayinAmount;
@property (strong, nonatomic) IBOutlet UILabel *crs_AccPayOutAmount;
@property (strong, nonatomic) IBOutlet UILabel *crs_AccRate;
@property (strong, nonatomic) IBOutlet UILabel *crs_AccTransferFee;
@property (strong, nonatomic) IBOutlet UILabel *crs_AccOrderAmount;
@property (strong, nonatomic) IBOutlet UIView *crs_AccountView;
@property (strong, nonatomic) IBOutlet UILabel *crs_AccountNumberChanger;
- (IBAction)home:(id)sender;


- (IBAction)profile:(id)sender;


- (IBAction)settings:(id)sender;
- (IBAction)history:(id)sender;
- (IBAction)crs_DashBack:(id)sender;

@end

//
//  HistoryDetailedViewController.h
//  CrossPay
//
//  Created by sai kiran  on 10/17/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryDetailedViewController : UIViewController
- (IBAction)crs_BackButton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *crs_RecieverName;
@property (strong, nonatomic) IBOutlet UILabel *crs_Country;
@property (strong, nonatomic) IBOutlet UILabel *crs_City;
@property (strong, nonatomic) IBOutlet UILabel *crs_TransactionNumber;

@property (strong, nonatomic) IBOutlet UILabel *crs_TransactionDate;
@property (strong, nonatomic) IBOutlet UILabel *crs_PayinSAmount;
@property (strong, nonatomic) IBOutlet UILabel *crs_PayoutAmount;
@property (strong, nonatomic) IBOutlet UILabel *crs_TransferFee;
@property (strong, nonatomic) IBOutlet UILabel *crs_OrderAmount;

@property (strong, nonatomic) NSMutableDictionary *crs_HistoryDetails;
@property (strong, nonatomic) IBOutlet UILabel *Crs_Payeeamount;

- (IBAction)crs_HomeActin:(id)sender;

- (IBAction)crs_History:(id)sender;

- (IBAction)crs_Notification:(id)sender;

- (IBAction)crs_Notifiaction:(id)sender;
- (IBAction)crs_Profile:(id)sender;
- (IBAction)crs_settings:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *Crs_PayoutAmountCurrencyDisplayer;
@property (strong, nonatomic) IBOutlet UILabel *crs_RateDisplayer;
@property (strong, nonatomic) IBOutlet UILabel *crs_PayinAmountDisplayer;
@property (strong, nonatomic) IBOutlet UILabel *crs_TransferFeeLabel;
@property (strong, nonatomic) IBOutlet UILabel *crs_TotalOrderAmount;
// Account Credit


@property (strong, nonatomic) IBOutlet UILabel *act_Countrt;


@property (strong, nonatomic) IBOutlet UILabel *act_TransacationDate;

@property (strong, nonatomic) IBOutlet UILabel *act_payput;

@property (strong, nonatomic) IBOutlet UILabel *act_rate;

@property (strong, nonatomic) IBOutlet UILabel *act_payinamount;


@property (strong, nonatomic) IBOutlet UILabel *act_transferFee;

@property (strong, nonatomic) IBOutlet UILabel *act_orderAmunt;

@property (strong, nonatomic) IBOutlet UILabel *act_city;

@property (strong, nonatomic) IBOutlet UILabel *actAccountNo;

@property (strong, nonatomic) IBOutlet UILabel *act_Ifsc;

@property (strong, nonatomic) IBOutlet UIView *crs_CashView;
@property (strong, nonatomic) IBOutlet UIView *crs_accountView;

@property (strong, nonatomic) IBOutlet UILabel *act_TransactionNumber;
@property (strong, nonatomic) IBOutlet UILabel *act_RecieverNme;
@property (strong, nonatomic) IBOutlet UILabel *crs_Newcity;
@property (strong, nonatomic) IBOutlet UILabel *crs_IfscCoder;
@property (strong, nonatomic) IBOutlet UILabel *crs_serviceType;
@property (strong, nonatomic) IBOutlet UILabel *act_serviceType;
@property (strong, nonatomic) IBOutlet UILabel *crs_ActNumber;

// Europe View



//@property (strong, nonatomic) IBOutlet UIView *crs_EuropeView;
//
//@property (strong, nonatomic) IBOutlet UILabel *Crs_europeDate;
//
//@property (strong, nonatomic) IBOutlet UILabel *crs_europePayout;
//
//@property (strong, nonatomic) IBOutlet UILabel *crs_EuropeRate;
//@property (strong, nonatomic) IBOutlet UILabel *crs_europePayinAmount;
//@property (strong, nonatomic) IBOutlet UILabel *crs_EuropeOrderAmount;
//@property (strong, nonatomic) IBOutlet UILabel *crs_europeInProcess;
//
//
//@property (strong, nonatomic) IBOutlet UILabel *crs_europeTransferFee;
@property (strong, nonatomic) IBOutlet UIView *crs_scrolltheView;


@end

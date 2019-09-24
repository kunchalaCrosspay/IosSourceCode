//
//  SecureTradingCharityViewController.h
//  CrossPay
//
//  Created by sai kiran  on 9/11/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecureTradingCharityViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *crs_SecureTrading;

@property (strong,nonatomic) NSString * crs_CHARITYAmount;
@property (strong,nonatomic) NSString * crs_CHARITYPurposeCode;
@property (strong,nonatomic) NSString * crs_CHARITYOrganisationCode;
@property (strong,nonatomic) NSString * crs_CHARITYCurrencyCode;
@property (strong,nonatomic) NSString * crs_CHARITYCardType;
@property (strong,nonatomic) NSString * crs_CHARITYCoustmerNo;
@property (strong,nonatomic) NSString * crs_CHARITYTransactionNumber;
@property (strong,nonatomic) NSString * crs_CHARITYOrderId;
@property (strong,nonatomic) NSString * crs_CHARITYLink;
@property (strong,nonatomic) NSString * crs_CHARITYSiteReference;
@property (strong,nonatomic) NSString * crs_SecureTradingLink;
@property (strong,nonatomic) NSString * crs_CHARITYVersion;
@property (strong,nonatomic) NSMutableDictionary * CharityDictionary;
@property (strong,nonatomic) NSString * crs_CHARITYOrganisationCode11;;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (strong,nonatomic) NSMutableDictionary * passingData;

- (IBAction)crs_BackAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *crs_SuccessfullTransactionView;

@property (strong, nonatomic) IBOutlet UIView *crs_transactionCompletedView;

- (IBAction)crs_YesAction:(id)sender;


- (IBAction)crs_NoAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *crs_NameChanger;

@property (strong, nonatomic) IBOutlet UIView *crs_TransactionCancel;
- (IBAction)crs_TransactionCancelYes:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_TransactioncancelYesOut;

- (IBAction)crs_TransactionNoAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_TransactionNoOut;












@end

//
//  CharityClearSettleViewController.h
//  CrossPay
//
//  Created by sai kiran  on 9/7/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharityClearSettleViewController : UIViewController
@property (strong,nonatomic) NSString * crs_CHARITYAmount;
@property (strong,nonatomic) NSString * crs_CHARITYPurposeCode;
@property (strong,nonatomic) NSString * crs_CHARITYOrganisationCode;
@property (strong,nonatomic) NSString * crs_CHARITYCurrencyCode;
@property (strong,nonatomic) NSString * crs_CHARITYCardType;
@property (strong,nonatomic) NSString * crs_CHARITYCoustmerNo;
@property (strong,nonatomic) NSString * crs_CHARITYTransactionNumber;
@property (strong,nonatomic) NSString * crs_CHARITYOrderId;

@property (strong,nonatomic) NSString * crs_ORGAn;
@property (strong,nonatomic) NSString * crs_purpose;
@property (strong,nonatomic) NSString * crs_Currency;
//Copied from clear settle


@property (strong, nonatomic) IBOutlet UIWebView *crs_CharityWebviw;

@property (strong, nonatomic) IBOutlet UIView *crs_BackCancelView;
@property (strong, nonatomic) IBOutlet UIButton *crs_BackYesOu;
- (IBAction)crs_BackActio:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_BackNoOut;
- (IBAction)crs_BackNoAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *crs_SucceessfullView;

@property (strong, nonatomic) IBOutlet UIButton *crs_SuccessfullOkOut;


- (IBAction)crs_SuccessAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *crs_TransactionDeclinedView;


@property (strong, nonatomic) IBOutlet UIButton *crs_TransactionDeclinedOk;

@property (strong,nonatomic) NSDictionary * passingData;

@property (strong,nonatomic) NSDictionary * ToatalData;



- (IBAction)crs_TransactionDeclinedOk:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_BackOut;





- (IBAction)crs_CharityBack:(id)sender;


@property (strong, nonatomic) IBOutlet UIView *crs_TransactionCancel;

@property (strong, nonatomic) IBOutlet UIButton *crs_YesOutTransaction;

- (IBAction)crs_TransactionYesAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_NoOutTransaction;

- (IBAction)crs_TransactionYesAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *crs_TransactionCancelViewForBackaction;

@property (strong, nonatomic) IBOutlet UIButton *crs_CharityYesOutlet;
- (IBAction)crs_CharityYesAction:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *crs_CharityNoOut;

- (IBAction)crs_CharityNoAction:(id)sender;




@end

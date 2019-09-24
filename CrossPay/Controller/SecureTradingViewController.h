//
//  SecureTradingViewController.h
//  CrossPay
//
//  Created by sai kiran  on 9/7/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecureTradingViewController : UIViewController
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


@property (strong, nonatomic) IBOutlet UIView *crs_SuccessFullTransaction;
@property (strong, nonatomic) IBOutlet UIButton *crs_SucessFulYesout;
- (IBAction)crs_sucessfullYesAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_NoOut;

- (IBAction)crs_NoAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIWebView *crs_SecureTradingWeb;

@end

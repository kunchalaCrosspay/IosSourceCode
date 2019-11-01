//
//  CharitySecuretrading1ViewController.h
//  CrossPay
//
//  Created by sai kiran  on 12/27/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface CharitySecuretrading1ViewController : UIViewController
{
    UIDatePicker *datePicker;
    
}

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
@property (strong,nonatomic) NSString * CharityReference;
@property (strong, nonatomic) IBOutlet UIScrollView *crs_SecureTradingScroll;

@property (strong, nonatomic) IBOutlet UILabel *crs_AmountLabel;
@property (strong, nonatomic) IBOutlet UILabel *crs_OrderReferenceLabel;
@property (strong, nonatomic) IBOutlet UITextField *crs_CardNumber;

@property (strong, nonatomic) IBOutlet UITextField *crs_Month;
@property (strong, nonatomic) IBOutlet UITextField *crs_Year;

@property (strong, nonatomic) IBOutlet UITextField *crs_Cvv;


- (IBAction)crs_PayNow:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *crs_SuccesfullView;

- (IBAction)crs_OkAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *crs_CancelView;

- (IBAction)crs_CancelYes:(id)sender;
- (IBAction)crs_CancelNo:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_SavedDetailsOut;

- (IBAction)crs_SavedDetailsAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_NewCardoutlet;
- (IBAction)crs_NewCardAction:(id)sender;

- (IBAction)crs_SavedDetailsButton:(id)sender;

- (IBAction)crs_PaymentDetails:(id)sender;
- (IBAction)crs_MorepaymentoptionsButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *crs_CardDetailsView;

@property (strong, nonatomic) IBOutlet UITableView *crs_SecureTradingTable;
@property (weak, nonatomic) IBOutlet UIView *Carddetails_View;
- (IBAction)CardDetails_BackAction:(id)sender;

//@property (weak, nonatomic) IBOutlet UILabel *Crs_CardnumberDetails;
//@property (weak, nonatomic) IBOutlet UILabel *Crs_CardMonth;
//@property (weak, nonatomic) IBOutlet UILabel *Crs_CardYear;

@property (weak, nonatomic) IBOutlet UITextField *Crs_CardCvv;

@property (weak, nonatomic) IBOutlet UIButton *Crs_SaveCardOulet;

- (IBAction)Crs_SaveCardAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIPickerView *Crs_Month_YearPicker;

- (IBAction)Month_Picker_Action:(id)sender;
- (IBAction)Year_Picker_Action:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *Crs_Picker_View;
- (IBAction)Crs_Picker_Done:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *Crs_CardnumberDetails;
@property (strong, nonatomic) IBOutlet UITextField *Crs_CardMonth;

@property (strong, nonatomic) IBOutlet UITextField *Crs_CardYear;
- (IBAction)crs_SecondpaymentButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_SecondPayout;

@property (strong, nonatomic) IBOutlet UIView *crs_paymentDetailsView;
@property (strong, nonatomic) IBOutlet UIView *crs_BackView;

@property (strong, nonatomic) IBOutlet UILabel *crs_BackLabel;
- (IBAction)Crs_BackToHome:(id)sender;
- (IBAction)crs_TableBack:(id)sender;
- (IBAction)crs_Radio1action:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs;
@property (strong, nonatomic) IBOutlet UIButton *crs_Radio1Outlet;
- (IBAction)crs_TableSaved:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_Radio2Out;
- (IBAction)crs_radio2Action:(id)sender;
- (IBAction)crs_TablePayments:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *crs_SecondAmount;
@property (strong, nonatomic) IBOutlet UILabel *crs_SecondOrder;
@property (strong, nonatomic) IBOutlet UIScrollView *crs_Scroll2;
@property (strong, nonatomic) IBOutlet UIButton *crs_SavedCradsOut2;
@property (strong, nonatomic) IBOutlet UIView *crs_movingView;
@property (strong, nonatomic) IBOutlet UILabel *crs_MerchantName;
@property (strong, nonatomic) IBOutlet UILabel *crs_MerchantName1;
@property(strong,nonatomic)NSString * CharityOrganisationName;
@property(strong,nonatomic)NSString * CharityOrganisationName1;
@property(strong,nonatomic)NSString * TrustGetter;
@property (strong, nonatomic) IBOutlet UILabel *crs_cardNumberlabel;
@property (strong, nonatomic) IBOutlet UILabel *crs_CvvLabel;
@property (strong, nonatomic) IBOutlet UIImageView *crs_cvvImage;

@property (strong, nonatomic) IBOutlet UILabel *crs_savedCardsFuturelabel;
@property (strong, nonatomic) IBOutlet UILabel *crs_expiryYearLabel;

@property (strong, nonatomic) IBOutlet UILabel *crs_expirymonthLabel;
@property (strong, nonatomic) IBOutlet UIButton *crs_MonthOutlet;

@property (strong, nonatomic) IBOutlet UIButton *crs_YearOutlet;

@property (strong, nonatomic) IBOutlet UIButton *crs_PaySecurelyout;

@property (strong, nonatomic) IBOutlet UILabel *crs_CharityCardLabel;

@property (strong, nonatomic) IBOutlet UILabel *crs_CharityMonthLabel;

@property (strong, nonatomic) IBOutlet UIButton *crs_PaymentDetailsOut;
@property(strong,nonatomic)NSString * CardGetter;

@property (strong, nonatomic) IBOutlet UIButton *crs_HideOut;
- (IBAction)crs_Hide:(id)sender;

@end



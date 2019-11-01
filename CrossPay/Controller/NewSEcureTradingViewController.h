//
//  NewSEcureTradingViewController.h
//  CrossPay
//
//  Created by sai kiran  on 12/21/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface NewSEcureTradingViewController : UIViewController

{
    UIDatePicker *datePicker;
    
}



@property (strong,nonatomic) NSString * OrderId;
@property (strong,nonatomic) NSMutableDictionary * passingData;
@property(nonatomic,strong)NSString * promoBalance1;
@property(nonatomic,strong)NSString * promoGetter;
- (IBAction)crs_BackAction:(id)sender;

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
@property (strong, nonatomic) IBOutlet UIView *crs_paymentDetailsView;
@property (strong, nonatomic) IBOutlet UIView *crs_BackView;
@property (strong, nonatomic) IBOutlet UILabel *crs_BackLabel;
- (IBAction)crs_BacktoAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_secondpayoutlet;
@property (strong, nonatomic) IBOutlet UILabel *crs_SecondAmountLabel;
@property (strong, nonatomic) IBOutlet UILabel *crs_secondOrderreference;
@property (strong, nonatomic) IBOutlet UIView *crs_CardDetailsView2;
- (IBAction)crs_CardDetailsAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_SavedCardsoutlet1;


- (IBAction)crs_savedCardsAction1:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_PaymentDetailsOut;

- (IBAction)crs_PaymentDetailsAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_PaymentDetailsAction1;
- (IBAction)crs_cardDetailsactionForTable:(id)sender;


- (IBAction)crs_SavedCardsActionForTableview:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_SavedCardsOutletForTableView;



@property (strong, nonatomic) IBOutlet UIButton *crs_SavedCardsOutletActionForTableView;

- (IBAction)crs_PaymentsAction:(id)sender;
- (IBAction)crs_CardDetailsBackAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_Radio2Outelet;

- (IBAction)crs_Radio2Action:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_Radio1out;
- (IBAction)crs_Radio1Action:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_SavedCardsOutlet2;
@property (strong, nonatomic) IBOutlet UIView *crs_MovingView;
@property (strong, nonatomic) IBOutlet UIScrollView *crs_Scroll2;
@property (strong, nonatomic) IBOutlet UIView *crs_RatingView;

@property (strong, nonatomic) IBOutlet UILabel *crs_CardNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *crs_ExpiryYearlabl;
@property (strong, nonatomic) IBOutlet UILabel *crs_ExpiryMonthLabel;
@property (strong, nonatomic) IBOutlet UIButton *crs_ExpiryButtonOutelet;
@property (strong, nonatomic) IBOutlet UIButton *crs_ExpiryMonthOutlet;
@property (strong, nonatomic) IBOutlet UILabel *crs_CvvLabel;
@property (strong, nonatomic) IBOutlet UIImageView *crs_CvvImage;
@property (strong, nonatomic) IBOutlet UILabel *crs_savedCardsLabel;
@property (strong, nonatomic) IBOutlet UIButton *crs_PaySecureout;
@property (strong, nonatomic) IBOutlet UIButton *crs_PaymentDetailsout;
@property (strong, nonatomic) IBOutlet UIButton *crs_HideOut;
- (IBAction)crs_Hide:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *crs_RecepitView;
@property (strong, nonatomic) IBOutlet UILabel *crs_TransactionNumber;
@property (strong, nonatomic) IBOutlet UILabel *crs_RecieverName;
@property (strong, nonatomic) IBOutlet UILabel *crs_CountryName;
@property (strong, nonatomic) IBOutlet UILabel *crs_City;
@property (strong, nonatomic) IBOutlet UILabel *crs_AccountNumber;
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
@property (strong, nonatomic) IBOutlet UIImageView *Reciept;
- (IBAction)crs_Home:(id)sender;

- (IBAction)crs_Profile:(id)sender;

- (IBAction)crs_settings:(id)sender;
- (IBAction)History:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *crs_NewAccountLabel;

@end




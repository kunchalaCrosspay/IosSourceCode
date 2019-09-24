//
//  RecieverDetailedViewController.h
//  CrossPay
//
//  Created by sai kiran  on 8/13/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecieverDetailedViewController : UIViewController

// Tab Bar action
- (IBAction)crs_ProceedAction:(id)sender;

@property (strong, nonatomic) NSMutableDictionary * crs_DictionarybankDetails;
@property (strong, nonatomic) IBOutlet UIScrollView *crs_ScrollViewForDetailedRecievers;

@property (strong, nonatomic) IBOutlet UIScrollView *crs_Scrollview;

@property (strong, nonatomic) IBOutlet UIButton *crs_Proceedoul;


@property (weak, nonatomic) NSString *Crs_Comparsion;

@property (strong, nonatomic) NSString *Crs_CashComparsion;
@property (strong, nonatomic) NSString *Crs_str_BankName;


@property (strong, nonatomic) IBOutlet UILabel *crs_PayInAmountLabel;

@property (strong, nonatomic) IBOutlet UILabel *crs_PayOutLabel;


@property (strong, nonatomic) IBOutlet UILabel *crs_CommisionLabel;
@property (strong,nonatomic) NSMutableArray * crs_Ary_CashPayDetails;


- (IBAction)crs_HomeAction:(id)sender;


- (IBAction)crs_HistoryAction:(id)sender;


- (IBAction)crs_ProfileAction:(id)sender;


- (IBAction)crs_NotificationAction:(id)sender;
- (IBAction)crs_SettingsAction:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *Crs_name;

@property (weak, nonatomic) IBOutlet UILabel *Crs_counrty;

@property (weak, nonatomic) IBOutlet UILabel *Crs_Bank_name;

@property (weak, nonatomic) IBOutlet UILabel *Crs_Banknumber;
@property (weak, nonatomic) IBOutlet UILabel *Crs_ifsc_code;



// back Action


- (IBAction)crs_BackAction:(id)sender;

@property(strong,nonatomic)NSMutableArray * Addreciverdetails;



@property (strong, nonatomic) IBOutlet UIButton *crs_ProceedOut;

@property (strong, nonatomic) IBOutlet UILabel *crs_CountryField;


@property (strong, nonatomic) IBOutlet UILabel *crs_Name1Label;


@property (strong, nonatomic) IBOutlet UILabel *crs_MobileNumber;




@property (strong, nonatomic) IBOutlet UILabel *crs_IfscCash;

@property (strong, nonatomic) IBOutlet UILabel *crs_AccountNoCash;

@property (strong, nonatomic) IBOutlet UILabel *crs_MobilenoCash;
@property (strong, nonatomic) IBOutlet UILabel *crs_TotalPayingAmount;

@property (strong, nonatomic) IBOutlet UIButton *crs_ProcedActionOut;


@property (strong, nonatomic) IBOutlet UIButton *crs_ProceedPic;
@property (strong, nonatomic) IBOutlet UILabel *crs_CurrencyDisplayer;
@property (strong, nonatomic) IBOutlet UILabel *crs_RateDisplay;


@property (strong, nonatomic) IBOutlet UITextField *crs_SourceOfFund;




- (IBAction)crs_SourceofFundButton:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *crs_PurposeOfRemitance;
- (IBAction)crs_PurposeOfRemitanceaction:(id)sender;


@property (strong, nonatomic) IBOutlet UIView *crs_PurposeOfFundView;

// source of fund table view View


@property (strong, nonatomic) IBOutlet UIView *crs_SourceView;


- (IBAction)crs_sourceHider:(id)sender;





@property (strong, nonatomic) IBOutlet UITableView *crs_recieverTableview;


@property (strong, nonatomic) IBOutlet UILabel *crs_ServiceLabel;
@property (strong, nonatomic) IBOutlet UILabel *crs_SourceofFundLabel;
@property (strong, nonatomic) IBOutlet UILabel *crs_RemitanceFundLabel;

@property (strong, nonatomic) IBOutlet UILabel *Crs_ServiceChanger;


@property (strong, nonatomic) IBOutlet UIView *crs_mainView;
@property (strong, nonatomic) IBOutlet UILabel *crs_IfscLine;

//@property(nonatomic,strong)NSString * searchTextString;

@property (strong, nonatomic) IBOutlet UITextField *crs_search;
@property(nonatomic,strong)NSString * searchTextString;

//promo code
@property (strong, nonatomic) IBOutlet UILabel *crs_promoline;

@property (strong, nonatomic) IBOutlet UILabel *crs_PromolaceHolder;
@property (strong, nonatomic) IBOutlet UILabel *crs_promocodeDisplayer;

@property (strong, nonatomic) IBOutlet UIButton *crs_promobuttonou;

- (IBAction)crs_promoButtonAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *crs_PromoView;
@property (strong, nonatomic) IBOutlet UILabel *crs_PromoDisplayLabel;
@property (strong, nonatomic) IBOutlet UIButton *crs_PromoViewHider;

- (IBAction)crs_PromoActionHider:(id)sender;

//
// Promo Code Out lets
@property (strong, nonatomic) IBOutlet UILabel *crs_PromoLine;

@property (strong, nonatomic) IBOutlet UILabel *crs_PromoPlaceHolder;
@property (strong, nonatomic) IBOutlet UITextField *crs_PromoCodeFiels;

@property (strong, nonatomic) IBOutlet UILabel *crs_PromoCodeDisplayer;
@property (strong, nonatomic) IBOutlet UILabel *crs_PromoCodeContent;
- (IBAction)crs_PromoApplyButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *crs_HideTheView;
@property (strong, nonatomic) IBOutlet UIButton *crs_PromoOutlet;
@property (strong, nonatomic) IBOutlet UITextField *crs_JustForScroll;
@property (strong, nonatomic) IBOutlet UIButton *crs_PromoOutlet1;
@property (strong, nonatomic) IBOutlet UILabel *crs_PromoHolder;
@property (strong, nonatomic) IBOutlet UIButton *crs_ApplyOut;

/// Resolving Back problem
@property (strong, nonatomic) NSString *Crs_BackToRecieverDetails;
@property (strong, nonatomic) NSString *Crs_PhpBankName;

- (IBAction)crs_home:(id)sender;

- (IBAction)crs_History:(id)sender;

- (IBAction)crs_Profile:(id)sender;
- (IBAction)crs_Settings:(id)sender;

@end

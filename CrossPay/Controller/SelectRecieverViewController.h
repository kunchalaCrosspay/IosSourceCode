//
//  SelectRecieverViewController.h
//  CrossPay
//
//  Created by sai kiran  on 8/13/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HoshiTextField.h"
@interface SelectRecieverViewController : UIViewController


// Add Reciever Button


- (IBAction)crs_AddRecieverAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIScrollView *crs_selectRecieverscroll;

@property (strong, nonatomic) IBOutlet UIButton *crs_ProceddoutLet;




- (IBAction)crs_BackAction:(id)sender;



// Tab Bar navigation

- (IBAction)crs_HomePage:(id)sender;


- (IBAction)crs_HistoryPage:(id)sender;


- (IBAction)crs_Notification:(id)sender;

- (IBAction)crs_Profile:(id)sender;



- (IBAction)crs_settingsPage:(id)sender;

//
//
//@property (strong, nonatomic) IBOutlet UILabel *crs_Name;
//
//@property (strong, nonatomic) IBOutlet UILabel *crs_AccountNunber;
//
@property (strong, nonatomic) IBOutlet UILabel *crs_nameLabel;


@property (strong, nonatomic) IBOutlet UITableView *crs_SelecRecieverTableView;

@property (strong, nonatomic) IBOutlet UIView *crs_bankView;

@property (strong, nonatomic) IBOutlet UIView *crs_CashPayView;

- (IBAction)crs_cashPayAction:(id)sender;

- (IBAction)crs_AccountCredit:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *crs_CashPayOutlet;



@property (strong, nonatomic) IBOutlet UIButton *crs_accountCredit;

@property (strong, nonatomic) IBOutlet UIView *crs_pickerView;


@property (strong, nonatomic) IBOutlet UITextField *crs_PayoutField;

- (IBAction)crs_SelectPayout:(id)sender;



@property (strong, nonatomic) IBOutlet UIButton *crs_addRecieverOut;




@property (strong, nonatomic) IBOutlet UILabel *crs_BranchNamelabel;



- (IBAction)crs_ProceedAction:(id)sender;







@property (strong, nonatomic) IBOutlet UIButton *crs_ProceedOut;


@property (strong, nonatomic) IBOutlet UIView *crs_PaymentModeView;


@property (strong, nonatomic) IBOutlet UILabel *crs_SelectPaymentLabel;


- (IBAction)crs_SelectPaymentModeAction:(id)sender;


@property (strong, nonatomic) IBOutlet UIView *crs_ViewBankMode;


@property (strong, nonatomic) IBOutlet UIPickerView *crs_PickerViewBankMode;

@property (strong, nonatomic) IBOutlet UILabel *crs_NODataContentLabel;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Branch;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_BankAccount;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Ifsc;
@property (strong, nonatomic) IBOutlet UILabel *crs_CashPickup;


@property (strong, nonatomic) IBOutlet UILabel *crs_AccountCredit;

@property (strong, nonatomic) IBOutlet UIView *crs_BankViewHider;

@property (strong, nonatomic) IBOutlet UIView *crs_TableViewview;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_NewBranch;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_PhpBankName;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_PhpAccountNumbe;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_PhpBranchName;
@property (strong, nonatomic) IBOutlet UIView *crs_PhpView;


- (IBAction)crs_RemoveAction:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *crs_BankIfscChanger;
//bank names

@property (weak, nonatomic) IBOutlet UIView *Crs_Banknameview;
@property (weak, nonatomic) IBOutlet UITableView *Crs_BankName_Tableview;
- (IBAction)Crs_bankAction:(id)sender;

- (IBAction)Crs_view_hide:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_Bankoutlet;


@property (strong, nonatomic) NSString *crs_PassingFromHome;
@property (strong, nonatomic) IBOutlet UILabel *crs_EurpoeCountryAccount;
@property (strong, nonatomic) IBOutlet UIImageView *crs_DropDownOmage;
// For Hiding PhP view
@property (strong, nonatomic) IBOutlet UIButton *crs_PhpCashPickUpoutlet;
@property (strong, nonatomic) IBOutlet UITextField *crs_search;
@property(nonatomic,strong)NSString * searchTextString;

@property (strong, nonatomic) IBOutlet UILabel *crs_pobDob;


@property (strong, nonatomic) IBOutlet UIButton *crs_PhpBankOutlet;
@property (strong, nonatomic) IBOutlet UILabel *crs_Vtn_BankNmae;
@property (strong, nonatomic) IBOutlet UILabel *crs_Vtn_AccountNumber;
@property (strong, nonatomic) IBOutlet UILabel *crs_Vtn_Branchname;
- (IBAction)crs_ForVietnam:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_ForCashVietnam;

- (IBAction)crs_KenyaAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_KenyaOutLet;
@property (strong, nonatomic) IBOutlet UIButton *crs_CashPayOutForKenya;

@property (strong, nonatomic) IBOutlet UILabel *crs_kenyaLabel;
@property (strong, nonatomic) IBOutlet UILabel *crs_AgentChanger;
@property (weak, nonatomic) IBOutlet UIButton *crs_BanglaBranch;
- (IBAction)crs_BanglaAction:(id)sender;

@end

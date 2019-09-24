//
//  registerViewController.h
//  CrossPay
//
//  Created by saikiran kunchala on 28/07/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HoshiTextField.h"
@interface registerViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>




{
    UIDatePicker *datePicker;
    
}

@property (strong, nonatomic) IBOutlet UIView *crs_CountryView;

@property (strong, nonatomic) IBOutlet UIPickerView *crs_CountryPicker;

- (IBAction)crs_SelectCountry:(id)sender;


- (IBAction)Crs_Back:(id)sender;

- (IBAction)Register_Action:(id)sender;
- (IBAction)Login_Action:(id)sender;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollForContent;
//@property (strong, nonatomic) IBOutlet UITextField *crs_CountryName;
//@property (strong, nonatomic) IBOutlet UITextField *crs_pincode;
@property (strong, nonatomic) IBOutlet UITextField *crs_FirstName;
@property (strong, nonatomic) IBOutlet UITextField *crs_LastName;
@property (strong, nonatomic) IBOutlet UITextField *crs_EmailId;
@property (strong, nonatomic) IBOutlet UITextField *crs_MobileNumber;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Adress;


//@property (strong, nonatomic) IBOutlet UITextField *crs_StdCode;
@property (strong, nonatomic) IBOutlet UITextField *crs_DateOfBirth;
@property (strong, nonatomic) IBOutlet UITextField *Crs_Gender;
@property (strong, nonatomic) IBOutlet UITextField *crs_CreateMPIn;
@property (strong, nonatomic) IBOutlet UITextField *crs_confirmMpin;
@property NSMutableURLRequest *loginURLRequest;
@property NSURLSessionConfiguration *loginURLSessionConfg;
@property NSURLSession *loginURLSession;
@property NSURLSessionDataTask *loginDataTask;
@property (strong, nonatomic) IBOutlet UILabel *crs_StdCodeFixedLabel;


// radio Buttons action Part

- (IBAction)Crs_Male_Action:(id)sender;


- (IBAction)Crs_Female_Action:(id)sender;

- (IBAction)Crs_other_Action:(id)sender;


/// Radio Buttons Outlet


@property (weak, nonatomic) IBOutlet UIButton *Crs_male;
@property (weak, nonatomic) IBOutlet UIButton *Crs_Female;

@property (strong, nonatomic) IBOutlet UILabel *crs_StdLabel;

@property (weak, nonatomic) IBOutlet UIButton *Crs_Other;
// Extra Fields Outlet
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Address2;



@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Nationality;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Country;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Address;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_County;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_city;

@property (strong, nonatomic) IBOutlet UIButton *crs_Registerout;


- (IBAction)crs_NationButton:(id)sender;



- (IBAction)crs_ClickOnConditions:(id)sender;



- (IBAction)crs_Hide:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *crs_HideOut;
@property (strong, nonatomic) IBOutlet UIView *crs_CountryTableViewView;

@property (strong, nonatomic) IBOutlet UITableView *crs_CountryTable;
- (IBAction)Crs_Remove_CountryView:(id)sender;



@property (strong, nonatomic) IBOutlet UIButton *crs_confirmHide;
- (IBAction)crs_ConfirmHideaction:(id)sender;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_referalCode;
// Given For Hiding and unhiding buttons when they are addded
- (IBAction)crs_AddressTwoButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *crs_AddressTwoDropDownImage;

- (IBAction)crs_AddressOneButton:(id)sender;


@property (strong, nonatomic) IBOutlet UIImageView *crs_AddressOneDropImage;
- (IBAction)crs_CityButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_CityButtonoutlet;



@property (strong, nonatomic) IBOutlet UIButton *crs_AddressoneButtonOutlet;

@property (strong, nonatomic) IBOutlet UIButton *crs_AddresstwoButtonOutlet;


- (IBAction)editChanged:(id)sender;


// For Isd problem

@property (strong, nonatomic) IBOutlet UIView *crs_countryView;


@property (strong, nonatomic) IBOutlet UIView *crs_DenmarkView;

@property (strong, nonatomic) IBOutlet UIScrollView *crs_ScrollContent1;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_idNumberfield;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_IdType;


@property (strong, nonatomic) IBOutlet UILabel *crs_Contentlabel;


@property (strong, nonatomic) IBOutlet UIImageView *crs_IdTypedropimage;


- (IBAction)crs_IdTypedata:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *crs_IdtypePlaceholderLabel;

@property (strong, nonatomic) IBOutlet UIButton *crs_IdtypeOutlet;
@property (strong, nonatomic) IBOutlet UIView *crs_FacebookView;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_facebookField;


- (IBAction)crs_facebookAction:(id)sender;

// check Out Buttons
- (IBAction)crs_CheckoutButton1:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_checkoutbutton1outlet;

- (IBAction)crs_checkout2button:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_checkout2buttonoutlet;



- (IBAction)Crs_SecondContentButton:(id)sender;
@property(nonatomic,strong)NSString * searchTextString;
@property (strong, nonatomic) IBOutlet UITextField *crs_search;

- (IBAction)crs_Cancel:(id)sender;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_OtherCountriesIdNumber;
@property (strong, nonatomic) IBOutlet UIView *crs_OtpView;
- (IBAction)crs_VerifyAction:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *Crs_Otp;
- (IBAction)crs_nation:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *OtpView;
- (IBAction)crs_OkOtp:(id)sender;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_PinNumber;

- (IBAction)TermsButton:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *crs_ClickOut;
@property (strong, nonatomic) IBOutlet UIButton *crs_TermsOut;
@property (strong, nonatomic) IBOutlet UILabel *Crs_HiddenLabel;

@end

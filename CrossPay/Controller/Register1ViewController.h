//
//  Register1ViewController.h
//  CrossPay
//
//  Created by sai kiran  on 12/6/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HoshiTextField.h"


@interface Register1ViewController : UIViewController<UITableViewDataSource,UITableViewDataSource>
{
    UIDatePicker *datePicker;
    
}


@property (strong, nonatomic) IBOutlet UITextField *crs_FirstName;
@property (strong, nonatomic) IBOutlet UITextField *crs_LastName;

@property(strong,nonatomic)IBOutlet UITextField *crs_MidddleName;

@property(strong,nonatomic)IBOutlet UITextField *crs_PostCode;

@property(strong,nonatomic)IBOutlet UITextField *crs_Address;


@property(strong,nonatomic)IBOutlet UITextField *crs_City;

@property (strong, nonatomic) IBOutlet UIButton *crs_CityOutlet;
- (IBAction)crs_CityAction:(id)sender;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_ReferalCode;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_DateObirth;


- (IBAction)crs_AddressButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_AddressOutlet;

@property (strong, nonatomic) IBOutlet UIView *crs_CountryView;
@property (strong, nonatomic) IBOutlet UITableView *crs_CountryTable;
@property (strong, nonatomic) IBOutlet UIScrollView *crs_scrollView;
- (IBAction)crs_Back:(id)sender;


@property (strong,nonatomic) NSString * ForUkRegister;

- (IBAction)crs_Nationality:(id)sender;
- (IBAction)crs_RegisterAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_RegisterOut;
@property (strong,nonatomic) NSString * MyCoustmerId;
@property (strong,nonatomic) NSString * MyCoustmerNumber;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_refferalCode;
@property (strong, nonatomic) IBOutlet UIView *crs_ThanksView;
- (IBAction)crs_OkAction:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *crs_Register1Out;
- (IBAction)crs_Register1Action:(id)sender;
@property (strong,nonatomic) NSString *verfiyMobileScreenCoustmerNumber;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_address2;
@property (strong, nonatomic) IBOutlet UIButton *crs_Address2;

- (IBAction)crs_address2Action:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *crs_NewCity;
- (IBAction)crs_NewCityAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_NewAddress2Outlet;

- (IBAction)crs_newAddress2Action:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *crs_Search;

@end



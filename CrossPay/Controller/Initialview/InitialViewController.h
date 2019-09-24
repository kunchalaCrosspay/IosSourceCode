//
//  InitialViewController.h
//  CrossPay
//
//  Created by aryvart3 on 28/07/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InitialViewController : UIViewController
- (IBAction)Display_Country_Popup:(id)sender;
- (IBAction)Register_Action:(id)sender;

- (IBAction)Login_Action:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *country_list_view;
@property (strong, nonatomic) IBOutlet UITableView *countryList_TableView;
@property (strong, nonatomic) IBOutlet UIImageView *crs_CountryImage1;
@property (strong, nonatomic) IBOutlet UIImageView *crs_CountryImage2;
@property (strong, nonatomic) IBOutlet UILabel *crs_CurrencyName;
@property (strong, nonatomic) IBOutlet UILabel *crs_CurrencyName1;
- (IBAction)crs_CountryListButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *crs_textfiled1;
@property (weak, nonatomic) IBOutlet UITextField *crs_texfiled2;
@property (weak, nonatomic) IBOutlet UITextField *crs_textfiled3;
@property (strong, nonatomic) IBOutlet UILabel *crs_RateLabel;



@property (strong, nonatomic) IBOutlet UIButton *crs_LoginOut;



@property (strong, nonatomic) IBOutlet UIButton *crs_RegisterOut;


@property (strong, nonatomic) IBOutlet UITextField *crs_search;

@property(nonatomic,strong)NSString * searchTextString;

@property (strong, nonatomic) IBOutlet UILabel *crs_noresultLabel;

@property (strong, nonatomic) IBOutlet UIView *crs_HideTheView;
- (IBAction)crs_Cancel:(id)sender;
- (IBAction)Crs_register1Action:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_Register1Out;

- (IBAction)crs_Login1Action:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_Login1Out;
- (IBAction)crs_Login1:(id)sender;
- (IBAction)crs_Login2:(id)sender;

@end

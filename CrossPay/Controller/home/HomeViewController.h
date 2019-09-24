//
//  HomeViewController.h
//  CrossPay
//
//  Created by Saikiran on 28/07/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UIAlertViewDelegate> 
- (IBAction)crs_ProceedAction:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *crs_CommisionChargeLabel;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activity;

@property (strong, nonatomic) IBOutlet UIView *crs_CountryListView;

@property (strong, nonatomic) IBOutlet UITableView *crs_CountryListTableView;


@property (strong, nonatomic) IBOutlet UITextField *crs_TextField;


@property (strong, nonatomic) IBOutlet UITextField *crs_TextField1;

@property (strong, nonatomic) IBOutlet UILabel *crs_CountryCode;


@property (strong, nonatomic) IBOutlet UILabel *crs_Countrycode1;

@property (strong, nonatomic) IBOutlet UIImageView *crs_CountryImage;



@property (strong, nonatomic) IBOutlet UIImageView *crs_CountryImage1;



@property (weak, nonatomic) IBOutlet UILabel *Crs_RateLabel;


- (IBAction)crs_SelectCountry:(id)sender;



- (IBAction)crs_SelectCountry1:(id)sender;

// view

@property (strong, nonatomic) IBOutlet UIButton *crs_ProceddOut;

@property (strong, nonatomic) IBOutlet UILabel *crs_cashComission;


@property (strong, nonatomic) IBOutlet UILabel *crs_KickLabelCommision;



@property (strong, nonatomic) IBOutlet UIView *crs_versionview;

- (IBAction)crs_UpdateVersion:(id)sender;



- (IBAction)crs_Remind:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_remindoutlet;
@property (strong, nonatomic) IBOutlet UIButton *crs_UpdateOutlet;
@property(nonatomic,strong)NSString * searchTextString;
@property (strong, nonatomic) IBOutlet UITextField *crs_search;
@property (strong, nonatomic) IBOutlet UILabel *crs_dateLabel;
@property (strong, nonatomic) IBOutlet UIView *crs_UpdateProfile;
- (IBAction)crs_Update:(id)sender;
@property (strong, nonatomic) NSString  *Crs_verifyBack;

@property (strong,nonatomic)NSString*Crs_EmailDisplayer;


@property (strong, nonatomic) IBOutlet UIButton *crs_CharityButtonout;
- (IBAction)crs_CharityAction:(id)sender;

- (IBAction)crs_HideUpdate:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *crs_Updateprofilelabel;
- (IBAction)Crs_GbButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_GbButtonOut;
@property (strong, nonatomic) IBOutlet UIButton *crs_GbUpdateOut;
- (IBAction)crs_skup:(id)sender;
@property (strong,nonatomic) NSString * RecieversHomeCountry;

- (IBAction)crs:(id)sender;

- (IBAction)crs_Close:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_Skipout1;

@property (strong, nonatomic) IBOutlet UIButton *crs_CancelOut;
- (IBAction)crs_cancelAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *crs_searchImage;
@property (strong, nonatomic) IBOutlet UIButton *crs_SourceCountryOut;
- (IBAction)crs_SourceAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_DestinationOut;
- (IBAction)crs_DestinationAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *line1;
@property (strong, nonatomic) IBOutlet UIButton *line2;
@property (strong, nonatomic) IBOutlet UITextField *crs_FirstField;
@property (strong, nonatomic) IBOutlet UITextField *crs_SecondField;
@property (strong, nonatomic) IBOutlet UILabel *crs_SelectSourceLabel;
@property (strong, nonatomic) IBOutlet UILabel *crs_SelectDestinationLabel;
@property (strong, nonatomic) IBOutlet UILabel *crs_Destination2;
@property (strong, nonatomic) IBOutlet UILabel *crs_Source2;

@end

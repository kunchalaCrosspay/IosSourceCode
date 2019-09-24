//
//  CharityPayViewController.h
//  CrossPay
//
//  Created by sai kiran  on 8/20/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "ViewController.h"
#import "HoshiTextField.h"
@interface CharityPayViewController : ViewController


@property (strong, nonatomic) IBOutlet UIScrollView *crs_CharityScroll;


@property (strong, nonatomic) IBOutlet UIButton *crs_ProceedToPay;

- (IBAction)crs_ProceedAction:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *crs_Homeoutlet;

- (IBAction)crs_HomeAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_HistoryOutLet;

- (IBAction)crs_HIstoryAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_FavoriteOutlet;
- (IBAction)crs_FavoriteAction:(id)sender;

- (IBAction)crs_Back:(id)sender;


- (IBAction)crs_CharityTableHider:(id)sender;
//
//@property (strong, nonatomic) IBOutlet UILabel *crs_Charityname;
//@property (strong, nonatomic) IBOutlet UILabel *crs_ReasonForDonation;
- (IBAction)crs_DonationButton:(id)sender;
- (IBAction)crs_CharityNameButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_creditCardOutlet;
- (IBAction)crs_creditCardAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_DebitCardoutlet;
- (IBAction)crs_Debitcard:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *crs_Charityview;
@property (strong, nonatomic) IBOutlet UITableView *crs_CharityTableView;
- (IBAction)crs_ViewHider:(id)sender;
@property(nonatomic,strong)NSString * searchTextString;


- (IBAction)crs_CharityButtonActionForHiding:(id)sender;

- (IBAction)crs_Checkout1Action:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *crs_Checkout1;

@property (strong, nonatomic) IBOutlet UIButton *crs_Checkout2out;
- (IBAction)crs_Checkout2Action:(id)sender;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_DonationAmount;

- (IBAction)crs_CreditExtraAction:(id)sender;

- (IBAction)crs_DebitCardExraAction:(id)sender;

- (IBAction)crs_UkGiftAidButton:(id)sender;

- (IBAction)crs_PrivacyButton:(id)sender;
- (IBAction)crs_Privacybutton:(id)sender;
- (IBAction)crs_TermsButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *checkOut3;
- (IBAction)crs_Checkout3Action:(id)sender;

@property (strong, nonatomic) NSMutableDictionary *crs_HistoryDetails;


- (IBAction)crs_ExtraCheckout1:(id)sender;


- (IBAction)crs_ExtraCheckout2:(id)sender;


@property (strong, nonatomic) IBOutlet UITextField *crs_ReasonForDonation;


@property (strong, nonatomic) IBOutlet UITextField *crs_Charityname;

@property (strong, nonatomic) IBOutlet UITextField *crs_Search;
@property (strong, nonatomic) IBOutlet UILabel *crs_NoResultsLabel;
@property (strong, nonatomic) IBOutlet UIImageView *crs_NoResultsImage;

@end

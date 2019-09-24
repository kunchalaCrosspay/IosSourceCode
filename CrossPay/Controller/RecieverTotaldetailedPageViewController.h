//
//  RecieverTotaldetailedPageViewController.h
//  CrossPay
//
//  Created by sai kiran  on 8/24/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HoshiTextField.h"
@interface RecieverTotaldetailedPageViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *crs_RecieverdetailsScrollView;

- (IBAction)crs_Back:(id)sender;

@property (strong, nonatomic) NSMutableArray *crs_recieverProfileDetails;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_FirstName;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_BankaccountNimber;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_LastName;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Branch;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Ifsc;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_PostCode;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Gender;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_BankBranch;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_DateOfBirth;

@property (strong, nonatomic) IBOutlet HoshiTextField *Crs_IfscField;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_EmailId;
- (IBAction)crs_Notification:(id)sender;
- (IBAction)crs_Settings:(id)sender;

- (IBAction)crs_History:(id)sender;

- (IBAction)crs_Profile:(id)sender;


- (IBAction)crs_Back:(id)sender;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_ReciverAccountNumber;
@property (strong, nonatomic) IBOutlet UILabel *crs_ReciversIfsc;


- (IBAction)crs_Home:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *crs_BankName;
@property (strong, nonatomic) IBOutlet UILabel *crs_AccountNum;

@property (strong, nonatomic) IBOutlet UILabel *crs_pakDate;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_pakDateOfBirhField;
@property (strong, nonatomic) IBOutlet UILabel *crs_FirstNamePlaceHolder;


@end


//
//  UpdateProfileViewController.h
//  Payment
//
//  Created by Saikiran on 8/12/17.
//  Copyright © 2017 Crosspay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HoshiTextField.h"
@interface UpdateProfileViewController : UIViewController
{
    UIImagePickerController *Imagepicker;
}
@property (strong, nonatomic) IBOutlet UIButton *Crs_Aboutme;
@property (strong, nonatomic) IBOutlet UIButton *Crs_Receivers;
@property (strong, nonatomic) IBOutlet UILabel *Crs_Lbl_aboutme_bgcolor;
@property (strong, nonatomic) IBOutlet UILabel *Crs_Lbl_recivers_bgcolor;
@property (strong, nonatomic) IBOutlet UIImageView *Crs_Profile;
- (IBAction)Crs_aboutme_Action:(id)sender;
- (IBAction)Crs_Recivers_Action:(id)sender;
- (IBAction)Crs_Opencamera:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *Crs_view_aboutme;
@property (strong, nonatomic) IBOutlet UIView *Crs_view_receiver;
@property (strong, nonatomic) IBOutlet UIScrollView *Crs_Scrollview;
- (IBAction)crs_OkZction:(id)sender;


- (IBAction)crs_BackAction:(id)sender;


- (IBAction)settings:(id)sender;

- (IBAction)crs_Notification:(id)sender;

- (IBAction)crs_Home:(id)sender;

- (IBAction)crs_History:(id)sender;

- (IBAction)crs_Profile:(id)sender;


// Navigation to Update profile

- (IBAction)crs_UpdateProfile:(id)sender;


// navigation to Add recievers
- (IBAction)crs_AddReciever:(id)sender;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_FirstName;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_MiddleName;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_LastName;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Email;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_PhoneNumber;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_MobileNumber;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Gender;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_DateOfBirth;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Country;

@property (strong, nonatomic) IBOutlet HoshiTextField *rs_Nationality;



@property (strong, nonatomic) IBOutlet HoshiTextField *crs_state;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_City;



@property (strong, nonatomic) IBOutlet HoshiTextField *crs_IdProofType;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_IssuedBy;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_IssuedDate;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_ExpireDtae;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Address2;



@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Adress1;





@property (strong, nonatomic) IBOutlet HoshiTextField *crs_ZipCode;


@property (weak, nonatomic) IBOutlet UITableView *Crs_tableview_Addreciver;

//Profile Pic Names


@property (strong,nonatomic) NSMutableArray * crs_ProfileDetails;

@property (strong, nonatomic) IBOutlet UILabel *crs_ProfileViewName;


@property (strong, nonatomic) IBOutlet UILabel *crs_ProfileViewCountry;


@property (strong, nonatomic) IBOutlet UILabel *crs_ProfileViewEmailId;


@property (strong, nonatomic) IBOutlet UIView *crs_AlertView;

@property (strong, nonatomic) IBOutlet UIView *Crs_UpdateAlert;

- (IBAction)crs_OkActionForUpdate:(id)sender;
- (IBAction)crs_CallMe:(id)sender;
- (IBAction)crs_EmailClick:(id)sender;

- (IBAction)crs_Closeaction:(id)sender;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_IdNumber;
@property (strong, nonatomic) IBOutlet UILabel *crs_Idnumber;
@property (strong, nonatomic) IBOutlet UIButton *crs_UpdateprofileButtonOutlet;
@property (strong, nonatomic) IBOutlet UIButton *crs_AddRecieverButtonOutlet;
@property (strong, nonatomic) IBOutlet UIButton *crs_HistoryButtonoutlet;
@property (strong, nonatomic) IBOutlet UILabel *crs_HistoryLabel;
@property (strong, nonatomic) IBOutlet UIButton *crs_ProfileBottomOutlet;
@property (strong, nonatomic) IBOutlet UILabel *crs_ProfileLabel;

@end

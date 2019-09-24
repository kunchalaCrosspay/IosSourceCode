


//
//  VerifyMobileScreen.h
//  CrossPay
//
//  Created by sai kiran  on 7/31/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HoshiTextField.h"
@interface VerifyMobileScreen : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *crs_VerifyMobileNumberField;
- (IBAction)crs_VerifyMobilSction:(id)sender;
//  OtP Page outlets


@property (strong, nonatomic) IBOutlet UIView *crs_OtpView;
@property (strong, nonatomic) IBOutlet UITextField *crs_EnterOtpField;
- (IBAction)crs_VerifyActio:(id)sender;

- (IBAction)crs_ResendOtpAvtion:(id)sender;

- (IBAction)crsNewUserAcount:(id)sender;
- (IBAction)crs_BackButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_VerifyOutlet;
@property (strong, nonatomic) IBOutlet UIButton *crs_VerifyGreen;
//@property (strong, nonatomic) IBOutlet HoshiTextField *crs_VerifyField;
@property(strong,nonatomic)NSString * crsVerifiaction;
@property(strong,nonatomic)NSString * crs_emailVerifiaction;
@property(strong,nonatomic)NSString * ForOtp;
@property (strong, nonatomic) IBOutlet UIView *crs_Home;
@property (strong, nonatomic) IBOutlet UIButton *crs_OkOut;
- (IBAction)crs_OkAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *crs_VerifyOtpView;

- (IBAction)Crs_VerifyOTPButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_VerifyOtpOkHome;

- (IBAction)crs_OkHomeAction:(id)sender;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_OtpVerifyField;

@property (strong, nonatomic) IBOutlet UIButton *Crs_OtpNewOut;

- (IBAction)crs_OtpAction:(id)sender;

@end

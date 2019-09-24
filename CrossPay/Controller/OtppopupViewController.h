//
//  OtppopupViewController.h
//  CrossPay
//
//  Created by aryvart3 on 02/08/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HoshiTextField.h"
@interface OtppopupViewController : UIViewController

- (IBAction)Crs_verify_otp:(id)sender;
@property(strong,nonatomic)NSString * otpvalue;
@property(strong,nonatomic)NSString * mobileNumber;
@property(strong,nonatomic)NSString * crsVerifiaction;
@property(strong,nonatomic)NSString * crs_emailVerifiaction;
@property(strong,nonatomic)NSString * ForOtp;

@property (strong, nonatomic) IBOutlet UIView *crs_verifiactionvew;



- (IBAction)crs_Ok:(id)sender;



@property (strong, nonatomic) IBOutlet UIButton *crs_VerifyOut;




@property (strong, nonatomic) IBOutlet UIView *crs_otpView;

- (IBAction)crs_OkAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *ccrs_okOut;

@property (strong, nonatomic) IBOutlet UIView *crs_HomeView;
@property(strong,nonatomic)NSString * ForVerifyMobile;
@property(strong,nonatomic)NSString * ForVerifyemail;

@property(strong,nonatomic)NSString * ForVerifOtp;
@property (strong, nonatomic) IBOutlet HoshiTextField *Crs_otpvalue;

@property(strong,nonatomic)NSString * RegisterCountry;
@property(strong,nonatomic)NSString * RegisterCountryCoustmerNumber;
@end

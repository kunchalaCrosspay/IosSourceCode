//
//  forgot_mpinViewController.h
//  Payment
//
//  Created by WELCOME on 7/30/17.
//  Copyright © 2017 WELCOME. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface forgot_mpinViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *Email;
@property (strong, nonatomic) IBOutlet UIButton *Email_radio_btn;
@property (strong, nonatomic) IBOutlet UIButton *Mobile_radio_btn;
- (IBAction)Email_Rd_Act:(id)sender;
- (IBAction)Mobile_Rd_Act:(id)sender;
- (IBAction)Forgot_btn_Act:(id)sender;
- (IBAction)Remove_superview:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *Crs_phonenumber;
@property (strong, nonatomic) IBOutlet UILabel *crs_forgotmobile;
@property (strong, nonatomic) IBOutlet UIButton *crs_SendOut;
@property (strong, nonatomic) IBOutlet UILabel *crs_forgotemail;
@property (strong,nonatomic) NSString * EmailAndMobileDisplayer;
@property (strong,nonatomic) NSString * EmailLabel;
@property (strong,nonatomic) NSString * mobileLabel;
@property (strong,nonatomic) NSString * ForgotEmailLabel;
@property (strong,nonatomic) NSString * ForgotmobileLabel;
@end

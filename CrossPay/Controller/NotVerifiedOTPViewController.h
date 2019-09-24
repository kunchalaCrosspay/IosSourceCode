//
//  NotVerifiedOTPViewController.h
//  CrossPay
//
//  Created by sai kiran  on 8/23/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotVerifiedOTPViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *crs_OtpView;
@property (strong, nonatomic) IBOutlet UITextField *crs_OtpField;
@property (strong, nonatomic) IBOutlet UIButton *crs_VerifyOut;
- (IBAction)crs_VerifyAction:(id)sender;
@property(strong,nonatomic)NSString * otpvalue;
@property(strong,nonatomic)NSString * mobileNumber;
@property(strong,nonatomic)NSString * crsVerifiaction;
@property(strong,nonatomic)NSString * crs_emailVerifiaction;
@property(strong,nonatomic)NSString * ForOtp;
@property (strong, nonatomic) NSString  *Crs_EmailDisplayer;

@end

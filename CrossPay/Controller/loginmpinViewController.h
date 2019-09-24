//
//  loginmpinViewController.h
//  Payment
//
//  Created by saikiran kunchala on 7/29/17.
//  Copyright © 2017saikiran kunchala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginmpinViewController : UIViewController <UITextFieldDelegate,UIKeyInput>
@property (strong, nonatomic) IBOutlet UITextField *pin1;
@property (strong, nonatomic) IBOutlet UITextField *pin2;
@property (strong, nonatomic) IBOutlet UITextField *pin3;
@property (strong, nonatomic) IBOutlet UITextField *pin4;
- (IBAction)Forgot_mpin:(id)sender;
- (IBAction)Login_Action:(id)sender;
- (IBAction)New_user_account:(id)sender;


- (IBAction)crs_backAction:(id)sender;


@property (strong, nonatomic) IBOutlet UILabel *crs_EnterMpinMobile;
@property (strong, nonatomic) IBOutlet UIButton *crs_MpinOut;
@property (strong, nonatomic) IBOutlet UIView *crs_MpinViewer;

@property (strong, nonatomic) IBOutlet UILabel *Crs_MpinDisplayer;

@property (strong, nonatomic) NSString  *Crs_EmailDisplayer;

- (IBAction)crs_ChangeUser:(id)sender;

@property (strong, nonatomic) NSString  *Crs_verifyBack;
@property (strong, nonatomic) IBOutlet UIView *crs_versionView;
- (IBAction)crs_Update:(id)sender;
@property (strong, nonatomic) NSString  *Crs_FirstName;
- (IBAction)Crs_FingerPrintLogin:(id)sender;
@property (strong, nonatomic) NSString  *MyMobileNumber;
@end

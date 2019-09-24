//
//  ReferalViewController.h
//  CrossPay
//
//  Created by sai kiran  on 2/17/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "ViewController.h"

@interface ReferalViewController : ViewController

// Back buttons


@property (strong, nonatomic) IBOutlet UILabel *crs_Referencelabel;


- (IBAction)crs_ReferBack:(id)sender;

- (IBAction)crs_invite:(id)sender;


@property (strong, nonatomic) IBOutlet UILabel *crs_HideTheLabel;

@property (strong, nonatomic) IBOutlet UILabel *crs_ReferalDispalyer;
@property (strong, nonatomic) IBOutlet UIButton *crs_InvitefriendLabel;
@property (strong, nonatomic) IBOutlet UIButton *crs_Invitebutton;

@property (strong, nonatomic) IBOutlet UIView *crs_HideTheView;

@property (strong, nonatomic) IBOutlet UIView *crs_MainView;
@property (strong, nonatomic) IBOutlet UILabel *crs_FreeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *crs_ReferIamge;
@property (strong, nonatomic) IBOutlet UILabel *crs_referLabelHeading;
@property (strong,nonatomic)NSString * referalCode;
@property (strong,nonatomic)NSString * referalstatus;
@property (strong,nonatomic)NSString * ReferalCountry;


- (IBAction)crs_TermsAndConditionsButton:(id)sender;










@end

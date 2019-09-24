//
//  SettingsViewController.h
//  CrossPay
//
//  Created by sai kiran  on 8/24/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HoshiTextField.h"
@interface SettingsViewController : UIViewController


- (IBAction)crs_ChangeMPIN:(id)sender;

- (IBAction)crs_Back:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_DoneOut;



@property (strong, nonatomic) IBOutlet UIView *crs_ChangeMpinView;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_CreateMpin;



@property (strong, nonatomic) IBOutlet HoshiTextField *crs_ConfirmMpin;

- (IBAction)crs_Conform:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *crs_Conformfield;


- (IBAction)crs_Profile:(id)sender;


- (IBAction)crs_settings:(id)sender;

- (IBAction)crs_History:(id)sender;

- (IBAction)crs_Notification:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *crs_ConformMPIN;


- (IBAction)cts_Home:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *crs_HistoryOutlet;


@property (strong, nonatomic) IBOutlet UILabel *crs_HistoryLabel;

@property (strong, nonatomic) IBOutlet UIButton *crs_ProfileOutlet;


@property (strong, nonatomic) IBOutlet UILabel *crs_profileLbel;









@property (strong, nonatomic) IBOutlet UIButton *crs_ChangeMpinOur;

@property (strong, nonatomic) IBOutlet UIScrollView *crs_ScrollView;




@end

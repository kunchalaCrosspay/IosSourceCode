
//
//  supportViewController.h
//  Payment
//
//  Created by WELCOME on 9/4/17.
//  Copyright © 2017 WELCOME. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HoshiTextField.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
@interface supportViewController : UIViewController<MFMailComposeViewControllerDelegate>{
    
    MFMailComposeViewController *mailComposer;
}
@property (strong, nonatomic) NSMutableArray *expandedCells;
@property (strong, nonatomic) IBOutlet UITableView *Crs_tablview_expanded;


@property (strong, nonatomic) IBOutlet UIView *Crs_contact_view;


@property (strong, nonatomic) IBOutlet UIView *crs_Faq_view;

@property (strong, nonatomic) IBOutlet UIButton *crs_btn_Faq;

@property (strong, nonatomic) IBOutlet UILabel *crs_border_faq;

@property (strong, nonatomic) IBOutlet UIButton *crs_contact_btn;
@property (strong, nonatomic) IBOutlet UILabel *Crs_border_contact;
- (IBAction)crs_Btn_Action_Faq:(id)sender;

- (IBAction)Crs_Btn_Action_contact:(id)sender;
@property (strong, nonatomic) IBOutlet UIScrollView *crs_ScrollForContact;



- (IBAction)crs_Home:(id)sender;

- (IBAction)crs_History:(id)sender;

- (IBAction)crs_Notifications:(id)sender;

- (IBAction)crs_Profile:(id)sender;

- (IBAction)crs_Settings:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *crs_EmailField;


- (IBAction)crs_Back:(id)sender;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Messgae;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_FirstName;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_emailId;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_subject;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_PhoneNumber;


- (IBAction)crs_EmailContact:(id)sender;

- (IBAction)crs_callUs:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_HistoryOutlet;

@property (strong, nonatomic) IBOutlet UILabel *crs_HistoryLabel;

@property (strong, nonatomic) IBOutlet UIButton *crs_profileOutlet;
@property (strong, nonatomic) IBOutlet UILabel *crs_ProfileLabel;


@end

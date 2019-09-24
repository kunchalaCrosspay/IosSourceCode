//
//  HistoryViewController.h
//  Payment
//
//  Created by saikiran kunchala on 7/29/17.
//  Copyright © 2017 saikiran kunchala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryViewController : UIViewController
- (IBAction)back_Action:(id)sender;
/// Tab bar navigation

@property (strong, nonatomic) IBOutlet UITextField *crs;


@property (strong, nonatomic) IBOutlet UITableView *crs_historyTable;
@property(nonatomic,strong)NSString * searchTextString;

- (IBAction)crs_HomeAction:(id)sender;


- (IBAction)crs_ProfileAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_ProfileAction;


- (IBAction)crs_NotificationAction:(id)sender;


- (IBAction)crs_SettingsAction:(id)sender;



- (IBAction)Crs_Home_Action:(id)sender;

- (IBAction)Crs_History_Action:(id)sender;

- (IBAction)Crs_Profile_Action:(id)sender;
- (IBAction)Crs_Notification_Action:(id)sender;
- (IBAction)Crs_Setting_Action:(id)sender;
- (IBAction)Crs_BackAction:(id)sender;

- (IBAction)crs_BackHistory:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *crs_HistoryImage;

@property (strong, nonatomic) IBOutlet UIImageView *crs_Image;

@property (strong,nonatomic) NSString * crs_BackToHome;
@property (strong,nonatomic) NSString * crs_BackToHome1;


- (IBAction)crs_back:(id)sender;














@end

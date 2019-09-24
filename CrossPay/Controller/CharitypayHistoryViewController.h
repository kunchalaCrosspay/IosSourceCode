//
//  CharitypayHistoryViewController.h
//  CrossPay
//
//  Created by sai kiran  on 8/20/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "ViewController.h"

@interface CharitypayHistoryViewController : ViewController
@property (strong, nonatomic) IBOutlet UITableView *crs_historyTable;

@property (strong, nonatomic) IBOutlet UIButton *crs_History;

- (IBAction)crs_HistoryAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_Home;
- (IBAction)crs_HomeAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_Favorite;
- (IBAction)crs_FavoriteAction:(id)sender;


- (IBAction)crs_Back:(id)sender;

@property (strong,nonatomic) NSString * crs_BackToHome;
@end

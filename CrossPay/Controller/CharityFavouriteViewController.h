//
//  CharityFavouriteViewController.h
//  CrossPay
//
//  Created by sai kiran  on 8/21/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharityFavouriteViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *crs_historyTable;

@property (strong, nonatomic) IBOutlet UIButton *crs_Homeout;


- (IBAction)crs_HomeAction:(id)sender;



@property (strong, nonatomic) IBOutlet UIButton *crs_Historyout;


- (IBAction)crs_HistoryAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_FavouriteOut;
- (IBAction)crs_favouriteAction:(id)sender;
- (IBAction)crs_Back:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_FavourButton;

@end

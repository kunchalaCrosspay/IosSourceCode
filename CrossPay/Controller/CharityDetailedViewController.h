//
//  CharityDetailedViewController.h
//  CrossPay
//
//  Created by sai kiran  on 9/3/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharityDetailedViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *crs_CharityNameLabel;
@property (strong, nonatomic) NSMutableDictionary *crs_HistoryDetails;

@property (strong, nonatomic) IBOutlet UILabel *crs_CoustmerNumber;


@property (strong, nonatomic) IBOutlet UILabel *crs_DonationAmount;

@property (strong, nonatomic) IBOutlet UILabel *crs_Paidwity;
- (IBAction)crs_Add:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_AddOut;

- (IBAction)crs_Back:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *crs_TransactioNumber;
@property (strong, nonatomic) IBOutlet UILabel *crs_FavaoriteLabel;
@property (strong, nonatomic) IBOutlet UIButton *crs_AddedFavorite;
- (IBAction)crs_Favourite:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *crs_Image1;
@property (strong, nonatomic) IBOutlet UIButton *crs_UnFav;
- (IBAction)crs_unFavAction:(id)sender;
- (IBAction)crs_UnFavr:(id)sender;

@end

//
//  FavouriteTableViewCell.h
//  CrossPay
//
//  Created by sai kiran  on 8/21/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavouriteTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *crs_NameLabel;
@property (strong, nonatomic) IBOutlet UILabel *crs_DateLabel;
- (IBAction)crs_UnFavarite:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *Crs_amount;
@property (strong, nonatomic) IBOutlet UIButton *crs_UnFavroiteOut;

@end

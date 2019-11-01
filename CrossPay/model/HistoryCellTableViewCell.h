//
//  HistoryCellTableViewCell.h
//  CrossPay
//
//  Created by sai kiran  on 10/16/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryCellTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *Crs_AccountNumber;
@property (strong, nonatomic) IBOutlet UILabel *crs_Name;
@property (strong, nonatomic) IBOutlet UILabel *crs_Country;
@property (strong, nonatomic) IBOutlet UIImageView *crs_HistoryImage;
@property (strong, nonatomic) IBOutlet UIButton *crs_ColorChanger;

@end

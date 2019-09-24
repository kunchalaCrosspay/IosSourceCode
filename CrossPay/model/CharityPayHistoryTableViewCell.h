//
//  CharityPayHistoryTableViewCell.h
//  CrossPay
//
//  Created by sai kiran  on 8/20/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharityPayHistoryTableViewCell : UITableViewCell





@property (strong, nonatomic) IBOutlet UILabel *crs_NameLabel;

@property (strong, nonatomic) IBOutlet UILabel *crs_PayeeAmount;
@property (strong, nonatomic) IBOutlet UILabel *crs_DateLabel;
@property (strong, nonatomic) IBOutlet UIButton *crs_ColorChanger;

@end

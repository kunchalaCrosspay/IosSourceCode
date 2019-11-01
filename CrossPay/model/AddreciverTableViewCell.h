//
//  AddreciverTableViewCell.h
//  CrossPay
//
//  Created by saiKiran on 17/08/17.
//  Copyright © 2017 CrossPay. All rights reserved.


#import <UIKit/UIKit.h>

@interface AddreciverTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Crs_name;
@property (weak, nonatomic) IBOutlet UILabel *Crs_Account_no;
@property (weak, nonatomic) IBOutlet UILabel *Crs_Date;


@property (strong, nonatomic) IBOutlet UILabel *crs_NameLabel;


@property (strong, nonatomic) IBOutlet UILabel *crs_AccountLabel;


@property (strong, nonatomic) IBOutlet UIButton *crs_UpdateAction;

@property (strong, nonatomic) IBOutlet UIButton *crs_Disable;

@property (strong, nonatomic) IBOutlet UIButton *crs_select;

@property (strong, nonatomic) IBOutlet UIImageView *crs_CheckMark;
@property (strong, nonatomic) IBOutlet UIButton *crs_SelectMark;

@property (strong, nonatomic) IBOutlet UIImageView *crs_SelectRecieverImage;
@property (strong, nonatomic) IBOutlet UIImageView *crs_AddRecieverIamge;
@property (strong, nonatomic) IBOutlet UILabel *crs_Lbl_CountryName;

//select reciver country name
@property (weak, nonatomic) IBOutlet UILabel *Crs_Lbl_Countryname;

@property (weak, nonatomic) IBOutlet UILabel *crs_lbl_countryname;

@property (strong, nonatomic) IBOutlet UIButton *crs_Updateout;




@end

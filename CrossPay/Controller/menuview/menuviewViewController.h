//
//  menuviewViewController.h
//  Payment
//
//  Created by saikiran kunchala on 7/15/17.
//  Copyright © 2017 saikiran kunchala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface menuviewViewController : UIViewController

- (IBAction)Removemenu_Action:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *crs_UserName;

@property (strong, nonatomic) IBOutlet UILabel *crs_UserEmailId;

@property (strong, nonatomic) IBOutlet UIImageView *crs_profileImage;

@property (strong, nonatomic) IBOutlet UIView *crs_MenyView;

@property(nonatomic,strong) NSMutableArray *Ary_Array_MenuItems;
@property(nonatomic,strong) NSString * MyUserId;
@end

//
//  NewHomeViewController.h
//  CrossPay
//
//  Created by sai kiran  on 1/9/19.
//  Copyright © 2019 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface NewHomeViewController : UIViewController
- (IBAction)Crs_CharityAction:(id)sender;
- (IBAction)crs_HomeAction:(id)sender;

- (IBAction)crs_menuAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_CharityOut;
@property (strong, nonatomic) IBOutlet UIImageView *crs_CharityImage;
@property(strong,nonatomic)NSString * MyUserId;
@end



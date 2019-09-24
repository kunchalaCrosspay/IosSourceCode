//
//  LoginViewController.h
//  Payment
//
//  Created bysaikiran kunchala on 7/23/17.
//  Copyright © 2017 saikiran kunchala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *myTextField;
@property (strong, nonatomic) IBOutlet UIButton *Login_Action;
- (IBAction)login:(id)sender;

- (IBAction)Register_Action:(id)sender;

@end

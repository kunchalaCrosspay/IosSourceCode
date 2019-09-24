//
//  LoginViewController.m
//  Payment
//
//  Created by saikiran kunchala on 7/23/17.
//  Copyright © 2017 WELCOME. All rights reserved.
//

#import "LoginViewController.h"
#import "menuviewViewController.h"
#import "ViewController.h"
#import "HomeViewController.h"
#import "registerViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.myTextField setValue:[UIColor whiteColor]
                    forKeyPath:@"_placeholderLabel.textColor"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)login:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)Register_Action:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    registerViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"RegisterViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}
@end


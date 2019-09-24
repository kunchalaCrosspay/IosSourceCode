//
//  RecieverTotaldetailedPageViewController.m
//  CrossPay
//
//  Created by sai kiran  on 8/24/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import "RecieverTotaldetailedPageViewController.h"
#import "UpdateProfile.h"
#import "HomeViewController.h"
#import "HistoryViewController.h"
#import "notificationViewController.h"
#import "Crs_sharedvariable.h"
#import "UpdateProfile.h"
#import "SelectRecieverViewController.h"
#import "SettingsViewController.h"
#import "crs_sharedmethods.h"
//#import <Google/Analytics.h>
@interface RecieverTotaldetailedPageViewController ()
{
    NSString * Name;
    
    
}
@end

@implementation RecieverTotaldetailedPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.crs_RecieverdetailsScrollView.contentSize = CGSizeMake(self.view.frame.size.width-30, 470);
    
    self.crs_FirstName.textColor = [UIColor whiteColor];
    self.crs_DateOfBirth.textColor = [UIColor whiteColor];
    self.crs_LastName.textColor = [UIColor whiteColor];
    self.crs_PostCode.textColor = [UIColor whiteColor];
    self.crs_Gender.textColor = [UIColor whiteColor];
    self.crs_Ifsc.textColor = [UIColor whiteColor];
    self.crs_PostCode.textColor = [UIColor whiteColor];
    self.crs_Branch.textColor = [UIColor whiteColor];
    self.crs_EmailId.textColor = [UIColor whiteColor];
    self.crs_BankaccountNimber.textColor  = [UIColor whiteColor];
    self.crs_BankaccountNimber.textColor = [UIColor whiteColor];
    self.crs_BankBranch.textColor =[UIColor whiteColor];
    self.Crs_IfscField.textColor = [UIColor whiteColor];
//    "account_num" = 789789777;
//                                  bankType = 1;
//    "bank_name" = "Hyderabad ";
//                                   "beneficiary_no" = 2;
//    country = India;
//    "first_name" = Sai;
//    gender = male;
//    "last_name" = "Kunchala ";
//    "middle_name" = "kiran ";
//    "phone_num" = 9959944273;
//    pincode = 502319;
//    
    
    
    
    
    Name =  [self.crs_recieverProfileDetails valueForKey:@"entitytype"];
    
    if ([Name isEqualToString:@"I"]) {
        
        self.crs_FirstNamePlaceHolder.text = @"First Name";
        
    }
    else {
        
        self.crs_FirstNamePlaceHolder.text = @"Entity Name";
        
    }
    
    
    
    NSLog(@"%@",self.crs_recieverProfileDetails);
    NSString * AccountNumber  = [self.crs_recieverProfileDetails valueForKey:@"account_num"];
    NSString * countryName = [self.crs_recieverProfileDetails valueForKey:@"country"];
    
    if ([AccountNumber isEqualToString:@"null"]||[AccountNumber isEqualToString:@""]||[AccountNumber length] == 0) {
        NSLog(@"cashPay , Rambo");
        
        
        
        if ([[self.crs_recieverProfileDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]) {
            
            NSString *str = [self.crs_recieverProfileDetails valueForKey:@"city"];
            
            NSArray * arr = [str componentsSeparatedByString:@"EWAY"];
            
          self.crs_BankBranch.text  = [arr objectAtIndex:1];;
            
            
            
        }
        else{
            
            @try {
                self.crs_BankBranch.text = [self.crs_recieverProfileDetails valueForKey:@"city"];
            }
            @catch (NSException * e) {
                NSLog(@"Exception: %@", e);
            }
            @finally {
                NSLog(@"finally");
            }
            
           

            
            
        }
        
        
        
        
        
        
        
        

        self.crs_ReciversIfsc.hidden = YES;
        self.Crs_IfscField.hidden = YES;
       
        self.crs_ReciverAccountNumber.hidden = YES;
        self.crs_ReciversIfsc.hidden = YES;
//        self.crs_AccountNum.hidden = YES;
//        self.crs_BankaccountNimber.hidden = YES;
        self.crs_AccountNum.text = @"Service Type";
        self.crs_BankaccountNimber.text = @"Cash Pick-Up";
        
        
        self.crs_BankName.text = @"City";
        
    }
    else{
        
        if ([countryName isEqualToString:@"INDIA"]) {
            self.crs_ReciversIfsc.hidden = YES;
            self.Crs_IfscField.hidden = YES;
            self.crs_ReciverAccountNumber.hidden = YES;
            self.crs_ReciversIfsc.hidden = YES;
            self.crs_BankaccountNimber.hidden = YES;
            self.crs_AccountNum.hidden = YES;
        }

        else if ([countryName isEqualToString:@"PHILIPPINES"]){
            self.crs_ReciversIfsc.hidden = YES;
            self.Crs_IfscField.hidden = YES;
            self.crs_ReciverAccountNumber.hidden = YES;
            self.crs_ReciversIfsc.hidden = YES;

            self.crs_BankaccountNimber.hidden = YES;
            self.crs_AccountNum.hidden = YES;

        }
        else if ([countryName isEqualToString:@"UNITED STATES"]){

            self.crs_ReciversIfsc.hidden = YES;
            self.Crs_IfscField.hidden = YES;
            self.crs_ReciverAccountNumber.hidden = YES;
            self.crs_ReciversIfsc.hidden = YES;
            self.crs_BankaccountNimber.hidden = YES;
            self.crs_AccountNum.hidden = YES;
      }
        else if ([countryName isEqualToString:@"AUSTRALIA"]){
            
            self.crs_ReciversIfsc.hidden = YES;
            self.Crs_IfscField.hidden = YES;
            self.crs_ReciverAccountNumber.hidden = YES;
            self.crs_ReciversIfsc.hidden = YES;
            self.crs_BankaccountNimber.hidden = YES;
            self.crs_AccountNum.hidden = YES;
        }
    if ([countryName isEqualToString:@"PAKISTAN"]){

//
//
//            self.crs_AccountNum.text = @"Date Of Birth";
//            self.crs_ReciversIfsc.text = @"Account Number";
//            self.crs_BankName.text = @"SWIFT CODE";
        self.crs_ReciversIfsc.hidden = YES;
        self.Crs_IfscField.hidden = YES;
        
        self.crs_ReciverAccountNumber.hidden = YES;
        self.crs_ReciversIfsc.hidden = YES;
        
        NSString *dateString = [self.crs_recieverProfileDetails valueForKey:@"dob"];
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy-MM-dd"];
        NSDate *date = [format dateFromString:dateString];
        [format setDateFormat:@"MM-dd-yyyy"];
        NSString* finalDateString = [format stringFromDate:date];

        
        
        
        self.crs_BankBranch.text = finalDateString;
  self.crs_BankName.text = @"Date Of Birth";

         self.crs_AccountNum.text = @"Service Type";
         self.crs_BankaccountNimber.text = @"Account Credit";
         


        }
        
        
        
        
        else {
            self.crs_ReciverAccountNumber.hidden = YES;
            self.crs_ReciversIfsc.hidden = YES;
            self.crs_BankBranch.text = @"Account Credit";
            self.crs_BankName.text = @"Service Type";
            self.crs_ReciversIfsc.hidden = YES;
            self.Crs_IfscField.hidden = YES;
            
            self.crs_BankaccountNimber.hidden = YES;
            self.crs_AccountNum.hidden = YES;
            
//
//            self.crs_AccountNum.text = @" IBAN / Account Number";
//            self.crs_ReciversIfsc.text = @"IFSC";
//            self.crs_BankName.text = @"Bank Name";
//            self.Crs_IfscField.hidden = YES;
//            self.crs_ReciversIfsc.hidden = YES;
            
            
            
        }
        
        
        
        
//
//
//        self.crs_BankBranch.text = [self.crs_recieverProfileDetails valueForKey:@"bank_name"];
//        self.crs_BankaccountNimber.text = [self.crs_recieverProfileDetails valueForKey:@"account_num"];
//        self.Crs_IfscField.text = [self.crs_recieverProfileDetails valueForKey:@"ifsc"];
//
        NSLog(@"Bank Details , sai");
        
        
    }
    
    
    self.crs_FirstName.text = [self.crs_recieverProfileDetails valueForKey:@"first_name"];
    self.crs_LastName.text = [self.crs_recieverProfileDetails valueForKey:@"middle_name"];
    self.crs_EmailId.text = [self.crs_recieverProfileDetails valueForKey:@"last_name"];
    self.crs_Gender.text = [self.crs_recieverProfileDetails valueForKey:@"mobile"];
    self.crs_DateOfBirth.text = [self.crs_recieverProfileDetails valueForKey:@"gender"];
    self.crs_PostCode.text = [self.crs_recieverProfileDetails valueForKey:@"country"];
    self.crs_Branch.text = [self.crs_recieverProfileDetails valueForKey:@"pincode"];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}


- (IBAction)crs_Notification:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    notificationViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"notificationViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

- (IBAction)crs_Settings:(id)sender {
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    SettingsViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewControllerSid"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    

    
    
    
    
    
    
}

- (IBAction)crs_History:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"historyViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)crs_Profile:(id)sender {
    
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UpdateProfile* viewController = [storyboard instantiateViewControllerWithIdentifier:@"UpdateProfileViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];

    
    
    
    
}

- (IBAction)crs_Back:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
[self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)crs_Home:(id)sender {
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    
    
    
    
}
//- (IBAction)crs_Back:(id)sender {
//}




-(void)viewWillAppear:(BOOL)animated
{
    
    
    
//    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
//    [tracker set:kGAIScreenName value:@"Reciever Detiled View controller"];
//    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
}
@end

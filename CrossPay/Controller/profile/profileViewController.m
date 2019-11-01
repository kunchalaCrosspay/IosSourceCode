//
//  profileViewController.m
//  CrossPay
//
//  Created by saikiran kunchala on 28/07/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import "profileViewController.h"
#import "HoshiTextField.h"
#import "HomeViewController.h"
#import "HistoryViewController.h"
#import "notificationViewController.h"
#import "Crs_sharedvariable.h"
#import "UpdateProfile.h"
#import "SelectRecieverViewController.h"
#import "SettingsViewController.h"
#import "AddreciverTableViewCell.h"
#import "MBProgressHUD.h"
#import "crs_sharedmethods.h"
#import "GlobalUrlsFile.h"
#import "NewHomeViewController.h"

@interface profileViewController ()


{
    
    NSString * CountryName;
    
    NSString * countryCode ;
    NSString * gender ;
    NSString * EntityType ;
    NSString * gender1;
    NSString * bankType;
    NSMutableArray * stdArray;
    NSMutableArray * bankArry;
    NSMutableArray * CountryCodeArray;
    NSMutableArray * countryArray;
    NSMutableArray * Crs_Array_banklist;
    NSMutableArray * Crs_Array_list;
    NSString * Crs_str_banklist;
    NSString * crs_bankCode;
    NSString * crs_branchCode;
    NSMutableArray *crs_CountryList;
    NSMutableArray * DistrictArray;
    NSString * DistrictCode;
    NSMutableArray * DistrictStoringArray;
    NSMutableArray * CityStoringArray;
    NSMutableArray* CityCode;
    NSMutableArray *crs_CountryList1;
    NSMutableArray * searchArray;
    NSString * date1;
    NSString * wards;
    NSString* citys;
    NSString * districId;
    NSMutableArray * wardArray;
    NSString * wardCode;
    NSString * PaymentType;
    NSString * kenyaBankType;
    NSString * BussinessType;
    NSString *EntityBussinessType;
    NSString *Table;
    NSString * branchTable;
    NSMutableArray * branchArray;
    BOOL  isFiltered;
    
    
}

@end

@implementation profileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isFiltered=NO;
    
    ///[self PostWards];
    [self GetDistricts];
    [self GetCites];
    [self Banks];
    self.crs_VitenamView.hidden = YES;
    self.crs_EntityName.hidden = YES;
    self.crs_search.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    
    self.crs_Hide.hidden = YES;
    self.crs_banglaDrop.hidden = YES;
    self.crs_BanglaBranchLabel.hidden = YES;
    self.Crs_BranchOutlet.hidden = YES;
    
    DistrictArray = [NSMutableArray new];
    wardArray = [NSMutableArray new];
    branchArray = [NSMutableArray new];
    //    UITapGestureRecognizer * tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    //
    //    [self.view addGestureRecognizer:tap];
    //
    //
    
    [self.crs_search addTarget:self action:@selector(textFieldDidChanges:) forControlEvents:UIControlEventEditingChanged];
    //
    
    // For Nepal
    
    //    self.crs_NepalBranchNameLabel.hidden = YES;
    
    
    
    
    self.crs_NepaliBranch.hidden = YES;
    countryCode = @"INR";
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Clear" style:UIBarButtonItemStyleBordered target:self action:@selector(clearNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],nil];
    [numberToolbar sizeToFit];
    _crs_SelectBranch.inputAccessoryView = numberToolbar;
    self.crs_Ifsc.inputAccessoryView = numberToolbar;
    self.crs_State.inputAccessoryView = numberToolbar;
    self.crs_FirstNameField.inputAccessoryView = numberToolbar;
    self.crs_MiddleNameField.inputAccessoryView = numberToolbar;
    self.crs_LastName.inputAccessoryView = numberToolbar;
    self.crs_Mobile.inputAccessoryView = numberToolbar;
    self.crs_CityField.inputAccessoryView = numberToolbar;
    self.crs_BranchName.inputAccessoryView = numberToolbar;
    self.crs_BankAccount.inputAccessoryView = numberToolbar;
    self.crs_search.inputAccessoryView = numberToolbar;
    self.crs_VietnamMobile.inputAccessoryView = numberToolbar;
    self.crs_EntityName.inputAccessoryView = numberToolbar;
    
    
    crs_CountryList=[NSMutableArray new];
    crs_CountryList1=[NSMutableArray new];
    [self getcountrydetails];
    
    
    
    self.crs_DropImage.hidden = NO;
    
    
    self.crs_DateOfBirthField.hidden = NO;
    
    [self.crs_Saveon.layer setBorderWidth:1.0];
    [self.crs_Saveon
     .layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    
    
    [self datePick];
    Crs_str_banklist=@"";
    
    CountryCodeArray = [NSMutableArray new];
    Crs_Array_banklist=[NSMutableArray new];
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:Crosspay_GetBank] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error
//                                                                                                                         ) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [MBProgressHUD hideHUDForView:self.view animated:YES];
//            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//            Crs_Array_list=[NSMutableArray new];
//            Crs_Array_banklist=[json valueForKey:@"bank"];
//
//            NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"bank_name" ascending:YES];
//
//            NSArray *sortDescriptors = [NSArray arrayWithObject:descriptor];
//
//            // here you will get sorted array in 'sortedArray'
//            Crs_Array_banklist = [[ Crs_Array_banklist sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
//        });
//
//    }];
//
//    [dataTask resume];
    
    
    //countryCode = @"INR";
    
    
    
    
    [self.crs_SaveOut.layer setBorderWidth:1.0];
    [self.crs_SaveOut.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    self.crs_CountrySelectorView.hidden = YES;
    
    
    self.crs_RecieverImage.layer.cornerRadius = self.crs_RecieverImage.frame.size.height/2;
    self.crs_RecieverImage.clipsToBounds = YES;
    self.crs_RecieverImage.layer.borderColor = [UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0].CGColor;
    self.crs_RecieverImage.layer.borderWidth = 1.0f;
    
    
    // Do any additional setup after loading the view.
    //self.crs_RegisterScrollView.contentSize = CGSizeMake(self.view.frame.size.width-30,1650);
    NSLog(@"sai %@",self.crs_UpdateRecieverDetails);
    _Crs_CashPay_view.hidden = NO;
    
    
    self.crs_RecieverScrollView.contentSize = CGSizeMake(self.view.frame.size.width-30,875);
    gender = @"male";
    gender1 = @"male";
    EntityType = @"Individual";
    bankType =@"0";
    kenyaBankType = @"2";
    
    self.crs_ProfileView.hidden = YES;
    
    bankArry  =  [NSMutableArray arrayWithObjects:@"State Bank Of Hyderabad",@"State Of India",@"Bank OF Borada", nil];
    
    
    
    // Place Holders colors For Top view
    
    self.crs_CounryField.textColor = [UIColor whiteColor];
    self.crs_ZipCodeField.textColor = [UIColor whiteColor];
    self.crs_FirstNameField.textColor = [UIColor whiteColor];
    self.crs_MiddleNameField.textColor = [UIColor whiteColor];
    self.crs_LastName.textColor = [UIColor whiteColor];
    self.crs_PhoneNumber.textColor = [UIColor whiteColor];
    //self.crs_EmailIdField.textColor = [UIColor whiteColor];
    self.crs_DateOfBirthField.textColor = [UIColor whiteColor];
    self.crs_StdField.textColor = [UIColor whiteColor];
    self.crs_Std2.textColor = [UIColor whiteColor];
    self.crs_VietnamCity.textColor = [UIColor whiteColor];
    self.crs_VietnamMobile.textColor = [UIColor whiteColor];
    self.crs_Ward.textColor = [UIColor whiteColor];
    self.crs_District.textColor = [UIColor whiteColor];
    [self datePick];
    
    //place Holders Colors for Cash view
    
    self.crs_CityField.textColor = [UIColor whiteColor];
    self.crs_State.textColor = [UIColor whiteColor];
    self.crs_Mobile.textColor = [UIColor whiteColor];
    self.crs_EntityName.textColor = [UIColor whiteColor];
    
    
    
    
    
    // Palce Holders Colors For Bottom View
    self.crs_SelectBranch.textColor = [UIColor whiteColor];
    self.crs_BankAccount.textColor = [UIColor whiteColor];
    self.crs_Ifsc.textColor = [UIColor whiteColor];
    self.crs_BranchName.textColor = [UIColor whiteColor];
    
    //    if ([EntityType isEqualToString:@"Individual"]) {
    //        [self.crs_IndividualOut setSelected:NO];
    //        [self.crs_CorparateOut setSelected:NO];
    //    }
    //    else if ([EntityType isEqualToString:@"Corparate"]){
    //        [self.crs_IndividualOut setSelected:YES];
    //        [self.crs_CorparateOut setSelected:YES];
    //    }
    //
    
    
    
    
    // Text  Field Deligate Methods
    
    //self.crs_ZipCodeField.delegate = self;
    //self.crs_FirstNameField.delegate = self;
    //    self.crs_MiddleNameField.delegate = self;
    //    self.crs_LastName.delegate = self;
    //    self.crs_PhoneNumber.delegate = self;
    //    self.crs_EmailIdField.delegate = self;
    //    self.crs_DateOfBirthField.delegate = self;
    //    //self.crs_
    
    
    //    self.crs_IfscField.delegate = self;
    
    
    
    
    
    
    
    NSString * accountNumber = [self.crs_UpdateRecieverDetails valueForKey:@"account_number"];
    
    
    
    
    if ([self.crs_Comparsion isEqualToString:@"update"]) {
        
        // self.crs_RecieverImage.image = [self decodeBase64ToImage:[self.crs_UpdateRecieverDetails valueForKey:@"image"]];
        
        //
        //         if ([accountNumber isEqualToString:@"null"]||[accountNumber isEqualToString:@""]||[accountNumber length] == 0)
        //         {
        //
        //             [self.crs_BankAcountClick  setSelected:NO];
        //             [self.crs_IbanClick setSelected:NO];
        //             _Crs_CashPay_view.hidden =NO;
        //
        //
        //         }
        //
        //
        //         else{
        //
        //             [self.crs_BankAcountClick  setSelected:NO];
        //             [self.crs_IbanClick setSelected:NO];
        //             _Crs_CashPay_view.hidden =NO;
        //
        //         }
        
        
        [self.crs_SaveOut setTitle:@"Update" forState:UIControlStateNormal];
        self.crs_recieverlabel.text = @"Update Receiver";
        
        
        
        EntityBussinessType = [self.crs_UpdateRecieverDetails valueForKey:@"entitytype"];
        if ([EntityBussinessType isEqualToString:@"I"]) {
            
            
            EntityType = @"Individual";
            CGPoint scrollPoint = CGPointMake(0,20);
            [  self.crs_RecieverScrollView setContentOffset:scrollPoint animated:YES];
            [self.crs_IndividualOut setSelected:NO];
            [self.crs_CorparateOut setSelected:NO];
            self.crs_FirstNameField.text = [self.crs_UpdateRecieverDetails valueForKey:@"first_name"];
            self.crs_LastName.text = [self.crs_UpdateRecieverDetails valueForKey:@"last_name"];
            self.crs_EntityName.hidden = YES;
            
            self.crs_Femaleout.hidden = NO;
            self.crs_MaleOut.hidden = NO;
            self.vietnamMaletouch.hidden = NO;
            self.vietnamFemal.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_MaleTouch.hidden = NO;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.vietnamMaleoutlet.hidden = NO;
            self.veitnamFemaleoutlet.hidden = NO;
            self.crs_DateOfBirthField.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
            
            if ([self.crs_CounryField.text isEqualToString:@"PAKISTAN"]) {
                self.crs_DateOfBirthField.hidden = NO;
            } else {
                self.crs_DateOfBirthField.hidden = YES;
            }
            
            
        } else {
            EntityType = @"Corparate";
            CGPoint scrollPoint = CGPointMake(0,120);
            [  self.crs_RecieverScrollView setContentOffset:scrollPoint animated:YES];
            [self.crs_IndividualOut setSelected:YES];
            [self.crs_CorparateOut setSelected:YES];
            
            self.crs_EntityName.text = [self.crs_UpdateRecieverDetails valueForKey:@"first_name"];
            self.crs_DateOfBirthField.text = [self.crs_UpdateRecieverDetails valueForKey:@"dob"];
            self.crs_MiddleNameField.hidden = YES;
            self.crs_FirstNameField.hidden = YES;
            self.crs_LastName.hidden = YES;
            self.crs_EntityName.hidden = NO;
            
            self.crs_Femaleout.hidden = YES;
            self.crs_MaleOut.hidden = YES;
            self.vietnamMaletouch.hidden = YES;
            self.vietnamFemal.hidden = YES;
            self.crs_FemaleTouch.hidden = YES;
            self.crs_MaleTouch.hidden = YES;
            self.crs_MaleClick.hidden = YES;
            self.crs_FemaleClick.hidden = YES;
            self.crs_FeamaleLabel.hidden = YES;
            self.crs_MaleLabel.hidden = YES;
            self.vietnamMaleoutlet.hidden = YES;
            self.veitnamFemaleoutlet.hidden = YES;
            //self.crs_DateOfBirthField.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
            if ([self.crs_CounryField.text isEqualToString:@"PAKISTAN"]) {
                self.crs_DateOfBirthField.hidden = NO;
            } else {
                self.crs_DateOfBirthField.hidden = YES;
            }
        }
        
        
        
        
        if ([EntityBussinessType isEqualToString:@"I"]) {
            
        }
        else if ([EntityBussinessType isEqualToString:@"C"]){
            
            
        }
        
        self.crs_BankAccount.text = [self.crs_UpdateRecieverDetails valueForKey:@"account_number"];
        
        self.crs_StdField.text = [self.crs_UpdateRecieverDetails valueForKey:@"isd_code"];
        self.crs_Std2.text = [self.crs_UpdateRecieverDetails valueForKey:@"isd_code"];
        
        self.crs_CounryField.text = [self.crs_UpdateRecieverDetails valueForKey:@"country"];
        
        self.crs_MiddleNameField.text = [self.crs_UpdateRecieverDetails valueForKey:@"middle_name"];
        
        self.crs_Mobile.text = [self.crs_UpdateRecieverDetails valueForKey:@"mobile"];
        self.crs_ZipCodeField.text = [self.crs_UpdateRecieverDetails valueForKey:@"pincode"];
        self.crs_CityField.text = [self.crs_UpdateRecieverDetails valueForKey:@"city"];
        
        NSString *dateString = [self.crs_UpdateRecieverDetails valueForKey:@"dob"];
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy-MM-dd"];
        NSDate *date = [format dateFromString:dateString];
        [format setDateFormat:@"MM-dd-yyyy"];
        NSString* finalDateString = [format stringFromDate:date];
        
        
        self.crs_DateOfBirthField.text = finalDateString;
        
        //self.crs_DateOfBirthField.text = ;
        //date1 = [self.crs_UpdateRecieverDetails valueForKey:@"dob"];
        
        
        // textfield.text=[NSString stringWithFormat:@"%@",[NSDate date]];
        crs_branchCode = [self.crs_UpdateRecieverDetails valueForKey:@"branch_code"];
        crs_bankCode = [self.crs_UpdateRecieverDetails valueForKey:@"bank_code"];
        self.crs_VietnamCity.text = [self.crs_UpdateRecieverDetails valueForKey:@"city"];
        wards = [self.crs_UpdateRecieverDetails valueForKey:@"DISTRICT_ID"];
        self.crs_District.text = [self.crs_UpdateRecieverDetails valueForKey:@"district"];
        self.crs_Ward.text = [self.crs_UpdateRecieverDetails valueForKey:@"ward"];
        self.crs_VietnamMobile.text = [self.crs_UpdateRecieverDetails valueForKey:@"mobile"];
        
        
        countryCode = [self.crs_UpdateRecieverDetails valueForKey:@"ccycode"];
        if ([[self.crs_UpdateRecieverDetails valueForKey:@"gender"]isEqualToString:@ "male"]||[[self.crs_UpdateRecieverDetails valueForKey:@"gender"]isEqualToString:@ "Male"]||[[self.crs_UpdateRecieverDetails valueForKey:@"gender1"]isEqualToString:@ "Male"]||[[self.crs_UpdateRecieverDetails valueForKey:@"gender1"]isEqualToString:@ "male"]) {
            NSLog(@"venkatesh..............");
            gender = @"male";
            
            [self.crs_MaleClick setSelected:NO];
            [self.crs_FemaleClick setSelected:NO];
            
            
            [self.vietnamMaleoutlet setSelected:NO];
            [self.veitnamFemaleoutlet setSelected:NO];
            
        }
        
        else{
            
            
            NSLog(@"sai..............");
            
            gender = @"female";
            [self.crs_MaleClick setSelected:YES];
            [self.crs_FemaleClick setSelected:YES];
            
            [self.vietnamMaleoutlet setSelected:YES];
            [self.veitnamFemaleoutlet setSelected:YES];
            
            
            
        }
        
        NSLog(@"Anusha %@",gender);
        
        
        if ([self.crs_CounryField.text isEqualToString:@"INDIA"]) {
            
            NSLog(@"india$$$$$$$$$$$");
            
            
            
            NSString * Accountnumber = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            
            if ([Accountnumber isEqualToString:@"null"]||[Accountnumber isEqualToString:@""]||[Accountnumber length] == 0)
                
            {
                
                [self.crs_BankAcountClick  setSelected:NO];
                [self.crs_IbanClick setSelected:NO];
                _Crs_CashPay_view.hidden =NO;
                self.crs_VitenamView.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
                
            }
            
            
            
            
            
            
            
            else{
                bankType = @"1";
                [self.crs_BankAcountClick  setSelected:YES];
                [self.crs_IbanClick setSelected:YES];
                _Crs_CashPay_view.hidden =YES;
                self.crs_BankAccount.hidden = NO;
                self.crs_NepalBranchNameLabel.hidden = YES;
                self.crs_Ifsc.text=[self.crs_UpdateRecieverDetails valueForKey:@"ifsc"];
                self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
                self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
                self.crs_DropImage.hidden = NO;
                self.crs_DateOfBirthField.hidden = YES;
                self.crs_BranchName.hidden = NO;
                self.crs_NepaliBranch.hidden = YES;
                self.crs_VitenamView.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            // Branch Name
            // Ifsc Code
            // Account Number
            // ba nk name
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        else  if ([self.crs_CounryField.text isEqualToString:@"SRI LANKA"]) {
            
            NSLog(@"SRILANKA");
            
            
            
            NSString * Accountnumber = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            
            if ([Accountnumber isEqualToString:@"null"]||[Accountnumber isEqualToString:@""]||[Accountnumber length] == 0)
                
            {
                
                [self.crs_BankAcountClick  setSelected:NO];
                [self.crs_IbanClick setSelected:NO];
                _Crs_CashPay_view.hidden =NO;
                self.crs_Bankbuttonhider.hidden = NO;
                self.crs_DropImage.hidden = YES;
                self.crs_VitenamView.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            
            
            
            
            
            
            else{
                bankType = @"1";
                [self.crs_BankAcountClick  setSelected:YES];
                [self.crs_IbanClick setSelected:YES];
                _Crs_CashPay_view.hidden =YES;
                self.crs_Ifsc.placeholder = @"Branch Code";
                self.crs_NepalBranchNameLabel.hidden = YES;
                self.crs_NepaliBranch.hidden = YES;
                self.crs_Ifsc.text=[self.crs_UpdateRecieverDetails valueForKey:@"branch_code"];
                self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
                self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
                self.crs_DropImage.hidden = NO;
                self.crs_DateOfBirthField.hidden = YES;
                self.crs_Bankbuttonhider.hidden = NO;
                self.crs_BranchName.hidden = NO;
                self.crs_VitenamView.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            // Branch Name
            // Ifsc Code
            // Account Number
            // ba nk name
        }
        
        
        
        
        
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"PHILIPPINES"]) {
            
            NSString * Accountnumber = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            
            if ([Accountnumber isEqualToString:@"null"]||[Accountnumber isEqualToString:@""]||[Accountnumber length] == 0)
                
            {
                
                [self.crs_BankAcountClick  setSelected:NO];
                [self.crs_IbanClick setSelected:NO];
                _Crs_CashPay_view.hidden =NO;
                self.crs_VitenamView.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            
            else{
                bankType = @"1";
                
                
                
                [self.crs_BankAcountClick  setSelected:YES];
                [self.crs_IbanClick setSelected:YES];
                _Crs_CashPay_view.hidden =YES;
                self.crs_BankAccount.hidden = YES;
                self.crs_NepalBranchNameLabel.hidden = YES;
                self.crs_NepaliBranch.hidden = YES;
                
                self.crs_BranchName.placeholder = @"Account Number";
                self.crs_Ifsc.placeholder = @"Branch Name";
                self.crs_VitenamView.hidden = YES;
                
                self.crs_Ifsc.text=[self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
                self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
                
                self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_DropImage.hidden = NO;
                self.crs_DateOfBirthField.hidden = YES;
                self.crs_BranchName.hidden = NO;
                self.crs_VitenamView.hidden = YES;
                
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
                
                
            }
            
            
        }
        
        else if ([self.crs_CounryField.text isEqualToString:@"VIETNAM"]){
            
            NSString * Accountnumber = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            
            if ([Accountnumber isEqualToString:@"null"]||[Accountnumber isEqualToString:@""]||[Accountnumber length] == 0)
                
            {
                
                [self.crs_BankAcountClick  setSelected:NO];
                [self.crs_IbanClick setSelected:NO];
                _Crs_CashPay_view.hidden =NO;
                //self.crs_VitenamView.hidden = NO;
                
                self.crs_VitenamView.hidden = NO;
                self.crs_MaleTouch.hidden = YES;
                self.crs_FemaleTouch.hidden = YES;
                self.crs_CityField.hidden = YES;
                self.crs_Mobile.hidden = YES;
                self.crs_DateOfBirthField.hidden = YES;
                self.crs_MaleClick.hidden = YES;
                self.crs_FemaleClick.hidden = YES;
                self.crs_MaleLabel.hidden = YES;
                self.crs_FeamaleLabel.hidden = YES;
                self.crs_Mobile.hidden  = YES;
                self.crs_DateOfBirthField.hidden = YES;
                self.crs_CityField.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            
            else{
                bankType = @"1";
                
                
                
                [self.crs_BankAcountClick  setSelected:YES];
                [self.crs_IbanClick setSelected:YES];
                _Crs_CashPay_view.hidden =YES;
                self.crs_BankAccount.hidden = YES;
                self.crs_NepalBranchNameLabel.hidden = YES;
                self.crs_NepaliBranch.hidden = YES;
                
                self.crs_Ifsc.placeholder = @"Branch Name";
                self.crs_BranchName.placeholder = @"Account Number";
                self.crs_VitenamView.hidden = NO;
                
                self.crs_Ifsc.text=[self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
                self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
                
                self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_DropImage.hidden = NO;
                self.crs_DateOfBirthField.hidden = YES;
                self.crs_BranchName.hidden = NO;
                
                self.crs_VitenamView.hidden = NO;
                self.crs_MaleTouch.hidden = YES;
                self.crs_FemaleTouch.hidden = YES;
                self.crs_CityField.hidden = YES;
                self.crs_Mobile.hidden = YES;
                self.crs_DateOfBirthField.hidden = YES;
                self.crs_MaleClick.hidden = YES;
                self.crs_FemaleClick.hidden = YES;
                self.crs_MaleLabel.hidden = YES;
                self.crs_FeamaleLabel.hidden = YES;
                self.crs_Mobile.hidden  = YES;
                self.crs_DateOfBirthField.hidden = YES;
                self.crs_CityField.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
                
                
            }
            
            
        }
        
        
        
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"NEPAL"]) {
            
            NSString * Accountnumber = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            
            if ([Accountnumber isEqualToString:@"null"]||[Accountnumber isEqualToString:@""]||[Accountnumber length] == 0)
                
            {
                
                [self.crs_BankAcountClick  setSelected:NO];
                [self.crs_IbanClick setSelected:NO];
                _Crs_CashPay_view.hidden =NO;
                self.crs_NepaliBranch.hidden = NO;
                self.crs_Ifsc.userInteractionEnabled = NO;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            
            else{
                bankType = @"1";
                
                
                
                [self.crs_BankAcountClick  setSelected:YES];
                [self.crs_IbanClick setSelected:YES];
                _Crs_CashPay_view.hidden =YES;
                self.crs_BankAccount.hidden = YES;
                PaymentType = @"Account";
                [self.crs_Ifsc setKeyboardType:UIKeyboardTypeNumberPad];
                self.crs_NepaliBranch.hidden = NO;
                self.crs_BranchName.placeholder = @"Account Number";
                self.crs_Ifsc.placeholder = @"";
                self.crs_NepalBranchNameLabel.hidden = NO;
                self.crs_Ifsc.userInteractionEnabled = NO;
                self.crs_Ifsc.text=[self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
                self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
                
                self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_DropImage.hidden = NO;
                self.crs_DateOfBirthField.hidden = YES;
                self.crs_BranchName.hidden = NO;
                
                self.crs_VitenamView.hidden = YES;
                
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
                
                
            }
            
            
        }
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"KENYA"]) {
            
            NSString * Accountnumber = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            
            if ([Accountnumber isEqualToString:@"null"]||[Accountnumber isEqualToString:@""]||[Accountnumber length] == 0)
                
            {
                bankType = @"0";
                kenyaBankType = @"2";
                countryCode = @"KES";
                PaymentType = @"Wallet";
                self.crs_CashPickUp.text = @"MOBILE WALLET";
                [self.crs_BankAcountClick  setSelected:NO];
                [self.crs_IbanClick setSelected:NO];
                _Crs_CashPay_view.hidden =NO;
                self.crs_VitenamView.hidden = YES;
                self.crs_BranchName.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            
            else{
                
                
                
                
                bankType = @"1";
                countryCode = @"KES";
                PaymentType = @"ACCOUNT CREDIT";
                self.crs_CashPickUp.text = @"MOBILE WALLET";
                [self.crs_BankAcountClick  setSelected:YES];
                [self.crs_IbanClick setSelected:YES];
                _Crs_CashPay_view.hidden =YES;
                self.crs_Ifsc.placeholder = @"Account Number";
                self.crs_BankAccount.hidden = NO;
                self.crs_NepalBranchNameLabel.hidden = YES;
                self.crs_Ifsc.text= [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
                self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
                self.crs_DropImage.hidden = NO;
                self.crs_DateOfBirthField.hidden = YES;
                self.crs_BranchName.hidden = YES;
                self.crs_BankAccount.hidden = YES;
                self.crs_NepaliBranch.hidden = YES;
                self.crs_VitenamView.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            
        }
        
        else if ([self.crs_CounryField.text isEqualToString:@"KENYA"]) {
            
            NSString * Accountnumber = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            
            if ([Accountnumber isEqualToString:@"null"]||[Accountnumber isEqualToString:@""]||[Accountnumber length] == 0)
                
            {
                bankType = @"0";
                kenyaBankType = @"2";
                countryCode = @"KES";
                PaymentType = @"Wallet";
                self.crs_CashPickUp.text = @"MOBILE WALLET";
                [self.crs_BankAcountClick  setSelected:NO];
                [self.crs_IbanClick setSelected:NO];
                _Crs_CashPay_view.hidden =NO;
                self.crs_VitenamView.hidden = YES;
                self.crs_BranchName.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            
            else{
                
                
                
                
                bankType = @"1";
                countryCode = @"KES";
                PaymentType = @"ACCOUNT CREDIT";
                self.crs_CashPickUp.text = @"MOBILE WALLET";
                [self.crs_BankAcountClick  setSelected:YES];
                [self.crs_IbanClick setSelected:YES];
                _Crs_CashPay_view.hidden =YES;
                self.crs_Ifsc.placeholder = @"Account Number";
                self.crs_BankAccount.hidden = NO;
                self.crs_NepalBranchNameLabel.hidden = YES;
                self.crs_Ifsc.text= [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
                self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
                self.crs_DropImage.hidden = NO;
                self.crs_DateOfBirthField.hidden = YES;
                self.crs_BranchName.hidden = YES;
                self.crs_BankAccount.hidden = YES;
                self.crs_NepaliBranch.hidden = YES;
                self.crs_VitenamView.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
                
            }
            
            
        }
        
        else if ([self.crs_CounryField.text isEqualToString:@""]) {
            
            NSString * Accountnumber = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            
            if ([Accountnumber isEqualToString:@"null"]||[Accountnumber isEqualToString:@""]||[Accountnumber length] == 0)
                
            {
                bankType = @"0";
                kenyaBankType = @"2";
                countryCode = @"KES";
                PaymentType = @"Wallet";
                self.crs_CashPickUp.text = @"MOBILE WALLET";
                [self.crs_BankAcountClick  setSelected:NO];
                [self.crs_IbanClick setSelected:NO];
                _Crs_CashPay_view.hidden =NO;
                self.crs_VitenamView.hidden = YES;
                self.crs_BranchName.hidden = YES;
            }
            
            
            else{
                
                
                
                
                bankType = @"1";
                countryCode = @"KES";
                PaymentType = @"ACCOUNT CREDIT";
                self.crs_CashPickUp.text = @"MOBILE WALLET";
                [self.crs_BankAcountClick  setSelected:YES];
                [self.crs_IbanClick setSelected:YES];
                _Crs_CashPay_view.hidden =YES;
                self.crs_Ifsc.placeholder = @"Account Number";
                self.crs_BankAccount.hidden = NO;
                self.crs_NepalBranchNameLabel.hidden = YES;
                self.crs_Ifsc.text= [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
                self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
                self.crs_DropImage.hidden = NO;
                self.crs_DateOfBirthField.hidden = YES;
                self.crs_BranchName.hidden = YES;
                self.crs_BankAccount.hidden = YES;
                self.crs_NepaliBranch.hidden = YES;
                self.crs_VitenamView.hidden = YES;
                
            }
            
            
        }
        
        else if ([self.crs_CounryField.text isEqualToString:@"BANGLADESH"]) {
            
            NSString * Accountnumber = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            
            if ([Accountnumber isEqualToString:@"null"]||[Accountnumber isEqualToString:@""]||[Accountnumber length] == 0)
                
            {
                bankType = @"0";
                kenyaBankType = @"2";
                countryCode = @"BGT";
                PaymentType = @"Wallet";
                self.crs_CashPickUp.text = @"MOBILE WALLET";
                [self.crs_BankAcountClick  setSelected:NO];
                [self.crs_IbanClick setSelected:NO];
                _Crs_CashPay_view.hidden =NO;
                self.crs_VitenamView.hidden = YES;
                self.crs_BranchName.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            
            else{
                
                
                
                
                bankType = @"1";
                countryCode = @"BGT";
                PaymentType = @"ACCOUNT CREDIT";
                self.crs_CashPickUp.text = @"MOBILE WALLET";
                [self.crs_BankAcountClick  setSelected:YES];
                [self.crs_IbanClick setSelected:YES];
                _Crs_CashPay_view.hidden =YES;
                self.crs_Ifsc.placeholder = @"";
                self.crs_BankAccount.hidden = NO;
                self.crs_NepalBranchNameLabel.hidden = YES;
                self.crs_Ifsc.text= [self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
                self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
                self.crs_BranchName.text=[self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
               
                self.crs_DropImage.hidden = NO;
                self.crs_DateOfBirthField.hidden = YES;
                self.crs_BranchName.hidden = NO;
                self.crs_BankAccount.hidden = YES;
                self.crs_NepaliBranch.hidden = YES;
                self.crs_VitenamView.hidden = YES;
                self.Crs_BranchOutlet.hidden = NO;
                self.crs_BanglaBranchLabel.hidden = NO;
                self.crs_banglaDrop.hidden = NO;
                self.crs_BranchName.placeholder = @"Account Number";
            }
            
            
        }
        else if ([self.crs_CounryField.text isEqualToString:@"UGANDA"]) {
            
            NSString * Accountnumber = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            
            if ([Accountnumber isEqualToString:@"null"]||[Accountnumber isEqualToString:@""]||[Accountnumber length] == 0)
                
            {
                bankType = @"0";
                kenyaBankType = @"2";
                countryCode = @"UGX";
                PaymentType = @"Wallet";
                self.crs_CashPickUp.text = @"MOBILE WALLET";
                [self.crs_BankAcountClick  setSelected:NO];
                [self.crs_IbanClick setSelected:NO];
                _Crs_CashPay_view.hidden =NO;
                self.crs_VitenamView.hidden = YES;
                self.crs_BranchName.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            
            else{
                
                
                
                
                bankType = @"1";
                countryCode = @"UGX";
                PaymentType = @"ACCOUNT CREDIT";
                self.crs_CashPickUp.text = @"MOBILE WALLET";
                [self.crs_BankAcountClick  setSelected:YES];
                [self.crs_IbanClick setSelected:YES];
                _Crs_CashPay_view.hidden =YES;
                self.crs_Ifsc.placeholder = @"Account Number";
                self.crs_BankAccount.hidden = NO;
                self.crs_NepalBranchNameLabel.hidden = YES;
                self.crs_Ifsc.text= [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
                self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
                self.crs_DropImage.hidden = NO;
                self.crs_DateOfBirthField.hidden = YES;
                self.crs_BranchName.hidden = YES;
                self.crs_BankAccount.hidden = YES;
                self.crs_NepaliBranch.hidden = YES;
                self.crs_VitenamView.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            
        }
        
        else if ([self.crs_CounryField.text isEqualToString:@"NIGERIA"]) {
            NSString * Accountnumber = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            
            if ([Accountnumber isEqualToString:@"null"]||[Accountnumber isEqualToString:@""]||[Accountnumber length] == 0)
                
            {
                bankType = @"0";
                kenyaBankType = @"2";
                countryCode = @"NGN";
                PaymentType = @"Wallet";
                self.crs_CashPickUp.text = @"MOBILE WALLET";
                [self.crs_BankAcountClick  setSelected:NO];
                [self.crs_IbanClick setSelected:NO];
                _Crs_CashPay_view.hidden =NO;
                self.crs_VitenamView.hidden = YES;
                self.crs_BranchName.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            
            else{
                
                
                
                
                bankType = @"1";
                countryCode = @"NGN";
                PaymentType = @"ACCOUNT CREDIT";
                self.crs_CashPickUp.text = @"MOBILE WALLET";
                [self.crs_BankAcountClick  setSelected:YES];
                [self.crs_IbanClick setSelected:YES];
                _Crs_CashPay_view.hidden =YES;
                self.crs_Ifsc.placeholder = @"Account Number";
                self.crs_BankAccount.hidden = NO;
                self.crs_NepalBranchNameLabel.hidden = YES;
                self.crs_Ifsc.text= [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
                self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
                self.crs_DropImage.hidden = NO;
                self.crs_DateOfBirthField.hidden = YES;
                self.crs_BranchName.hidden = YES;
                self.crs_BankAccount.hidden = YES;
                self.crs_NepaliBranch.hidden = YES;
                self.crs_VitenamView.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            
        }
        
        else if ([self.crs_CounryField.text isEqualToString:@"RWANDA"]) {
            
            NSString * Accountnumber = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            
            if ([Accountnumber isEqualToString:@"null"]||[Accountnumber isEqualToString:@""]||[Accountnumber length] == 0)
                
            {
                bankType = @"0";
                kenyaBankType = @"2";
                countryCode = @"RWF";
                PaymentType = @"Wallet";
                self.crs_CashPickUp.text = @"MOBILE WALLET";
                [self.crs_BankAcountClick  setSelected:NO];
                [self.crs_IbanClick setSelected:NO];
                _Crs_CashPay_view.hidden =NO;
                self.crs_VitenamView.hidden = YES;
                self.crs_BranchName.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            
            else{
                
                
                
                
                bankType = @"1";
                countryCode = @"RWF";
                PaymentType = @"ACCOUNT CREDIT";
                self.crs_CashPickUp.text = @"MOBILE WALLET";
                [self.crs_BankAcountClick  setSelected:YES];
                [self.crs_IbanClick setSelected:YES];
                _Crs_CashPay_view.hidden =YES;
                self.crs_Ifsc.placeholder = @"Account Number";
                self.crs_BankAccount.hidden = NO;
                self.crs_NepalBranchNameLabel.hidden = YES;
                self.crs_Ifsc.text= [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
                self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
                self.crs_DropImage.hidden = NO;
                self.crs_DateOfBirthField.hidden = YES;
                self.crs_BranchName.hidden = YES;
                self.crs_BankAccount.hidden = YES;
                self.crs_NepaliBranch.hidden = YES;
                self.crs_VitenamView.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            
        }
        
        else if ([self.crs_CounryField.text isEqualToString:@"GHANA"]) {
            
            NSString * Accountnumber = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            
            if ([Accountnumber isEqualToString:@"null"]||[Accountnumber isEqualToString:@""]||[Accountnumber length] == 0)
                
            {
                bankType = @"0";
                kenyaBankType = @"2";
                countryCode = @"GHS";
                PaymentType = @"Wallet";
                self.crs_CashPickUp.text = @"MOBILE WALLET";
                [self.crs_BankAcountClick  setSelected:NO];
                [self.crs_IbanClick setSelected:NO];
                _Crs_CashPay_view.hidden =NO;
                self.crs_VitenamView.hidden = YES;
                self.crs_BranchName.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            
            else{
                
                
                
                
                bankType = @"1";
                countryCode = @"GHS";
                PaymentType = @"ACCOUNT CREDIT";
                self.crs_CashPickUp.text = @"MOBILE WALLET";
                [self.crs_BankAcountClick  setSelected:YES];
                [self.crs_IbanClick setSelected:YES];
                _Crs_CashPay_view.hidden =YES;
                self.crs_Ifsc.placeholder = @"Account Number";
                self.crs_BankAccount.hidden = NO;
                self.crs_NepalBranchNameLabel.hidden = YES;
                self.crs_Ifsc.text= [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
                self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
                self.crs_DropImage.hidden = NO;
                self.crs_DateOfBirthField.hidden = YES;
                self.crs_BranchName.hidden = YES;
                self.crs_BankAccount.hidden = YES;
                self.crs_NepaliBranch.hidden = YES;
                self.crs_VitenamView.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
                
            }
            
            
        }
        else if ([self.crs_CounryField.text isEqualToString:@"TANZANIA"]) {
            
            NSString * Accountnumber = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            
            if ([Accountnumber isEqualToString:@"null"]||[Accountnumber isEqualToString:@""]||[Accountnumber length] == 0)
                
            {
                self.crs_CashPickUp.text = @"MOBILE WALLET";
                [self.crs_BankAcountClick  setSelected:NO];
                [self.crs_IbanClick setSelected:NO];
                _Crs_CashPay_view.hidden =NO;
                self.crs_VitenamView.hidden = YES;
                self.crs_BranchName.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            
            else{
                
                
                
                
                bankType = @"1";
                self.crs_CashPickUp.text = @"MOBILE WALLET";
                [self.crs_BankAcountClick  setSelected:YES];
                [self.crs_IbanClick setSelected:YES];
                _Crs_CashPay_view.hidden =YES;
                self.crs_Ifsc.placeholder = @"Account Number";
                self.crs_BankAccount.hidden = NO;
                self.crs_NepalBranchNameLabel.hidden = YES;
                self.crs_Ifsc.text= [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
                self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
                self.crs_DropImage.hidden = NO;
                self.crs_DateOfBirthField.hidden = YES;
                self.crs_BranchName.hidden = YES;
                self.crs_BankAccount.hidden = YES;
                self.crs_NepaliBranch.hidden = YES;
                self.crs_VitenamView.hidden = YES;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
            }
            
            
        }
        
        
        //        else if ([self.crs_CounryField.text isEqualToString:@"TANZANIA"]) {
        //
        //            NSString * Accountnumber = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
        //
        //            if ([Accountnumber isEqualToString:@"null"]||[Accountnumber isEqualToString:@""]||[Accountnumber length] == 0)
        //
        //            {
        //                self.crs_CashPickUp.text = @"Mobile Wallet";
        //                [self.crs_BankAcountClick  setSelected:NO];
        //                [self.crs_IbanClick setSelected:NO];
        //                _Crs_CashPay_view.hidden =NO;
        //                self.crs_VitenamView.hidden = YES;
        //                self.crs_BranchName.hidden = YES;
        //                self.crs_Bankbuttonhider.hidden = YES;
        //            }
        //
        //
        //            else{
        //
        //
        //
        //
        //                bankType = @"1";
        //                self.crs_CashPickUp.text = @"Mobile Wallet";
        //                [self.crs_BankAcountClick  setSelected:YES];
        //                [self.crs_IbanClick setSelected:YES];
        //                _Crs_CashPay_view.hidden =YES;
        //                self.crs_Ifsc.placeholder = @"Account Number";
        //                self.crs_BankAccount.hidden = YES;
        //                self.crs_Bankbuttonhider.hidden = YES;
        //                self.crs_NepalBranchNameLabel.hidden = YES;
        //                self.crs_Ifsc.text= [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
        //                self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
        //                self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
        //                self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
        //                self.crs_DropImage.hidden = NO;
        //                self.crs_DateOfBirthField.hidden = YES;
        //                self.crs_BranchName.hidden = YES;
        //                self.crs_BankAccount.hidden = YES;
        //                self.crs_NepaliBranch.hidden = YES;
        //                self.crs_VitenamView.hidden = YES;
        //
        //            }
        //
        //
        //        }
        
        
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"UNITED STATES"]) {
            bankType = @"1";
            self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
            self.crs_Ifsc.text=[self.crs_UpdateRecieverDetails valueForKey:@"ifsc"];
            self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
            self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_NepaliBranch.hidden = YES;
            NSLog(@"USAS$$$$$$");
            
            // Select Bank
            // swift code
            // Branch name
            // Account Number
            
            
            bankType = @"1";
            //            [self.crs_BankAccount setKeyboardType:UIKeyboardTypeNamePhonePad];
            //            [_crs_Ifsc reloadInputViews];
            
            self.crs_CashPickUp.text = @"ACCOUNT CREDIT";
            self.crs_AccountCredit.hidden = YES;
            self.crs_BankAcountClick.hidden = YES;
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.Crs_CashPay_view.hidden = YES;
            self.crs_BranchName.placeholder = @"Branch Name";
            self.crs_Ifsc.placeholder = @"Swift Code";
            self.crs_BankAccount.placeholder = @"Account Number";
            self.crs_DropImage.hidden = YES;
            self.crs_BankAccount.hidden = NO;
            self.crs_Bankbuttonhider.hidden = YES;
            self.crs_BranchName.hidden = NO;
            
            self.crs_VitenamView.hidden = YES;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
            
        }
        else if ([self.crs_CounryField.text isEqualToString:@"GAMBIA"])
        {
            bankType = @"0";
            countryCode = @"GMD";
            self.crs_CashPickUp.text = @"CASH PICK-UP";
            self.crs_AccountCredit.hidden = YES ;
            self.crs_BankAcountClick.hidden = YES;
            self.Crs_CashPay_view.hidden = NO;
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNamePhonePad];
            [_crs_Ifsc reloadInputViews];
            
            self.crs_Ifsc.placeholder = @"Branch Name";
            self.crs_BranchName.placeholder = @"Account Number";
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_Bankbuttonhider.hidden = NO;
            //self.crs_DropDown.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_DropImage.hidden = NO;
            self.crs_NepalBranchNameLabel.hidden = YES;
            //[self.crs_BankAcountClick  setSelected:NO];
            [self.crs_BankAcountClick  setSelected:NO];
            [self.crs_IbanClick setSelected:NO];
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
            
        }
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"AUSTRALIA"]||[self.crs_CounryField.text isEqualToString:@"SIERRA LEONE"]||[self.crs_CounryField.text isEqualToString:@"CANADA"]) {
            bankType = @"1";
            self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
            self.crs_Ifsc.text=[self.crs_UpdateRecieverDetails valueForKey:@"ifsc"];
            self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
            self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            self.crs_DateOfBirthField.hidden = YES;
            
            NSLog(@"USAS$$$$$$");
            
            // Select Bank
            // swift code
            // Branch name
            // Account Number
            
            
            bankType = @"1";
            self.crs_NepaliBranch.hidden = YES;
            self.crs_CashPickUp.text = @"ACCOUNT CREDIT";
            self.crs_AccountCredit.hidden = YES;
            self.crs_BankAcountClick.hidden = YES;
            self.Crs_CashPay_view.hidden = YES;
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_BranchName.placeholder = @"Branch Name";
            self.crs_Ifsc.placeholder = @"Swift Code";
            self.crs_DropImage.hidden = YES;
            self.crs_BankAccount.hidden = NO;
            self.crs_Bankbuttonhider.hidden = YES;
            self.crs_BranchName.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
            
        }
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"PAKISTAN"]) {
            
            
            NSString * Accountnumber = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            
            if ([Accountnumber isEqualToString:@"null"]||[Accountnumber isEqualToString:@""]||[Accountnumber length] == 0)
                
            {
                
                [self.crs_BankAcountClick  setSelected:NO];
                [self.crs_IbanClick setSelected:NO];
                _Crs_CashPay_view.hidden =NO;
                self.crs_DateOfBirthField.hidden = NO;
                
                NSString *dateString = [self.crs_UpdateRecieverDetails valueForKey:@"dob"];
                NSDateFormatter *format = [[NSDateFormatter alloc] init];
                [format setDateFormat:@"yyyy-MM-dd"];
                NSDate *date = [format dateFromString:dateString];
                [format setDateFormat:@"MM-dd-yyyy"];
                NSString* finalDateString = [format stringFromDate:date];
                self.crs_DateOfBirthField.text = finalDateString;
                
                self.crs_DateOfBirthField.text = [self.crs_UpdateRecieverDetails valueForKey:@"dob"];
                self.crs_Ifsc.placeholder = @"Branch Code";
                
            }
            
            
            
            
            
            
            
            else{
                bankType = @"1";
                [self.crs_BankAcountClick  setSelected:YES];
                [self.crs_IbanClick setSelected:YES];
                _Crs_CashPay_view.hidden =YES;
                self.crs_BankAccount.hidden = NO;
                self.crs_NepalBranchNameLabel.hidden = YES;
                //                self.crs_Ifsc.text=[self.crs_UpdateRecieverDetails valueForKey:@"ifsc"];
                //                self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
                //                self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                //                self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
                //                self.crs_DropImage.hidden = NO;
                //                self.crs_DateOfBirthField.hidden = YES;
                //
                
                date1 = [self.crs_UpdateRecieverDetails valueForKey:@"dob"];
                self.crs_NepaliBranch.hidden = YES;
                self.crs_Bankbuttonhider.hidden = NO;
                self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
                self.crs_Ifsc.text=[self.crs_UpdateRecieverDetails valueForKey:@"ifsc"];
                self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];
                self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
                 self.crs_DateOfBirthField.hidden = NO;
               
                
                //self.crs_DropImage.hidden = NO;
                NSLog(@"USAS$$$$$$");
                
                // Select Bank
                // swift code
                // Branch name
                // Account Number
                
                
                
                
                //self.crs_CashPickUp.text = @"Account Credit";
                //                self.crs_AccountCredit.hidden = YES;
                //                self.crs_BankAcountClick.hidden = YES;
                //                self.Crs_CashPay_view.hidden = YES;
                //                self.crs_BranchName.placeholder = @"Branch Name";
                self.crs_Ifsc.placeholder = @"Branch Code";
                
                self.crs_DropImage.hidden = NO;
                self.crs_BankAccount.hidden = NO;
                self.crs_BranchName.hidden = NO;
                self.Crs_BranchOutlet.hidden = YES;
                self.crs_BanglaBranchLabel.hidden = YES;
                self.crs_banglaDrop.hidden = YES;
                
            }
            
            
            
            // bankType  = @"1";
            
            
            
            
        }
        
        
        
        //SINGAPORE,HONKONG, THAILAND,JAPAN,NEW ZEALAND,OMAN,SOUTH AFRICA
        else if ([self.crs_CounryField.text isEqualToString:@"SINGAPORE"]||[self.crs_CounryField.text isEqualToString:@"HONG KONG"]||[self.crs_CounryField.text isEqualToString:@"SOUTH AFRICA"]||[self.crs_CounryField.text isEqualToString:@"THAILAND"]||[self.crs_CounryField.text isEqualToString:@"JAPAN"]||[self.crs_CounryField.text isEqualToString:@"NEW ZEALAND"]||[self.crs_CounryField.text isEqualToString:@"OMAN"]) {
            
            bankType = @"1";
            
            
            self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            self.crs_Ifsc.text= [self.crs_UpdateRecieverDetails valueForKey:@"ifsc"];
            self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];;
            self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
            
            
            
            
            bankType = @"1";
            //
            //            self.crs_CashPickUp.text = @"Account Credit";
            //            self.crs_AccountCredit.hidden = YES;
            //            self.crs_BankAcountClick.hidden = YES;
            //            self.Crs_CashPay_view.hidden = YES;
            //            self.crs_BranchName.placeholder = @"Branch Name";
            //            self.crs_Ifsc.placeholder = @"IBAN";
            //             self.crs_BankAccount.hidden = YES;
            //            self.crs_BankAccount.hidden = NO;
            //
            
            [self.crs_BankAcountClick  setSelected:YES];
            self.crs_CashPickUp.text = @"ACCOUNT CREDIT";
            self.crs_AccountCredit.hidden = YES;
            self.crs_BankAcountClick.hidden = YES;
            self.Crs_CashPay_view.hidden = YES;
            self.crs_BranchName.placeholder = @"Account Number";
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNamePhonePad];
            [_crs_Ifsc reloadInputViews];
            
            self.crs_Ifsc.placeholder = @"Swift Code";
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_Bankbuttonhider.hidden = YES;
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_DropImage.hidden = YES;
            self.crs_DateOfBirthField.hidden = YES;
            [self.crs_IbanClick setSelected:NO];
            self.crs_BranchName.hidden = NO;
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            
            
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            NSLog(@"IRELAND$$$$$$");
            
            
            
            
            
            
            
            
            
            
        }
        
        
        
        //        IBAN-BULGARIA,ROMANIA, ISREAL, KUWAIT,QATAR,UNITED ARAB EMIRATES,SAUDI ARABIA,TURKEY,SWITZERLAND,CROATIA,BAHRAIN,POLAND
        else if ([self.crs_CounryField.text isEqualToString:@"BULGARIA"]||[self.crs_CounryField.text isEqualToString:@"ROMANIA"]||[self.crs_CounryField.text isEqualToString:@"ISRAEL"]||[self.crs_CounryField.text isEqualToString:@"KUWAIT"]||[self.crs_CounryField.text isEqualToString:@"QATAR"]||[self.crs_CounryField.text isEqualToString:@"UNITED ARAB EMIRATES"]||[self.crs_CounryField.text isEqualToString:@"SAUDI ARABIA"]||[self.crs_CounryField.text isEqualToString:@"TURKEY"]||[self.crs_CounryField.text isEqualToString:@"SWITZERLAND"]||[self.crs_CounryField.text isEqualToString:@"CROATIA"]||[self.crs_CounryField.text isEqualToString:@"BAHRAIN"]||[self.crs_CounryField.text isEqualToString:@"POLAND"]||[self.crs_CounryField.text isEqualToString:@"POLAND"]){
            
            bankType = @"1";
            
            self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            self.crs_Ifsc.text= [self.crs_UpdateRecieverDetails valueForKey:@"ifsc"];
            self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];;
            self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
            
            
            
            
            bankType = @"1";
            //
            //            self.crs_CashPickUp.text = @"Account Credit";
            //            self.crs_AccountCredit.hidden = YES;
            //            self.crs_BankAcountClick.hidden = YES;
            //            self.Crs_CashPay_view.hidden = YES;
            //            self.crs_BranchName.placeholder = @"Branch Name";
            //            self.crs_Ifsc.placeholder = @"IBAN";
            //             self.crs_BankAccount.hidden = YES;
            //            self.crs_BankAccount.hidden = NO;
            //
            
            
            self.crs_CashPickUp.text = @"ACCOUNT CREDIT";
            self.crs_AccountCredit.hidden = YES;
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_BankAcountClick.hidden = YES;
            self.Crs_CashPay_view.hidden = YES;
            self.crs_BranchName.placeholder = @"IBAN";
            self.crs_Ifsc.placeholder = @"Swift Code";
            self.crs_Bankbuttonhider.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_DropImage.hidden = YES;
            self.crs_BranchName.hidden = NO;
            self.crs_NepaliBranch.hidden = YES;
            
            
            
            
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
            
            
            
            
            
            
            
            
            
            
            
            
        }
        else if ([self.crs_CounryField.text isEqualToString:@"NEW ZEALAND"]||[self.crs_CounryField.text isEqualToString:@"OMAN"]||[self.crs_CounryField.text isEqualToString:@"HONG KONG"]||[self.crs_CounryField.text isEqualToString:@"SOUTH AFRICA"]||[self.crs_CounryField.text isEqualToString:@"SINGAPORE"]||[self.crs_CounryField.text isEqualToString:@"JAPAN"]||[self.crs_CounryField.text isEqualToString:@"THAILAND"]){
            
            bankType = @"1";
            
            self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            self.crs_Ifsc.text= [self.crs_UpdateRecieverDetails valueForKey:@"ifsc"];
            self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];;
            self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
            
            
            
            
            bankType = @"1";
            //
            //            self.crs_CashPickUp.text = @"Account Credit";
            //            self.crs_AccountCredit.hidden = YES;
            //            self.crs_BankAcountClick.hidden = YES;
            //            self.Crs_CashPay_view.hidden = YES;
            //            self.crs_BranchName.placeholder = @"Branch Name";
            //            self.crs_Ifsc.placeholder = @"IBAN";
            //             self.crs_BankAccount.hidden = YES;
            //            self.crs_BankAccount.hidden = NO;
            //
            
            
            self.crs_CashPickUp.text = @"ACCOUNT CREDIT";
            self.crs_AccountCredit.hidden = YES;
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_BankAcountClick.hidden = YES;
            self.Crs_CashPay_view.hidden = YES;
            self.crs_BranchName.placeholder = @"IBAN";
            self.crs_Ifsc.placeholder = @"Swift Code";
            self.crs_Bankbuttonhider.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_DropImage.hidden = YES;
            self.crs_BranchName.hidden = NO;
            self.crs_NepaliBranch.hidden = YES;
            
            
            
            
            
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
            
            
            
            
            
            
            
            
            
            
            
        }
        
        else if ([self.crs_CounryField.text isEqualToString:@"ZAMBIA"]||[self.crs_CounryField.text isEqualToString:@"ZIMBABWE"]){
            
            bankType = @"1";
            
            //self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            self.crs_Ifsc.text= [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];;
            
            
            
            
            
            
            
            
            
            
            // bankType = @"1";
            countryCode = @"ZMW";
            [self.crs_BankAcountClick  setSelected:YES];
            self.crs_CashPickUp.text = @"ACCOUNT CREDIT";
            self.crs_AccountCredit.hidden = YES;
            self.crs_BankAcountClick.hidden = YES;
            self.Crs_CashPay_view.hidden = YES;
            self.crs_BranchName.hidden = YES;
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNamePhonePad];
            [_crs_Ifsc reloadInputViews];
            self.crs_SelectBranch.hidden = NO;
            
            self.crs_Ifsc.placeholder = @"Account Number";
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_Bankbuttonhider.hidden =NO;
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_DropImage.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            [self.crs_IbanClick setSelected:NO];
            self.crs_BranchName.hidden = YES;
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
            
            
            
            
            
            
            
            
            
        }
        
        
        
        else {
            
            bankType = @"1";
            
            self.crs_BranchName.text = [self.crs_UpdateRecieverDetails valueForKey:@"account_num"];
            self.crs_Ifsc.text=[self.crs_UpdateRecieverDetails valueForKey:@"ifsc"];
            self.crs_SelectBranch.text=[self.crs_UpdateRecieverDetails valueForKey:@"bank_name"];;
            self.crs_BankAccount.text=[self.crs_UpdateRecieverDetails valueForKey:@"branch_name"];
            
            
            
            
            bankType = @"1";
            //
            //            self.crs_CashPickUp.text = @"Account Credit";
            //            self.crs_AccountCredit.hidden = YES;
            //            self.crs_BankAcountClick.hidden = YES;
            //            self.Crs_CashPay_view.hidden = YES;
            //            self.crs_BranchName.placeholder = @"Branch Name";
            //            self.crs_Ifsc.placeholder = @"IBAN";
            //             self.crs_BankAccount.hidden = YES;
            //            self.crs_BankAccount.hidden = NO;
            //
            
            
            self.crs_CashPickUp.text = @"ACCOUNT CREDIT";
            self.crs_AccountCredit.hidden = YES;
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_BankAcountClick.hidden = YES;
            self.Crs_CashPay_view.hidden = YES;
            self.crs_BranchName.placeholder = @"IBAN / Account Number";
            self.crs_Ifsc.placeholder = @"Swift Code";
            self.crs_Bankbuttonhider.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_DropImage.hidden = YES;
            self.crs_BranchName.hidden = NO;
            self.crs_NepaliBranch.hidden = YES;
            
            
            
            
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            NSLog(@"IRELAND$$$$$$");
            
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    else{
        
        
        
        
        
        
        self.crs_recieverlabel.text = @"Add Receiver";
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
}
-(UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



























- (IBAction)crs_MaleAction:(id)sender {
    
    gender = @"male";
    
    [self.crs_MaleClick setSelected:NO];
    [self.crs_FemaleClick setSelected:NO];
    
}

- (IBAction)crs_FenaleAction:(id)sender {
    
    gender = @"female";
    
    [self.crs_MaleClick setSelected:YES];
    [self.crs_FemaleClick setSelected:YES];
    
    
    
    
    
}

- (IBAction)crs_IbanAction:(id)sender {
    
    NSLog(@"Hi Cash pay has been taped");
    if ([self.crs_CounryField.text isEqualToString:@"IRELAND"]) {
        [self.crs_BankAcountClick  setSelected:NO];
        [self.crs_IbanClick setSelected:NO];
        
        
    }
    
    else  if ([self.crs_CounryField.text isEqualToString:@"UNITED STATES"])
    {
        PaymentType = @"CASH";
        [self.crs_BankAcountClick  setSelected:NO];
        [self.crs_IbanClick setSelected:NO];
        //        [self.crs_BankAccount setKeyboardType:UIKeyboardTypeNamePhonePad];
        //        [_crs_Ifsc reloadInputViews];
        
        
    }
    else  if ([self.crs_CounryField.text isEqualToString:@"INDIA"]||[self.crs_CounryField.text isEqualToString:@"PHILIPPINES"]||[self.crs_CounryField.text isEqualToString:@"PAKISTAN"]||[self.crs_CounryField.text isEqualToString:@"SRI LANKA"]||[self.crs_CounryField.text isEqualToString:@"NEPAL"]||[self.crs_CounryField.text isEqualToString:@"VIETNAM"]||[self.crs_CounryField.text isEqualToString:@"GAMBIA"])
    {
        bankType =@"0";
        PaymentType = @"CASH";
        [self.crs_BankAcountClick  setSelected:NO];
        [self.crs_IbanClick setSelected:NO];
        _Crs_CashPay_view.hidden =NO;
        
        
        
    }
    
    else  if ([self.crs_CounryField.text isEqualToString:@"KENYA"]||[self.crs_CounryField.text isEqualToString:@"TANZANIA"]||[self.crs_CounryField.text isEqualToString:@"UGANDA"]||[self.crs_CounryField.text isEqualToString:@"NIGERIA"]||[self.crs_CounryField.text isEqualToString:@"RWANDA"]||[self.crs_CounryField.text isEqualToString:@"GHANA"]||[self.crs_CounryField.text isEqualToString:@"BANGLADESH"])
    {
        bankType =@"0";
        PaymentType = @"Wallet";
        [self.crs_BankAcountClick  setSelected:NO];
        [self.crs_IbanClick setSelected:NO];
        _Crs_CashPay_view.hidden =NO;
        
        
        
    }
    
    
    
    else{
        
        [self.crs_BankAcountClick  setSelected:NO];
        [self.crs_IbanClick setSelected:NO];
        
        
    }
    
}

- (IBAction)crs_BankAccountNumber:(id)sender {
    PaymentType = @"ACCOUNT CREDIT";
    
    //    if ([self.crs_CounryField.text isEqualToString:@"Select Country"]) {
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"For Banks Please Select Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    ////
    ////        self.crs_Ifsc.hidden = YES;
    ////        self.crs_SelectBranch.hidden = YES;
    ////        self.crs_search.hidden = YES;
    ////          self.crs_BankAccount.hidden = YES;
    ////        //self.crs_BankAccount.hidden = NO;
    ////        self.crs_DropImage.hidden = YES;
    ////        self.crs_BranchName.hidden = YES;
    ////        self.crs_Bankbuttonhider.hidden = YES;
    ////        self.crs_Bankname.hidden = YES;
    ////
    //    }
    //
    
    
    
    bankType = @"1";
    
    
    if ([bankType isEqualToString:@"1"]) {
        
    }
    
    
    if ([self.crs_CounryField.text isEqualToString:@"INDIA"]) {
        
        CountryName = @"INDIA";
        
        
        
        
        
        
        self.crs_Ifsc.placeholder = @"IFSC ";
        
        self.crs_BankAccount.hidden = NO;
        
    }
    
    
    else if ([self.crs_CounryField.text isEqualToString:@"SRI LANKA"]) {
        
        CountryName = @"SRI LANKA";
        
        
        
        
        
        
        self.crs_Ifsc.placeholder = @"Branch Code ";
        
        self.crs_BankAccount.hidden = NO;
        self.crs_DropImage.hidden = NO;
    }
    
    
    
    
    
    else if ([self.crs_CounryField.text isEqualToString:@"IRELAND"]) {
        
        CountryName = @"IRELAND";
        
        self.crs_Ifsc.placeholder = @"IBAN";
        
        self.crs_BankAccount.hidden = NO;
        
    }
    
    
    
    else if ([self.crs_CounryField.text isEqualToString:@"PHILIPPINES"])
    {
        CountryName = @"PHILIPPINES";
        self.crs_Ifsc.placeholder = @"Branch name";
        self.crs_BranchName.placeholder = @"Account Number";;
        self.crs_BankAccount.hidden = YES;
        
        
        
        
    }
    
    else if ([self.crs_CounryField.text isEqualToString:@"KENYA"])
    {
        CountryName = @"KENYA";
        self.crs_Ifsc.placeholder = @"Account Number";
        //self.crs_BranchName.placeholder = @"Account Number";;
        self.crs_BankAccount.hidden = YES;
        
        
        
        
    }
    else if ([self.crs_CounryField.text isEqualToString:@"TANZANIA"]||[self.crs_CounryField.text isEqualToString:@"GHANA"]||[self.crs_CounryField.text isEqualToString:@"UGANDA"]||[self.crs_CounryField.text isEqualToString:@"NIGERIA"]||[self.crs_CounryField.text isEqualToString:@"RWANDA"])
    {
        CountryName = @"TANZANIA";
        self.crs_Ifsc.placeholder = @"Account Number";
        //self.crs_BranchName.placeholder = @"Account Number";;
        self.crs_BankAccount.hidden = YES;
        
        
        
        
    }
    
    
    
    else if ([self.crs_CounryField.text isEqualToString:@"NEPAL"])
    {
        CountryName = @"NEPAL";
        self.crs_Ifsc.placeholder = @"";
        self.crs_BranchName.placeholder = @"Account Number";;
        self.crs_BankAccount.hidden = YES;
        self.crs_NepalBranchNameLabel.hidden = NO;
        
        
        
    }
    else if ([self.crs_CounryField.text isEqualToString:@"BANGLADESH"])
    {
        CountryName = @"BANGLADESH";
        self.crs_Ifsc.placeholder = @"";
        self.crs_BranchName.placeholder = @"Account Number";;
        self.crs_BankAccount.hidden = YES;
        self.crs_NepalBranchNameLabel.hidden = NO;
        
        
        
    }
    
   
    
    
    
    
    
    else if ([self.crs_CounryField.text isEqualToString:@"UNITED STATES"]||[self.crs_CounryField.text isEqualToString:@"CANADA"])
    {
        CountryName = @"UNITED STATES";
        self.crs_BranchName.placeholder = @"Branch Name";
        self.crs_Ifsc.placeholder = @"Swift Code";
        self.crs_BankAccount.placeholder = @"Account Number ";
        self.crs_BankAccount.hidden = NO;
        self.crs_NepalBranchNameLabel.hidden = YES;
        
    }
    
    
    
    
    
    
    [self.crs_IbanClick setSelected:YES];
    [self.crs_BankAcountClick setSelected:YES];
    
    self.crs_NepalBranchNameLabel.hidden = YES;
    self.crs_CountrySelectorView.hidden = YES;
    _Crs_CashPay_view.hidden =YES;
    
    
}
- (IBAction)crs_BackAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}
- (IBAction)crs_HomeAction:(id)sender {
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    
}

- (IBAction)crs_History:(id)sender {
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"historyViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}





- (IBAction)crs_ProfileAction:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UpdateProfile* viewController = [storyboard instantiateViewControllerWithIdentifier:@"UpdateProfileViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

- (IBAction)crs_NotificationAction:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    notificationViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"notificationViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}

- (IBAction)crs_SettingsAction:(id)sender {
    
    
    
    
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    SettingsViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewControllerSid"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    
    
    
}
- (IBAction)crs_SaveAction:(id)sender {
    
    [self.view endEditing:YES];
    
    
    
    
    if ([EntityType isEqualToString:@"Individual"]&&![self.crs_CounryField.text isEqualToString:@"VIETNAM"]) {
        
        if ([self.crs_FirstNameField.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"First Name should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        
        else if ([self.crs_LastName.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Last Name should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        
        else if ([self.crs_CounryField.text isEqualToString:@"Select Country"]) {
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        
        else if ([self.crs_PhoneNumber.text isEqualToString:@""]){
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Phone Number should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            
            
        }
        
        else if ([self.crs_CityField.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter  City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        
        else  {
            
            // BOTTOM VIEW VALIDATIONS
            
            
            
            if ([bankType isEqualToString:@"1"]) {
                
                
                
                
                [self Bankvalidation];
                
                
                
                
                
                
            }
            
            
            
            else
            {
                if ([self.crs_CounryField.text isEqualToString:@"PAKISTAN"]) {
                    
                    
                    if ([self.crs_DateOfBirthField.text isEqualToString:@""]) {
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Date Of Birth should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                    }
                    else{
                        
                        if ([self.crs_Mobile.text isEqualToString:@""]){
                            
                            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Mobile Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            
                            [alert show];
                            return;
                            
                            
                        }  else if (self.crs_Mobile.text.length <9)
                            
                            
                        {
                            
                            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            
                            [alert show];
                            return;
                            
                            
                            
                            
                        }
                        
                        [self Crs_AccountCredit];
                        
                        
                    }
                }
                
                else if ([self.crs_CounryField.text isEqualToString:@"SRI LANKA"])
                {
                    
                    
                    
                    if ([self.crs_Mobile.text isEqualToString:@""]) {
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter  Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                    }
                    else{
                        
                        if ([self.crs_Mobile.text isEqualToString:@""]){
                            
                            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Mobile Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            
                            [alert show];
                            return;
                            
                            
                        }
                        else if (self.crs_Mobile.text.length <9)
                            
                            
                        {
                            
                            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            
                            [alert show];
                            return;
                            
                            
                            
                            
                        }
                        
                        [self Crs_AccountCredit];
                        
                        
                    }
                    
                    
                }
                else if ([self.crs_CounryField.text isEqualToString:@"KENYA"]||[self.crs_CounryField.text isEqualToString:@"UGANDA"]||[self.crs_CounryField.text isEqualToString:@"NIGERIA"]||[self.crs_CounryField.text isEqualToString:@"RWANDA"]||[self.crs_CounryField.text isEqualToString:@"GHANA"])
                {
                    
                    
                    
                    if ([self.crs_Mobile.text isEqualToString:@""]) {
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter  Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                    }
                    else{
                        
                        if ([self.crs_Mobile.text isEqualToString:@""]){
                            
                            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Mobile Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            
                            [alert show];
                            return;
                            
                            
                        }
                        else if (self.crs_Mobile.text.length <8)
                            
                            
                        {
                            
                            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            
                            [alert show];
                            return;
                            
                            
                            
                            
                        }
                        
                        [self Crs_AccountCredit];
                        
                        
                    }
                    
                    
                }
                else if ([self.crs_CounryField.text isEqualToString:@"TANZANIA"])
                {
                    
                    
                    
                    if ([self.crs_Mobile.text isEqualToString:@""]) {
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter  Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                    }
                    else{
                        
                        if ([self.crs_Mobile.text isEqualToString:@""]){
                            
                            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Mobile Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            
                            [alert show];
                            return;
                            
                            
                        }
                        else if (self.crs_Mobile.text.length <8)
                            
                            
                        {
                            
                            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            
                            [alert show];
                            return;
                            
                            
                            
                            
                        }
                        
                        [self Crs_AccountCredit];
                        
                        
                    }
                    
                    
                }
                else{
                    
                    if ([self.crs_Mobile.text isEqualToString:@""]){
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Mobile Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        return;
                        
                        
                    }  else if (self.crs_Mobile.text.length <9)
                        
                        
                    {
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        return;
                        
                        
                        
                        
                    }
                    
                    [self Crs_AccountCredit];
                }
                
                
                
                
            }
        }
        
        
        
        
        
    }
    
    
    
    else if ([EntityType isEqualToString:@"Corparate"]&&![self.crs_CounryField.text isEqualToString:@"VIETNAM"]){
        
        if ([_crs_EntityName.text isEqualToString:@""]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Entity Name should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"Select Country"]) {
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        
        
        
        
        else if ([self.crs_PhoneNumber.text isEqualToString:@""]){
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Phone Number should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            
            
        }
        
        else if ([self.crs_CityField.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter  City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        
        
        else  {
            
            // BOTTOM VIEW VALIDATIONS
            
            
            
            if ([bankType isEqualToString:@"1"]) {
                
                
                
                
                [self Bankvalidation];
                
                
                
                
                
                
            }
            
            
            
            else
            {
                if ([self.crs_CounryField.text isEqualToString:@"PAKISTAN"]) {
                    
                    
                    if ([self.crs_DateOfBirthField.text isEqualToString:@""]) {
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Date Of Birth should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                    }
                    else{
                        
                        if ([self.crs_Mobile.text isEqualToString:@""]){
                            
                            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Mobile Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            
                            [alert show];
                            return;
                            
                            
                        }  else if (self.crs_Mobile.text.length <9)
                            
                            
                        {
                            
                            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            
                            [alert show];
                            return;
                            
                            
                            
                            
                        }
                        
                        [self Crs_AccountCredit];
                        
                        
                    }
                }
                
                else if ([self.crs_CounryField.text isEqualToString:@"SRI LANKA"])
                {
                    
                    
                    
                    if ([self.crs_Mobile.text isEqualToString:@""]) {
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter  Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                    }
                    else{
                        
                        if ([self.crs_Mobile.text isEqualToString:@""]){
                            
                            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Mobile Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            
                            [alert show];
                            return;
                            
                            
                        }
                        else if (self.crs_Mobile.text.length <9)
                            
                            
                        {
                            
                            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            
                            [alert show];
                            return;
                            
                            
                            
                            
                        }
                        
                        [self Crs_AccountCredit];
                        
                        
                    }
                    
                    
                }
                else if ([self.crs_CounryField.text isEqualToString:@"KENYA"]||[self.crs_CounryField.text isEqualToString:@"UGANDA"]||[self.crs_CounryField.text isEqualToString:@"NIGERIA"]||[self.crs_CounryField.text isEqualToString:@"RWANDA"]||[self.crs_CounryField.text isEqualToString:@"GHANA"])
                {
                    
                    
                    
                    if ([self.crs_Mobile.text isEqualToString:@""]) {
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter  Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                    }
                    else{
                        
                        if ([self.crs_Mobile.text isEqualToString:@""]){
                            
                            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Mobile Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            
                            [alert show];
                            return;
                            
                            
                        }
                        else if (self.crs_Mobile.text.length <8)
                            
                            
                        {
                            
                            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            
                            [alert show];
                            return;
                            
                            
                            
                            
                        }
                        
                        [self Crs_AccountCredit];
                        
                        
                    }
                    
                    
                }
                else if ([self.crs_CounryField.text isEqualToString:@"TANZANIA"])
                {
                    
                    
                    
                    if ([self.crs_Mobile.text isEqualToString:@""]) {
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter  Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                    }
                    else{
                        
                        if ([self.crs_Mobile.text isEqualToString:@""]){
                            
                            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Mobile Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            
                            [alert show];
                            return;
                            
                            
                        }
                        else if (self.crs_Mobile.text.length <8)
                            
                            
                        {
                            
                            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                            
                            [alert show];
                            return;
                            
                            
                            
                            
                        }
                        
                        [self Crs_AccountCredit];
                        
                        
                    }
                    
                    
                }
                else{
                    
                    if ([self.crs_Mobile.text isEqualToString:@""]){
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Mobile Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        return;
                        
                        
                    }  else if (self.crs_Mobile.text.length <9)
                        
                        
                    {
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        return;
                        
                        
                        
                        
                    }
                    
                    [self Crs_AccountCredit];
                }
                
                
                
                
            }
        }
        
        
        
    }
    
    
    
    else if ([self.crs_CounryField.text isEqualToString:@"VIETNAM"]) {
        [self Vietnam];
        return;
    }
    
    
    
    
    
    
    
    else  {
        
        // BOTTOM VIEW VALIDATIONS
        
        
        
        if ([bankType isEqualToString:@"1"]) {
            
            
            
            
            [self Bankvalidation];
            
            
            
            
            
            
        }
        
        
        
        else
        {
            if ([self.crs_CounryField.text isEqualToString:@"PAKISTAN"]) {
                
                
                if ([self.crs_DateOfBirthField.text isEqualToString:@""]) {
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Date Of Birth should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                }
                else{
                    
                    if ([self.crs_Mobile.text isEqualToString:@""]){
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Mobile Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        return;
                        
                        
                    }  else if (self.crs_Mobile.text.length <9)
                        
                        
                    {
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        return;
                        
                        
                        
                        
                    }
                    
                    [self Crs_AccountCredit];
                    
                    
                }
            }
            
            else if ([self.crs_CounryField.text isEqualToString:@"SRI LANKA"])
            {
                
                
                
                if ([self.crs_Mobile.text isEqualToString:@""]) {
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter  Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                }
                else{
                    
                    if ([self.crs_Mobile.text isEqualToString:@""]){
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Mobile Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        return;
                        
                        
                    }
                    else if (self.crs_Mobile.text.length <9)
                        
                        
                    {
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        return;
                        
                        
                        
                        
                    }
                    
                    [self Crs_AccountCredit];
                    
                    
                }
                
                
            }
            else if ([self.crs_CounryField.text isEqualToString:@"KENYA"]||[self.crs_CounryField.text isEqualToString:@"UGANDA"]||[self.crs_CounryField.text isEqualToString:@"NIGERIA"]||[self.crs_CounryField.text isEqualToString:@"RWANDA"]||[self.crs_CounryField.text isEqualToString:@"GHANA"])
            {
                
                
                
                if ([self.crs_Mobile.text isEqualToString:@""]) {
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter  Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                }
                else{
                    
                    if ([self.crs_Mobile.text isEqualToString:@""]){
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Mobile Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        return;
                        
                        
                    }
                    else if (self.crs_Mobile.text.length <8)
                        
                        
                    {
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        return;
                        
                        
                        
                        
                    }
                    
                    [self Crs_AccountCredit];
                    
                    
                }
                
                
            }
            else if ([self.crs_CounryField.text isEqualToString:@"TANZANIA"])
            {
                
                
                
                if ([self.crs_Mobile.text isEqualToString:@""]) {
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter  Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                }
                else{
                    
                    if ([self.crs_Mobile.text isEqualToString:@""]){
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Mobile Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        return;
                        
                        
                    }
                    else if (self.crs_Mobile.text.length <8)
                        
                        
                    {
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        return;
                        
                        
                        
                        
                    }
                    
                    [self Crs_AccountCredit];
                    
                    
                }
                
                
            }
            else{
                
                if ([self.crs_Mobile.text isEqualToString:@""]){
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Mobile Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    return;
                    
                    
                }  else if (self.crs_Mobile.text.length <9)
                    
                    
                {
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    return;
                    
                    
                    
                    
                }
                
                [self Crs_AccountCredit];
            }
            
            
            
            
        }
    }
    
}

-(void)Bankvalidation

{
    
    
    
    if ([self.crs_CounryField.text isEqualToString:@"SRI LANKA"]) {
        
        if ([self.crs_SelectBranch.text isEqualToString:@""]) {
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Choose Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        else if ([self.crs_Ifsc.text isEqualToString:@""]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please enter  Branch Code " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        else
            
            if ([self.crs_BranchName.text isEqualToString:@""]) {
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Branch Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
            }
        
        
        
        
        
            else if ([self.crs_BankAccount.text isEqualToString:@""]) {
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please enter  Account number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
            }
        
        
        
        
            else if ([self.crs_SelectBranch.text isEqualToString:@""]) {
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Choose Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
            }
        
            else if ([self.crs_Mobile.text isEqualToString:@""]) {
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter Your Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
            }
            else if (self.crs_Mobile.text.length <9)
                
                
            {
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                return;
                
                
                
                
            }
        
        
        
            else{
                
                [self Crs_AccountCredit];
            }
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    else   if ([self.crs_CounryField.text isEqualToString:@"INDIA"]) {
        
        
        if ([self.crs_SelectBranch.text isEqualToString:@""]||[self.crs_SelectBranch.text isEqualToString:@"(null)"]) {
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Choose Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        else if ([self.crs_Ifsc.text isEqualToString:@""]||[self.crs_Ifsc.text isEqualToString:@"(null)"]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please enter  IFSC " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        else if (self.crs_Ifsc.text.length <11) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter   a Valid IFSC " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        
        
        
        else if ([self.crs_BranchName.text isEqualToString:@""]||[self.crs_BranchName.text isEqualToString:@"(null)"]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Branch Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        
        
        
        
        
        else if ([self.crs_BankAccount.text isEqualToString:@""]||[self.crs_BankAccount.text isEqualToString:@"(null)"]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please enter  Account number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        
        
        
        
        else if ([self.crs_SelectBranch.text isEqualToString:@""]||[self.crs_SelectBranch.text isEqualToString:@"(null)"]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Choose Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        
        
        
        
        else{
            
            [self Crs_AccountCredit];
        }
        
        
        
    }
    
    
    
    
    
    
    else   if ([_crs_CounryField.text isEqualToString:@"TANZANIA"]||[_crs_CounryField.text isEqualToString:@"KENYA"]||[_crs_CounryField.text isEqualToString:@"GHANA"]||[_crs_CounryField.text isEqualToString:@"UGANDA"]||[_crs_CounryField.text isEqualToString:@"RWANDA"]||[_crs_CounryField.text isEqualToString:@"NIGERIA"]) {
        
        if ([self.crs_Mobile.text isEqualToString:@""]) {
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        else if (self.crs_Mobile.text.length <5)
            
            
        {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            return;
            
            
            
            
        }
        
        
        else if ([self.crs_SelectBranch.text isEqualToString:@""]||[self.crs_SelectBranch.text isEqualToString:@"(null)"]) {
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Choose Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        else if ([self.crs_Ifsc.text isEqualToString:@""]||[self.crs_Ifsc.text isEqualToString:@"(null)"]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please  Enter  Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        else if (self.crs_Ifsc.text.length <8) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter   a Valid Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        
        
        
        else{
            
            [self Crs_AccountCredit];
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    else   if ([self.crs_CounryField.text isEqualToString:@"PHILIPPINES"]||[self.crs_CounryField.text isEqualToString:@"NEPAL"]||[self.crs_CounryField.text isEqualToString:@"BANGLADESH"]) {
        
        
        if ([self.crs_CounryField.text isEqualToString:@"VIETNAM"]) {
            if ([self.crs_SelectBranch.text isEqualToString:@""]||[self.crs_SelectBranch.text isEqualToString:@"(null)"]) {
                
                
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Select Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                
                
            }
            else if ([self.crs_Ifsc.text isEqualToString:@""]||[self.crs_Ifsc.text isEqualToString:@"(null)"]) {
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter Branch Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
            }
            else
                
                if ([self.crs_BranchName.text isEqualToString:@""]||[self.crs_BranchName.text isEqualToString:@"(null)"]) {
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please enter  Account number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                }
            
            
            
            
            
            
            
                else{
                    
                    [self Crs_AccountCredit];
                }
        }
        
        if ([self.crs_SelectBranch.text isEqualToString:@""]||[self.crs_SelectBranch.text isEqualToString:@"(null)"]) {
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Select Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            
            
        }
        else if ([self.crs_Ifsc.text isEqualToString:@""]||[self.crs_Ifsc.text isEqualToString:@"(null)"]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter Branch Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        else
            
            if ([self.crs_BranchName.text isEqualToString:@""]||[self.crs_BranchName.text isEqualToString:@"(null)"]) {
                
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please enter  Account number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                
            }
        
        
        
        
        
        
        
            else{
                
                [self Crs_AccountCredit];
            }
        
        
        
        
    }
    
    
    
    else   if ([self.crs_CounryField.text isEqualToString:@"PAKISTAN"]) {
        
        
        if ([self.crs_SelectBranch.text isEqualToString:@""]||[self.crs_SelectBranch.text isEqualToString:@"(null)"]) {
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please select bank name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        else if ([self.crs_Ifsc.text isEqualToString:@""]||[self.crs_Ifsc.text isEqualToString:@"(null)"]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please enter  Branch Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        else if ([self.crs_BranchName.text isEqualToString:@""]||[self.crs_BranchName.text isEqualToString:@"(null)"]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please enter  Branch" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        
        
        else if ([self.crs_DateOfBirthField.text isEqualToString:@""]||[self.crs_DateOfBirthField.text isEqualToString:@"(null)"]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Date Of Birth" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        
        
        
        
        
        else if ([self.crs_BankAccount.text isEqualToString:@""]||[self.crs_BankAccount.text isEqualToString:@"(null)"]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please enter  Account number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        
        
        
        
        
        
        
        else{
            
            [self Crs_AccountCredit];
        }
        
        
        
        
    }
    
    
    //else if ([self.crs_CounryField.text isEqualToString:@"UNITED STATES"])
    //    {
    //
    //        if ([self.crs_SelectBranch.text isEqualToString:@""]) {
    //
    //
    //            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter bank name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //            [alert show];
    //
    //        }
    //        else if ([self.crs_Ifsc.text isEqualToString:@""]) {
    //            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please enter  swift code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //            [alert show];
    //        }
    //        else if ([self.crs_BranchName.text isEqualToString:@""]) {
    //            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please enter  Branch" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //            [alert show];
    //        }
    //
    //
    //
    //
    //
    //        else if ([self.crs_BankAccount.text isEqualToString:@""]) {
    //
    //            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please enter  IBAN / Account number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //            [alert show];
    //
    //        }
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //
    //        else{
    //
    //            [self Crs_AccountCredit];
    //        }
    //
    //
    //
    //
    //    }
    
    
    else if ([self.crs_CounryField.text isEqualToString:@"SIERRA LEONE"]||[self.crs_CounryField.text isEqualToString:@"CANADA"]||[self.crs_CounryField.text isEqualToString:@"UNITED STATES"]||[self.crs_CounryField.text isEqualToString:@"AUSTRALIA"]) {
        
        
        if ([self.crs_SelectBranch.text isEqualToString:@""]) {
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter bank name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        else if ([self.crs_Ifsc.text isEqualToString:@""]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please enter  swift code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        else if ([self.crs_BranchName.text isEqualToString:@""]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please enter  Branch" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        
        
        
        
        
        else if ([self.crs_BankAccount.text isEqualToString:@""]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please enter  Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        else{
            
            [self Crs_AccountCredit];
        }
        
        
        
        
    }
    //IBAN-BULGARIA,ROMANIA, ISREAL, KUWAIT,QATAR,UNITED ARAB EMIRATES,SAUDI ARABIA,TURKEY,SWITZERLAND,CROATIA,BAHRAIN,POLAND
    
    
    //SINGAPORE,HONKONG, THAILAND,JAPAN,NEW ZEALAND,OMAN,SOUTH AFRICA
    
    else if ([self.crs_CounryField.text isEqualToString:@"SINGAPORE"]||[self.crs_CounryField.text isEqualToString:@"HONG KONG"]||[self.crs_CounryField.text isEqualToString:@"THAILAND"]||[self.crs_CounryField.text isEqualToString:@"JAPAN"]||[self.crs_CounryField.text isEqualToString:@"NEW ZEALAND"]||[self.crs_CounryField.text isEqualToString:@"OMAN"]||[self.crs_CounryField.text isEqualToString:@"SOUTH AFRICA"]) {
        
        
        if ([self.crs_SelectBranch.text isEqualToString:@""]) {
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        else if ([self.crs_Ifsc.text isEqualToString:@""]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Swift Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        
        else if (self.crs_Ifsc.text.length <7) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter a valid swift code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        
        else  if ([self.crs_BranchName.text isEqualToString:@""]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        
        
        
        
        
        else{
            
            [self Crs_AccountCredit];
        }
        
        
        
        
    }
    
    else if ([self.crs_CounryField.text isEqualToString:@"BULGARIA"]||[self.crs_CounryField.text isEqualToString:@"ROMANIA"]||[self.crs_CounryField.text isEqualToString:@"ISRAEL"]||[self.crs_CounryField.text isEqualToString:@"KUWAIT"]||[self.crs_CounryField.text isEqualToString:@"QATAR"]||[self.crs_CounryField.text isEqualToString:@"UNITED ARAB EMIRATES"]||[self.crs_CounryField.text isEqualToString:@"SAUDI ARABIA"]||[self.crs_CounryField.text isEqualToString:@"TURKEY"]||[self.crs_CounryField.text isEqualToString:@"SWITZERLAND"]||[self.crs_CounryField.text isEqualToString:@"CROATIA"]||[self.crs_CounryField.text isEqualToString:@"BAHRAIN"]||[self.crs_CounryField.text isEqualToString:@"POLAND"])
        
        
    {
        
        if ([self.crs_SelectBranch.text isEqualToString:@""]) {
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        else if ([self.crs_Ifsc.text isEqualToString:@""]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Swift Code " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        
        else if (self.crs_Ifsc.text.length <8) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please enter a valid swift code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        
        else  if ([self.crs_BranchName.text isEqualToString:@""]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter IBAN" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        
        else if (self.crs_BranchName.text.length <15) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter   a Valid IBAN " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        
        
        else{
            
            [self Crs_AccountCredit];
        }
        
        
        
    }
    else if ([self.crs_CounryField.text isEqualToString:@"ZAMBIA"]||[self.crs_CounryField.text isEqualToString:@"ZIMBABWE"])
        
        
    {
        
        if ([self.crs_SelectBranch.text isEqualToString:@""]) {
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Select Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        else if ([self.crs_Ifsc.text isEqualToString:@""]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        }
        
        
        
        else{
            
            [self Crs_AccountCredit];
        }
        
        
        
    }
    else
    {
        
        if ([self.crs_SelectBranch.text isEqualToString:@""]) {
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
        }
        else if ([self.crs_Ifsc.text isEqualToString:@""]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Swift Code " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            
        }
        
        else  if ([self.crs_BranchName.text isEqualToString:@""]) {
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter IBAN / Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        
        
        //
        //        else if ([self.crs_BankAccount.text isEqualToString:@""]) {
        //
        //            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please enter  Account number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        //
        //            [alert show];
        //
        //        }
        //
        
        else{
            
            [self Crs_AccountCredit];
        }
        
        
        
        
    }
    
}
















- (void)Crs_AccountCredit
{
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    
    NSURL * url;
    
    if ([_crs_Comparsion isEqualToString:@"update"]) {
        
        
        
        url  = [NSURL URLWithString:Crosspay_UpdateReciever];
        
        
        
    }
    
    else{
        
        
        
        url = [NSURL URLWithString:Crosspay_AddReciever];
        
        
        
        
        
        
        
        
        
    }
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    
    
    
    
    
    
    
    
    
    
    //    CGSize imagsize=CGSizeMake(150,150);
    //    UIImage *convertimage= [self imageWithImage:self.crs_RecieverImage.image convertToSize:imagsize];
    //    NSString *tempImageNSString = [self encodeToBase64String:convertimage];
    //
    //
    
    
    
    
    
    [mapData setObject:@"" forKey:@"pincode"];
    
    [mapData setObject:self.crs_FirstNameField.text forKey:@"first_name"];
    
    [mapData setObject:self.crs_MiddleNameField.text forKey:@"middle_name"];
    
    if ([EntityType isEqualToString:@"Corparate"]) {
        [mapData setObject:@"" forKey:@"last_name"];
        [mapData setObject:self.crs_EntityName.text forKey:@"first_name"];
        
    }
    else{
        
        [mapData setObject:self.crs_LastName.text forKey:@"last_name"];
    }
    
    
    [mapData setObject:self.crs_CounryField.text forKey:@"country"];
    
    [mapData setObject:self.crs_Mobile.text forKey:@"mobile"];
    
    if ([EntityType isEqualToString:@"Individual"]) {
        [mapData setObject:@"I" forKey:@"entitytype"];
    } else {
        [mapData setObject:@"C" forKey:@"entitytype"];
    }
    
    
    if ([PaymentType isEqualToString:@"Wallet"]) {
        
        @try {
            
            if ([bankType isEqualToString:@"1"]) {
                [mapData setObject:@"ACCOUNT" forKey:@"payment_type"];
                
                NSLog(@"My Payment Type is %d",1);
            }
            else if ([bankType isEqualToString:@"0"]){
                [mapData setObject:@"WALLET" forKey:@"payment_type"];
                NSLog(@"My Payment Type is %d",0);
                
            }
            
            
            
            
        }
        @catch (NSException * e) {
            
            NSLog(@" HELLO THERE Exception: %@", e);
        }
        @finally {
            NSLog(@"finally");
        }
        NSLog(@"%@ sai Kiran Kunchala",mapData);
    } else {
        @try {
            
            
            
            if ([bankType isEqualToString:@"1"]) {
                [mapData setObject:@"ACCOUNT" forKey:@"payment_type"];
                
                NSLog(@"My Payment Type is %d",1);
            }
            else if ([bankType isEqualToString:@"0"]){
                [mapData setObject:@"CASH" forKey:@"payment_type"];
                NSLog(@"My Payment Type is %d",0);
                
            }
            
            
        }
        @catch (NSException * e) {
            
            NSLog(@" HELLO THERE Exception: %@", e);
        }
        @finally {
            NSLog(@"finally");
        }
        NSLog(@"%@ sai Kiran Kunchala",mapData);
        
        
        
        
    }
    
    
    @try {
        if ([self.crs_CounryField.text isEqualToString:@"VIETNAM"]) {
            [mapData setObject:citys forKey:@"city"];
            [mapData setObject:self.crs_VietnamMobile.text forKey:@"mobile"];
            [mapData setObject:DistrictCode forKey:@"district"];
            [mapData setObject:wardCode forKey:@"ward"];
        }
        else{
            [mapData setObject:self.crs_CityField.text forKey:@"city"];
            [mapData setObject:self.crs_Mobile.text forKey:@"mobile"];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        
    }
    @finally {
        NSLog(@"Finally condition");
    }
    
    
    
    
    
    
    
    
    
    
    [mapData setObject:@""forKey:@"state"];
    
    if ([bankType isEqualToString:@"1"]) {
        
        [mapData setObject:self.crs_BankAccount.text forKey:@"account_number"];
        NSLog(@"My Payment Type is %d",1);
    }
    else if ([bankType isEqualToString:@"0"]){
        
        [mapData setObject:@"" forKey:@"account_number"];
        NSLog(@"My Payment Type is %d",0);
        
    }
    
    
    [mapData setObject:countryCode forKey:@"ccycode"];
    
    
    
    NSLog(@"%@",self.crs_PhoneNumber);
    
    if ([bankType isEqualToString:@"1"]) {
        
        
        // @"INDIA",@"PHILIPPINES",@"USA",@"IRELAND"
        
        if ([self.crs_CounryField.text isEqualToString:@"INDIA"]) {
            [mapData setObject:self.crs_BranchName.text forKey:@"branch_name"];
            [mapData setObject:self.crs_Ifsc.text forKey:@"ifsc"];
            [mapData setObject:self.crs_SelectBranch.text forKey:@"bank_name"];
            [mapData setObject:self.crs_BankAccount.text forKey:@"account_number"];
            
            [mapData setObject:@"1" forKey:@"payment_type"];
            
            // Branch Name
            // Ifsc Code
            // Account Number
            // ba nk name
        }
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"SRI LANKA"]) {
            
            [mapData setObject:self.crs_BranchName.text forKey:@"branch_name"];
            [mapData setObject:self.crs_Ifsc.text forKey:@"branch_code"];
            [mapData setObject:self.crs_SelectBranch.text forKey:@"bank_name"];
            [mapData setObject:self.crs_BankAccount.text forKey:@"account_number"];
            [mapData setObject:crs_bankCode forKey:@"bank_code"];
            
            
        }
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"PHILIPPINES"]) {
            
            [mapData setObject:self.crs_Ifsc.text forKey:@"branch_name"];
            [mapData setObject:self.crs_SelectBranch.text forKey:@"bank_name"];
            [mapData setObject:self.crs_BranchName.text forKey:@"account_number"];
            [mapData setObject:crs_bankCode forKey:@"bank_code"];
            
            
            
            
            
        }
        
        else if ([self.crs_CounryField.text isEqualToString:@"BANGLADESH"]) {
            
            [mapData setObject:self.crs_Ifsc.text forKey:@"branch_name"];
            [mapData setObject:self.crs_SelectBranch.text forKey:@"bank_name"];
            [mapData setObject:self.crs_BranchName.text forKey:@"account_number"];
            [mapData setObject:crs_bankCode forKey:@"bank_code"];
            [mapData setObject:crs_branchCode forKey:@"branch_code"];
          [mapData setObject:@"1" forKey:@"payment_type"];
            
            
            
            
        }
        else if ([self.crs_CounryField.text isEqualToString:@"KENYA"]||[_crs_CounryField.text isEqualToString:@"TANZANIA"]||[self.crs_CounryField.text isEqualToString:@"UGANDA"]||[self.crs_CounryField.text isEqualToString:@"GHANA"]||[self.crs_CounryField.text isEqualToString:@"NIGERIA"]||[self.crs_CounryField.text isEqualToString:@"RWANDA"]) {
            
            [mapData setObject:self.crs_Ifsc.text forKey:@"account_number"];
            [mapData setObject:self.crs_SelectBranch.text forKey:@"bank_name"];
            //            [mapData setObject:self.crs_BranchName.text forKey:@"account_number"];
            [mapData setObject:crs_bankCode forKey:@"bank_code"];
            
            
            
            
            
        }
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"VIETNAM"]) {
            
            [mapData setObject:self.crs_Ifsc.text forKey:@"branch_name"];
            [mapData setObject:self.crs_SelectBranch.text forKey:@"bank_name"];
            [mapData setObject:self.crs_BranchName.text forKey:@"account_number"];
            [mapData setObject:crs_bankCode forKey:@"bank_code"];
            [mapData setObject:citys forKey:@"city"];
            //           [mapData setObject:DistrictCode forKey:@"district"];
            
            @try {
                
                
                
                [mapData setObject:DistrictCode forKey:@"districtId"];
                
            }
            @catch (NSException * e) {
                
                NSLog(@" HELLO THERE Exception: %@", e);
            }
            @finally {
                NSLog(@"finally");
            }
            NSLog(@"%@ sai Kiran Kunchala",mapData);
            
            @try {
                
                
                
                [mapData setObject:wardCode forKey:@"ward"];
                
            }
            @catch (NSException * e) {
                
                NSLog(@" HELLO THERE Exception: %@", e);
            }
            @finally {
                NSLog(@"finally");
            }
            NSLog(@"%@ sai Kiran Kunchala",mapData);
            
            
            
            
            
            
        }
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"NEPAL"]) {
            
            [mapData setObject:self.crs_Ifsc.text forKey:@"branch_name"];
            [mapData setObject:self.crs_SelectBranch.text forKey:@"bank_name"];
            [mapData setObject:self.crs_BranchName.text forKey:@"account_number"];
            
            [mapData setObject:crs_branchCode forKey:@"branch_code"];
            
            [mapData setObject:crs_bankCode forKey:@"bank_code"];
            
            
            
            
            
        }
        //
        //       else if ([self.crs_CounryField.text isEqualToString:@"VIETNAM"]){
        //
        //
        //           [mapData setObject:self.crs_Ifsc.text forKey:@"branch_name"];
        //           [mapData setObject:self.crs_SelectBranch.text forKey:@"bank_name"];
        //           [mapData setObject:self.crs_BranchName.text forKey:@"account_number"];
        //
        //           [mapData setObject:crs_branchCode forKey:@"branch_code"];
        //
        //           [mapData setObject:crs_bankCode forKey:@"bank_code"];
        //             [mapData setObject:DistrictCode forKey:@"DISTRICT_ID"];
        //
        //
        //       }
        //
        //
        
        
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"UNITED STATES"]||[self.crs_CounryField.text isEqualToString:@"CANADA"]) {
            [mapData setObject:self.crs_BranchName.text forKey:@"branch_name"];
            [mapData setObject:self.crs_Ifsc.text forKey:@"ifsc"];
            [mapData setObject:self.crs_SelectBranch.text forKey:@"bank_name"];
            [mapData setObject:self.crs_BankAccount.text forKey:@"account_number"];
            
            
            
            
            
            
            
        }
        else if ([self.crs_CounryField.text isEqualToString:@"AUSTRALIA"]||[self.crs_CounryField.text isEqualToString:@"SIERRA LEONE"]) {
            [mapData setObject:self.crs_BranchName.text forKey:@"branch_name"];
            [mapData setObject:self.crs_Ifsc.text forKey:@"ifsc"];
            [mapData setObject:self.crs_SelectBranch.text forKey:@"bank_name"];
            [mapData setObject:self.crs_BankAccount.text forKey:@"account_number"];
            
            
            
            
            
            
            
        }
        
        else if ([self.crs_CounryField.text isEqualToString:@"PAKISTAN"]) {
            
            
            [mapData setObject:self.crs_BranchName.text forKey:@"branch_name"];
            [mapData setObject:self.crs_Ifsc.text forKey:@"ifsc"];
            [mapData setObject:self.crs_SelectBranch.text forKey:@"bank_name"];
            [mapData setObject:self.crs_BankAccount.text forKey:@"account_number"];
            @try {
                 [mapData setObject:date1 forKey:@"dob"];
            } @catch (NSException *exception) {
                NSLog(@"Exception%@",exception);
            } @finally {
                NSLog(@"Finally");
            }
           
            
            
            
            
            
            
        }
        
        
        
        //SINGAPORE,HONKONG, THAILAND,JAPAN,NEW ZEALAND,OMAN,SOUTH AFRICA
        else if ([self.crs_CounryField.text isEqualToString:@"SINGAPORE"]||[self.crs_CounryField.text isEqualToString:@"THAILAND"]||[self.crs_CounryField.text isEqualToString:@"HONG KONG"]||[self.crs_CounryField.text isEqualToString:@"JAPAN"]||[self.crs_CounryField.text isEqualToString:@"NEW ZEALAND"]||[self.crs_CounryField.text isEqualToString:@"OMAN"]||[self.crs_CounryField.text isEqualToString:@"SOUTH AFRICA"]){
            
            [mapData setObject:self.crs_Ifsc.text forKey:@"ifsc"];
            [mapData setObject:self.crs_BranchName.text forKey:@"account_number"];
            //            [mapData setObject:self.crs_Ifsc.text forKey:@"account_number"];
            [mapData setObject:self.crs_SelectBranch.text forKey:@"bank_name"];
            //[mapData setObject:self.crs_BankAccount.text forKey:@"account_number"];
            self.crs_Bankbuttonhider.hidden = YES;
            
            
            
            
        }
        //
        //        IBAN-BULGARIA,ROMANIA, ISREAL, KUWAIT,QATAR,UNITED ARAB EMIRATES,SAUDI ARABIA,TURKEY,SWITZERLAND,CROATIA,BAHRAIN,POLAND
        //
        //        IBAN-BULGARIA,ROMANIA, ISREAL, KUWAIT,QATAR,UNITED ARAB EMIRATES,SAUDI ARABIA,TURKEY,SWITZERLAND,CROATIA,BAHRAIN,POLAND
        else if ([self.crs_CounryField.text isEqualToString:@"BULGARIA"]||[self.crs_CounryField.text isEqualToString:@"ROMANIA"]||[self.crs_CounryField.text isEqualToString:@"ISRAEL"]||[self.crs_CounryField.text isEqualToString:@"KUWAIT"]||[self.crs_CounryField.text isEqualToString:@"QATAR"]||[self.crs_CounryField.text isEqualToString:@"UNITED ARAB EMIRATES"]||[self.crs_CounryField.text isEqualToString:@"SAUDI ARABIA"]||[self.crs_CounryField.text isEqualToString:@"TURKEY"]||[self.crs_CounryField.text isEqualToString:@"SWITZERLAND"]||[self.crs_CounryField.text isEqualToString:@"CROATIA"]||[self.crs_CounryField.text isEqualToString:@"BAHRAIN"]||[self.crs_CounryField.text isEqualToString:@"POLAND"]){
            
            [mapData setObject:self.crs_BranchName.text forKey:@"account_number"];
            [mapData setObject:self.crs_Ifsc.text forKey:@"ifsc"];
            [mapData setObject:self.crs_SelectBranch.text forKey:@"bank_name"];
            //[mapData setObject:self.crs_BankAccount.text forKey:@"account_number"];
            self.crs_Bankbuttonhider.hidden = YES;
            
            
            
            
        }
        
        else if ([self.crs_CounryField.text isEqualToString:@"ZAMBIA"]||[self.crs_CounryField.text isEqualToString:@"ZIMBABWE"]){
            
            // [mapData setObject:self.crs_BranchName.text forKey:@"account_number"];
            [mapData setObject:self.crs_Ifsc.text forKey:@"account_number"];
            [mapData setObject:self.crs_SelectBranch.text forKey:@"bank_name"];
            @try {
                [mapData setObject:crs_bankCode forKey:@"bank_code"];
            } @catch (NSException *exception) {
                NSLog(@"Hwllo Bank code is empty @@@@@@@");
            } @finally {
                NSLog(@"Finally ");
            }
            
            //[mapData setObject:self.crs_BankAccount.text forKey:@"account_number"];
            self.crs_Bankbuttonhider.hidden = NO;
            
            
            
            
        }
        
        
        else {
            [mapData setObject:self.crs_BranchName.text forKey:@"account_number"];
            [mapData setObject:self.crs_Ifsc.text forKey:@"ifsc"];
            [mapData setObject:self.crs_SelectBranch.text forKey:@"bank_name"];
            //[mapData setObject:self.crs_BankAccount.text forKey:@"account_number"];
            self.crs_Bankbuttonhider.hidden = YES;
            
            
            
            
            
        }
        
        
        
        
        
        
        
    }
    else{
        
        if ([self.crs_CounryField.text isEqualToString:@"PAKISTAN"]) {
            
            @try {
                [mapData setObject:date1 forKey:@"dob"];
            } @catch (NSException *exception) {
                
            } @finally {
                
            }
            
            
        }
    }
    
    //    [mapData setObject:tempImageNSString forKey:@"image"];
    //    [mapData setObject:@"Hi" forKey:@"image"];
    //    [mapData setObject:@"city"forKey:@"city"];
    //    [mapData setObject:@"state"forKey:@"state"];
    //
    
    NSString * callName = [NSString stringWithFormat:@"%@ %@ %@",self.crs_FirstNameField.text,self.crs_MiddleNameField.text,self.crs_LastName.text];
    if ([EntityType isEqualToString:@"Corparate"]) {
        callName = self.crs_EntityName.text;
        
        [mapData setObject:callName forKey:@"call_name"];
        
    }
    else
    {
        
        [mapData setObject:callName forKey:@"call_name"];
        
    }
    
    
    
    
    
    
    if ([EntityType isEqualToString:@"Individual"]) {
        [mapData setObject:gender forKey:@"gender"];
    } else {
        [mapData setObject:@"NA" forKey:@"gender"];
    }
    
    
    // [mapData setObject:gender forKey:@"gender"];
    
    //[mapData setObject:bankType forKey:@"bank_type"];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
    
    if ([self.crs_Comparsion isEqualToString:@"update"]) {
        
        
        [mapData setObject: [self.crs_UpdateRecieverDetails valueForKey:@"beneficiary_no"] forKey:@"beneficiary_no"];
        
        
        
    }
    
    NSLog(@"saee  %@",mapData);
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"error %@",error);
            NSLog(@"venkatesh %@",data);
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json );
            
            NSLog(@"%@", [json valueForKey:@"message"]);
            //message = [json valueForKey:@"message"];
            if ([[json valueForKey:@"message"]isEqualToString:@"Success"])
                
                
            {
                
                [self.navigationController popViewControllerAnimated:YES];
                
            }
            else{
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                
            }
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
}





-(void)datePick{
    
    datePicker=[[UIDatePicker alloc]init];
    datePicker.datePickerMode=UIDatePickerModeDate;
    [self.crs_DateOfBirthField setInputView:datePicker];
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor blackColor]];
    
    
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(ShowSelectedDate)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    [self.crs_DateOfBirthField setInputAccessoryView:toolBar];
    
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:-18];
    NSDate *maxDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
    [comps setYear:-90];
    NSDate *minDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
    
    [datePicker setMaximumDate:maxDate];
    [datePicker setMinimumDate:minDate];
    
    
}

-(void)ShowSelectedDate
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd-MM-YYYY"];
    
    
    
    
    NSDateFormatter *Format = [[NSDateFormatter alloc]init];
    [Format setDateFormat:@"YYYY-MM-dd"];
    
    NSLog(@"Hello date%@",[Format stringFromDate:datePicker.date]);
    
    date1 = [NSString stringWithFormat:@"%@",[Format stringFromDate:datePicker.date]];
    
    
    self.crs_DateOfBirthField.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
    
    [self.crs_DateOfBirthField resignFirstResponder];
    
    
    
    
}





- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField==self.crs_BranchName) {
        if (self.self.crs_BranchName.text.length >=34 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            
            
            
            NSString *validRegEx =@"^[0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            
            
            
            
            return YES;}
        
    }
    
    
    else if  (textField==self.crs_EntityName) {
        if (self.self.crs_EntityName.text.length >=34 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            
            
            //
            //            NSString *validRegEx =@"^[0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]*$"; //change this regular expression as your requirement
            //            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            //            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            //            if (myStringMatchesRegEx)
            //                return YES;
            //            else
            //                return NO;
            //
            
            
            
            
            
            
            
            return YES;}
        
    }
    
    else if (textField == self.crs_PhoneNumber)
    {
        
        if (self.self.self.crs_PhoneNumber.text.length >=10 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            
            NSString *validRegEx =@"^[0-9.]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            return YES;}
        
    }
    else if (textField == self.crs_VietnamMobile)
    {
        
        if (self.self.self.crs_VietnamMobile.text.length >=10 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            
            NSString *validRegEx =@"^[0-9.]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            return YES;}
        
    }
    
    
    else if (textField == self.crs_Mobile)
    {
        if ([self.crs_CounryField.text isEqualToString:@"KENYA"]) {
            if (self.self.self.crs_Mobile.text.length >=9 && range.length == 0)
            {
                return NO; // return NO to not change text
            }
            
            
            else
            {
                
                
                
                
                NSString *validRegEx =@"^[0-9.]*$"; //change this regular expression as your requirement
                NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
                BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
                if (myStringMatchesRegEx)
                    return YES;
                else
                    return NO;
                
                
                
                
                return YES;}
            
        } else {
            if (self.self.self.crs_Mobile.text.length >=10 && range.length == 0)
            {
                return NO; // return NO to not change text
            }
            
            
            else
            {
                
                
                
                
                NSString *validRegEx =@"^[0-9.]*$"; //change this regular expression as your requirement
                NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
                BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
                if (myStringMatchesRegEx)
                    return YES;
                else
                    return NO;
                
                
                
                
                return YES;}
        }
        
        
    }
    //
    //        else if ([self.crs_CounryField.text isEqualToString:@"KENYA"]||[self.crs_CounryField.text isEqualToString:@"TANZANIA"]) {
    //
    //
    //            if (self.self.crs_Mobile.text.length >=9 && range.length == 0)
    //
    //            {
    //                return NO; // return NO to not change text
    //            }
    //            else
    //
    //
    //
    //
    //
    //            {
    //
    //
    //
    //
    //                NSString *validRegEx =@"^[0-9,+.]*$"; //change this regular expression as your requirement
    //                NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
    //                BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
    //                if (myStringMatchesRegEx)
    //                    return YES;
    //                else
    //                    return NO;
    //
    //
    //
    //
    //
    //
    //
    //
    //                return YES;}
    //
    //
    //
    //
    //
    //        }
    
    //
    //
    //    else if ([self.crs_CounryField.text isEqualToString:@"KENYA"]||[self.crs_CounryField.text isEqualToString:@"TANZANIA"]) {
    //
    //
    //        if (self.self.crs_Ifsc.text.length >=20 && range.length == 0)
    //
    //        {
    //            return NO; // return NO to not change text
    //        }
    //        else
    //
    //
    //
    //
    //
    //        {
    //
    //
    //
    //
    //            NSString *validRegEx =@"^[0-9,+.]*$"; //change this regular expression as your requirement
    //            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
    //            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
    //            if (myStringMatchesRegEx)
    //                return YES;
    //            else
    //                return NO;
    //
    //
    //
    //
    //
    //
    //
    //
    //            return YES;}
    //
    //
    //
    //
    //
    //    }
    
    
    
    else if (textField == self.crs_BankAccount)
    {
        
        if (self.self.self.crs_BankAccount.text.length >=34 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            //
            //
            //            NSString *validRegEx =@"^[0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]*$"; //change this regular expression as your requirement
            //            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            //            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            //            if (myStringMatchesRegEx)
            //                return YES;
            //            else
            //                return NO;
            
            
            
            
            return YES;}
        
    }
    
    
    else if (textField == self.crs_CityField)
    {
        
        if (self.self.self.crs_CityField.text.length >=60 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            
            NSString *validRegEx =@"^[a-z,A-Z.]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            return YES;}
        
    }
    
    
    
    
    
    else if (textField == self.crs_FirstNameField)
    {
        
        if (self.self.self.crs_FirstNameField.text.length >=120 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            
            
            NSString *validRegEx =@"^[A-Z a-z 0-9.]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            return YES;}
        
    }
    else if (textField == self.crs_search)
    {
        
        if (self.self.self.crs_search.text.length >=120 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            
            
            NSString *validRegEx =@"^[A-Z a-z .]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            return YES;}
        
    }
    
    
    
    
    
    
    
    
    else if (textField == self.crs_LastName)
    {
        
        if (self.self.self.crs_LastName.text.length >=120 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            
            
            
            NSString *validRegEx =@"^[A-Z a-z 0-9.]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            
            
            
            
            return YES;}
        
    }
    
    
    
    else if (textField == self.crs_MiddleNameField)
    {
        
        if (self.self.self.crs_MiddleNameField.text.length >=120 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            
            
            
            NSString *validRegEx =@"^[A-Z a-z 0-9.]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            
            
            
            
            return YES;}
        
    }
    
    
    
    
    
    
    else if (textField == self.crs_SelectBranch)
    {
        
        if (self.self.self.crs_SelectBranch.text.length >=60 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            
            
            
            
            
            NSString *validRegEx =@"^[A-Z a-z.]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            return YES;}
        
    }
    
    
    else if ( ([self.crs_CounryField.text isEqualToString:@"BULGARIA"]||[self.crs_CounryField.text isEqualToString:@"ROMANIA"]||[self.crs_CounryField.text isEqualToString:@"ISRAEL"]||[self.crs_CounryField.text isEqualToString:@"KUWAIT"]||[self.crs_CounryField.text isEqualToString:@"QATAR"]||[self.crs_CounryField.text isEqualToString:@"UNITED ARAB EMIRATES"]||[self.crs_CounryField.text isEqualToString:@"SAUDI ARABIA"]||[self.crs_CounryField.text isEqualToString:@"TURKEY"]||[self.crs_CounryField.text isEqualToString:@"SWITZERLAND"]||[self.crs_CounryField.text isEqualToString:@"CROATIA"]||[self.crs_CounryField.text isEqualToString:@"BAHRAIN"]||[self.crs_CounryField.text isEqualToString:@"POLAND"]||[self.crs_CounryField.text isEqualToString:@"SINGAPORE"]||[self.crs_CounryField.text isEqualToString:@"HON KONG"]||[self.crs_CounryField.text isEqualToString:@"THAILAND"]||[self.crs_CounryField.text isEqualToString:@"JAPAN"]||[self.crs_CounryField.text isEqualToString:@"NEW ZEALAND"]||[self.crs_CounryField.text isEqualToString:@"OMAN"]||[self.crs_CounryField.text isEqualToString:@"SOUTH AFRICA"]||[self.crs_CounryField.text isEqualToString:@"INDIA"])) {
        
        
        if (self.self.crs_Ifsc.text.length >=11 && range.length == 0)
            
        {
            return NO; // return NO to not change text
        }
        else
            
            
            
            
            
        {
            
            
            
            NSString *validRegEx =@"^[0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            return YES;}
        
        
        
    }
    
    else if ( ([self.crs_CounryField.text isEqualToString:@"KENYA"]||[self.crs_CounryField.text isEqualToString:@"TANZANIA"]||[self.crs_CounryField.text isEqualToString:@"UGANDA"]||[self.crs_CounryField.text isEqualToString:@"NIGERIA"]||[self.crs_CounryField.text isEqualToString:@"RWANDA"]||[self.crs_CounryField.text isEqualToString:@"GHANA"])) {
        
        
        if (self.self.crs_Ifsc.text.length >=20 && range.length == 0)
            
        {
            return NO; // return NO to not change text
        }
        else
            
            
            
            
            
        {
            
            
            
            NSString *validRegEx =@"^[0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            return YES;}
        
        
        
    }
    
    
    
    
    else if (textField == self.crs_Ifsc)
    {
        
        if (self.self.self.crs_Ifsc.text.length >=34 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            
            
            NSString *validRegEx =@"^[0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            
            
            
            
            
            return YES;}
        
    }
    
    
    
    
    
    else if (textField == self.crs_BankAccount)
    {
        
        if (self.self.self.crs_BankAccount.text.length >=34 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            NSString *validRegEx =@"^[0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            
            
            
            return YES;}
        
    }
    
    
    
    
    
    
    else{
        {return YES;}
        
    }
    
}















-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}


- (IBAction)crs_SelectBankAction:(id)sender {
    
    self.crs_ProfileView.hidden = NO;
    
    
    
    
}


- (IBAction)crs_Camera:(id)sender {
    
    
    [self.view endEditing:YES];
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Choose Image From:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Camera",
                            @"Photo Library",
                            nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
    
    
    
    
}
#pragma mark - PickerView _delegate

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    Imagepicker = [[UIImagePickerController alloc] init];
    Imagepicker.delegate = self;
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                {
                    @try {
                        
                        Imagepicker.allowsEditing = YES;
                        Imagepicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                        [self presentViewController:Imagepicker animated:YES completion:NULL];
                    }
                    @catch (NSException *exception) {
                        
                    }
                    break;
                }
                case 1:
                {
                    
                    
                    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
                    imagePickerController.delegate = self;
                    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
                    [self presentViewController:imagePickerController animated:YES completion:nil];
                    
                    
                    
                    break;
                }
                    
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}

#pragma mark - UIImage Delegate

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    
    NSData *imgData=UIImagePNGRepresentation(image);
    self.crs_RecieverImage.image = image;
    
    [picker dismissModalViewControllerAnimated:YES];
    
    
}
- (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}
- (NSString *)encodeToBase64String:(UIImage *)image {
    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}





-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if ([Crs_str_banklist isEqualToString:@"list"]) {
        return Crs_Array_list.count;
        
    }
    else{
        return countryArray.count;
    }
    
    
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([Crs_str_banklist isEqualToString:@"list"]) {
        
        return [[Crs_Array_list valueForKey:@"bank_name"] objectAtIndex:row];
        
    }
    else{
        return [countryArray objectAtIndex:row];
    }
    
    
    
    
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if ([Crs_str_banklist isEqualToString:@"list"]) {
        
        
        self.crs_SelectBranch.text = [[Crs_Array_list valueForKey:@"bank_name"] objectAtIndex:row];
        
        NSLog(@" component zero %@ ",[[Crs_Array_list valueForKey:@"bank_name"] objectAtIndex:row]);
        //
        //        [pickerView selectRow:row inComponent:1 animated:true];
        
        self.crs_CountrySelectorView.hidden = YES;
        
        
    }
    else{
        
        
        self.crs_CounryField.text = [countryArray objectAtIndex:row];
        
        
        
        if ([self.crs_CounryField.text isEqualToString:@"INDIA"]) {
            
            CountryName = @"INDIA";
            
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_Ifsc.placeholder = @"IFSC ";
            
            self.crs_BankAccount.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
            
        }
        
        //         if ([self.crs_CounryField.text isEqualToString:@"IRELAND"]) {
        //
        //              CountryName = @"IRELAND";
        //
        //             self.crs_Ifsc.placeholder = @"IBAN / Account Number";
        //              self.crs_NepalBranchNameLabel.hidden = YES;
        //             self.crs_BankAccount.hidden = NO;
        //
        //         }
        //
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"PHILIPPINES"]||[self.crs_CounryField.text isEqualToString:@"VIETNAM"])
        {
            CountryName = @"PHILIPPINES";
            
            self.crs_Ifsc.placeholder = @"Account Number";
            self.crs_BranchName.placeholder = @"Branch Name";
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
            
        }
        
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"NEPAL"])
        {
            CountryName = @"NEPAL";
            
            self.crs_Ifsc.placeholder = @"Account Number";
            self.crs_BranchName.placeholder = @"";
            self.crs_NepalBranchNameLabel.hidden = NO;
            self.crs_BankAccount.hidden = YES;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
            
        }
        
        else if ([self.crs_CounryField.text isEqualToString:@"SRI LANKA"]) {
            
            CountryName = @"SRI LANKA";
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
            
            self.crs_Ifsc.placeholder = @"Branch Code ";
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_BankAccount.hidden = NO;
            self.crs_DropImage.hidden = NO;
        }
        
        
        
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"UNITED STATES"])
        {
            CountryName = @"UNITED STATES";
            self.crs_BranchName.placeholder = @"Branch Name";
            self.crs_Ifsc.placeholder = @"Swift Code";
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_BankAccount.placeholder = @"Account Number";
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"AUSTRALIA"])
        {
            CountryName = @"AUSTRALIA";
            self.crs_BranchName.placeholder = @"Branch Name";
            self.crs_Ifsc.placeholder = @"Swift Code";
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_BankAccount.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
            
        }
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"SIERRA LEONE"]||[self.crs_CounryField.text isEqualToString:@"CANADA"])
        {
            CountryName = @"SIERRA LEONE";
            self.crs_BranchName.placeholder = @"Branch Name";
            self.crs_Ifsc.placeholder = @"Swift Code";
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_BankAccount.hidden = NO;
            
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        
        
        else{
            
            self.crs_Ifsc.placeholder = @"IBAN / Account Number";
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_BankAccount.hidden = NO;
            self.crs_Bankbuttonhider.hidden = YES;
        }
        
        
        
        
        
        
        
        
        
        
        
        
        NSLog(@" component zero %@ ",[countryArray objectAtIndex:row]);
        //
        //        [pickerView selectRow:row inComponent:1 animated:true];
        
        self.crs_CountrySelectorView.hidden = YES;
        
    }
    
    
    
    
    
    
    
    
    
    
    
}





- (IBAction)Crs_Btn_Action_banklist:(id)sender {
    
    
    self.crs_search.hidden = NO;
    isFiltered = NO;
    self.crs_search.placeholder  = @"Search By Bank Name";
    self.crs_search.text = @"";
    
    //    self.crs_search.hidden = YES;
    
    if ([self.crs_CounryField.text isEqualToString:@"Select Country"]) {
        
        
        self.crs_CountrySelectorView.hidden = YES;
    }
    
    
    
    
    
    if ([self.crs_CounryField.text isEqualToString:@"Select Country"]) {
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"For Banks Please Select Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
    
    
    NSMutableArray *BankArray = [NSMutableArray new];
    
    if ([self.crs_CounryField.text isEqualToString:@"INDIA"]) {
        
        
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"IN"] ) {
                
                //  [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                
                [BankArray addObject:[Crs_Array_banklist objectAtIndex:i]];
            }
            else{
                
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
        
        
    }
    else if ([self.crs_CounryField.text isEqualToString:@"PHILIPPINES"])
    {
        
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"PH"] ) {
                
                
                // [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                
                [BankArray addObject:[Crs_Array_banklist objectAtIndex:i]];
            }
            else{
                
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
    }else if ([self.crs_CounryField.text isEqualToString:@"UNITED STATES"])
    {
        
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"US"] ) {
                
                
                // [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                
                [BankArray addObject:[Crs_Array_banklist objectAtIndex:i]];
            }
            else{
                
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
    }
    
    else if ([self.crs_CounryField.text isEqualToString:@"PAKISTAN"])
    {
        
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"PK"] ) {
                
                
                //[Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                [BankArray addObject:[Crs_Array_banklist objectAtIndex:i]];
                
            }
            else{
                
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
    }
    else if ([self.crs_CounryField.text isEqualToString:@"NEPAL"])
    {
        
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"NP"] ) {
                
                
                // [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                [BankArray addObject:[Crs_Array_banklist objectAtIndex:i]];
                
            }
            else{
                
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
    }
    else if ([self.crs_CounryField.text isEqualToString:@"SRI LANKA"])
    {
        
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"LK"] ) {
                
                
                // [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                [BankArray addObject:[Crs_Array_banklist objectAtIndex:i]];
                
            }
            else{
                
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
    }
    
    
    else if ([self.crs_CounryField.text isEqualToString:@"VIETNAM"])
    {
        
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"VN"] ) {
                
                
                // [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                [BankArray addObject:[Crs_Array_banklist objectAtIndex:i]];
                
            }
            else{
                
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
    }
    else if ([self.crs_CounryField.text isEqualToString:@"KENYA"])
    {
        
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"KE"] ) {
                
                
                // [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                [BankArray addObject:[Crs_Array_banklist objectAtIndex:i]];
                
            }
            else{
                
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
    }
    else if ([self.crs_CounryField.text isEqualToString:@"ZAMBIA"])
    {
        
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"ZM"] ) {
                
                
                // [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                [BankArray addObject:[Crs_Array_banklist objectAtIndex:i]];
                
            }
            else{
                
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
    }
    else if ([self.crs_CounryField.text isEqualToString:@"ZIMBABWE"])
    {
        
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"ZW"] ) {
                
                
                // [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                [BankArray addObject:[Crs_Array_banklist objectAtIndex:i]];
                
            }
            else{
                
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
    }
    else if ([self.crs_CounryField.text isEqualToString:@"TANZANIA"])
    {
        
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"TZ"] ) {
                
                
                // [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                [BankArray addObject:[Crs_Array_banklist objectAtIndex:i]];
                
            }
            else{
                
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
    }
    else if ([self.crs_CounryField.text isEqualToString:@"GHANA"])
    {
        
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"GH"] ) {
                
                
                // [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                [BankArray addObject:[Crs_Array_banklist objectAtIndex:i]];
                
            }
            else{
                
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
    }
    else if ([self.crs_CounryField.text isEqualToString:@"NIGERIA"])
    {
        
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"NG"] ) {
                
                
                // [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                [BankArray addObject:[Crs_Array_banklist objectAtIndex:i]];
                
            }
            else{
                
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
    }
    else if ([self.crs_CounryField.text isEqualToString:@"RWANDA"])
    {
        
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"RW"] ) {
                
                
                // [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                [BankArray addObject:[Crs_Array_banklist objectAtIndex:i]];
                
            }
            else{
                
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
    }
    else if ([self.crs_CounryField.text isEqualToString:@"BANGLADESH"])
    {
        
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"BD"] ) {
                
                
                // [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                
                [BankArray addObject:[Crs_Array_banklist objectAtIndex:i]];
            }
            else{
                
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
    }
    else if ([self.crs_CounryField.text isEqualToString:@"UGANDA"])
    {
        
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"UG"] ) {
                
                
                // [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                [BankArray addObject:[Crs_Array_banklist objectAtIndex:i]];
                
            }
            else{
                
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
    }
    Crs_Array_list = BankArray;
    Crs_str_banklist=@"list";
    self.crs_CountrySelectorView.hidden = NO;
    [self.crs_pickerview_data reloadAllComponents];
    [self.crs_CountryTableView reloadData];
    
    
    
}




- (IBAction)crs_SelectCountry:(id)sender {
    
    if ([EntityType isEqualToString:@"Corparate"]) {
        Table = @"Hello";
        
    }
    else if (![EntityType isEqualToString:@"Corparate"]){
        
        
        Table = @"Jai";
    }
    
    _crs_CountrySelectorView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    
    [self.view addSubview:_crs_CountrySelectorView];
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        _crs_CountrySelectorView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            _crs_CountrySelectorView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                _crs_CountrySelectorView.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    //crs_CountryList=crs_CountryList1;
    self.crs_search.hidden = NO;
    self.crs_search.text = @"";
    isFiltered = NO;
    self.crs_search.placeholder = @"Search By Country";
    
    self.crs_search.hidden = NO;
    NSMutableArray * Ary=[NSMutableArray new];
    
    
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"country_name" ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:descriptor];
    
    // here you will get sorted array in 'sortedArray'
    crs_CountryList = [[crs_CountryList1 sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
    
    NSLog(@"%@",crs_CountryList);
    
    
    for (int i=0; i<crs_CountryList.count; i++) {
        if ([[[crs_CountryList valueForKey:@"country_status"]objectAtIndex:i]isEqualToString:@"2"]||[[[crs_CountryList valueForKey:@"country_status"]objectAtIndex:i]isEqualToString:@"1"]) {
            
            
            NSMutableDictionary * dict=[NSMutableDictionary new];
            dict =[crs_CountryList objectAtIndex:i];
            [Ary addObject:dict];
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    crs_CountryList =Ary;
    NSLog(@"%@",crs_CountryList);
    
    
    Crs_str_banklist=@"";
    
    
    
    
    
    
    self.crs_VitenamView.hidden = YES;
    self.crs_CountrySelectorView.hidden = NO;
    [self.crs_pickerview_data reloadAllComponents];
    [self.crs_CountryTableView reloadData];
}


// Table view methods

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    
    
    
    if ([Crs_str_banklist isEqualToString:@"list"]) {
        
        if (!isFiltered) {
            
            return Crs_Array_list.count;
            
        }
        else{
            
            
            return searchArray.count;
        }
        
        
    }
    
    else if ([Crs_str_banklist isEqualToString:@"DistrictsCaller"]){
        
        
        if (!isFiltered) {
            
            return DistrictStoringArray.count;
            
        }
        else{
            
            
            return searchArray.count;
        }
        
        
        
        
    }
    else if ([Crs_str_banklist isEqualToString:@"CityCaller"]){
        
        
        if (!isFiltered) {
            
            return CityStoringArray.count;
            
        }
        else{
            
            
            return searchArray.count;
        }
        
        
        
        
    }
    else if ([Crs_str_banklist isEqualToString:@"BranchGetter"]){
        
        if (!isFiltered) {
            
            return branchArray.count;
            
        }
        else{
            
            
            return searchArray.count;
        }
        
    }
    else if ([Crs_str_banklist isEqualToString:@"wardCaller"]){
        
        
        if (!isFiltered) {
            
            return wardArray.count;
            
        }
        else{
            
            
            return searchArray.count;
        }
        
        
        
        
    }
    
    
    
    else{
        if (!isFiltered) {
            
            return crs_CountryList.count;
        }
        
        
        
        else{
            
            
            return searchArray.count;
        }
    }
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}



-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    AddreciverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CountryNameTabelViewCellSID"];
    
    if (cell == nil)
    {
        cell = [[AddreciverTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:@"CountryNameTabelViewCellSID"];
    }
    
    
    
    
    if ([Crs_str_banklist isEqualToString:@"BranchGetter"]){
        
        if (!isFiltered) {
            cell.crs_Lbl_CountryName.text =[[branchArray valueForKey:@"branch_name"] objectAtIndex:indexPath.row];
        }
        else{
            
            
            cell.crs_Lbl_CountryName.text = [[searchArray valueForKey:@"branch_name"] objectAtIndex:indexPath.row];
            //CityCode = [[searchArray valueForKey:@"WARD_ID"] objectAtIndex:indexPath.row];
        }
        
        
        
        
    }
    
   else if ([Crs_str_banklist isEqualToString:@"list"]) {
        
        if (!isFiltered) {
            cell.crs_Lbl_CountryName.text = [[Crs_Array_list valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
            
        }
        else{
            
            
            cell.crs_Lbl_CountryName.text = [[searchArray valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
        }
        //return [[Crs_Array_list valueForKey:@"bank_name"] objectAtIndex:row];
        
        
    }
    
    else if ([Crs_str_banklist isEqualToString:@"DistrictsCaller"]){
        
        if (!isFiltered) {
            cell.crs_Lbl_CountryName.text = [[DistrictStoringArray valueForKey:@"DISTRICT_NAME"] objectAtIndex:indexPath.row];
            DistrictCode = [[DistrictStoringArray valueForKey:@"DISTRICT_ID"] objectAtIndex:indexPath.row];
        }
        else{
            
            
            cell.crs_Lbl_CountryName.text = [[searchArray valueForKey:@"DISTRICT_NAME"] objectAtIndex:indexPath.row];
            DistrictCode = [[DistrictStoringArray valueForKey:@"DISTRICT_ID"] objectAtIndex:indexPath.row];
        }
        
        
        
        
    }
    else if ([Crs_str_banklist isEqualToString:@"CityCaller"]){
        
        if (!isFiltered) {
            cell.crs_Lbl_CountryName.text = [[CityStoringArray valueForKey:@"CITY_NAME"] objectAtIndex:indexPath.row];
            CityCode = [[CityStoringArray valueForKey:@"CITY_ID"] objectAtIndex:indexPath.row];
        }
        else{
            
            
            cell.crs_Lbl_CountryName.text = [[searchArray valueForKey:@"CITY_NAME"] objectAtIndex:indexPath.row];
            CityCode = [[searchArray valueForKey:@"CITY_ID"] objectAtIndex:indexPath.row];
        }
        
        
        
        
    }
    else if ([Crs_str_banklist isEqualToString:@"wardCaller"]){
        
        if (!isFiltered) {
            cell.crs_Lbl_CountryName.text = [[wardArray valueForKey:@"WARD_NAME"] objectAtIndex:indexPath.row];
            //CityCode = [[wardArray valueForKey:@"WARD_ID"] objectAtIndex:indexPath.row];
        }
        else{
            
            
            cell.crs_Lbl_CountryName.text = [[searchArray valueForKey:@"WARD_NAME"] objectAtIndex:indexPath.row];
            //CityCode = [[searchArray valueForKey:@"WARD_ID"] objectAtIndex:indexPath.row];
        }
        
        
        
        
    }
    
    
    
    
    
    
    else{
        if (!isFiltered) {
            
            
            
            cell.crs_Lbl_CountryName.text = [[crs_CountryList  objectAtIndex:indexPath.row]valueForKey:@"country_name"];
            
        }
        
        else{
            
            
            cell.crs_Lbl_CountryName.text = [[searchArray  objectAtIndex:indexPath.row]valueForKey:@"country_name"];
            
        }
        //return [countryArray objectAtIndex:row];
    }
    
    
    
    //tableView.tableFooterView=[[UIView alloc]init];
    
    
    return cell;
    
    
    
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if ([EntityType isEqualToString:@"Corparate"]) {
        self.crs_Hide.hidden = NO;
        
    }
    if ([Crs_str_banklist isEqualToString:@"list"]) {
        
        
        if ([self.crs_CounryField.text isEqualToString:@"NEPAL"]) {
            
            if (!isFiltered) {
                
                self.crs_Ifsc.text = [[Crs_Array_list valueForKey:@"branch_name"] objectAtIndex:indexPath.row];
                NSLog(@" component zero %@ ",[[Crs_Array_list valueForKey:@"bank_name"] objectAtIndex:indexPath.row]);
                crs_bankCode = [[Crs_Array_list valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                crs_branchCode = [[Crs_Array_list valueForKey:@"branch_code"] objectAtIndex:indexPath.row];
                
            }
            
            
            
            
            
            
            
            
            else{
                
                
                
                self.crs_Ifsc.text = [[searchArray valueForKey:@"branch_name"] objectAtIndex:indexPath.row];
                // NSLog(@" component zero %@ ",[[searchArray valueForKey:@"bank_name"] objectAtIndex:indexPath.row]);
                crs_bankCode = [[searchArray valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                crs_branchCode = [[searchArray valueForKey:@"branch_code"] objectAtIndex:indexPath.row];
                
            }
            //self.crs_Ifsc.text = [[Crs_Array_list valueForKey:@"branch_code"] objectAtIndex:indexPath.row];
            
            
        }
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"PHILIPPINES"]){
            
            
            if (!isFiltered) {
                
                
                crs_bankCode = [[Crs_Array_list valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                crs_branchCode = [[Crs_Array_list valueForKey:@"branch_code"] objectAtIndex:indexPath.row];
                
            }
            
            
            
            
            
            
            
            
            else{
                
                
                
                crs_bankCode = [[searchArray valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                crs_branchCode = [[searchArray valueForKey:@"branch_code"] objectAtIndex:indexPath.row];
                
            }
            
        }
        
        
        
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"VIETNAM"]||[self.crs_CounryField.text isEqualToString:@"KENYA"]||[self.crs_CounryField.text isEqualToString:@"UGANDA"]||[self.crs_CounryField.text isEqualToString:@"RWANDA"]||[self.crs_CounryField.text isEqualToString:@"GHANA"]||[self.crs_CounryField.text isEqualToString:@"NIGERIA"]||[self.crs_CounryField.text isEqualToString:@"ZAMBIA"]||[self.crs_CounryField.text isEqualToString:@"ZIMBABWE"]){
            
            
            if (!isFiltered) {
                
                
                crs_bankCode = [[Crs_Array_list valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                
                
            }
            
            
            
            
            
            
            
            
            else{
                
                
                
                crs_bankCode = [[searchArray valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                
                
            }
            
        }
        
        
        
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"BANGLADESH"]) {
            
            if (!isFiltered) {
                
                
                NSLog(@" component zero %@ ",[[Crs_Array_list valueForKey:@"bank_name"] objectAtIndex:indexPath.row]);
                crs_bankCode = [[Crs_Array_list valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                crs_branchCode = [[Crs_Array_list valueForKey:@"branch_code"] objectAtIndex:indexPath.row];
                self.crs_VitenamView.hidden = YES;
                
            }
            
            
            
            
            
            
            
            
            else{
                
                
                
                self.crs_Ifsc.text = [[searchArray valueForKey:@"branch_name"] objectAtIndex:indexPath.row];
                // NSLog(@" component zero %@ ",[[searchArray valueForKey:@"bank_name"] objectAtIndex:indexPath.row]);
                crs_bankCode = [[searchArray valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                crs_branchCode = [[searchArray valueForKey:@"branch_code"] objectAtIndex:indexPath.row];
                self.crs_VitenamView.hidden = YES;
            }
            //self.crs_Ifsc.text = [[Crs_Array_list valueForKey:@"branch_code"] objectAtIndex:indexPath.row];
            
            
        }
        
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"SRI LANKA"]){
            
            
            if (!isFiltered) {
                
                
                
                crs_bankCode = [[Crs_Array_list valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                crs_branchCode = [[Crs_Array_list valueForKey:@"branch_code"] objectAtIndex:indexPath.row];
                
            }
            
            
            
            
            
            
            
            
            else{
                
                
                
                crs_bankCode = [[searchArray valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                crs_branchCode = [[searchArray valueForKey:@"branch_code"] objectAtIndex:indexPath.row];
                
                
            }
            
        }
        
        
        
        
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@""]){
            
            //            self.crs_CountrySelectorView.hidden = YES;
            //            self.crs_SelectBranch.text = [[Crs_Array_list valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
            
            
            
            crs_bankCode = [[Crs_Array_list valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
            crs_branchCode = [[Crs_Array_list valueForKey:@"branch_code"] objectAtIndex:indexPath.row];
            
            
        }
        
        
        if (!isFiltered) {
            self.crs_CountrySelectorView.hidden = YES;
            self.crs_SelectBranch.text = [[Crs_Array_list valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
            
            
            
        }
        else{
            
            
            self.crs_CountrySelectorView.hidden = YES;
            self.crs_SelectBranch.text = [[searchArray valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
            
            
            
        }
        
        
        
        
    }
    
    
    else if ([Crs_str_banklist isEqualToString:@"DistrictsCaller"]){
        self.crs_CountrySelectorView.hidden = YES;
        
        if (!isFiltered) {
            
            self.crs_District.text =[[DistrictStoringArray valueForKey:@"DISTRICT_NAME"] objectAtIndex:indexPath.row];
            DistrictCode = [[DistrictStoringArray valueForKey:@"DISTRICT_ID"] objectAtIndex:indexPath.row];
            
        }
        
        else{
            
            isFiltered = NO;
            self.crs_District.text =[[searchArray valueForKey:@"DISTRICT_NAME"] objectAtIndex:indexPath.row];
            DistrictCode = [[searchArray valueForKey:@"DISTRICT_ID"] objectAtIndex:indexPath.row];
            
            
        }
        
        
    }
    
    else if ([Crs_str_banklist isEqualToString:@"CityCaller"]){
        self.crs_CountrySelectorView.hidden = YES;
        
        if (!isFiltered) {
            
            
            
            //citys = [[CityStoringArray valueForKey:@"CITY_NAME"] objectAtIndex:indexPath.row];
            self.crs_VietnamCity.text =[[CityStoringArray valueForKey:@"CITY_NAME"] objectAtIndex:indexPath.row];
            CityCode = [[CityStoringArray valueForKey:@"CITY_ID"] objectAtIndex:indexPath.row];
            //citys = [NSString stringWithFormat: self.crs_VietnamCity.text,CityCode,@"%@EWAY%@"];
            citys = [NSString stringWithFormat:@"%@EWAY%@",CityCode,self.crs_VietnamCity.text];
            
            
            
            
        }
        
        else{
            
            isFiltered = NO;
            self.crs_VietnamCity=[[searchArray valueForKey:@"CITY_NAME"] objectAtIndex:indexPath.row];
            CityCode = [[searchArray valueForKey:@"CITY_ID"] objectAtIndex:indexPath.row];
            citys = [[searchArray valueForKey:@"CITY_NAME"] objectAtIndex:indexPath.row];
            citys = [NSString stringWithFormat:@"%@EWAY%@",CityCode,self.crs_VietnamCity.text];
            
            
            //
            
            
            
        }
        
        
    }
    
    else if ([Crs_str_banklist isEqualToString:@"wardCaller"]){
        self.crs_CountrySelectorView.hidden = YES;
        
        if (!isFiltered) {
            
            
            
            
            self.crs_Ward.text =[[wardArray valueForKey:@"WARD_NAME"] objectAtIndex:indexPath.row];
            wardCode = [[wardArray valueForKey:@"WARD_ID"] objectAtIndex:indexPath.row];
            
        }
        
        else{
            
            isFiltered = NO;
            self.crs_Ward.text=[[searchArray valueForKey:@"WARD_NAME"] objectAtIndex:indexPath.row];
            wardCode = [[searchArray valueForKey:@"WARD_ID"] objectAtIndex:indexPath.row];
            
            
            
        }
        
        
    }
    
    
    
    else if ([Crs_str_banklist isEqualToString:@"BranchGetter"]){
        self.crs_CountrySelectorView.hidden = YES;
        
        if (!isFiltered) {
            self.crs_Ifsc.text =[[branchArray valueForKey:@"branch_name"] objectAtIndex:indexPath.row];
            self.crs_VitenamView.hidden = YES;
        }
        
        else{
            
            isFiltered = NO;
            
            self.crs_Ifsc.text =[[searchArray valueForKey:@"branch_name"] objectAtIndex:indexPath.row];
            
            
            
        }
        
        
    }
    
    
    else{
        if (!isFiltered) {
            
            
            self.crs_CounryField.text = [[crs_CountryList  objectAtIndex:indexPath.row]valueForKey:@"country_name"];
            self.crs_StdField.text = [[crs_CountryList  objectAtIndex:indexPath.row]valueForKey:@"isd_code"];
            self.crs_Std2.text = [[crs_CountryList  objectAtIndex:indexPath.row]valueForKey:@"isd_code"];
            countryCode = [[crs_CountryList  objectAtIndex:indexPath.row]valueForKey:@"country_code"];
            
        }
        
        else{
            
            
            
            self.crs_CounryField.text = [[searchArray  objectAtIndex:indexPath.row]valueForKey:@"country_name"];
            self.crs_StdField.text = [[searchArray  objectAtIndex:indexPath.row]valueForKey:@"isd_code"];
            self.crs_Std2.text = [[searchArray  objectAtIndex:indexPath.row]valueForKey:@"isd_code"];
            countryCode = [[searchArray  objectAtIndex:indexPath.row]valueForKey:@"country_code"];
        }
        
        // Claring Bank Name
        self.crs_BranchName.text = @"";
        self.crs_SelectBranch.text = @"";
        self.crs_Ifsc.text = @"";
        self.crs_BankAccount.text = @"";
        PaymentType = @"Cash";
        
        self.crs_BranchName.hidden = NO;
        
        
        
        if ([self.crs_CounryField.text isEqualToString:@"INDIA"]) {
            
            
            bankType = @"0";
            countryCode = @"INR";
            self.crs_CashPickUp.text = @"CASH PICK-UP";
            
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNamePhonePad];
            [_crs_Ifsc reloadInputViews];
            
            
            self.crs_AccountCredit.hidden = NO ;
            self.crs_BankAcountClick.hidden = NO;
            self.Crs_CashPay_view.hidden = NO;
            self.crs_Ifsc.placeholder = @"IFSC ";
            self.crs_BranchName.placeholder = @"Branch Name";
            self.crs_BankAccount.hidden = NO;
            self.crs_NepaliBranch.hidden = YES;
            self.crs_Bankbuttonhider.hidden = NO;
            self.crs_DropImage.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            //[self.crs_BankAcountClick  setSelected:NO];
            self.crs_NepalBranchNameLabel.hidden = YES;
            [self.crs_BankAcountClick  setSelected:NO];
            [self.crs_IbanClick setSelected:NO];
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_SelectBranch.userInteractionEnabled = NO;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"SRI LANKA"]) {
            
            
            bankType = @"0";
            countryCode = @"LKR";
            self.crs_CashPickUp.text = @"CASH PICK-UP";
            self.crs_AccountCredit.hidden = NO ;
            self.crs_BankAcountClick.hidden = NO;
            self.Crs_CashPay_view.hidden = NO;
            self.crs_Ifsc.placeholder = @"Branch Code";
            self.crs_BranchName.placeholder = @"Branch Name";
            self.crs_BankAccount.hidden = NO;
            self.crs_Bankbuttonhider.hidden = NO;
            self.crs_DropImage.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_NepaliBranch.hidden = YES;
            //[self.crs_BankAcountClick  setSelected:NO];
            self.crs_NepalBranchNameLabel.hidden = YES;
            [self.crs_BankAcountClick  setSelected:NO];
            [self.crs_IbanClick setSelected:NO];
            
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        
        
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"PHILIPPINES"])
        {
            bankType = @"0";
            countryCode = @"PHP";
            self.crs_CashPickUp.text = @"CASH PICK-UP";
            self.crs_AccountCredit.hidden = NO ;
            self.crs_BankAcountClick.hidden = NO;
            self.Crs_CashPay_view.hidden = NO;
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNamePhonePad];
            [_crs_Ifsc reloadInputViews];
            
            self.crs_Ifsc.placeholder = @"Branch Name";
            self.crs_BranchName.placeholder = @"Account Number";
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_Bankbuttonhider.hidden = NO;
            //self.crs_DropDown.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_DropImage.hidden = NO;
            self.crs_NepalBranchNameLabel.hidden = YES;
            //[self.crs_BankAcountClick  setSelected:NO];
            [self.crs_BankAcountClick  setSelected:NO];
            [self.crs_IbanClick setSelected:NO];
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        else if ([self.crs_CounryField.text isEqualToString:@"KENYA"])
        {
            bankType = @"0";
            kenyaBankType = @"2";
            countryCode = @"KES";
            PaymentType = @"Wallet";
            self.crs_CashPickUp.text = @"MOBILE WALLET";
            self.crs_AccountCredit.hidden = NO ;
            self.crs_BankAcountClick.hidden = NO;
            self.Crs_CashPay_view.hidden = NO;
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNumberPad];
            [_crs_Ifsc reloadInputViews];
            
            self.crs_Ifsc.placeholder = @"Account Number";
            self.crs_BranchName.hidden = YES;
            
            // self.crs_BranchName.placeholder = @"Account Number";
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_Bankbuttonhider.hidden = NO;
            //self.crs_DropDown.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_DropImage.hidden = NO;
            self.crs_NepalBranchNameLabel.hidden = YES;
            //[self.crs_BankAcountClick  setSelected:NO];
            [self.crs_BankAcountClick  setSelected:NO];
            [self.crs_IbanClick setSelected:NO];
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        else if ([self.crs_CounryField.text isEqualToString:@"BANGLADESH"])
        {
            bankType = @"0";
            kenyaBankType = @"2";
            countryCode = @"BDT";
            PaymentType = @"Wallet";
            self.crs_CashPickUp.text = @"MOBILE WALLET";
            self.crs_AccountCredit.hidden = NO ;
            self.crs_BankAcountClick.hidden = NO;
            self.Crs_CashPay_view.hidden = NO;
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNumberPad];
            [_crs_Ifsc reloadInputViews];
            
            self.crs_Ifsc.placeholder = @"";
            self.crs_BranchName.hidden = NO;
            self.crs_BranchName.placeholder = @"Account Number";
            self.Crs_BranchOutlet.hidden = NO;
            // self.crs_BranchName.placeholder = @"Account Number";
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_Bankbuttonhider.hidden = NO;
            //self.crs_DropDown.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_DropImage.hidden = NO;
            self.crs_NepalBranchNameLabel.hidden = YES;
            //[self.crs_BankAcountClick  setSelected:NO];
            [self.crs_BankAcountClick  setSelected:NO];
            [self.crs_IbanClick setSelected:NO];
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.Crs_BranchOutlet.hidden = NO;
            self.crs_BanglaBranchLabel.hidden = NO;
            self.crs_banglaDrop.hidden = NO;
        }
        //        else if ([self.crs_CounryField.text isEqualToString:@"ZAMBIA"])
        //        {
        //            bankType = @"0";
        //            kenyaBankType = @"2";
        //            countryCode = @"ZMW";
        //            PaymentType = @"Wallet";
        //            self.crs_CashPickUp.hidden = YES;
        //            self.crs_AccountCredit.hidden = NO ;
        //            self.crs_BankAcountClick.hidden = NO;
        //            self.Crs_CashPay_view.hidden = YES;
        //            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNumberPad];
        //            [_crs_Ifsc reloadInputViews];
        //
        //            self.crs_Ifsc.placeholder = @"Account Number";
        //            self.crs_BranchName.hidden = YES;
        //
        //            // self.crs_BranchName.placeholder = @"Account Number";
        //            self.crs_NepaliBranch.hidden = YES;
        //            self.crs_BankAccount.hidden = YES;
        //            self.crs_Bankbuttonhider.hidden = NO;
        //            //self.crs_DropDown.hidden = NO;
        //            self.crs_DateOfBirthField.hidden = YES;
        //            self.crs_DropImage.hidden = NO;
        //            self.crs_NepalBranchNameLabel.hidden = YES;
        //            //[self.crs_BankAcountClick  setSelected:NO];
        //            [self.crs_BankAcountClick  setSelected:NO];
        //            [self.crs_IbanClick setSelected:NO];
        //            self.crs_Ifsc.userInteractionEnabled = YES;
        //            self.crs_VitenamView.hidden = YES;
        //            // Hiding For Vietnam
        //            self.crs_MaleTouch.hidden = NO;
        //            self.crs_FemaleTouch.hidden = NO;
        //            self.crs_CityField.hidden = NO;
        //            self.crs_Mobile.hidden = NO;
        //            self.crs_DateOfBirthField.hidden = YES;
        //            self.crs_MaleClick.hidden = NO;
        //            self.crs_FemaleClick.hidden = NO;
        //            self.crs_MaleLabel.hidden = NO;
        //            self.crs_FeamaleLabel.hidden = NO;
        //
        //        }
        else if ([self.crs_CounryField.text isEqualToString:@"TANZANIA"])
        {
            bankType = @"0";
            kenyaBankType = @"2";
            countryCode = @"TZS";
            PaymentType = @"Wallet";
            self.crs_CashPickUp.text = @"MOBILE WALLET";
            self.crs_AccountCredit.hidden = NO ;
            self.crs_BankAcountClick.hidden = NO;
            self.Crs_CashPay_view.hidden = NO;
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNumberPad];
            [_crs_Ifsc reloadInputViews];
            
            self.crs_Ifsc.placeholder = @"Account Number";
            self.crs_BranchName.hidden = YES;
            
            // self.crs_BranchName.placeholder = @"Account Number";
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_Bankbuttonhider.hidden = NO;
            //self.crs_DropDown.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_DropImage.hidden = NO;
            self.crs_NepalBranchNameLabel.hidden = YES;
            //[self.crs_BankAcountClick  setSelected:NO];
            [self.crs_BankAcountClick  setSelected:NO];
            [self.crs_IbanClick setSelected:NO];
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        else if ([self.crs_CounryField.text isEqualToString:@"GHANA"])
        {
            bankType = @"0";
            kenyaBankType = @"2";
            countryCode = @"GHS";
            PaymentType = @"Wallet";
            self.crs_CashPickUp.text = @"MOBILE WALLET";
            self.crs_AccountCredit.hidden = NO ;
            self.crs_BankAcountClick.hidden = NO;
            self.Crs_CashPay_view.hidden = NO;
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNumberPad];
            [_crs_Ifsc reloadInputViews];
            
            self.crs_Ifsc.placeholder = @"Account Number";
            self.crs_BranchName.hidden = YES;
            
            // self.crs_BranchName.placeholder = @"Account Number";
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_Bankbuttonhider.hidden = NO;
            //self.crs_DropDown.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_DropImage.hidden = NO;
            self.crs_NepalBranchNameLabel.hidden = YES;
            //[self.crs_BankAcountClick  setSelected:NO];
            [self.crs_BankAcountClick  setSelected:NO];
            [self.crs_IbanClick setSelected:NO];
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        else if ([self.crs_CounryField.text isEqualToString:@"UGANDA"])
        {
            bankType = @"0";
            kenyaBankType = @"2";
            countryCode = @"UGX";
            PaymentType = @"Wallet";
            self.crs_CashPickUp.text = @"MOBILE WALLET";
            self.crs_AccountCredit.hidden = NO ;
            self.crs_BankAcountClick.hidden = NO;
            self.Crs_CashPay_view.hidden = NO;
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNumberPad];
            [_crs_Ifsc reloadInputViews];
            
            self.crs_Ifsc.placeholder = @"Account Number";
            self.crs_BranchName.hidden = YES;
            
            // self.crs_BranchName.placeholder = @"Account Number";
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_Bankbuttonhider.hidden = NO;
            //self.crs_DropDown.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_DropImage.hidden = NO;
            self.crs_NepalBranchNameLabel.hidden = YES;
            //[self.crs_BankAcountClick  setSelected:NO];
            [self.crs_BankAcountClick  setSelected:NO];
            [self.crs_IbanClick setSelected:NO];
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        else if ([self.crs_CounryField.text isEqualToString:@"RWANDA"])
        {
            bankType = @"0";
            kenyaBankType = @"2";
            countryCode = @"RWF";
            PaymentType = @"Wallet";
            self.crs_CashPickUp.text = @"MOBILE WALLET";
            self.crs_AccountCredit.hidden = NO ;
            self.crs_BankAcountClick.hidden = NO;
            self.Crs_CashPay_view.hidden = NO;
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNumberPad];
            [_crs_Ifsc reloadInputViews];
            
            self.crs_Ifsc.placeholder = @"Account Number";
            self.crs_BranchName.hidden = YES;
            
            // self.crs_BranchName.placeholder = @"Account Number";
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_Bankbuttonhider.hidden = NO;
            //self.crs_DropDown.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_DropImage.hidden = NO;
            self.crs_NepalBranchNameLabel.hidden = YES;
            //[self.crs_BankAcountClick  setSelected:NO];
            [self.crs_BankAcountClick  setSelected:NO];
            [self.crs_IbanClick setSelected:NO];
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        //        else if ([self.crs_CounryField.text isEqualToString:@"ZAMBIA"])
        //        {
        //            bankType = @"0";
        //            kenyaBankType = @"2";
        //            countryCode = @"ZMB";
        //            PaymentType = @"Wallet";
        //            self.crs_CashPickUp.text = @"MOBILE WALLET";
        //            self.crs_AccountCredit.hidden = NO ;
        //            self.crs_BankAcountClick.hidden = NO;
        //            self.Crs_CashPay_view.hidden = NO;
        //            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNumberPad];
        //            [_crs_Ifsc reloadInputViews];
        //
        //            self.crs_Ifsc.placeholder = @"Account Number";
        //            self.crs_BranchName.hidden = YES;
        //
        //            // self.crs_BranchName.placeholder = @"Account Number";
        //            self.crs_NepaliBranch.hidden = YES;
        //            self.crs_BankAccount.hidden = YES;
        //            self.crs_Bankbuttonhider.hidden = NO;
        //            //self.crs_DropDown.hidden = NO;
        //            self.crs_DateOfBirthField.hidden = YES;
        //            self.crs_DropImage.hidden = NO;
        //            self.crs_NepalBranchNameLabel.hidden = YES;
        //            //[self.crs_BankAcountClick  setSelected:NO];
        //            [self.crs_BankAcountClick  setSelected:NO];
        //            [self.crs_IbanClick setSelected:NO];
        //            self.crs_Ifsc.userInteractionEnabled = YES;
        //            self.crs_VitenamView.hidden = YES;
        //            // Hiding For Vietnam
        //            self.crs_MaleTouch.hidden = NO;
        //            self.crs_FemaleTouch.hidden = NO;
        //            self.crs_CityField.hidden = NO;
        //            self.crs_Mobile.hidden = NO;
        //            self.crs_DateOfBirthField.hidden = YES;
        //            self.crs_MaleClick.hidden = NO;
        //            self.crs_FemaleClick.hidden = NO;
        //            self.crs_MaleLabel.hidden = NO;
        //            self.crs_FeamaleLabel.hidden = NO;
        //
        //        }
        else if ([self.crs_CounryField.text isEqualToString:@"NIGERIA"])
        {
            bankType = @"0";
            kenyaBankType = @"2";
            countryCode = @"NGN";
            PaymentType = @"Wallet";
            self.crs_CashPickUp.text = @"MOBILE WALLET";
            self.crs_AccountCredit.hidden = NO ;
            self.crs_BankAcountClick.hidden = NO;
            self.Crs_CashPay_view.hidden = NO;
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNumberPad];
            [_crs_Ifsc reloadInputViews];
            
            self.crs_Ifsc.placeholder = @"Account Number";
            self.crs_BranchName.hidden = YES;
            
            // self.crs_BranchName.placeholder = @"Account Number";
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_Bankbuttonhider.hidden = NO;
            //self.crs_DropDown.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_DropImage.hidden = NO;
            self.crs_NepalBranchNameLabel.hidden = YES;
            //[self.crs_BankAcountClick  setSelected:NO];
            [self.crs_BankAcountClick  setSelected:NO];
            [self.crs_IbanClick setSelected:NO];
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        
        //        else if ([_crs_CounryField.text isEqualToString:@"TANZANIA"])
        //        {
        //            bankType = @"1";
        //            countryCode = @"TZS";
        //            PaymentType = @"Wallet";
        //            self.crs_CashPickUp.text = @"Mobile Wallet";
        //            self.crs_AccountCredit.hidden = NO ;
        //            self.crs_BankAcountClick.hidden = NO;
        //            self.Crs_CashPay_view.hidden = NO;
        //            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNumberPad];
        //            [_crs_Ifsc reloadInputViews];
        //
        //            self.crs_Ifsc.placeholder = @"Account Number";
        //            self.crs_BranchName.hidden = YES;
        //
        //            // self.crs_BranchName.placeholder = @"Account Number";
        //            self.crs_NepaliBranch.hidden = YES;
        //            self.crs_BankAccount.hidden = YES;
        //            self.crs_Bankbuttonhider.hidden = YES;
        //            //self.crs_DropDown.hidden = NO;
        //            self.crs_DateOfBirthField.hidden = YES;
        //            self.crs_DropImage.hidden = NO;
        //            self.crs_NepalBranchNameLabel.hidden = YES;
        //            //[self.crs_BankAcountClick  setSelected:NO];
        //            [self.crs_BankAcountClick  setSelected:NO];
        //            [self.crs_IbanClick setSelected:NO];
        //            self.crs_Ifsc.userInteractionEnabled = YES;
        //            self.crs_VitenamView.hidden = YES;
        //            // Hiding For Vietnam
        //            self.crs_MaleTouch.hidden = NO;
        //            self.crs_FemaleTouch.hidden = NO;
        //            self.crs_CityField.hidden = NO;
        //            self.crs_Mobile.hidden = NO;
        //            self.crs_DateOfBirthField.hidden = YES;
        //            self.crs_MaleClick.hidden = NO;
        //            self.crs_FemaleClick.hidden = NO;
        //            self.crs_MaleLabel.hidden = NO;
        //            self.crs_FeamaleLabel.hidden = NO;
        //
        //        }
        else if ([self.crs_CounryField.text isEqualToString:@"GAMBIA"])
        {
            bankType = @"0";
            countryCode = @"GMD";
            self.crs_CashPickUp.text = @"CASH PICK-UP";
            self.crs_AccountCredit.hidden = YES ;
            self.crs_BankAcountClick.hidden = YES;
            self.Crs_CashPay_view.hidden = NO;
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNamePhonePad];
            [_crs_Ifsc reloadInputViews];
            
            self.crs_Ifsc.placeholder = @"Branch Name";
            self.crs_BranchName.placeholder = @"Account Number";
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_Bankbuttonhider.hidden = NO;
            //self.crs_DropDown.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_DropImage.hidden = NO;
            self.crs_NepalBranchNameLabel.hidden = YES;
            //[self.crs_BankAcountClick  setSelected:NO];
            [self.crs_BankAcountClick  setSelected:NO];
            [self.crs_IbanClick setSelected:NO];
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"NEPAL"])
        {
            bankType = @"0";
            countryCode = @"NPR";
            self.crs_CashPickUp.text = @"CASH PICK-UP";
            self.crs_AccountCredit.hidden = NO ;
            self.crs_BankAcountClick.hidden = NO;
            self.Crs_CashPay_view.hidden = NO;
            self.crs_NepalBranchNameLabel.hidden = NO;
            self.crs_Ifsc.placeholder = @"";
            self.crs_BranchName.placeholder = @"Account Number";
            self.crs_Ifsc.userInteractionEnabled = NO;
            self.crs_BankAccount.hidden = YES;
            self.crs_Bankbuttonhider.hidden = NO;
            //self.crs_DropDown.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_DropImage.hidden = NO;
            self.crs_NepaliBranch.hidden = NO;
            //[self.crs_BankAcountClick  setSelected:NO];
            [self.crs_BankAcountClick  setSelected:NO];
            [self.crs_IbanClick setSelected:NO];
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"UNITED STATES"])
        {
            
            bankType = @"1";
            
            self.crs_CashPickUp.text = @"ACCOUNT CREDIT";
            [self.crs_BankAcountClick  setSelected:YES];
            self.crs_AccountCredit.hidden = YES;
            self.crs_BankAcountClick.hidden = YES;
            self.Crs_CashPay_view.hidden = YES;
            self.crs_BranchName.placeholder = @"Branch Name";
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNamePhonePad];
            [_crs_Ifsc reloadInputViews];
            //            [self.crs_BankAccount setKeyboardType:UIKeyboardTypeNamePhonePad];
            //            [_crs_Ifsc reloadInputViews];
            
            self.crs_Ifsc.placeholder = @"Swift Code";
            self.crs_BankAccount.placeholder = @"Account Number";
            self.crs_Bankbuttonhider.hidden = YES;
            self.crs_BankAccount.hidden = NO;
            self.crs_DropImage.hidden = YES;
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_DateOfBirthField.hidden = YES;
            [self.crs_IbanClick setSelected:NO];
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        
        else if ([self.crs_CounryField.text isEqualToString:@"AUSTRALIA"])
        {
            
            bankType = @"1";
            [self.crs_BankAcountClick  setSelected:YES];
            self.crs_CashPickUp.text = @"ACCOUNT CREDIT";
            self.crs_AccountCredit.hidden = YES;
            self.crs_BankAcountClick.hidden = YES;
            self.Crs_CashPay_view.hidden = YES;
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BranchName.placeholder = @"Branch Name";
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNamePhonePad];
            [_crs_Ifsc reloadInputViews];
            
            self.crs_Ifsc.placeholder = @"Swift Code";
            self.crs_Bankbuttonhider.hidden = YES;
            self.crs_BankAccount.hidden = NO;
            self.crs_DropImage.hidden = YES;
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_DateOfBirthField.hidden = YES;
            [self.crs_IbanClick setSelected:NO];
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"SIERRA LEONE"]||[self.crs_CounryField.text isEqualToString:@"CANADA"])
        {
            
            bankType = @"1";
            [self.crs_BankAcountClick  setSelected:YES];
            self.crs_CashPickUp.text = @"ACCOUNT CREDIT";
            self.crs_AccountCredit.hidden = YES;
            self.crs_BankAcountClick.hidden = YES;
            self.Crs_CashPay_view.hidden = YES;
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BranchName.placeholder = @"Branch Name";
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNamePhonePad];
            [_crs_Ifsc reloadInputViews];
            
            self.crs_Ifsc.placeholder = @"Swift Code";
            self.crs_Bankbuttonhider.hidden = YES;
            self.crs_BankAccount.hidden = NO;
            self.crs_DropImage.hidden = YES;
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_DateOfBirthField.hidden = YES;
            [self.crs_IbanClick setSelected:NO];
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"PAKISTAN"])
        {
            // India
            bankType = @"0";
            self.crs_CashPickUp.text = @"CASH PICK-UP";
            self.crs_AccountCredit.hidden = NO ;
            self.crs_BankAcountClick.hidden = NO;
            self.Crs_CashPay_view.hidden = NO;
            self.crs_NepaliBranch.hidden = YES;
            //            self.crs_Ifsc.placeholder = @"IFSC ";
            //            self.crs_BranchName.placeholder = @"Branch Name";
            //            self.crs_BankAccount.hidden = NO;
            //            self.crs_Bankbuttonhider.hidden = NO;
            //            self.crs_DropImage.hidden = NO;
            //         [self.crs_BankAcountClick  setSelected:NO];
            //
            
            
            //bankType = @"1";
            
            // [self.crs_BankAcountClick  setSelected:NO];
            //            self.crs_CashPickUp.text = @"Account Credit";
            //            self.crs_AccountCredit.hidden = YES;
            //           self.crs_BankAcountClick.hidden = YES;
            //            self.Crs_CashPay_view.hidden = YES;
            
            
           
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_BranchName.placeholder = @"Branch Name";
            self.crs_Ifsc.placeholder = @"Branch Code";
            self.crs_Bankbuttonhider.hidden = NO;
            self.crs_BankAccount.hidden = NO;
            self.crs_DropImage.hidden = NO;
            self.crs_DateOfBirthField.hidden = NO;
            [self.crs_BankAcountClick  setSelected:NO];
            [self.crs_IbanClick setSelected:NO];
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = NO;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        
        
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"VIETNAM"]) {
            
            
            bankType = @"0";
            countryCode = @"VND";
            self.crs_CashPickUp.text = @"CASH PICK-UP";
            self.crs_AccountCredit.hidden = NO ;
            self.crs_BankAcountClick.hidden = NO;
            self.Crs_CashPay_view.hidden = NO;
            self.crs_Ifsc.placeholder = @"Branch Name";
            self.crs_BranchName.placeholder = @"Account Number";
            self.crs_BankAccount.hidden = NO;
            self.crs_Bankbuttonhider.hidden = NO;
            self.crs_DropImage.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_NepaliBranch.hidden = YES;
            //[self.crs_BankAcountClick  setSelected:NO];
            self.crs_NepalBranchNameLabel.hidden = YES;
            [self.crs_BankAcountClick  setSelected:NO];
            [self.crs_IbanClick setSelected:NO];
            
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = NO;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = YES;
            self.crs_FemaleTouch.hidden = YES;
            self.crs_CityField.hidden = YES;
            self.crs_Mobile.hidden = YES;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = YES;
            self.crs_FemaleClick.hidden = YES;
            self.crs_MaleLabel.hidden = YES;
            self.crs_FeamaleLabel.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        
        
        
        
        
        
        //SINGAPORE,HONKONG, THAILAND,JAPAN,NEW ZEALAND,OMAN,SOUTH AFRICA
        
        else if ([self.crs_CounryField.text isEqualToString:@"SINGAPORE"]||[self.crs_CounryField.text isEqualToString:@"HONG KONG"]||[self.crs_CounryField.text isEqualToString:@"THAILAND"]||[self.crs_CounryField.text isEqualToString:@"JAPAN"]||[self.crs_CounryField.text isEqualToString:@"NEW ZEALAND"]||[self.crs_CounryField.text isEqualToString:@"OMAN"]||[self.crs_CounryField.text isEqualToString:@"SOUTH AFRICA"]||[self.crs_CounryField.text isEqualToString:@"HONG KONG"]) {
            
            
            
            bankType = @"1";
            [self.crs_BankAcountClick  setSelected:YES];
            self.crs_CashPickUp.text = @"ACCOUNT CREDIT";
            self.crs_AccountCredit.hidden = YES;
            self.crs_BankAcountClick.hidden = YES;
            self.Crs_CashPay_view.hidden = YES;
            self.crs_BranchName.placeholder = @"Account Number";
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNamePhonePad];
            [_crs_Ifsc reloadInputViews];
            
            self.crs_Ifsc.placeholder = @"Swift Code";
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_Bankbuttonhider.hidden = YES;
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_DropImage.hidden = YES;
            self.crs_DateOfBirthField.hidden = YES;
            [self.crs_IbanClick setSelected:NO];
            self.crs_BranchName.hidden = NO;
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        
        else if ([self.crs_CounryField.text isEqualToString:@"ZAMBIA"]) {
            
            
            
            bankType = @"1";
            countryCode = @"ZMW";
            [self.crs_BankAcountClick  setSelected:YES];
            self.crs_CashPickUp.text = @"ACCOUNT CREDIT";
            self.crs_AccountCredit.hidden = YES;
            self.crs_BankAcountClick.hidden = YES;
            self.Crs_CashPay_view.hidden = YES;
            self.crs_BranchName.hidden = YES;
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNamePhonePad];
            [_crs_Ifsc reloadInputViews];
            self.crs_SelectBranch.hidden = NO;
            
            self.crs_Ifsc.placeholder = @"Account Number";
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_Bankbuttonhider.hidden =NO;
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_DropImage.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            [self.crs_IbanClick setSelected:NO];
            self.crs_BranchName.hidden = YES;
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        else if ([self.crs_CounryField.text isEqualToString:@"ZIMBABWE"]) {
            
            
            
            bankType = @"1";
            countryCode = @"ZMW";
            [self.crs_BankAcountClick  setSelected:YES];
            self.crs_CashPickUp.text = @"ACCOUNT CREDIT";
            self.crs_AccountCredit.hidden = YES;
            self.crs_BankAcountClick.hidden = YES;
            self.Crs_CashPay_view.hidden = YES;
            self.crs_BranchName.hidden = YES;
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNamePhonePad];
            [_crs_Ifsc reloadInputViews];
            self.crs_SelectBranch.hidden = NO;
            
            self.crs_Ifsc.placeholder = @"Account Number";
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_Bankbuttonhider.hidden =NO;
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_DropImage.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            [self.crs_IbanClick setSelected:NO];
            self.crs_BranchName.hidden = YES;
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        
        
        else if ([self.crs_CounryField.text isEqualToString:@"BULGARIA"]||[self.crs_CounryField.text isEqualToString:@"ROMANIA"]||[self.crs_CounryField.text isEqualToString:@"ISRAEL"]||[self.crs_CounryField.text isEqualToString:@"KUWAIT"]||[self.crs_CounryField.text isEqualToString:@"QATAR"]||[self.crs_CounryField.text isEqualToString:@"UNITED ARAB EMIRATES"]||[self.crs_CounryField.text isEqualToString:@"SAUDI ARABIA"]||[self.crs_CounryField.text isEqualToString:@"TURKEY"]||[self.crs_CounryField.text isEqualToString:@"SWITZERLAND"]||[self.crs_CounryField.text isEqualToString:@"CROATIA"]||[self.crs_CounryField.text isEqualToString:@"BAHRAIN"]||[self.crs_CounryField.text isEqualToString:@"POLAND"]){
            
            bankType = @"1";
            [self.crs_BankAcountClick  setSelected:YES];
            self.crs_CashPickUp.text = @"ACCOUNT CREDIT";
            self.crs_AccountCredit.hidden = YES;
            self.crs_BankAcountClick.hidden = YES;
            self.Crs_CashPay_view.hidden = YES;
            self.crs_BranchName.placeholder = @"IBAN";
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNamePhonePad];
            [_crs_Ifsc reloadInputViews];
            
            self.crs_Ifsc.placeholder = @"Swift Code";
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_Bankbuttonhider.hidden = YES;
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_DropImage.hidden = YES;
            self.crs_DateOfBirthField.hidden = YES;
            [self.crs_IbanClick setSelected:NO];
            self.crs_BranchName.hidden = NO;
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
            
        }
        
        else
        {
            
            
            bankType = @"1";
            [self.crs_BankAcountClick  setSelected:YES];
            self.crs_CashPickUp.text = @"ACCOUNT CREDIT";
            self.crs_AccountCredit.hidden = YES;
            self.crs_BankAcountClick.hidden = YES;
            self.Crs_CashPay_view.hidden = YES;
            self.crs_BranchName.placeholder = @"IBAN / Account Number";
            [_crs_Ifsc setKeyboardType:UIKeyboardTypeNamePhonePad];
            [_crs_Ifsc reloadInputViews];
            
            self.crs_Ifsc.placeholder = @"Swift Code";
            self.crs_NepalBranchNameLabel.hidden = YES;
            self.crs_Bankbuttonhider.hidden = YES;
            self.crs_NepaliBranch.hidden = YES;
            self.crs_BankAccount.hidden = YES;
            self.crs_DropImage.hidden = YES;
            self.crs_DateOfBirthField.hidden = YES;
            [self.crs_IbanClick setSelected:NO];
            self.crs_BranchName.hidden = NO;
            self.crs_Ifsc.userInteractionEnabled = YES;
            self.crs_VitenamView.hidden = YES;
            // Hiding For Vietnam
            self.crs_MaleTouch.hidden = NO;
            self.crs_FemaleTouch.hidden = NO;
            self.crs_CityField.hidden = NO;
            self.crs_Mobile.hidden = NO;
            self.crs_DateOfBirthField.hidden = YES;
            self.crs_MaleClick.hidden = NO;
            self.crs_FemaleClick.hidden = NO;
            self.crs_MaleLabel.hidden = NO;
            self.crs_FeamaleLabel.hidden = NO;
            self.Crs_BranchOutlet.hidden = YES;
            self.crs_BanglaBranchLabel.hidden = YES;
            self.crs_banglaDrop.hidden = YES;
        }
        
        
        NSLog(@" component zero %@ ",[countryArray objectAtIndex:indexPath.row]);
        
        //[pickerView selectRow:row inComponent:1 animated:true];
        
        self.crs_CountrySelectorView.hidden = YES;
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(5, 5);
    cell.alpha = 0;
    
    //2. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.5];
    cell.transform = CGAffineTransformMakeTranslation(0.f, 0);
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
}
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//
//
//    //1. Setup the CATransform3D structure
//    CATransform3D rotation;
//    rotation = CATransform3DMakeRotation( (55.0*M_PI)/180, 0.0, 10.4, 0.4);
//    rotation.m34 = 20.0/ 1000;
//
//
//    //2. Define the initial state (Before the animation)
//    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    cell.layer.shadowOffset = CGSizeMake(10, 10);
//    cell.alpha = 0;
//
//    cell.layer.transform = rotation;
//    cell.layer.anchorPoint = CGPointMake(0, 0.5);
//
//
//    //3. Define the final state (After the animation) and commit the animation
//    [UIView beginAnimations:@"rotation" context:NULL];
//    [UIView setAnimationDuration:1.0];
//    cell.layer.transform = CATransform3DIdentity;
//    cell.alpha = 1;
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//    [UIView commitAnimations];
//
//}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == _crs_FirstNameField) {
        
        
        
        
        
        
        CGPoint scrollPoint = CGPointMake(0,30);
        [  self.crs_RecieverScrollView setContentOffset:scrollPoint animated:YES];
        
        
    }
    
    else if (textField == _crs_MiddleNameField)
        
        
    {
        
        CGPoint scrollPoint = CGPointMake(0,60);
        [  self.crs_RecieverScrollView setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    
    else if (textField == _crs_LastName)
        
        
    {
        
        CGPoint scrollPoint = CGPointMake(0,90);
        [  self.crs_RecieverScrollView setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    
    else if (textField == _crs_CityField)
        
        
    {
        
        CGPoint scrollPoint = CGPointMake(0,120);
        [  self.crs_RecieverScrollView setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    else if (textField == _crs_EntityName)
        
        
    {
        
        CGPoint scrollPoint = CGPointMake(0,120);
        [  self.crs_RecieverScrollView setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    else if (textField == _crs_Mobile)
        
        
    {
        
        CGPoint scrollPoint = CGPointMake(0,150);
        [  self.crs_RecieverScrollView setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    
    else if (textField == _crs_SelectBranch)
        
        
    {
        
        CGPoint scrollPoint = CGPointMake(0,180);
        [  self.crs_RecieverScrollView setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    else if (textField == _crs_Ifsc)
        
        
    {
        
        CGPoint scrollPoint = CGPointMake(0,500);
        [  self.crs_RecieverScrollView setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    else if (textField == _crs_BranchName)
        
        
    {
        
        CGPoint scrollPoint = CGPointMake(0,530);
        [  self.crs_RecieverScrollView setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    else if (textField == _crs_BankAccount)
        
        
    {
        
        CGPoint scrollPoint = CGPointMake(0,560);
        [  self.crs_RecieverScrollView setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    
}







-(void) textFieldDidEndEditing:(UITextField *)textField {
    //[self.crs_RecieverScrollView setContentOffset:CGPointZero animated:YES];
    
    
    
    
}
//-(BOOL) textFieldShouldReturn:(UITextField *)textField{
//
//
//    NSInteger nextTag = textField.tag + 1;
//    // Try to find next responder
//    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
//    if (nextResponder) {
//        // Found next responder, so set it.
//        [nextResponder becomeFirstResponder];
//        if(nextTag==6)
//        {
//
//
//            [[self view] endEditing:YES];
//
//        }
//    }
//
//
//    return NO;
//
//}
-(BOOL) textFieldShouldReturn: (UITextField *) textField
{
    [textField resignFirstResponder];
    
    
    return YES;
}





-(void)getcountrydetails
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:Crosspay_getCountry] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        crs_CountryList = [json valueForKey: @"country"];
        crs_CountryList1 = [json valueForKey: @"country"];
        NSLog(@"%@", crs_CountryList);
        
        
        
    }];
    
    [dataTask resume];
    
}


-(void)clearNumberPad{
    [_crs_SelectBranch resignFirstResponder];
    [_crs_Ifsc resignFirstResponder];
    [_crs_FirstNameField resignFirstResponder];
    [_crs_Mobile resignFirstResponder];
    [_crs_MiddleNameField resignFirstResponder];
    [_crs_LastName resignFirstResponder];
    [_crs_CityField resignFirstResponder];
    [_crs_BranchName resignFirstResponder];
    [_crs_BankAccount resignFirstResponder];
    [_crs_search resignFirstResponder];
    [_crs_VietnamMobile resignFirstResponder];
    [_crs_EntityName resignFirstResponder];
    
    self.crs_search.text = @"";
    
    
    
    
    
    
}

-(void)doneWithNumberPad{
    //NSString *numberFromTheKeyboard = self.crs_SelectBranch.text;
    [_crs_SelectBranch resignFirstResponder];
    [_crs_Ifsc resignFirstResponder];
    [_crs_FirstNameField resignFirstResponder];
    [_crs_Mobile resignFirstResponder];
    [_crs_MiddleNameField resignFirstResponder];
    [_crs_LastName resignFirstResponder];
    [_crs_CityField resignFirstResponder];
    [_crs_BranchName resignFirstResponder];
    [_crs_BankAccount resignFirstResponder];
    [_crs_search resignFirstResponder];
    [_crs_VietnamMobile resignFirstResponder];
    [_crs_EntityName resignFirstResponder];
}





-(void)viewWillAppear:(BOOL)animated
{
    
    
    //
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"Add Reciever And Update  View controller"];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
}

#pragma mark -Searchmethod

-(void)textFieldDidChanges:(UITextField *)textField
{
    self.searchTextString=textField.text;
    if ([Crs_str_banklist isEqualToString:@"list"]){
        
        [self updateSearchArray:self.searchTextString];
    }
    
    
    else if ([Crs_str_banklist isEqualToString:@"wardCaller"]){
        
        [self updateSearchArrayWard:self.searchTextString];
        
    }
    
    
    else if ([Crs_str_banklist isEqualToString:@"DistrictsCaller"]){
        [self updateSearchArrayDistrict:self.searchTextString];
        
    }
    else if ([Crs_str_banklist isEqualToString:@"CITY_NAME"]){
        
        [self updateSearchArrayCity:self.searchTextString];
        
    }
    
    else{
        
        [self updateSearchArrays:self.searchTextString];
        
        
        
    }
    
}

-(void)updateSearchArray:(NSString *)searchText
{
    searchArray = [NSMutableArray new];
    
    if(searchText.length==0)
    {
        isFiltered=NO;
        searchArray = Crs_Array_list ;
        NSLog(@"%@",searchArray);
        [self.crs_CountryTableView reloadData ];
    }
    else
    {
        isFiltered=YES;
        
        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in Crs_Array_list){
            NSString * string= [NSString stringWithFormat:@"%@",[dic valueForKey:@"bank_name"]] ;
            
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                
                // NSString * Ary_id=[dic valueForKey:@"id"];
                
                [searchArray addObject:dic];
                
                NSLog(@"search %@",searchArray);
                
            }
        }
        
        
        
        /// historyArray = searchArray;
        [self.crs_CountryTableView reloadData ];
        
        
    }
    
    
    
}

-(void)updateSearchArrays:(NSString *)searchText
{
    searchArray = [NSMutableArray new];
    
    if(searchText.length==0)
    {
        isFiltered=NO;
        searchArray = crs_CountryList ;
        NSLog(@"%@",searchArray);
        [self.crs_CountryTableView reloadData ];
    }
    else
    {
        isFiltered=YES;
        
        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in crs_CountryList){
            NSString * string= [NSString stringWithFormat:@"%@",[dic valueForKey:@"country_name"]] ;
            
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                
                // NSString * Ary_id=[dic valueForKey:@"id"];
                
                [searchArray addObject:dic];
                
                NSLog(@"search %@",searchArray);
                
            }
        }
        
        
        
        /// historyArray = searchArray;
        [self.crs_CountryTableView reloadData ];
        
        
    }
    
    
    
}

-(void)updateSearchArrayWard:(NSString *)searchText
{
    searchArray = [NSMutableArray new];
    
    if(searchText.length==0)
    {
        isFiltered=NO;
        searchArray = crs_CountryList ;
        NSLog(@"%@",searchArray);
        [self.crs_CountryTableView reloadData ];
    }
    else
    {
        isFiltered=YES;
        
        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in wardArray){
            NSString * string= [NSString stringWithFormat:@"%@",[dic valueForKey:@"WARD_NAME"]] ;
            
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                
                // NSString * Ary_id=[dic valueForKey:@"id"];
                
                [searchArray addObject:dic];
                
                NSLog(@"search %@",searchArray);
                
            }
        }
        
        
        
        /// historyArray = searchArray;
        [self.crs_CountryTableView reloadData ];
        
        
    }
    
    
    
}
-(void)updateSearchArrayDistrict:(NSString *)searchText
{
    searchArray = [NSMutableArray new];
    
    if(searchText.length==0)
    {
        isFiltered=NO;
        searchArray = crs_CountryList ;
        NSLog(@"%@",searchArray);
        [self.crs_CountryTableView reloadData ];
    }
    else
    {
        isFiltered=YES;
        
        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in DistrictStoringArray){
            NSString * string= [NSString stringWithFormat:@"%@",[dic valueForKey:@"DISTRICT_NAME"]] ;
            
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                
                // NSString * Ary_id=[dic valueForKey:@"id"];
                
                [searchArray addObject:dic];
                
                NSLog(@"search %@",searchArray);
                
            }
        }
        
        
        
        /// historyArray = searchArray;
        [self.crs_CountryTableView reloadData ];
        
        
    }
    
    
    
}
-(void)updateSearchArrayCity:(NSString *)searchText
{
    searchArray = [NSMutableArray new];
    
    if(searchText.length==0)
    {
        isFiltered=NO;
        searchArray = crs_CountryList ;
        NSLog(@"%@",searchArray);
        [self.crs_CountryTableView reloadData ];
    }
    else
    {
        isFiltered=YES;
        
        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in CityStoringArray){
            NSString * string= [NSString stringWithFormat:@"%@",[dic valueForKey:@"CITY_NAME"]] ;
            
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                
                // NSString * Ary_id=[dic valueForKey:@"id"];
                
                [searchArray addObject:dic];
                
                NSLog(@"search %@",searchArray);
                
            }
        }
        
        
        
        /// historyArray = searchArray;
        [self.crs_CountryTableView reloadData ];
        
        
    }
    
    
    
}
- (IBAction)crs_VietnmaAction:(id)sender {
}
- (IBAction)crs_VietnamMaleAction:(id)sender {
    gender = @"male";
    
    [self.crs_MaleClick setSelected:NO];
    [self.crs_FemaleClick setSelected:NO];
    NSLog(@"Iam sai %@",gender);
    
    
}
- (IBAction)crs:(id)sender {
}
- (IBAction)crs_FemaleVietnma:(id)sender {
    
    gender = @"female";
    [self.crs_MaleClick setSelected:YES];
    [self.crs_FemaleClick setSelected:YES];
    
    NSLog(@"Iam Anusha %@",gender);
    
    
}
- (IBAction)crs_DistrictAction:(id)sender {
    isFiltered = NO;
    Crs_str_banklist = @"DistrictsCaller";
    self.crs_search.hidden = YES;
    NSLog(@" You Have Tapped On Me %@",DistrictStoringArray);
    
    
    self.crs_VitenamView.hidden = NO;
    self.crs_CountrySelectorView.hidden = NO;
    [self.crs_pickerview_data reloadAllComponents];
    [self.crs_CountryTableView reloadData];
}
- (IBAction)crs_WardAction:(id)sender {
    self.crs_search.hidden = YES;
    Crs_str_banklist = @"WardCaller";
    [self PostWards];
    
    
}
- (IBAction)crs_VietCityAction:(id)sender {
    isFiltered = NO;
    
    self.crs_search.hidden = YES;
    //NSLog(@"HEllo City %@",self.crs_VietnamCity.text);
    Crs_str_banklist = @"CityCaller";
    
    NSLog(@" You Have Tapped On Me %@",CityStoringArray);
    
    
    self.crs_VitenamView.hidden = NO;
    self.crs_CountrySelectorView.hidden = NO;
    [self.crs_pickerview_data reloadAllComponents];
    [self.crs_CountryTableView reloadData];
    
    
}


-(void)GetDistricts
{
    
    
    
    DistrictStoringArray = [NSMutableArray new];
    // Get method for Nationality
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:Crosspay_GetDistricts] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            DistrictStoringArray = json;
            NSLog(@"%@", DistrictStoringArray);
            
        });
        // [self.countryList_TableView reloadData];
    }];
    
    [dataTask resume];
    
    
    
    
    
    [dataTask resume];
    
    
    
    
    
    
}


-(void)GetCites
{
    
    
    
    DistrictStoringArray = [NSMutableArray new];
    // Get method for Nationality
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:Crosspay_GetCitys] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            
            CityStoringArray = json;
            
            
        });
        // [self.countryList_TableView reloadData];
    }];
    
    [dataTask resume];
    
    
    
    
    
    
    
    
    
    
    
    
}



- (IBAction)vietnamAction:(id)sender {
    gender1 = @"male";
    [self.vietnamMaleoutlet setSelected:NO];
    [self.veitnamFemaleoutlet setSelected:NO];
    
}
- (IBAction)vietnamFemaleActio:(id)sender {
    gender1 = @"female";
    [self.vietnamMaleoutlet setSelected:YES];
    [self.veitnamFemaleoutlet setSelected:YES];
}
- (IBAction)vietnamMaleActionTouch:(id)sender {
}
- (IBAction)vietnamFemaleActionTouch:(id)sender {
}


-(void)PostWards{
    if ([self.crs_District.text isEqualToString:@""]) {
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select District For Wards" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        return;
        
    }
    else{
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_PostWards];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
        
        @try {
            
            
            
            [mapData setObject:DistrictCode forKey:@"districtId"];
            
        }
        @catch (NSException * e) {
            
            NSLog(@" HELLO THERE Exception: %@", e);
        }
        @finally {
            NSLog(@"finally");
        }
        NSLog(@"%@ sai Kiran Kunchala",mapData);
        
        
        
        
        
        
        
        
        
        
        
        
        NSLog(@"%@",mapData);
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [[crs_sharedmethods sharedMySingleton].Ary_view_LoadingBg removeFromSuperview];
                
                NSLog(@"error %@",error);
                NSLog(@"data %@",data);
                NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@", json );
                
                
                
                wardArray = json;
                
                isFiltered = NO;
                
                
                //NSLog(@"HEllo City %@",self.crs_VietnamCity.text);
                Crs_str_banklist = @"wardCaller";
                
                //NSLog(@" You Have Tapped On Me %@",W);
                
                
                self.crs_VitenamView.hidden = NO;
                self.crs_CountrySelectorView.hidden = NO;
                [self.crs_pickerview_data reloadAllComponents];
                [self.crs_CountryTableView reloadData];
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
        
    }
    
    
}


-(void)Vietnam {
    
    if ([self.crs_VietnamMobile.text  isEqualToString:@""]) {
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter  Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
    
    else if (self.crs_VietnamMobile.text.length <9)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        return;
        
        
        
        
    }
    
    
    
    
    else if ([self.crs_VietnamCity.text isEqualToString:@""]){
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        return;
        
        
        
    }
    
    
    
    else if ([self.crs_District.text isEqualToString:@""]){
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Select District" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        return;
        
        
        
    }
    
    //            else if ([self.crs_Ward.text isEqualToString:@""]){
    //
    //
    //                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Select Ward" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //                [alert show];
    //                return;
    //
    //
    
    // }
    
    
    else{
        
        
        
        if ([bankType isEqualToString:@"1"]){
            
            
            if ([self.crs_SelectBranch.text isEqualToString:@""]) {
                
                
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Select Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                
                
            }
            else if ([self.crs_Ifsc.text isEqualToString:@""]) {
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter Branch Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
            }
            else
                
                if ([self.crs_BranchName.text isEqualToString:@""]) {
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please enter  Account number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                }
            
            
            
            
            
            
            
                else{
                    
                    [self Crs_AccountCredit];
                }
        }
        
        
        
        else{
            
            [self Crs_AccountCredit];
        }
    }
    
    
    
    
    
}












- (IBAction)crs_IndividualAction:(id)sender {
    
    EntityType = @"Individual";
    self.crs_Hide.hidden = YES;
    
    CGPoint scrollPoint = CGPointMake(0,20);
    [  self.crs_RecieverScrollView setContentOffset:scrollPoint animated:YES];
    self.crs_FirstNameField.placeholder = @"First Name";
    [self.crs_IndividualOut setSelected:NO];
    [self.crs_CorparateOut setSelected:NO];
    self.crs_LastName.hidden = NO;
    
    self.crs_FirstNameField.hidden = NO;
    self.crs_MiddleNameField.hidden = NO;
    self.crs_EntityName.hidden = YES;
    
    self.crs_Femaleout.hidden = NO;
    self.crs_MaleOut.hidden = NO;
    self.vietnamMaletouch.hidden = NO;
    self.vietnamFemal.hidden = NO;
    self.crs_FemaleTouch.hidden = NO;
    self.crs_MaleTouch.hidden = NO;
    self.crs_MaleClick.hidden = NO;
    self.crs_FemaleClick.hidden = NO;
    self.crs_FeamaleLabel.hidden = NO;
    self.crs_MaleLabel.hidden = NO;
    self.vietnamMaleoutlet.hidden = NO;
    self.veitnamFemaleoutlet.hidden = NO;
    if ([_crs_CounryField.text isEqualToString:@"PAKISTAN"]) {
        self.crs_DateOfBirthField.hidden = NO;
    } else {
        self.crs_DateOfBirthField.hidden = YES;
    }
    
}

- (IBAction)crs_Individual1Action:(id)sender {
    
    EntityType = @"Individual";
    self.crs_Hide.hidden = YES;
    CGPoint scrollPoint = CGPointMake(0,20);
    [  self.crs_RecieverScrollView setContentOffset:scrollPoint animated:YES];
    self.crs_FirstNameField.hidden = NO;
    self.crs_MiddleNameField.hidden = NO;
    self.crs_EntityName.hidden = YES;
    self.crs_LastName.hidden = NO;
    
    self.crs_FirstNameField.placeholder = @"First Name";
    [self.crs_IndividualOut setSelected:NO];
    [self.crs_CorparateOut setSelected:NO];
    
    self.crs_Femaleout.hidden = NO;
    self.crs_MaleOut.hidden = NO;
    self.vietnamMaletouch.hidden = NO;
    self.vietnamFemal.hidden = NO;
    self.crs_FemaleTouch.hidden = NO;
    self.crs_MaleTouch.hidden = NO;
    self.crs_MaleClick.hidden = NO;
    self.crs_FemaleClick.hidden = NO;
    self.crs_FeamaleLabel.hidden = NO;
    self.crs_MaleLabel.hidden = NO;
    self.vietnamMaleoutlet.hidden = NO;
    self.veitnamFemaleoutlet.hidden = NO;
    
    if ([_crs_CounryField.text isEqualToString:@"PAKISTAN"]) {
        self.crs_DateOfBirthField.hidden = NO;
    } else {
        self.crs_DateOfBirthField.hidden = YES;
    }
    
    
}
- (IBAction)crs_CorparateAction:(id)sender {
    EntityType  = @"Corparate";
    self.crs_Hide.hidden = NO;
    self.crs_Femaleout.hidden = YES;
    self.crs_MaleOut.hidden = YES;
    self.vietnamMaletouch.hidden = YES;
    self.vietnamFemal.hidden = YES;
    self.crs_FemaleTouch.hidden = YES;
    self.crs_MaleTouch.hidden = YES;
    self.crs_MaleClick.hidden = YES;
    self.crs_FemaleClick.hidden = YES;
    self.crs_FeamaleLabel.hidden = YES;
    self.crs_MaleLabel.hidden = YES;
    self.vietnamMaleoutlet.hidden = YES;
    self.veitnamFemaleoutlet.hidden = YES;
    
    
    CGPoint scrollPoint = CGPointMake(0,120);
    [  self.crs_RecieverScrollView setContentOffset:scrollPoint animated:YES];
    
    self.crs_FirstNameField.hidden = YES;
    self.crs_MiddleNameField.hidden = YES;
    self.crs_EntityName.hidden = NO;
    self.crs_LastName.hidden = YES;
    self.crs_FirstNameField.placeholder = @"Entity Name";
    [self.crs_IndividualOut setSelected:YES];
    [self.crs_CorparateOut setSelected:YES];
    
    
    if ([self.crs_CounryField.text isEqualToString:@"PAKISTAN"]) {
        self.crs_DateOfBirthField.hidden = NO;
    } else {
        self.crs_DateOfBirthField.hidden = YES;
    }
}

- (IBAction)crs_Coraparate1Action:(id)sender {
    EntityType  = @"Corparate";
    self.crs_Hide.hidden = NO;
    CGPoint scrollPoint = CGPointMake(0,120);
    [  self.crs_RecieverScrollView setContentOffset:scrollPoint animated:YES];
    
    
    self.crs_Femaleout.hidden = YES;
    self.crs_MaleOut.hidden = YES;
    self.vietnamMaletouch.hidden = YES;
    self.vietnamFemal.hidden = YES;
    self.crs_FemaleTouch.hidden = YES;
    self.crs_MaleTouch.hidden = YES;
    self.crs_MaleClick.hidden = YES;
    self.crs_FemaleClick.hidden = YES;
    self.crs_FeamaleLabel.hidden = YES;
    self.crs_MaleLabel.hidden = YES;
    self.vietnamMaleoutlet.hidden = YES;
    self.veitnamFemaleoutlet.hidden = YES;
      self.crs_DateOfBirthField.hidden = NO;
    
    self.crs_FirstNameField.hidden = YES;
    self.crs_LastName.hidden = YES;
    self.crs_MiddleNameField.hidden = YES;
    self.crs_EntityName.hidden = NO;
    self.crs_FirstNameField.placeholder = @"Entity Name";
    [self.crs_IndividualOut setSelected:YES];
    [self.crs_CorparateOut setSelected:YES];
    if ([self.crs_CounryField.text isEqualToString:@"PAKISTAN"]) {
        self.crs_DateOfBirthField.hidden = NO;
    } else {
        self.crs_DateOfBirthField.hidden = YES;
    }
}
- (IBAction)crs_BranchAction:(id)sender {
    self.crs_BanglaBranchLabel.hidden = NO;
    
    NSLog(@"Helllo Iam working");
   
    
    if ([self.crs_SelectBranch.text isEqualToString:@""]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Bank Name For Branches" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        return;
        
    } else {
        Crs_str_banklist = @"BranchGetter";
        self.crs_CountrySelectorView.hidden = NO;
        [self BranchCodes];
    }
    //[self.crs_CountryTableView reloadData];
}



-(void)BranchCodes{
    
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_GetBranchCode];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    @try {
        
        
        
        [mapData setObject:crs_bankCode forKey:@"bankcode"];
        
    }
    @catch (NSException * e) {
        
        NSLog(@" HELLO THERE Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    NSLog(@"%@ sai Kiran Kunchala",mapData);
    
    
    
    
    
    
    
    
    
    
    
    
    NSLog(@"%@",mapData);
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [[crs_sharedmethods sharedMySingleton].Ary_view_LoadingBg removeFromSuperview];
            
            NSLog(@"error %@",error);
            NSLog(@"data %@",data);
            NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json );
            
            
            branchArray = [NSMutableArray new];
            branchArray = [json valueForKey:@"branch"];
            
            
            isFiltered = NO;
            
            
            //NSLog(@"HEllo City %@",self.crs_VietnamCity.text);
            //                Crs_str_banklist = @"BranchGetter";
            //
            //NSLog(@" You Have Tapped On Me %@",W);
            
            
            self.crs_VitenamView.hidden = NO;
            
            [self.crs_CountryTableView reloadData];
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
    
    
    
}



-(void)Banks
{
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:Crosspay_GetBank] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        Crs_Array_list=[NSMutableArray new];
        Crs_Array_banklist=[json valueForKey:@"bank"];
        NSLog(@"%@", Crs_Array_banklist);
        NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"bank_name" ascending:YES];
        
        NSArray *sortDescriptors = [NSArray arrayWithObject:descriptor];
        
        // here you will get sorted array in 'sortedArray'
        Crs_Array_list= [[ Crs_Array_banklist sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
        NSLog(@"My Bank List is  %@",Crs_Array_list);
        
    }];
    
    [dataTask resume];
    
}



@end

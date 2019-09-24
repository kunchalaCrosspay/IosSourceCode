//
//  registerViewController.m
//  CrossPay
//
//  Created by Saikiran on 28/07/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import "registerViewController.h"
#import "LoginViewController.h"
#import "HomeViewController.h"
#import "loginmpinViewController.h"
#import "VerifyMobileScreen.h"
#import "OtppopupViewController.h"
#import "crs_sharedmethods.h"
#import "InitialViewController.h"
#import "MBProgressHUD.h"
#import "TermsandCondtionsViewController.h"
#import "crs_sharedmethods.h"
#import "GlobalUrlsFile.h"
//#import <Google/Analytics.h>
#import "PrivacyPolicyViewController.h"
#import "NewTermsViewController.h"
#import "Crs_sharedvariable.h"
@interface registerViewController ()

{
    NSMutableArray * NationalityArray;
    NSString * message;
    
    NSString * Gender;
    NSMutableArray * stdArray;
    
    NSMutableArray * CountryArray;
    
    NSString * NationalityName;
    NSMutableArray * crs_countrylist;
    
    NSString * Hider;
    
    UITapGestureRecognizer * tap;
    
    NSString * ConformHide;
    NSMutableArray * NationalityAlphabets;
    NSMutableArray * PostalCoderray;
    
    NSMutableArray * postalCompressingArray;
    
    // For Storing Country and Postal Code
    
    NSString * CountryPlacer;
    NSString * PostCodePlacer;
    NSArray * FacebookArray;
    
    NSString * check1;
    NSString * check2;
    
    NSMutableArray * searchArray;
    NSString * date1;
    NSString * date2;
    
    BOOL  isFiltered;
}



@end

@implementation registerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // check in code
    check1 = @"Checkout";
    check2 = @"Checkout";
    isFiltered=NO;
    
    self.OtpView.hidden = YES;
    
   [ self CountryArrayk];
    self.crs_search.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    
   [self.crs_search addTarget:self action:@selector(textFieldDidChanges:) forControlEvents:UIControlEventEditingChanged];
    
//    _crs_ClickOut.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
//    // you probably want to center it
//    _crs_TermsOut.titleLabel.textAlignment = NSTextAlignmentCenter; // if you want to
//    [_crs_ClickOut setTitle: @"-----------" forState: UIControlStateNormal];
//    [_crs_TermsOut setTitle: @"-----------" forState: UIControlStateNormal];
    
//
    
  
    
    FacebookArray = [NSArray arrayWithObjects:@"Facebook",@"Friend",@"Google",@"Website",@"Referral",@"Others", nil];
    

    NSMutableArray *array = [NSMutableArray arrayWithObjects:
                             
                             @"<null>",
                             @"10/29/1988",
                             @"11/13",
                             @"03/24/1987",
                             @"04/25/1990",
                             @"03/13",
                             @"01/01",
                             @"<null>",
                             @"12/15/1905",
                             @"07/10",
                             @"11/02/1990",
                             @"12/30/1990",
                             @"<null>",
                             @"07/22/1990",
                             @"01/01",
                             @"07/17/1989",
                             @"08/28/1990",
                             @"01/10/1990",
                             @"06/12/1990", nil];
    NSLog(@"The Rock  %lu", (unsigned long)[array count]);
    NSString *nullStr = @"<null>";
    [array removeObject:nullStr];
    NSLog(@"Rikishi  %lu", (unsigned long)[array count]);
    
    
    
    self.crs_CountryTable.delegate=self;
    self.crs_CountryTable.dataSource=self;
    self.crs_CountryTableViewView.hidden = YES;
    CountryPlacer = @"";
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackOpaque;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Hide" style:UIBarButtonItemStyleBordered target:self action:@selector(clearNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    _crs_FirstName.inputAccessoryView = numberToolbar;
    _crs_MobileNumber.inputAccessoryView = numberToolbar;
    _crs_LastName.inputAccessoryView = numberToolbar;
    _crs_EmailId.inputAccessoryView = numberToolbar;
    _crs_Adress.inputAccessoryView = numberToolbar;
    _crs_Address.inputAccessoryView = numberToolbar;
    _crs_Address2.inputAccessoryView = numberToolbar;
    _crs_city.inputAccessoryView = numberToolbar;
    _crs_County.inputAccessoryView = numberToolbar;
    _crs_CreateMPIn.inputAccessoryView = numberToolbar;
    _crs_confirmMpin.inputAccessoryView = numberToolbar;
    _crs_referalCode.inputAccessoryView = numberToolbar;
    _crs_Address2.inputAccessoryView = numberToolbar;
    _crs_idNumberfield.inputAccessoryView  = numberToolbar;
    _crs_OtherCountriesIdNumber.inputAccessoryView = numberToolbar;
    crs_countrylist = [NSMutableArray new];
    self.crs_CountryView.hidden = YES;
    ConformHide = @"show";
    Hider = @"show";
    
    NationalityAlphabets = [NSMutableArray new];
    CountryArray =[NSMutableArray new];
    PostalCoderray = [NSMutableArray new];
    postalCompressingArray = [NSMutableArray new];
    
    
    [self empty];
    Gender=@"male";
    
    self.scrollForContent.contentSize = CGSizeMake(self.view.frame.size.width-30,510);
    
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    NationalityArray = [NSMutableArray new];
    // Get method for Nationality
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:Crosspay_Getnationalities] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NationalityArray = [json valueForKey: @"bank"];
            NSLog(@"%@", NationalityArray);
            
        });
        // [self.countryList_TableView reloadData];
    }];
    
    [dataTask resume];
    
    
    
    
    
    tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    
    
    
    
    [self.crs_Registerout.layer setBorderWidth:1.0];
    [self.crs_Registerout.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    
    
    
    
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    self.crs_FirstName.textColor = [UIColor whiteColor];
    
    self.crs_LastName.textColor = [UIColor whiteColor];
    //self.crs_StdCode.textColor = [UIColor whiteColor];
    self.crs_EmailId.textColor = [UIColor whiteColor];
    self.crs_DateOfBirth.textColor = [UIColor whiteColor];
    self.crs_CreateMPIn.textColor = [UIColor whiteColor];
    self.Crs_Gender.textColor = [UIColor whiteColor];
    self.crs_confirmMpin.textColor = [UIColor whiteColor];
    self.crs_MobileNumber.textColor = [UIColor whiteColor];
    self.crs_Adress.textColor = [UIColor whiteColor];
    self.crs_Address.textColor = [UIColor whiteColor];
    self.crs_Address2.textColor = [UIColor whiteColor];
    self.crs_Country.textColor = [UIColor whiteColor];
    self.crs_County.textColor = [UIColor whiteColor];
    self.crs_city.textColor = [UIColor whiteColor];
    self.crs_referalCode.textColor = [UIColor whiteColor];
    self.crs_idNumberfield.textColor = [UIColor whiteColor];
    self.crs_Nationality.textColor = [UIColor whiteColor];
    self.crs_facebookField.textColor = [UIColor whiteColor];
    _crs_OtherCountriesIdNumber.textColor = [UIColor whiteColor];
    [self datePick];
    
    
    
}

-(void) dismissKeyboard { [self.crs_FirstName resignFirstResponder];
    [self.crs_LastName resignFirstResponder]; [self.crs_EmailId resignFirstResponder]  ;
    
    [self.crs_city resignFirstResponder];
    [self.crs_Address resignFirstResponder];
    [self.crs_County resignFirstResponder];
    [self.crs_Country resignFirstResponder];
    [self.crs_Address resignFirstResponder];
    [self.crs_Adress resignFirstResponder];
    [self.crs_CreateMPIn resignFirstResponder];
    [self.crs_confirmMpin resignFirstResponder];
    [_crs_Address2 resignFirstResponder];
    [self.crs_referalCode resignFirstResponder];
    [_crs_idNumberfield resignFirstResponder];
     [_crs_facebookField resignFirstResponder];
    [_crs_OtherCountriesIdNumber resignFirstResponder];

}



-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == _crs_Country) {
        
        
        
        
        
        
        CGPoint scrollPoint = CGPointMake(0,30);
        [  self.scrollForContent setContentOffset:scrollPoint animated:YES];
        


    }
    
//    else if  (textField == _crs_FirstName) {
//
//
//
//
//
//
//        CGPoint scrollPoint = CGPointMake(0,90);
//        [  self.scrollForContent setContentOffset:scrollPoint animated:YES];
//
//
//
//    }
//
//    else if  (textField == _crs_County) {
//
//
//
//
//
//
//        CGPoint scrollPoint = CGPointMake(0,150);
//        [  self.scrollForContent setContentOffset:scrollPoint animated:YES];
//
//
//
//    }
//
//
    
//
//    else if  (textField == _crs_LastName) {
//
//
//
//
//
//
//        CGPoint scrollPoint = CGPointMake(0,180);
//        [  self.scrollForContent setContentOffset:scrollPoint animated:YES];
//
//
//
//    }
    
    
    else if  (textField == _crs_EmailId) {
        
        
        
        
        
        
        CGPoint scrollPoint = CGPointMake(0,60);
        [  self.scrollForContent setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    else if (textField == _crs_Adress)
    {
        
        
        
        self.crs_AddressoneButtonOutlet.hidden = NO;
        self.crs_AddresstwoButtonOutlet.hidden = NO;
        self.crs_CityButtonoutlet.hidden = NO;
        self.crs_AddressOneDropImage.hidden = NO;
        self.crs_AddressTwoDropDownImage.hidden = NO;
        CGPoint scrollPoint = CGPointMake(0,240);
        [  self.scrollForContent setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    
    
    else if  (textField ==_crs_CreateMPIn ) {
        
        
        
        
        
        
        CGPoint scrollPoint = CGPointMake(0,100);
        [  self.scrollForContent setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
   
    
    
    else if  (textField == _crs_confirmMpin) {
        
        
        
        
        
        
        CGPoint scrollPoint = CGPointMake(0,320);
        [  self.scrollForContent setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    else if (textField == _crs_referalCode)
    {
        
        CGPoint scrollPoint = CGPointMake(0,360);
        [  self.scrollForContent setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
   
    else if (textField == _crs_facebookField)
    {
        
        CGPoint scrollPoint = CGPointMake(0,400);
        [  self.scrollForContent setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    
    
    
    
    
    //
    //    else{
    //    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
    //    [  self.scrollForContent setContentOffset:scrollPoint animated:YES];
    //
    //
    //    }
    
}

-(void) textFieldDidEndEditing:(UITextField *)textField {
    //[self.scrollForContent setContentOffset:CGPointZero animated:YES];
    
    
    if (textField == self.crs_Adress ) {
        self.crs_city.text = @"";
        self.crs_Address.text = @"";
        self.crs_Address2.text = @"";
        
    }
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)crs_SelectCountry:(id)sender {
    
    
    [ self CountryArrayk];
    self.crs_search.placeholder = @"Search By country";
     self.crs_search.text = @"";
    if ([self.crs_Country.text isEqualToString:@"UNITED KINGDOM"]) {
        self.crs_idNumberfield.hidden = YES;
        self.crs_OtherCountriesIdNumber.hidden = YES;
    }
    
    else if ([self.crs_Country.text isEqualToString:@"IRELAND"]){
        
        self.crs_idNumberfield.hidden = YES;
        self.crs_OtherCountriesIdNumber.hidden = YES;
        
        
    }
    
    else if ([self.crs_Country.text isEqualToString:@"SWEDEN"]){
        
        self.crs_idNumberfield.hidden = NO;
      self.crs_idNumberfield.placeholder = @"National ID Number";
         self.crs_OtherCountriesIdNumber.hidden = YES;
        
    }
    
    else if ([self.crs_Country.text isEqualToString:@"DENMARK"]){
        
        self.crs_idNumberfield.hidden = NO;
           self.crs_idNumberfield.placeholder = @"CPR Number";
         self.crs_OtherCountriesIdNumber.hidden = YES;
        
    }
    else if ([self.crs_Country.text isEqualToString:@"ITALY"]){
        
        self.crs_idNumberfield.hidden = YES;
        self.crs_OtherCountriesIdNumber.placeholder = @"Codice Fiscale";
          self.crs_OtherCountriesIdNumber.hidden = NO;
        
    }
    else if ([self.crs_Country.text isEqualToString:@"SPAIN"]){
        
        self.crs_idNumberfield.hidden = YES;
       self.crs_OtherCountriesIdNumber.placeholder = @"NIF/NIE Number";
        self.crs_OtherCountriesIdNumber.hidden = NO;
        
    }
    else if ([self.crs_Country.text isEqualToString:@"NORWAY"]||[self.crs_Country.text isEqualToString:@"FRANCE"]||[self.crs_Country.text isEqualToString:@"GERMANY"]||[self.crs_Country.text isEqualToString:@"NETHERLANDS"]||[self.crs_Country.text isEqualToString:@"BELGIUM"]||[self.crs_Country.text isEqualToString:@"AUSTRIA"]){
        
        self.crs_idNumberfield.hidden = YES;
          self.crs_OtherCountriesIdNumber.hidden = YES;
        
    }
    
    
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    [self.view removeGestureRecognizer:tap];
    
    
    crs_countrylist = CountryArray;
    
    NSMutableArray * Ary=[NSMutableArray new];
    
    for (int i=0; i<crs_countrylist.count; i++) {
        
        
        
        
              
  if ([[[crs_countrylist valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"DENMARK"]) {
            
            NSMutableDictionary * dict=[NSMutableDictionary new];
            dict =[crs_countrylist objectAtIndex:i];
            [Ary addObject:dict];
            self.crs_DenmarkView.hidden = NO;
            
        }
        
        
        
        
        
        
  else if ([[[crs_countrylist valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"FRANCE"]) {
      
      NSMutableDictionary * dict=[NSMutableDictionary new];
      dict =[crs_countrylist objectAtIndex:i];
      [Ary addObject:dict];
      self.crs_DenmarkView.hidden = NO;
      
  }
        
        
     else if ([[[crs_countrylist valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"UNITED KINGDOM"]) {
            
            NSMutableDictionary * dict=[NSMutableDictionary new];
            dict =[crs_countrylist objectAtIndex:i];
            [Ary addObject:dict];
            
            self.crs_DenmarkView.hidden = YES;
            
            
        }
        
        
        
        
        else if ([[[crs_countrylist valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"NORWAY"]) {
            
            NSMutableDictionary * dict=[NSMutableDictionary new];
            dict =[crs_countrylist objectAtIndex:i];
            [Ary addObject:dict];
            self.crs_DenmarkView.hidden = YES;
        }
        
        
        
        
        
        
        else if ([[[crs_countrylist valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"SWEDEN"]) {
            
            
            NSMutableDictionary * dict=[NSMutableDictionary new];
            dict =[crs_countrylist objectAtIndex:i];
            [Ary addObject:dict];
            self.crs_DenmarkView.hidden = NO;
            
        }
        
        
        
        
        
        
        else if ([[[crs_countrylist valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"NETHERLANDS"]) {
            
            NSMutableDictionary * dict=[NSMutableDictionary new];
            dict =[crs_countrylist objectAtIndex:i];
            [Ary addObject:dict];
            self.crs_DenmarkView.hidden = NO;
            
        }
        else if ([[[crs_countrylist valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"GERMANY"]) {
            
            NSMutableDictionary * dict=[NSMutableDictionary new];
            dict =[crs_countrylist objectAtIndex:i];
            [Ary addObject:dict];
            self.crs_DenmarkView.hidden = NO;
            
        }
        else if ([[[crs_countrylist valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"SPAIN"]) {
            
            NSMutableDictionary * dict=[NSMutableDictionary new];
            dict =[crs_countrylist objectAtIndex:i];
            [Ary addObject:dict];
            self.crs_DenmarkView.hidden = NO;
            
        }
        
        else if ([[[crs_countrylist valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"ITALY"]) {
            
            NSMutableDictionary * dict=[NSMutableDictionary new];
            dict =[crs_countrylist objectAtIndex:i];
            [Ary addObject:dict];
            self.crs_DenmarkView.hidden = NO;
            
        }
        
        else if ([[[crs_countrylist valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"IRELAND"]) {
            
            NSMutableDictionary * dict=[NSMutableDictionary new];
            dict =[crs_countrylist objectAtIndex:i];
            [Ary addObject:dict];
            self.crs_DenmarkView.hidden = YES;
            
        }
        
   
        
else if ([[[crs_countrylist valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"UNITED STATES"]) {
    
    NSMutableDictionary * dict=[NSMutableDictionary new];
    dict =[crs_countrylist objectAtIndex:i];
    [Ary addObject:dict];
    self.crs_DenmarkView.hidden = YES;
    
}
        else if ([[[crs_countrylist valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"BELGIUM"]) {
            
            NSMutableDictionary * dict=[NSMutableDictionary new];
            dict =[crs_countrylist objectAtIndex:i];
            [Ary addObject:dict];
            self.crs_DenmarkView.hidden = YES;
            
        }
        
        else if ([[[crs_countrylist valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"AUSTRIA"]) {
            
            NSMutableDictionary * dict=[NSMutableDictionary new];
            dict =[crs_countrylist objectAtIndex:i];
            [Ary addObject:dict];
            self.crs_DenmarkView.hidden = YES;
            
        }
        else if([[[crs_countrylist valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"HONG KONG"]) {
            
            NSMutableDictionary * dict=[NSMutableDictionary new];
            dict =[crs_countrylist objectAtIndex:i];
            [Ary addObject:dict];
            self.crs_DenmarkView.hidden = YES;
            
        }
    }
    
    
    
    
    
    crs_countrylist =Ary;
    
    NationalityName =@"country";
    self.crs_CountryTableViewView.hidden = NO;
    self.crs_CountryView.hidden = NO;
    [self.crs_CountryPicker reloadAllComponents];
    [self.crs_CountryTable reloadData];
    
    
    
    
    _crs_CountryView.hidden = NO;
    _crs_CountryView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    
    [self.view addSubview:_crs_CountryView];
    [self.crs_CountryTable reloadData];
    [UIView animateWithDuration:0.3/1.5 animations:^{
        _crs_CountryView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            _crs_CountryView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                _crs_CountryView.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
    
    
    
    
}

- (IBAction)Crs_Back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)Register_Action:(id)sender {
    
    
    
    if ([self.crs_Country.text isEqualToString:@"UNITED KINGDOM"]) {
        
        
        
        [self.scrollForContent setContentOffset:CGPointMake(0, 0)];
        [self UkValidation];
    }
    
    else if ([self.crs_Country.text isEqualToString:@"UNITED STATES"]) {
         [self.scrollForContent setContentOffset:CGPointMake(0, 0)];
        [self UsValidation];
    }
    else if ([self.crs_Country.text isEqualToString:@"HONG KONG"]) {
         [self.scrollForContent setContentOffset:CGPointMake(0, 0)];
        [self HongKongValidation];
    }
    
    else if ([self.crs_Country.text isEqualToString:@"NORWAY"]) {
         [self.scrollForContent setContentOffset:CGPointMake(0, 0)];
        [self NorwayValidation];
    }
    else if ([self.crs_Country.text isEqualToString:@"IRELAND"]) {
         [self.scrollForContent setContentOffset:CGPointMake(0, 0)];
        [self Ireland];
    }
    
    else if ([self.crs_Country.text isEqualToString:@"DENMARK"]||[self.crs_Country.text isEqualToString:@"SWEDEN"]) {
         [self.scrollForContent setContentOffset:CGPointMake(0, 0)];
        [self DenmarkValidation];
    }
    else if ([self.crs_Country.text isEqualToString:@"ITALY"]) {
         [self.scrollForContent setContentOffset:CGPointMake(0, 0)];
        [self ItalyValidation];
    }
    else if ([self.crs_Country.text isEqualToString:@"SPAIN"]) {
         [self.scrollForContent setContentOffset:CGPointMake(0, 0)];
        [self Spain];
    }
    else if ([self.crs_Country.text isEqualToString:@"AUSTRIA"]) {
         [self.scrollForContent setContentOffset:CGPointMake(0, 0)];
        [self AUSTRIAValidation];
    }
    else if ([self.crs_Country.text isEqualToString:@"BELGIUM"]) {
         [self.scrollForContent setContentOffset:CGPointMake(0, 0)];
        [self BelgiumValidation];
    }
    
    
    
    else if ([self.crs_Country.text isEqualToString:@"GERMANY"]||[self.crs_Country.text isEqualToString:@"FRANCE"]||[self.crs_Country.text isEqualToString:@"NETHERLANDS"]) {
         [self.scrollForContent setContentOffset:CGPointMake(0, 0)];
        [self GermanyValidation];
    }
    
    else   {
         [self.scrollForContent setContentOffset:CGPointMake(0, 0)];
        [self SwedenValidation];
    }
    
   
}

- (IBAction)Login_Action:(id)sender {
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    VerifyMobileScreen * viewController = [storyboard instantiateViewControllerWithIdentifier:@"VerifyMobileScreenViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    
    //
    //   // - (IBAction)crs_Male:(id)sender {
    //    }
    //    - (IBAction)crs_Female:(id)sender {
    //    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
     [self.crs_EmailId endEditing:YES];
    // this will do the trick
}
//
//-(BOOL)textFieldShouldReturn:(UITextField*)textField;
//{
//  [[self view] endEditing:YES];
//    return YES;
//}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    if(textField == self.crs_search){
           [[self view] endEditing:YES];
        [self.crs_EmailId endEditing:YES];
        
    }
        
//
//
//    NSInteger nextTag = textField.tag + 1;
//    // Try to find next responder
//    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
//    if (nextResponder) {
//        // Found next responder, so set it.
//        [nextResponder becomeFirstResponder];
//        if(nextTag==12)
//        {
//
//
//            [[self view] endEditing:YES];
//
//        }
//    }
    
    
    return NO;
    
}

-(void)datePick{

    datePicker=[[UIDatePicker alloc]init];
    datePicker.datePickerMode=UIDatePickerModeDate;
    [self.crs_DateOfBirth setInputView:datePicker];
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor blackColor]];


    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(ShowSelectedDate)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    [self.crs_DateOfBirth setInputAccessoryView:toolBar];


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

    self.crs_DateOfBirth.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
    [self.crs_DateOfBirth resignFirstResponder];




}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField==self.crs_MobileNumber)
        
    {
        
        if ([self.crs_Country.text isEqualToString:@"UNITED KINGDOM"]||[self.crs_Country.text isEqualToString:@"AUSTRIA"]||[self.crs_Country.text isEqualToString:@"IRELAND"]) {
            
            
            if (self.self.crs_MobileNumber.text.length >=13 && range.length == 0)
                
            {
                return NO; // return NO to not change text
            }
            else
                
                
                
                
                
            {
                
                
                
                
                NSString *validRegEx =@"^[0-9,+.]*$"; //change this regular expression as your requirement
                NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
                BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
                if (myStringMatchesRegEx)
                    return YES;
                else
                    return NO;
                
                
                
                
                
                
                
                
                return YES;}
            
            
            
            
            
        }
        
        
        
        
         else if ([self.crs_Country.text isEqualToString:@"SWEDEN"]||[self.crs_Country.text isEqualToString:@"SPAIN"]||[self.crs_Country.text isEqualToString:@"BELGIUM"]||[self.crs_Country.text isEqualToString:@"ITALY"]) {
            
            
            if (self.self.crs_MobileNumber.text.length >=12 && range.length == 0)
                
            {
                return NO; // return NO to not change text
            }
            else
                
                
                
                
                
            {
                
                
                
                
                NSString *validRegEx =@"^[0-9,+.]*$"; //change this regular expression as your requirement
                NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
                BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
                if (myStringMatchesRegEx)
                    return YES;
                else
                    return NO;
                
                
                
                
                
                
                
                
                return YES;}
            
            
            
            
            
        }
        
         else if ([self.crs_Country.text isEqualToString:@"HONG KONG"]||[self.crs_Country.text isEqualToString:@"UNITED STATES"]) {
             
             
             if (self.self.crs_MobileNumber.text.length >=12 && range.length == 0)
                 
             {
                 return NO; // return NO to not change text
             }
             else
                 
                 
                 
                 
                 
             {
                 
                 
                 
                 
                 NSString *validRegEx =@"^[0-9,+.]*$"; //change this regular expression as your requirement
                 NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
                 BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
                 if (myStringMatchesRegEx)
                     return YES;
                 else
                     return NO;
                 
                 
                 
                 
                 
                 
                 
                 
                 return YES;}
             
             
             
             
             
         }
        
         else if ([self.crs_Country.text isEqualToString:@"BELGIUM"]) {
             
             
             if (self.self.crs_MobileNumber.text.length >=10 && range.length == 0)
                 
             {
                 return NO; // return NO to not change text
             }
             else
                 
                 
                 
                 
                 
             {
                 
                 
                 
                 
                 NSString *validRegEx =@"^[0-9,+.]*$"; //change this regular expression as your requirement
                 NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
                 BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
                 if (myStringMatchesRegEx)
                     return YES;
                 else
                     return NO;
                 
                 
                 
                 
                 
                 
                 
                 
                 return YES;}
             
             
             
             
             
         }
        
        
        
        
        
        else{
            
            if (self.self.crs_MobileNumber.text.length >=11 && range.length == 0)
                
            {
                return NO; // return NO to not change text
            }
            else
                
                
                
                
                
            {
                
                
                
                
                NSString *validRegEx =@"^[0-9,+.]*$"; //change this regular expression as your requirement
                NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
                BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
                if (myStringMatchesRegEx)
                    return YES;
                else
                    return NO;
                
                
                
                
                
                
                
                
                return YES;}
            
            
            
            
            
            
            
            
            
        }
        
        
        
    }
    
    else if (textField == self.crs_CreateMPIn)
    {
        
        if (self.self.self.crs_CreateMPIn.text.length >=4 && range.length == 0)
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
    
    else if (textField == self.crs_confirmMpin)
    {
        
        if (self.self.self.self.crs_confirmMpin.text.length >=4 && range.length == 0)
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
    
    else if (textField == self.crs_FirstName)
    {
        
        if (self.self.self.self.crs_FirstName.text.length >=120 && range.length == 0)
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
    
    
    else if (textField == self.crs_LastName)
    {
        
        if (self.self.self.self.crs_LastName.text.length >=120 && range.length == 0)
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
    
    else if (textField == self.crs_EmailId)
    {
        
        if (self.self.self.self.crs_EmailId.text.length >=60 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            
            
            
            
            
            
            return YES;}
        
        
        
        
        
    }
    
    
    
    else if (textField == self.crs_Nationality)
    {
        
        if (self.self.self.self.crs_Nationality.text.length >=60 && range.length == 0)
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
    
    
    
    
    
    else if (textField == self.crs_Country)
    {
        
        if (self.self.self.self.crs_Country.text.length >=60 && range.length == 0)
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
    
    
    
    
    
    else if (textField == self.crs_County)
    {
        
        if (self.self.self.self.crs_County.text.length >=60 && range.length == 0)
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
    
    
    
    
    else if (textField == self.crs_city)
    {
        
        if (self.self.self.self.crs_city.text.length >=60 && range.length == 0)
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
    else if (textField == self.crs_Adress)
    {
        
        
        if ( self.crs_Adress.text.length == 0) {
            self.crs_city.text = @"";
            self.crs_Address.text = @"";
            self.crs_Address2.text = @"";
            
        }
        
        if (self.self.self.self.crs_Adress.text.length >=10 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        
        
        
        
        else
        {
//            
//            
//            
//            NSString *validRegEx =@"^[A-Z a-z 0-9.]*$"; //change this regular expression as your requirement
//            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
//            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
//            if (myStringMatchesRegEx)
//                return YES;
//            else
//                return NO;
//            
//            
//            
            
            
            
            
            
            
            
            
            return YES;}
        
        
        
        
        
    }
    
    
    
    
    else if (textField == self.crs_Address)
    {
        
        if (self.self.self.self.crs_Address.text.length >=120 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {return YES;}
        
        
        
        
        
    }
    
    else if (textField == self.crs_referalCode)
    {
        
        if (self.self.self.self.crs_referalCode.text.length >=11 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {return YES;}
        
        
        
        
        
    }
    
    
    else if (textField == self.crs_idNumberfield)
    {
        
        if (self.self.self.self.crs_idNumberfield.text.length >=10 && range.length == 0)
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
    
   
    
    
    
else if ([self.crs_Country.text isEqualToString:@"SPAIN"]) {
        
        
        if (self.self.crs_OtherCountriesIdNumber.text.length >=9 && range.length == 0)
            
        {
            return NO; // return NO to not change text
        }
        else
            
            
           
            
            
        {
            
            
            
            
            NSString *validRegEx =@"^[A-Z,a-z,0-9,+.]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            
            
            
            
            return YES;}
        
        
        
        
        
    }
    
    
    
else if ([self.crs_Country.text isEqualToString:@"BELGIUM"]||[self.crs_Country.text isEqualToString:@"ITALY"]||[self.crs_Country.text isEqualToString:@"AUSTRIA"]) {
    
    
    if (self.self.crs_OtherCountriesIdNumber.text.length >=16 && range.length == 0)
        
    {
        return NO; // return NO to not change text
    }
    else
        
        
        
        
        
    {
        
        
        
        
        NSString *validRegEx =@"^[A-Z,a-z,0-9,+.]*$"; //change this regular expression as your requirement
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





- (IBAction)Crs_Male_Action:(id)sender {
    Gender=@"male";
    [_Crs_male setSelected:NO];
    [_Crs_Female setSelected:NO];
    [_Crs_Other setSelected:NO];
}

- (IBAction)Crs_Female_Action:(id)sender {
    Gender=@"female";
    [_Crs_male setSelected:YES];
    [_Crs_Female setSelected:YES];
    [_Crs_Other setSelected:NO];
}

- (IBAction)Crs_other_Action:(id)sender {
    Gender=@"other";
    
    [_Crs_Other setSelected:YES];
    [_Crs_male setSelected:YES];
    [_Crs_Female setSelected:NO];
    
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //    if ([Crs_str_banklist isEqualToString:@"list"]) {
    //        return Crs_Array_list.count;
    //
    //    }
    //    else{
    //        return countryArray.count;
    //    }
    //
    //
    if ([NationalityName isEqualToString:@"country"]) {
        return crs_countrylist.count;
    }
    else{
        
        return NationalityArray.count;
    }
    
    
    
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //    if ([Crs_str_banklist isEqualToString:@"list"]) {
    //
    //        return [[Crs_Array_list valueForKey:@"bank_name"] objectAtIndex:row];
    //
    //    }
    //    else{
    //        return [countryArray objectAtIndex:row];
    //    }
    
    if ([NationalityName isEqualToString:@"country"]) {
        return [[crs_countrylist valueForKey:@"country_name"] objectAtIndex:row];
        
        
    }
    
    
    else{
        
        return [[NationalityArray valueForKey:@"nationality"] objectAtIndex:row];
        
        
        
    }
    
    
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //
    //    if ([Crs_str_banklist isEqualToString:@"list"]) {
    //
    //
    //        self.crs_SelectBranch.text = [[Crs_Array_list valueForKey:@"bank_name"] objectAtIndex:row];
    //
    //        NSLog(@" component zero %@ ",[[Crs_Array_list valueForKey:@"bank_name"] objectAtIndex:row]);
    //        //
    //        //        [pickerView selectRow:row inComponent:1 animated:true];
    //
    //        self.crs_CountrySelectorView.hidden = YES;
    
    
    if ([NationalityName isEqualToString:@"country"]) {
        self.crs_StdLabel.text = [[crs_countrylist valueForKey:@"isd_code"] objectAtIndex:row];
        self.crs_Country.text = [[crs_countrylist valueForKey:@"country_name"]objectAtIndex:row];
    }
    
    
    
    else{
        
        
        self.crs_Nationality.text = [[NationalityArray valueForKey:@"nationality"]objectAtIndex:row];
        
    }
    
    //
    
    self.crs_CountryView.hidden = YES;
    
    
    
}

-(void)CountryArrayk{
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:Crosspay_getCountry] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            
           CountryArray = [json valueForKey: @"country"];
           
            NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"country_name" ascending:YES];
            
            NSArray *sortDescriptors = [NSArray arrayWithObject:descriptor];
            // return [[NationalityArray valueForKey:@"nationality"] objectAtIndex:row];
            
            // here you will get sorted array in 'sortedArray'
        CountryArray= [[CountryArray sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
            
            
            
            NSLog(@"venkatesh %@", CountryArray);
            
        });
    }];
    
    [dataTask resume];
    
    
    
}


//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//
//
//    return CountryArray;
//
//}
//
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//
//    }
//
//    return cell;
//}
//
//
//-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//
//
//
//
//    }
//





- (IBAction)crs_NationButton:(id)sender {
        isFiltered=NO;
    
     self.crs_search.placeholder = @"Search By Nationality";
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    [self.view removeGestureRecognizer:tap];
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"nationality" ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:descriptor];
    // return [[NationalityArray valueForKey:@"nationality"] objectAtIndex:row];
    
    // here you will get sorted array in 'sortedArray'
    NationalityArray= [[NationalityArray sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
    
    
    
    NationalityName = @"nationality";
    self.crs_CountryView.hidden = NO;
    [self.crs_CountryPicker reloadAllComponents];
    self.crs_CountryTableViewView.hidden = NO;
    [self.crs_CountryTable reloadData];
    
}

- (IBAction)crs_ClickOnConditions:(id)sender {
    
    
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
   NewTermsViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"TermsandConditionsViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

- (IBAction)crs_Hide:(id)sender {
    
    //self.crs_confirmMpin.secureTextEntry = NO;
    
    if ([Hider isEqualToString:@"show"]) {
        
        self.crs_CreateMPIn.secureTextEntry = NO;
        
        Hider = @"hide";
        [_crs_HideOut setSelected:YES];
        
    }
    
    else
    {
        
        
        self.crs_CreateMPIn.secureTextEntry = YES;
        [_crs_HideOut setSelected:NO];
        Hider = @"show";
    }
    
}



-(void)clearNumberPad{
    [_crs_FirstName resignFirstResponder];
    [_crs_LastName resignFirstResponder];
    [_crs_city resignFirstResponder];
    [_crs_CreateMPIn resignFirstResponder];
    [_crs_confirmMpin resignFirstResponder];
    [_crs_MobileNumber resignFirstResponder];
    [_crs_LastName resignFirstResponder];
    [_crs_EmailId resignFirstResponder];
    [_crs_Address resignFirstResponder];
    [_crs_Adress resignFirstResponder];
    [_crs_Address2 resignFirstResponder];
    [_crs_referalCode resignFirstResponder];
    [_crs_Address2 resignFirstResponder];
    [_crs_idNumberfield resignFirstResponder];
    [self.crs_facebookField resignFirstResponder];
    [_crs_OtherCountriesIdNumber resignFirstResponder];
    //[ resignFirstResponder];
}

-(void)doneWithNumberPad{
    //NSString *numberFromTheKeyboard = self.crs_SelectBranch.text;
    [_crs_FirstName resignFirstResponder];
    [_crs_LastName resignFirstResponder];
    [_crs_city resignFirstResponder];
    [_crs_CreateMPIn resignFirstResponder];
    [_crs_confirmMpin resignFirstResponder];
    [_crs_MobileNumber resignFirstResponder];
    [_crs_LastName resignFirstResponder];
    [_crs_EmailId resignFirstResponder];
    [_crs_Address resignFirstResponder];
    [_crs_Adress resignFirstResponder];
    [_crs_referalCode resignFirstResponder];
     [_crs_OtherCountriesIdNumber resignFirstResponder];
    [_crs_Address2 resignFirstResponder];
     [_crs_idNumberfield resignFirstResponder];
    [self.crs_facebookField resignFirstResponder];
    
}
-(void)UkValidation{
    
    self.crs_idNumberfield.hidden = YES;
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    if ([self.crs_Country.text isEqualToString:@"Select Country"]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
//
//    else if ([self.crs_FirstName.text isEqualToString:@""])  {
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//    else if ([self.crs_LastName.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
    else if ([self.crs_EmailId.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
    
    else if (self.crs_MobileNumber.text.length <10)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"00000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"0000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"00000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"000000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"0000000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"1111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"11111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"111111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"1111111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
   
    else if ([self.crs_MobileNumber.text isEqualToString:@"22222222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    } else if ([self.crs_MobileNumber.text isEqualToString:@"2222222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"2222222222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"3333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"33333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"33333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"3333333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"4444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"44444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"444444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"4444444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"5555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"55555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"555555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"5555555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"6666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"66666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"666666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"6666666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"7777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"77777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"77777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"7777777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"8888888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"88888888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"8888888888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"9999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"99999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"99999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"9999999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
//    else if ([self.crs_Nationality.text isEqualToString:@"Select Nationality"]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Nationality" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
    
    
    
    
   


//
//    else if ([self.crs_DateOfBirth.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Date Of Birth should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//

    
    
    
  
    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
        
        
        
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
                [alert show];
        
            }
    
    
    
    else if (self.crs_CreateMPIn.text.length <4)
        
        
            {
        
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
                [alert show];
        
        
        
        
        
            }
    
//
//
//    else if ([self.Crs_Gender.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Pls Specify your Gender" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
    
    
    
    
    
    
    
    
    
    //    else if ([self.crs_County.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your County" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
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
//    else if ([self.crs_Address.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//    else if ([self.crs_city.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//    else if ([self.crs_Adress.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter Post Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
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
//    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//    else if ([self.crs_confirmMpin.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Confirm your Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if (self.crs_CreateMPIn.text   != self.crs_confirmMpin.text)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Pin  Numbers  Should Be Same " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
//
//
//
//    else if (self.crs_CreateMPIn.text.length <4)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
//
    
    else if (![_crs_checkoutbutton1outlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    else if (![_crs_checkout2buttonoutlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    else {
        
        
        
        
        
        [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
        
        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            return ;
            
            
            
            
            
            
            
            
            
        }
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_NewRegister];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
        //[mapData setObject:self.crs_FirstName.text forKey:@"firstname"];
        
        //[mapData setObject:self.crs_LastName.text forKey:@"lastname"];
        
        [mapData setObject:self.crs_EmailId.text forKey:@"email"];
        
        [mapData setObject:self.crs_MobileNumber.text forKey:@"mobile"];
        
        [mapData setObject:self.crs_StdCodeFixedLabel.text forKey:@"countrycode"];
        [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
        
        //[mapData setObject:date1 forKey:@"dateofbirth"];
        
       // [mapData setObject:self.crs_Nationality.text forKey:@"Nationality"];
        [mapData setObject:self.crs_Country.text forKey:@"Country"];
       // [mapData setObject:self.crs_County.text forKey:@"middlename"];
//        [mapData setObject:self.crs_Address.text forKey:@"Address"];
//        [mapData setObject:self.crs_Adress.text forKey:@"Zipcode"];
//        [mapData setObject:self.crs_city.text forKey:@"city"];
//        [mapData setObject:self.crs_Address2.text forKey:@"Address2"];
        //[mapData setObject:self.crs_referalCode.text forKey:@"refcode"];
        [mapData setObject:@"IOS" forKey:@"device"];
         // [mapData setObject:self.crs_facebookField.text forKey:@"source"];
        
//        [mapData setObject:Gender forKey:@"gender"];
//        [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
        
        
       ;
        
        NSLog(@"%@",mapData);
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [[crs_sharedmethods sharedMySingleton].Ary_view_LoadingBg removeFromSuperview];
                
                NSLog(@"error %@",error);
                NSLog(@"data %@",data);
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@", json );
                
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerNumber = [json valueForKey:@"customerno"];
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId = [json valueForKey:@"user_id"];
                
                NSLog(@"%@", [json valueForKey:@"message"]);
                message = [json valueForKey:@"message"];
                if ([[json valueForKey:@"message"]isEqualToString:@"Success"]) {
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    OtppopupViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    OtppopupViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];;
                    viewController.otpvalue = [json valueForKey:@"OTP"];
                    viewController.ForOtp = self.crs_MobileNumber.text;
                    [Crs_sharedvariable sharedMySingleton].crs_Otp = [json valueForKey:@"OTP"];
                    
                    [self.navigationController pushViewController:viewController animated:YES];
                    
                }
               
                
                
                else{
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                    
                }
                
                
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
        
        
        
        
    }
    
}


-(void)Ireland{
    
    self.crs_idNumberfield.hidden = YES;
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    if ([self.crs_Country.text isEqualToString:@"Select Country"]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
//    else if ([self.crs_FirstName.text isEqualToString:@""])  {
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//    else if ([self.crs_LastName.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
    
    
    else if ([self.crs_EmailId.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
    
    else if (self.crs_MobileNumber.text.length <4)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"00000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"0000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"00000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"000000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"0000000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"1111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"11111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"111111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"1111111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"22222222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    } else if ([self.crs_MobileNumber.text isEqualToString:@"2222222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"2222222222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"3333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"33333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"33333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"3333333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"4444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"44444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"444444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"4444444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"5555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"55555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"555555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"5555555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"6666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"66666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"666666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"6666666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"7777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"77777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"77777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"7777777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"8888888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"88888888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"8888888888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"9999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"99999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"99999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"9999999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
  
//    else if ([self.crs_Nationality.text isEqualToString:@"Select Nationality"]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Nationality" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
    
    
    
    
    
    
//
//    else if ([self.crs_DateOfBirth.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Date Of Birth should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
    
    
    
   
        else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
    
    
    
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
           [alert show];
    
     }
    
    
    else if (self.crs_CreateMPIn.text.length <4)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
//
//
//
//
//    else if ([self.Crs_Gender.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Pls Specify your Gender" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
    
    
    
    
    
    
    
    
    //    else if ([self.crs_County.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your County" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    
    
    
    
    
    
    
    
    
    
    
//
//    else if ([self.crs_Address.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//    else if ([self.crs_city.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//    else if ([self.crs_Adress.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter Post Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
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
//    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//    else if ([self.crs_confirmMpin.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Confirm your Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if (self.crs_CreateMPIn.text   != self.crs_confirmMpin.text)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Pin  Numbers  Should Be Same " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
//
//
//
//    else if (self.crs_CreateMPIn.text.length <4)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
    
    
    else if (![_crs_checkoutbutton1outlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    else if (![_crs_checkout2buttonoutlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    else {
        
        
        
        
        
        [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
        
        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            return ;
            
            
            
            
            
            
            
            
            
        }
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_NewRegister];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
//        [mapData setObject:self.crs_FirstName.text forKey:@"firstname"];
//
//        [mapData setObject:self.crs_LastName.text forKey:@"lastname"];
//
        [mapData setObject:self.crs_EmailId.text forKey:@"email"];
        
        [mapData setObject:self.crs_MobileNumber.text forKey:@"mobile"];
        
        [mapData setObject:self.crs_StdCodeFixedLabel.text forKey:@"countrycode"];
         [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
 //[mapData setObject:date1 forKey:@"dateofbirth"];
        
       // [mapData setObject:self.crs_Nationality.text forKey:@"Nationality"];
        [mapData setObject:self.crs_Country.text forKey:@"Country"];
//        [mapData setObject:self.crs_County.text forKey:@"middlename"];
//        [mapData setObject:self.crs_Address.text forKey:@"Address"];
//        [mapData setObject:self.crs_Adress.text forKey:@"Zipcode"];
//        [mapData setObject:self.crs_city.text forKey:@"city"];
//        [mapData setObject:self.crs_Address2.text forKey:@"Address2"];
//        [mapData setObject:self.crs_referalCode.text forKey:@"refcode"];
        [mapData setObject:@"IOS" forKey:@"device"];
//        [mapData setObject:self.crs_facebookField.text forKey:@"source"];
//
//        [mapData setObject:Gender forKey:@"gender"];
//        [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
        
        NSLog(@"%@",mapData);
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [[crs_sharedmethods sharedMySingleton].Ary_view_LoadingBg removeFromSuperview];
                
                NSLog(@"error %@",error);
                NSLog(@"data %@",data);
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@", json );
                
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerNumber = [json valueForKey:@"customerno"];
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId = [json valueForKey:@"user_id"];
                NSLog(@"%@", [json valueForKey:@"message"]);
                message = [json valueForKey:@"message"];
                if ([[json valueForKey:@"message"]isEqualToString:@"Success"]) {
                    OtppopupViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    OtppopupViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];;
                    viewController.otpvalue = [json valueForKey:@"OTP"];
                    viewController.ForOtp = self.crs_MobileNumber.text;
                    [Crs_sharedvariable sharedMySingleton].crs_Otp = [json valueForKey:@"OTP"];
                    
                    [self.navigationController pushViewController:viewController animated:YES];
                    
                    
                    //
                    //                    [self addChildViewController:MenuViewControllerOBJ];
                    //                    [MenuViewControllerOBJ didMoveToParentViewController:self];
                    //                    // MenuViewControllerOBJ.otpvalue=[json valueForKey:@"OTP"];
                    //
                    //                    MenuViewControllerOBJ.otpvalue= [json valueForKey:@"OTP"];
                    //                    MenuViewControllerOBJ.crsVerifiaction = @"Register";
                    //
                    //                    MenuViewControllerOBJ.mobileNumber = self.crs_MobileNumber.text;
                    //
                    //                    MenuViewControllerOBJ.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
                    //                    [self.view addSubview:MenuViewControllerOBJ.view];
                    //
                    
                    
                }
                else{
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                    
                }
                
                
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
        
        
        
        
    }
    
}







-(void)NorwayValidation{
    
    
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    if ([self.crs_Country.text isEqualToString:@"Select Country"]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
//    else if ([self.crs_FirstName.text isEqualToString:@""])  {
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//    else if ([self.crs_LastName.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
    
    
    
    else if ([self.crs_EmailId.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
   
    else if (self.crs_MobileNumber.text.length <8)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"11111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"1111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"11111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"22222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"222222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"2222222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"22222222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"33333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"3333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"33333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"44444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"4444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"44444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"55555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"5555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"55555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"66666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"6666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"66666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"77777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"7777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"77777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"88888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"888888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"8888888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"88888888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"99999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"9999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"99999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"00000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"0000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"00000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
//
//    else if ([self.crs_Nationality.text isEqualToString:@"Select Nationality"]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Nationality" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
    
    
 
    


//
//
//    else if ([self.crs_DateOfBirth.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Date Of Birth should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }

    
    
    
    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    else if (self.crs_CreateMPIn.text.length <4)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
//
//    else if ([self.crs_Address.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//
//
//
//
////
////
////    else if ([self.Crs_Gender.text isEqualToString:@""]){
////
////
////
////        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Pls Specify your Gender" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
////
////        [alert show];
////
////    }
////
////
////
////
//
//
//
//
//
//
//    //    else if ([self.crs_County.text isEqualToString:@""]){
//    //
//    //
//    //
//    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your County" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    //
//    //        [alert show];
//    //
//    //    }
//    //
//    //
//
//    else if ([self.crs_city.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if ([self.crs_Adress.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter Post Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
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
//    else if (self.crs_CreateMPIn.text   != self.crs_confirmMpin.text)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" PIN'S Should Be Same" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
//
//
//    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  PIN Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if (self.crs_CreateMPIn.text.length <4)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Enter Valid PIN Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
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
//    else if ([self.crs_confirmMpin.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Confirm your PIN Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//
    
    
    
    else if (![_crs_checkoutbutton1outlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    else if (![_crs_checkout2buttonoutlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    else {
        
        
        
        
        
        [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
        
        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            return ;
            
            
            
            
            
            
            
            
            
        }
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_register];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
//
//        [mapData setObject:self.crs_FirstName.text forKey:@"firstname"];
//
//        [mapData setObject:self.crs_LastName.text forKey:@"lastname"];
        
        [mapData setObject:self.crs_EmailId.text forKey:@"email"];
        
        [mapData setObject:self.crs_MobileNumber.text forKey:@"mobile"];
        
        [mapData setObject:self.crs_StdCodeFixedLabel.text forKey:@"countrycode"];
         [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
        //[mapData setObject:date1 forKey:@"dateofbirth"];
        
        //[mapData setObject:self.crs_Nationality.text forKey:@"Nationality"];
        [mapData setObject:self.crs_Country.text forKey:@"Country"];
//        [mapData setObject:self.crs_County.text forKey:@"middlename"];
//        [mapData setObject:self.crs_Address.text forKey:@"Address"];
//        [mapData setObject:self.crs_Adress.text forKey:@"Zipcode"];
//        [mapData setObject:self.crs_city.text forKey:@"city"];
//        [mapData setObject:self.crs_Address2.text forKey:@"Address2"];
//        [mapData setObject:self.crs_referalCode.text forKey:@"refcode"];
        [mapData setObject:@"IOS" forKey:@"device"];
//          [mapData setObject:self.crs_facebookField.text forKey:@"source"];
//
//        [mapData setObject:Gender forKey:@"gender"];
//        [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
//
        NSLog(@"%@",mapData);
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [[crs_sharedmethods sharedMySingleton].Ary_view_LoadingBg removeFromSuperview];
                
                NSLog(@"error %@",error);
                NSLog(@"data %@",data);
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@", json );
                
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerNumber = [json valueForKey:@"customerno"];
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId = [json valueForKey:@"user_id"];
                
                NSLog(@"%@", [json valueForKey:@"message"]);
                message = [json valueForKey:@"message"];
                if ([[json valueForKey:@"message"]isEqualToString:@"Success"]) {
                    OtppopupViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    OtppopupViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];;
                    viewController.otpvalue = [json valueForKey:@"OTP"];
                    viewController.ForOtp = self.crs_MobileNumber.text;
                    [Crs_sharedvariable sharedMySingleton].crs_Otp = [json valueForKey:@"OTP"];
                    
                    [self.navigationController pushViewController:viewController animated:YES];
                    
                    
                    //
                    //                    [self addChildViewController:MenuViewControllerOBJ];
                    //                    [MenuViewControllerOBJ didMoveToParentViewController:self];
                    //                    // MenuViewControllerOBJ.otpvalue=[json valueForKey:@"OTP"];
                    //
                    //                    MenuViewControllerOBJ.otpvalue= [json valueForKey:@"OTP"];
                    //                    MenuViewControllerOBJ.crsVerifiaction = @"Register";
                    //
                    //                    MenuViewControllerOBJ.mobileNumber = self.crs_MobileNumber.text;
                    //
                    //                    MenuViewControllerOBJ.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
                    //                    [self.view addSubview:MenuViewControllerOBJ.view];
                    //
                    
                    
                }
                else{
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                    
                }
                
                
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
        
        
        
        
    }
    
    
    
}

-(void)GermanyValidation{
    
    
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    if ([self.crs_Country.text isEqualToString:@"Select Country"]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
//    else if ([self.crs_FirstName.text isEqualToString:@""])  {
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//    else if ([self.crs_LastName.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
    
    else if ([self.crs_EmailId.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
    
    else if (self.crs_MobileNumber.text.length <8)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"11111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"1111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"11111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"22222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"222222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"2222222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"22222222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"33333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"3333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"33333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"44444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"4444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"44444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"55555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"5555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"55555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"66666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"6666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"66666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"77777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"7777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"77777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"88888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"888888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"8888888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"88888888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"99999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"9999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"99999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"00000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"0000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"00000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
   
        
        
        
        
 
    
//
//
//    else if ([self.crs_Nationality.text isEqualToString:@"Select Nationality"]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Nationality" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
    
    
    
    
    
//
//    else if ([self.crs_DateOfBirth.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Date Of Birth should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }

    
    
    
    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    else if (self.crs_CreateMPIn.text.length <4)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    


//
//    else if ([self.crs_Address.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//

    
    
    
    
    
//
//
//
//
//    else if ([self.Crs_Gender.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Pls Specify your Gender" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
    
    
    
    
    
    
    
    
    //    else if ([self.crs_County.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your County" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //

//    else if ([self.crs_city.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if ([self.crs_Adress.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter Post Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
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
//    else if (self.crs_CreateMPIn.text   != self.crs_confirmMpin.text)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" PIN'S Should Be Same " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
//
//
//    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  PIN Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if (self.crs_CreateMPIn.text.length <4)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Enter Valid PIN Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
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
//    else if ([self.crs_confirmMpin.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Confirm your PIN Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//
//
//
//
    else if (![_crs_checkoutbutton1outlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    else if (![_crs_checkout2buttonoutlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    else {
        
        
        
        
        
        [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
        
        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            return ;
            
            
            
            
            
            
            
            
            
        }
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_NewRegister];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
//        [mapData setObject:self.crs_FirstName.text forKey:@"firstname"];
//
//        [mapData setObject:self.crs_LastName.text forKey:@"lastname"];
//
        [mapData setObject:self.crs_EmailId.text forKey:@"email"];
        
        [mapData setObject:self.crs_MobileNumber.text forKey:@"mobile"];
        
        [mapData setObject:self.crs_StdCodeFixedLabel.text forKey:@"countrycode"];
         [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
//        [mapData setObject:date1 forKey:@"dateofbirth"];
//
//        [mapData setObject:self.crs_Nationality.text forKey:@"Nationality"];
        [mapData setObject:self.crs_Country.text forKey:@"Country"];
//        [mapData setObject:self.crs_County.text forKey:@"middlename"];
//        [mapData setObject:self.crs_Address.text forKey:@"Address"];
//        [mapData setObject:self.crs_Adress.text forKey:@"Zipcode"];
//        [mapData setObject:self.crs_city.text forKey:@"city"];
//        [mapData setObject:self.crs_Address2.text forKey:@"Address2"];
//        [mapData setObject:self.crs_referalCode.text forKey:@"refcode"];
        [mapData setObject:@"IOS" forKey:@"device"];
//        [mapData setObject:self.crs_facebookField.text forKey:@"source"];
//
//        [mapData setObject:Gender forKey:@"gender"];
//        [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
//
        NSLog(@"%@",mapData);
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [[crs_sharedmethods sharedMySingleton].Ary_view_LoadingBg removeFromSuperview];
                
                NSLog(@"error %@",error);
                NSLog(@"data %@",data);
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@", json );
                
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerNumber = [json valueForKey:@"customerno"];
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId = [json valueForKey:@"user_id"];
                NSLog(@"%@", [json valueForKey:@"message"]);
                message = [json valueForKey:@"message"];
                if ([[json valueForKey:@"message"]isEqualToString:@"Success"]) {
                    OtppopupViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    OtppopupViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];;
                    viewController.otpvalue = [json valueForKey:@"OTP"];
                    viewController.ForOtp = self.crs_MobileNumber.text;
                    viewController.RegisterCountry = self.crs_Country.text;
                    [Crs_sharedvariable sharedMySingleton].crs_Otp = [json valueForKey:@"OTP"];
                    
                    [self.navigationController pushViewController:viewController animated:YES];
                    
                    
                    //
                    //                    [self addChildViewController:MenuViewControllerOBJ];
                    //                    [MenuViewControllerOBJ didMoveToParentViewController:self];
                    //                    // MenuViewControllerOBJ.otpvalue=[json valueForKey:@"OTP"];
                    //
                    //                    MenuViewControllerOBJ.otpvalue= [json valueForKey:@"OTP"];
                    //                    MenuViewControllerOBJ.crsVerifiaction = @"Register";
                    //
                    //                    MenuViewControllerOBJ.mobileNumber = self.crs_MobileNumber.text;
                    //
                    //                    MenuViewControllerOBJ.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
                    //                    [self.view addSubview:MenuViewControllerOBJ.view];
                    //
                    
                    
                }
                else{
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                    
                }
                
                
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
        
        
        
        
    }
    
    
    
}







-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ([NationalityName isEqualToString:@"country"]) {
        
        
        
        if (!isFiltered){
            
            return crs_countrylist.count;
            
        }
        
        else{
            
            return searchArray.count;
        }
    }
    else if ([NationalityName isEqualToString:@"PostalCode"])
    {
        if (!isFiltered){
            
             return postalCompressingArray.count;
        }
        else{
            
            
            return searchArray.count;
        }
        
       
        
        
    }
    else if ([NationalityName isEqualToString:@"PostalCode1"])
    {
       
             return postalCompressingArray.count;
            
        
        
        
    }
    else if ([NationalityName isEqualToString:@"Facebook"])
    {
        
        return FacebookArray.count;
        
        
    }
    
    else if ([NationalityName isEqualToString:@"nationality"])
    { if (!isFiltered){
        
        return NationalityArray.count;
    }
        
    else{
        
        return searchArray.count;
        
        
    }
        
    }
    
    
    else{
        
        return NationalityArray.count;
    }
    
    return 10;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}



-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"countryCell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"countryCell"];
    }
    
    
    
    if ([NationalityName isEqualToString:@"country"]) {
        
        if (!isFiltered){
             cell.textLabel.text = [[crs_countrylist valueForKey:@"country_name"] objectAtIndex:indexPath.row];
        }
        else{
            
            
             cell.textLabel.text = [[searchArray valueForKey:@"country_name"] objectAtIndex:indexPath.row];
        }
        
    }
    else if ([NationalityName isEqualToString:@"PostalCode"])
    {
        if (!isFiltered){
             cell.textLabel.text = [[postalCompressingArray valueForKey:@"addressline1"] objectAtIndex:indexPath.row];
            
        }
        
        else{
            
            
             cell.textLabel.text = [[searchArray valueForKey:@"addressline1"] objectAtIndex:indexPath.row];
        }
        
        
        
        
    }
    else if ([NationalityName isEqualToString:@"PostalCode1"])
    {
      
            
               cell.textLabel.text = [postalCompressingArray objectAtIndex:indexPath.row];
       
      
        
        
        
        
    }
    
    else if ([NationalityName isEqualToString:@"Facebook"])
    {
        cell.textLabel.text = [FacebookArray objectAtIndex:indexPath.row];
        
        
        
        
    }
    
    else{
        
        
        cell.textLabel.text = [[NationalityArray valueForKey:@"nationality"] objectAtIndex:indexPath.row];
        
        
    }
    
    
    
    return cell;
    
    
    
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    if ([NationalityName isEqualToString:@"country"]) {
        
        
        self.crs_AddressoneButtonOutlet.hidden = NO;
        self.crs_AddresstwoButtonOutlet.hidden = NO;
        self.crs_CityButtonoutlet.hidden = NO;
        self.crs_AddressOneDropImage.hidden = NO;
        self.crs_AddressTwoDropDownImage.hidden = NO;
        
        
        self.crs_MobileNumber.text = @"";
        self.crs_Address.text = @"";
        self.crs_Address2.text = @"";
        self.crs_Adress.text = @"";
        self.crs_city.text = @"";
        self.crs_search.text = @"";
        if (!isFiltered){
            
            self.crs_StdLabel.text = [[crs_countrylist valueForKey:@"isd_code"] objectAtIndex:indexPath.row];
            self.crs_Country.text = [[crs_countrylist valueForKey:@"country_name"]objectAtIndex:indexPath.row];
            CountryPlacer = [[crs_countrylist valueForKey:@"country_code"] objectAtIndex:indexPath.row];
             [Crs_sharedvariable sharedMySingleton].crs_RegisterCountryCode = [[crs_countrylist valueForKey:@"country_code"] objectAtIndex:indexPath.row];
            NSLog(@"My Country Code is %@", [Crs_sharedvariable sharedMySingleton].crs_RegisterCountryCode);
        }
        else{
            
            self.crs_StdLabel.text = [[searchArray valueForKey:@"isd_code"] objectAtIndex:indexPath.row];
            self.crs_Country.text = [[searchArray valueForKey:@"country_name"]objectAtIndex:indexPath.row];
            CountryPlacer = [[searchArray valueForKey:@"country_code"] objectAtIndex:indexPath.row];
        }
        
        
        
        if ([self.crs_Country.text isEqualToString:@"UNITED KINGDOM"]||[self.crs_Country.text isEqualToString:@"NORWAY"]||[self.crs_Country.text isEqualToString:@"GERMANY"]||[self.crs_Country.text isEqualToString:@"FRANCE"]||[self.crs_Country.text isEqualToString:@"NETHERLANDS"]||[self.crs_Country.text isEqualToString:@"IRELAND"]||[self.crs_Country.text isEqualToString:@"AUSTRIA"]||[self.crs_Country.text isEqualToString:@"BELGIUM"]) {
            self.crs_idNumberfield.hidden = YES;
            self.crs_OtherCountriesIdNumber.hidden = YES;
//            CGRect r = [self.crs_FacebookView frame];
//            r.origin.y = 865.0f;
//              [self.crs_FacebookView setFrame:r];
            
            
           // self.crs_idNumberfield.placeholder = @"How did You Hear us ";
        }
        
        
        else if ([self.crs_Country.text isEqualToString:@"SWEDEN"]){
            
            
            
            
            self.crs_idNumberfield.hidden = NO;
//            CGRect r = [self.crs_FacebookView frame];
//            r.origin.y = 920.0f;
            //[self.crs_FacebookView setFrame:r];
            self.crs_idNumberfield.hidden = NO;
            self.crs_idNumberfield.placeholder = @"National ID Number";
            self.crs_OtherCountriesIdNumber.hidden = YES;
        }
        
        else if ([self.crs_Country.text isEqualToString:@"ITALY"]){
            
            
            
            
            self.crs_idNumberfield.hidden = NO;
//            CGRect r = [self.crs_FacebookView frame];
//            r.origin.y = 920.0f;
//            [self.crs_FacebookView setFrame:r];
            self.crs_idNumberfield.hidden = YES;
        self.crs_OtherCountriesIdNumber.hidden = NO;
            self.crs_OtherCountriesIdNumber.placeholder = @"Codice Fiscale";
        }
        
        else if ([self.crs_Country.text isEqualToString:@"SPAIN"]){
            
            
            
            
            self.crs_idNumberfield.hidden = NO;
//            CGRect r = [self.crs_FacebookView frame];
//            r.origin.y = 920.0f;
//            [self.crs_FacebookView setFrame:r];
            self.crs_idNumberfield.hidden = YES;
            self.crs_OtherCountriesIdNumber.hidden = NO;
            self.crs_OtherCountriesIdNumber.placeholder = @"NIF/NIE Number";
        }

        else{


            self.crs_idNumberfield.hidden = NO;
//            CGRect r = [self.crs_FacebookView frame];
//            r.origin.y = 920.0f;
//            [self.crs_FacebookView setFrame:r];
                  self.crs_idNumberfield.hidden = NO;
            self.crs_idNumberfield.placeholder = @"CPR Number";
        }

        
        
        
    }
    
    else if ([NationalityName isEqualToString:@"PostalCode"])
        
    {
        if (! isFiltered) {
            self.crs_Address.text = [[postalCompressingArray valueForKey:@"addressline1"] objectAtIndex:indexPath.row];
            
            self.crs_city.text = [[postalCompressingArray valueForKey:@"posttown"] objectAtIndex:indexPath.row];
            
        }
        else{
            
            self.crs_Address.text = [[searchArray valueForKey:@"addressline1"] objectAtIndex:indexPath.row];
            
            self.crs_city.text = [[searchArray valueForKey:@"posttown"] objectAtIndex:indexPath.row];
            
            
        }
        // self.crs_Address.placeholderFontScale = 100;
        
      
        
        
        
    }
    else if ([NationalityName isEqualToString:@"PostalCode1"])
    {
        
        
            
            self.crs_Address2.text = [postalCompressingArray  objectAtIndex:indexPath.row];
        
      
        
        
        
        
    }
    
    else if ([NationalityName isEqualToString:@"Facebook"])
    {
        self.crs_facebookField.text = [FacebookArray  objectAtIndex:indexPath.row];
        
        
        
        
    }
    
    
    else{
        
        
        self.crs_Nationality.text = [[NationalityArray valueForKey:@"nationality"]objectAtIndex:indexPath.row];
        
    }
    
    
    //
    
    self.crs_CountryView.hidden = YES;
    
    
    
    
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


- (IBAction)Crs_Remove_CountryView:(id)sender {
    self.crs_CountryView.hidden = YES;
}
- (IBAction)crs_ConfirmHideaction:(id)sender {
    
    
    if ([ConformHide isEqualToString:@"show"]) {
        
        self.crs_confirmMpin.secureTextEntry = NO;
        
        ConformHide = @"hide";
        [_crs_confirmHide setSelected:YES];
        
    }
    
    else
    {
        
        
        self.crs_confirmMpin.secureTextEntry = YES;
        [_crs_confirmHide setSelected:NO];
        ConformHide = @"show";
    }
}
- (IBAction)crs_AddressTwoButton:(id)sender {
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    if ([self.crs_Country.text isEqualToString:@"Select Country"]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Country and Post Code For Address Line 2" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
    }
    
    
    
    else if ([self.crs_Adress.text isEqualToString:@""])
    {
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Country and Post Code For Address Line 2 " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else
    {
        
        
        
        
        
        
        
        NationalityName = @"PostalCode1";
        [self PostCodeAdress1];
        
        
        
    }
    
    
}
- (IBAction)crs_AddressOneButton:(id)sender {
    isFiltered=NO;
    
    self.crs_search.placeholder = @"Search For Address ";
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    [self empty];
    
    if ([self.crs_Country.text isEqualToString:@"Select Country"]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Country and Post Code For Address Line 1" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
    }
    
    
    
    else if ([self.crs_Adress.text isEqualToString:@""])
    {
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Country and Post Code For Address Line 1" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_Country.text isEqualToString:@"UNITED KINGDOM"]){
        
        NationalityName = @"PostalCode";
        [self PostCodeAdress];
        self.crs_AddressoneButtonOutlet.hidden = NO;
        self.crs_AddresstwoButtonOutlet.hidden = NO;
        self.crs_AddressOneDropImage.hidden = NO;
        self.crs_AddressTwoDropDownImage.hidden = NO;
           self.crs_CityButtonoutlet.hidden = NO;
    }
//    else if ([self.crs_Country.text isEqualToString:@"GERMANY"]||[self.crs_Country.text isEqualToString:@"FRANCE"]){
//
//        NationalityName = @"PostalCode";
//        [self PostCodeAdress];
//        self.crs_AddressoneButtonOutlet.hidden = NO;
//        self.crs_AddresstwoButtonOutlet.hidden = NO;
//        self.crs_AddressOneDropImage.hidden = NO;
//        self.crs_AddressTwoDropDownImage.hidden = NO;
//        self.crs_CityButtonoutlet.hidden = NO;
//    }
//
    
    else
    {
        
         self.crs_AddressoneButtonOutlet.hidden = YES;
        self.crs_AddresstwoButtonOutlet.hidden = YES;
        self.crs_AddressOneDropImage.hidden = YES;
        self.crs_AddressTwoDropDownImage.hidden = YES;
        self.crs_CityButtonoutlet.hidden = YES;
    }
}
- (IBAction)crs_CityButton:(id)sender {
    [self empty];
    
    
}


-(void)PostCodeAdress {
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString * CountryCodeChanger ;
    if ([CountryPlacer isEqualToString:@"GBP"]) {
        CountryCodeChanger = @"uk";
    }
    
   else if ([CountryPlacer isEqualToString:@"NOK"]) {
        CountryCodeChanger = @"";
       
    }
    
      else if ([CountryPlacer isEqualToString:@"DKK"]) {
        CountryCodeChanger = @"";
    }
    
      else if ([self.crs_Country.text isEqualToString:@"GERMANY"]) {
          CountryCodeChanger = @"";
      }
      else if ([self.crs_Country.text isEqualToString:@"FRANCE"]) {
          CountryCodeChanger = @"";
      }
    
    else
    {
        
        CountryCodeChanger = @"" ;
        
    }
    NSString *str = self.crs_Adress.text;
    
    str = [str stringByReplacingOccurrencesOfString:@" "withString:@""];;
    NSLog(@"%@ Anusha",str);
    
    NSString * postCodeUrl = [NSString stringWithFormat:@"https://ws.postcoder.com/pcw/PCWBD-CB592-Q66XH-3KQ6R/address/%@/%@?lines=5&format=json",CountryCodeChanger,str];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:postCodeUrl] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            
            @try {
                
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                
                PostalCoderray = json;
                [self.view removeGestureRecognizer:tap];
                postalCompressingArray = [NSMutableArray new];
                postalCompressingArray = json;
            }
            @catch (NSException *exception) {
                
                NSLog(@"Max index manish");
                //                postalCompressingArray = [NSMutableArray new];
                //                postalCompressingArray = 0;
                //                NSLog(@"Max index value",postalCompressingArray.count);
            }
            @finally {
                
                NSLog(@"  Max index is %lu",(unsigned long)postalCompressingArray.count);
            }
            
            
            
            if (postalCompressingArray.count == 0) {
                self.crs_AddressoneButtonOutlet.hidden = YES;
                self.crs_AddresstwoButtonOutlet.hidden = YES;
                self.crs_CityButtonoutlet.hidden = YES;
                self.crs_AddressOneDropImage.hidden = YES;
                self.crs_AddressTwoDropDownImage.hidden = YES;
                
                
            }
            else{
                
                
                if ([NationalityName isEqualToString:@"PostalCode1"]) {
                    postalCompressingArray = [NSMutableArray new];
                    for (int i = 0; i<PostalCoderray.count; i++) {
                        
                        
                        
                        [postalCompressingArray addObject:[[PostalCoderray valueForKey:@"addressline2"]objectAtIndex: i] ];
                        
                        
                        
                    }
                    
                    NSString *nullStr = @"nil";
                    [postalCompressingArray removeObject:nullStr];
                    
                    [postalCompressingArray removeObjectIdenticalTo:[NSNull  null  ]];
                }
                
                
                NSLog(@"%lu",(unsigned long)postalCompressingArray.count);
                NSLog(@" sai kiran %lu",(unsigned long)PostalCoderray.count);
                //postalCompressingArray = PostalCoderray;
                NSLog(@"%@ StoneCold steve",postalCompressingArray);
                [self.crs_CountryTable reloadData];
                self.crs_CountryView.hidden = NO;
                //NSLog(@"%@ PostCode",json);
                
                
                
                
                
            }
            
        });
    }];
    
    [dataTask resume];
    
    
    
    
}
-(void)PostCodeAdress1 {
    
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString * CountryCodeChanger ;
    if ([CountryPlacer isEqualToString:@"GBP"]) {
        CountryCodeChanger = @"uk";
    }
    
    
    
    else if ([CountryPlacer isEqualToString:@"NOK"]) {
        CountryCodeChanger = @"";
    }
    
    else if ([CountryPlacer isEqualToString:@"DKK"]) {
        CountryCodeChanger = @"";
    }
    
    else
    {
        
        CountryCodeChanger = @"" ;
        
    }
    NSString *str = self.crs_Adress.text;
    
    str = [str stringByReplacingOccurrencesOfString:@" "withString:@""];;
    NSLog(@"%@ Anusha",str);
    
    NSString * postCodeUrl = [NSString stringWithFormat:@"https://ws.postcoder.com/pcw/PCWBD-CB592-Q66XH-3KQ6R/address/%@/%@?lines=5&format=json",CountryCodeChanger,str];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:postCodeUrl] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            
            @try {
                
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                
                PostalCoderray = json;
                [self.view removeGestureRecognizer:tap];
                postalCompressingArray = [NSMutableArray new];
                postalCompressingArray = json;
            }
            @catch (NSException *exception) {
                
                NSLog(@"Max index manish");
                //                postalCompressingArray = [NSMutableArray new];
                //                postalCompressingArray = 0;
                //                NSLog(@"Max index value",postalCompressingArray.count);
            }
            @finally {
                
                NSLog(@"Max index is");
            }
            
            
            
            if (postalCompressingArray.count == 0) {
                self.crs_AddressoneButtonOutlet.hidden = YES;
                self.crs_AddresstwoButtonOutlet.hidden = YES;
                self.crs_CityButtonoutlet.hidden = YES;
                self.crs_AddressOneDropImage.hidden = YES;
                self.crs_AddressTwoDropDownImage.hidden = YES;
                
                
            }
            else{
                
                
                if ([NationalityName isEqualToString:@"PostalCode1"]) {
                    postalCompressingArray = [NSMutableArray new];
                    for (int i = 0; i<PostalCoderray.count; i++) {
                        
                        
                        
                        [postalCompressingArray addObject:[[PostalCoderray valueForKey:@"addressline2"]objectAtIndex: i] ];
                        
                        
                        
                    }
                    
                    NSString *nullStr = @"nil";
                    [postalCompressingArray removeObject:nullStr];
                    
                    [postalCompressingArray removeObjectIdenticalTo:[NSNull  null  ]];
                }
                
                
                NSLog(@"%lu",(unsigned long)postalCompressingArray.count);
                NSLog(@" sai kiran %lu",(unsigned long)PostalCoderray.count);
                //postalCompressingArray = PostalCoderray;
                NSLog(@"%@ StoneCold steve",postalCompressingArray);
                [self.crs_CountryTable reloadData];
                self.crs_CountryView.hidden = NO;
                //NSLog(@"%@ PostCode",json);
                
                
                
                
                
            }
            
        });
    }];
    
    [dataTask resume];
    
    
    
    
}


-(void)DenmarkValidation{
    
    self.crs_idNumberfield.hidden = NO;
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    if ([self.crs_Country.text isEqualToString:@"Select Country"]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    else if ([self.crs_EmailId.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
    }
    
//    else if ([self.crs_FirstName.text isEqualToString:@""])  {
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//    else if ([self.crs_LastName.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
    
    else if ([self.crs_MobileNumber.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
    
    else if (self.crs_MobileNumber.text.length <8)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    
    
//
//    else if ([self.crs_Nationality.text isEqualToString:@"Select Nationality"]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Nationality" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
    
    
    
    
//
//
//
//    else if ([self.crs_DateOfBirth.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Date Of Birth should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
    
    
    
    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    else if (self.crs_CreateMPIn.text.length <4)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
//
//    else if ([self.Crs_Gender.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Pls Specify your Gender" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
    
    
    
    
    
    
    
    
    //    else if ([self.crs_County.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your County" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    
    
    
    
    
    
    



//
//
//    else if ([self.crs_Address.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//    else if ([self.crs_city.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//    else if ([self.crs_Adress.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter Post Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
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
//    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//    else if ([self.crs_confirmMpin.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Confirm your Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if (self.crs_CreateMPIn.text   != self.crs_confirmMpin.text)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Pin  Numbers  Should Be Same " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
//
//
//
//    else if (self.crs_CreateMPIn.text.length <4)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
//
//
//
//
//
////
////    else if ([self.crs_idNumberfield.text isEqualToString:@""]){
////
////
////
////        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your CPR Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
////
////        [alert show];
////
////    }
////
////
////
////
////
////
////
////    else if (self.crs_idNumberfield.text.length <10)
////
////
////    {
////
////        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid CPR Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
////
////        [alert show];
////
////
////
////
////
////    }
////
////
//
    
    
    else if (![_crs_checkoutbutton1outlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    else if (![_crs_checkout2buttonoutlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    else {
        
        
        
        
        
        [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
        
        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            return ;
            
            
            
            
            
            
            
            
            
        }
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_NewRegister];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
//
//        [mapData setObject:self.crs_FirstName.text forKey:@"firstname"];
//
//        [mapData setObject:self.crs_LastName.text forKey:@"lastname"];
//
        [mapData setObject:self.crs_EmailId.text forKey:@"email"];
        
        [mapData setObject:self.crs_MobileNumber.text forKey:@"mobile"];
        
        [mapData setObject:self.crs_StdCodeFixedLabel.text forKey:@"countrycode"];
 [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
//      [mapData setObject:date1 forKey:@"dateofbirth"];
//
//        [mapData setObject:self.crs_Nationality.text forKey:@"Nationality"];
//
        [mapData setObject:self.crs_Country.text forKey:@"Country"];
//        [mapData setObject:self.crs_County.text forKey:@"middlename"];
//        [mapData setObject:self.crs_Address.text forKey:@"Address"];
//        [mapData setObject:self.crs_Adress.text forKey:@"Zipcode"];
//        [mapData setObject:self.crs_city.text forKey:@"city"];
//        [mapData setObject:self.crs_Address2.text forKey:@"Address2"];
//        [mapData setObject:self.crs_referalCode.text forKey:@"refcode"];
        [mapData setObject:@"IOS" forKey:@"device"];
//          [mapData setObject:self.crs_idNumberfield.text forKey:@"CusIdNumber"];
//        [mapData setObject:self.crs_facebookField.text forKey:@"source"];
//
//        [mapData setObject:Gender forKey:@"gender"];
//        [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
//
        NSLog(@"%@",mapData);
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [[crs_sharedmethods sharedMySingleton].Ary_view_LoadingBg removeFromSuperview];
                
                NSLog(@"error %@",error);
                NSLog(@"data %@",data);
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@", json );
                
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerNumber = [json valueForKey:@"customerno"];
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId = [json valueForKey:@"user_id"];
                
                NSLog(@"%@", [json valueForKey:@"message"]);
                message = [json valueForKey:@"message"];
                if ([[json valueForKey:@"message"]isEqualToString:@"Success"]) {
                    OtppopupViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    OtppopupViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];;
                    viewController.otpvalue = [json valueForKey:@"OTP"];
                    viewController.ForOtp = self.crs_MobileNumber.text;
                    [Crs_sharedvariable sharedMySingleton].crs_Otp = [json valueForKey:@"OTP"];
                    
                    [self.navigationController pushViewController:viewController animated:YES];
                    
                    
                    //
                    //                    [self addChildViewController:MenuViewControllerOBJ];
                    //                    [MenuViewControllerOBJ didMoveToParentViewController:self];
                    //                    // MenuViewControllerOBJ.otpvalue=[json valueForKey:@"OTP"];
                    //
                    //                    MenuViewControllerOBJ.otpvalue= [json valueForKey:@"OTP"];
                    //                    MenuViewControllerOBJ.crsVerifiaction = @"Register";
                    //
                    //                    MenuViewControllerOBJ.mobileNumber = self.crs_MobileNumber.text;
                    //
                    //                    MenuViewControllerOBJ.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
                    //                    [self.view addSubview:MenuViewControllerOBJ.view];
                    //
                    
                    
                }
                else{
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                    
                }
                
                
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
        
        
        
        
    }
    
}


-(void)swedenValidation{
    
    self.crs_idNumberfield.hidden = NO;
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    if ([self.crs_Country.text isEqualToString:@"Select Country"]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    else if ([self.crs_EmailId.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
    }
    
    //    else if ([self.crs_FirstName.text isEqualToString:@""])  {
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //    else if ([self.crs_LastName.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    
    else if ([self.crs_MobileNumber.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
    
    else if (self.crs_MobileNumber.text.length <8)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    
    
   
    
    
    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    else if (self.crs_CreateMPIn.text.length <4)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if (![_crs_checkoutbutton1outlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    else if (![_crs_checkout2buttonoutlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    else {
        
        
        
        
        
        [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
        
        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            return ;
            
            
            
            
            
            
            
            
            
        }
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_NewRegister];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
      
        [mapData setObject:self.crs_EmailId.text forKey:@"email"];
        
        [mapData setObject:self.crs_MobileNumber.text forKey:@"mobile"];
        
        [mapData setObject:self.crs_StdCodeFixedLabel.text forKey:@"countrycode"];
        [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
       
        [mapData setObject:self.crs_Country.text forKey:@"Country"];
    
        [mapData setObject:@"IOS" forKey:@"device"];
        
        //
        NSLog(@"%@",mapData);
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [[crs_sharedmethods sharedMySingleton].Ary_view_LoadingBg removeFromSuperview];
                
                NSLog(@"error %@",error);
                NSLog(@"data %@",data);
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@", json );
                
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerNumber = [json valueForKey:@"customerno"];
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId = [json valueForKey:@"user_id"];
                
                NSLog(@"%@", [json valueForKey:@"message"]);
                message = [json valueForKey:@"message"];
                if ([[json valueForKey:@"message"]isEqualToString:@"Success"]) {
                    OtppopupViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    OtppopupViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];;
                    viewController.otpvalue = [json valueForKey:@"OTP"];
                    viewController.ForOtp = self.crs_MobileNumber.text;
                    [Crs_sharedvariable sharedMySingleton].crs_Otp = [json valueForKey:@"OTP"];
                    
                    [self.navigationController pushViewController:viewController animated:YES];
                    
                    
                    //
                    //                    [self addChildViewController:MenuViewControllerOBJ];
                    //                    [MenuViewControllerOBJ didMoveToParentViewController:self];
                    //                    // MenuViewControllerOBJ.otpvalue=[json valueForKey:@"OTP"];
                    //
                    //                    MenuViewControllerOBJ.otpvalue= [json valueForKey:@"OTP"];
                    //                    MenuViewControllerOBJ.crsVerifiaction = @"Register";
                    //
                    //                    MenuViewControllerOBJ.mobileNumber = self.crs_MobileNumber.text;
                    //
                    //                    MenuViewControllerOBJ.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
                    //                    [self.view addSubview:MenuViewControllerOBJ.view];
                    //
                    
                    
                }
                else{
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                    
                }
                
                
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
        
        
        
        
    }
    
}

-(void)SwedenValidation{
    
    self.crs_idNumberfield.hidden = NO;
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    if ([self.crs_Country.text isEqualToString:@"Select Country"]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
//    else if ([self.crs_FirstName.text isEqualToString:@""])  {
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//    else if ([self.crs_LastName.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
    
    
    else if ([self.crs_EmailId.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
    
    else if (self.crs_MobileNumber.text.length <8)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    
    
    
//    else if ([self.crs_Nationality.text isEqualToString:@"Select Nationality"]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Nationality" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if ([self.crs_FirstName.text isEqualToString:@""])  {
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//    else if ([self.crs_LastName.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
////
//
//    else if ([self.crs_DateOfBirth.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Date Of Birth should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//



    
    
    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    else if (self.crs_CreateMPIn.text.length <4)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
//
//
//
//    else if ([self.Crs_Gender.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Pls Specify your Gender" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
    
    
    
    
    
    
    
    
    
    //    else if ([self.crs_County.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your County" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    
    
    
    
    
    
    




//
//    else if ([self.crs_Address.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//    else if ([self.crs_city.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//    else if ([self.crs_Adress.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter Post Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
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
//    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//    else if ([self.crs_confirmMpin.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Confirm your Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if (self.crs_CreateMPIn.text   != self.crs_confirmMpin.text)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Pin  Numbers  Should Be Same " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
//
//
//
//    else if (self.crs_CreateMPIn.text.length <4)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
//
//
    
//
//
//    else if ([self.crs_idNumberfield.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your National ID Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//
//
//
//    else if (self.crs_idNumberfield.text.length <10)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid National ID Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
    
    
    
    else if (![_crs_checkoutbutton1outlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    else if (![_crs_checkout2buttonoutlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    else {
        
        
        
        
        
        [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
        
        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            return ;
            
            
            
            
            
            
            
            
            
        }
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_NewRegister];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
//        [mapData setObject:self.crs_FirstName.text forKey:@"firstname"];
//
//        [mapData setObject:self.crs_LastName.text forKey:@"lastname"];
//
        [mapData setObject:self.crs_EmailId.text forKey:@"email"];
        
        [mapData setObject:self.crs_MobileNumber.text forKey:@"mobile"];
        
        [mapData setObject:self.crs_StdCodeFixedLabel.text forKey:@"countrycode"];
         [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
       // [mapData setObject:date1 forKey:@"dateofbirth"];
        
        [mapData setObject:@"IOS" forKey:@"device"];
        
        //          [mapData setObject:self.crs_facebookField.t
        
        //[mapData setObject:self.crs_Nationality.text forKey:@"Nationality"];
        [mapData setObject:self.crs_Country.text forKey:@"Country"];
//        [mapData setObject:self.crs_County.text forKey:@"middlename"];
//        [mapData setObject:self.crs_Address.text forKey:@"Address"];
//        [mapData setObject:self.crs_Adress.text forKey:@"Zipcode"];
//        [mapData setObject:self.crs_city.text forKey:@"city"];
//        [mapData setObject:self.crs_Address2.text forKey:@"Address2"];
//        [mapData setObject:self.crs_referalCode.text forKey:@"refcode"];
//          [mapData setObject:self.crs_idNumberfield.text forKey:@"CusIdNumber"];
//        [mapData setObject:@"IOS" forKey:@"device"];
//          [mapData setObject:self.crs_facebookField.text forKey:@"source"];
//
//        [mapData setObject:Gender forKey:@"gender"];
//        [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
        
        NSLog(@"%@",mapData);
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [[crs_sharedmethods sharedMySingleton].Ary_view_LoadingBg removeFromSuperview];
                
                NSLog(@"error %@",error);
                NSLog(@"data %@",data);
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@", json );
                
                NSLog(@"%@", [json valueForKey:@"message"]);
                message = [json valueForKey:@"message"];
                if ([[json valueForKey:@"message"]isEqualToString:@"Success"]) {
                    OtppopupViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    OtppopupViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];;
                    viewController.otpvalue = [json valueForKey:@"OTP"];
                    viewController.ForOtp = self.crs_MobileNumber.text;
                    [Crs_sharedvariable sharedMySingleton].crs_Otp = [json valueForKey:@"OTP"];
                    
                    [self.navigationController pushViewController:viewController animated:YES];
                    
                    
                    //
                    //                    [self addChildViewController:MenuViewControllerOBJ];
                    //                    [MenuViewControllerOBJ didMoveToParentViewController:self];
                    //                    // MenuViewControllerOBJ.otpvalue=[json valueForKey:@"OTP"];
                    //
                    //                    MenuViewControllerOBJ.otpvalue= [json valueForKey:@"OTP"];
                    //                    MenuViewControllerOBJ.crsVerifiaction = @"Register";
                    //
                    //                    MenuViewControllerOBJ.mobileNumber = self.crs_MobileNumber.text;
                    //
                    //                    MenuViewControllerOBJ.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
                    //                    [self.view addSubview:MenuViewControllerOBJ.view];
                    //
                    
                    
                }
                else{
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                    
                }
                
                
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
        
        
        
        
    }
    
}

-(void)ItalyValidation{
    
    
    if ([self.crs_Country.text isEqualToString:@"ITALY"]) {
       [self.crs_OtherCountriesIdNumber setKeyboardType:UIKeyboardTypeNumberPad];
    }
    
    self.crs_idNumberfield.hidden = YES;
     self.crs_OtherCountriesIdNumber.hidden = NO;
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    if ([self.crs_Country.text isEqualToString:@"Select Country"]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
//    else if ([self.crs_FirstName.text isEqualToString:@""])  {
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//    else if ([self.crs_LastName.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
    
    
    else if ([self.crs_EmailId.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
    
    else if (self.crs_MobileNumber.text.length <9)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    
    
//
//    else if ([self.crs_Nationality.text isEqualToString:@"Select Nationality"]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Nationality" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if ([self.crs_FirstName.text isEqualToString:@""])  {
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//    else if ([self.crs_LastName.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//


//
//    else if ([self.crs_DateOfBirth.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Date Of Birth should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
    
    
    else if ([self.crs_EmailId.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
    }
    
    
    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    else if (self.crs_CreateMPIn.text.length <4)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
//
//    else if ([self.Crs_Gender.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Pls Specify your Gender" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
    
    
    
    
    
    
    
    
    
    
    //    else if ([self.crs_County.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your County" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    
    
    
    
    
    
    
    
    
    
//
//
//    else if ([self.crs_Address.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//    else if ([self.crs_city.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//    else if ([self.crs_Adress.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter Post Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
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
//    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//    else if ([self.crs_confirmMpin.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Confirm your Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if (self.crs_CreateMPIn.text   != self.crs_confirmMpin.text)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Pin  Numbers  Should Be Same " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
//
//
//
//    else if (self.crs_CreateMPIn.text.length <4)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
    
    
    
    
//
//    else if ([self.crs_OtherCountriesIdNumber.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Codice Fiscale " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//
//
//    else if (self.crs_OtherCountriesIdNumber.text.length <16)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Codice Fiscale" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
    
    
    
    else if (![_crs_checkoutbutton1outlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    else if (![_crs_checkout2buttonoutlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    else {
        
        
        
        
        
        [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
        
        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            return ;
            
            
            
            
            
            
            
            
            
        }
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_NewRegister];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
//        [mapData setObject:self.crs_FirstName.text forKey:@"firstname"];
//
//        [mapData setObject:self.crs_LastName.text forKey:@"lastname"];
//
        [mapData setObject:self.crs_EmailId.text forKey:@"email"];
        
        [mapData setObject:self.crs_MobileNumber.text forKey:@"mobile"];
         [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
       [mapData setObject:self.crs_StdCodeFixedLabel.text forKey:@"countrycode"];
//
//[mapData setObject:date1 forKey:@"dateofbirth"];
//
       // [mapData setObject:self.crs_Nationality.text forKey:@"Nationality"];
        [mapData setObject:self.crs_Country.text forKey:@"Country"];
//        [mapData setObject:self.crs_County.text forKey:@"middlename"];
//        [mapData setObject:self.crs_Address.text forKey:@"Address"];
//        [mapData setObject:self.crs_Adress.text forKey:@"Zipcode"];
//        [mapData setObject:self.crs_city.text forKey:@"city"];
//        [mapData setObject:self.crs_Address2.text forKey:@"Address2"];
//        [mapData setObject:self.crs_referalCode.text forKey:@"refcode"];
//        [mapData setObject:self.crs_OtherCountriesIdNumber.text forKey:@"CusIdNumber"];
        [mapData setObject:@"IOS" forKey:@"device"];
//        [mapData setObject:self.crs_facebookField.text forKey:@"source"];
//
//        [mapData setObject:Gender forKey:@"gender"];
//        [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
//
        NSLog(@"%@",mapData);
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [[crs_sharedmethods sharedMySingleton].Ary_view_LoadingBg removeFromSuperview];
                
                NSLog(@"error %@",error);
                NSLog(@"data %@",data);
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@", json );
                
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerNumber = [json valueForKey:@"customerno"];
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId = [json valueForKey:@"user_id"];
                NSLog(@"%@", [json valueForKey:@"message"]);
                message = [json valueForKey:@"message"];
                if ([[json valueForKey:@"message"]isEqualToString:@"Success"]) {
                    OtppopupViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    OtppopupViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];;
                    viewController.otpvalue = [json valueForKey:@"OTP"];
                    viewController.ForOtp = self.crs_MobileNumber.text;
                    [Crs_sharedvariable sharedMySingleton].crs_Otp = [json valueForKey:@"OTP"];
                    
                    [self.navigationController pushViewController:viewController animated:YES];
                    
                    
                    
                    //
                    //                    [self addChildViewController:MenuViewControllerOBJ];
                    //                    [MenuViewControllerOBJ didMoveToParentViewController:self];
                    //                    // MenuViewControllerOBJ.otpvalue=[json valueForKey:@"OTP"];
                    //
                    //                    MenuViewControllerOBJ.otpvalue= [json valueForKey:@"OTP"];
                    //                    MenuViewControllerOBJ.crsVerifiaction = @"Register";
                    //
                    //                    MenuViewControllerOBJ.mobileNumber = self.crs_MobileNumber.text;
                    //
                    //                    MenuViewControllerOBJ.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
                    //                    [self.view addSubview:MenuViewControllerOBJ.view];
                    //
                    
                    
                }
                else{
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                    
                }
                
                
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
        
        
        
        
    }
    
}

-(void)Spain{
    
    self.crs_idNumberfield.hidden = YES;
     self.crs_OtherCountriesIdNumber.hidden = NO;
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    if ([self.crs_Country.text isEqualToString:@"Select Country"]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
//    else if ([self.crs_FirstName.text isEqualToString:@""])  {
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//    else if ([self.crs_LastName.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
    
    else if ([self.crs_EmailId.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
    
    else if (self.crs_MobileNumber.text.length <9)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    
    
//
//    else if ([self.crs_Nationality.text isEqualToString:@"Select Nationality"]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Nationality" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if ([self.crs_FirstName.text isEqualToString:@""])  {
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//    else if ([self.crs_LastName.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//


//
//    else if ([self.crs_DateOfBirth.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Date Of Birth should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
    
    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    else if (self.crs_CreateMPIn.text.length <4)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
//    else if ([self.Crs_Gender.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Pls Specify your Gender" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//
//
    
    
    
    
    //    else if ([self.crs_County.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your County" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    
    
    
    
    
    
    
    
    
    
    
//
//    else if ([self.crs_Address.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//    else if ([self.crs_city.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//    else if ([self.crs_Adress.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter Post Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
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
//    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//    else if ([self.crs_confirmMpin.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Confirm your Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if (self.crs_CreateMPIn.text   != self.crs_confirmMpin.text)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Pin  Numbers  Should Be Same " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
//
//
//
//    else if (self.crs_CreateMPIn.text.length <4)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
//
//
//
//
//
//    else if ([self.crs_OtherCountriesIdNumber.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your NIF/NIE Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//    else if (self.crs_OtherCountriesIdNumber.text.length <8)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid NIF/NIE Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
//
//
//
    
    
    
    
    else if (![_crs_checkoutbutton1outlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    else if (![_crs_checkout2buttonoutlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    
    
    
    else {
        
        
        
        
        
        [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
        
        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            return ;
            
            
            
            
            
            
            
            
            
        }
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_NewRegister];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
//        [mapData setObject:self.crs_FirstName.text forKey:@"firstname"];
//
//        [mapData setObject:self.crs_LastName.text forKey:@"lastname"];
        
        [mapData setObject:self.crs_EmailId.text forKey:@"email"];
        
        [mapData setObject:self.crs_MobileNumber.text forKey:@"mobile"];
        
        [mapData setObject:self.crs_StdCodeFixedLabel.text forKey:@"countrycode"];
         [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
//[mapData setObject:date1 forKey:@"dateofbirth"];
//
//        [mapData setObject:self.crs_Nationality.text forKey:@"Nationality"];
        [mapData setObject:self.crs_Country.text forKey:@"Country"];
//        [mapData setObject:self.crs_County.text forKey:@"middlename"];
//        [mapData setObject:self.crs_Address.text forKey:@"Address"];
//        [mapData setObject:self.crs_Adress.text forKey:@"Zipcode"];
//        [mapData setObject:self.crs_city.text forKey:@"city"];
//        [mapData setObject:self.crs_Address2.text forKey:@"Address2"];
//        [mapData setObject:self.crs_referalCode.text forKey:@"refcode"];
//        [mapData setObject:self.crs_OtherCountriesIdNumber.text forKey:@"CusIdNumber"];
        [mapData setObject:@"IOS" forKey:@"device"];
//        [mapData setObject:self.crs_facebookField.text forKey:@"source"];
//
//        [mapData setObject:Gender forKey:@"gender"];
//        [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
        
        NSLog(@"%@",mapData);
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [[crs_sharedmethods sharedMySingleton].Ary_view_LoadingBg removeFromSuperview];
                
                NSLog(@"error %@",error);
                NSLog(@"data %@",data);
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@", json );
                
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerNumber = [json valueForKey:@"customerno"];
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId = [json valueForKey:@"user_id"];
                NSLog(@"%@", [json valueForKey:@"message"]);
                message = [json valueForKey:@"message"];
                if ([[json valueForKey:@"message"]isEqualToString:@"Success"]) {
                    OtppopupViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    OtppopupViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];;
                    viewController.otpvalue = [json valueForKey:@"OTP"];
                    viewController.ForOtp = self.crs_MobileNumber.text;
                    [Crs_sharedvariable sharedMySingleton].crs_Otp = [json valueForKey:@"OTP"];
                    
                    [self.navigationController pushViewController:viewController animated:YES];
                    
                    
                    //
                    //                    [self addChildViewController:MenuViewControllerOBJ];
                    //                    [MenuViewControllerOBJ didMoveToParentViewController:self];
                    //                    // MenuViewControllerOBJ.otpvalue=[json valueForKey:@"OTP"];
                    //
                    //                    MenuViewControllerOBJ.otpvalue= [json valueForKey:@"OTP"];
                    //                    MenuViewControllerOBJ.crsVerifiaction = @"Register";
                    //
                    //                    MenuViewControllerOBJ.mobileNumber = self.crs_MobileNumber.text;
                    //
                    //                    MenuViewControllerOBJ.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
                    //                    [self.view addSubview:MenuViewControllerOBJ.view];
                    //
                    
                    
                }
                else{
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                    
                }
                
                
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
        
        
        
        
    }
    
}


-(void)AUSTRIAValidation{
    
    self.crs_idNumberfield.hidden = YES;
     self.crs_OtherCountriesIdNumber.hidden = YES;
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    if ([self.crs_Country.text isEqualToString:@"Select Country"]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
//
//    else if ([self.crs_FirstName.text isEqualToString:@""])  {
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//    else if ([self.crs_LastName.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
    
    else if ([self.crs_EmailId.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
    
    else if (self.crs_MobileNumber.text.length <4)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    
    
//
//    else if ([self.crs_Nationality.text isEqualToString:@"Select Nationality"]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Nationality" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if ([self.crs_FirstName.text isEqualToString:@""])  {
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//    else if ([self.crs_LastName.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//

//    else if ([self.crs_DateOfBirth.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Date Of Birth should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//


    
    
    
    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    else if (self.crs_CreateMPIn.text.length <4)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    
//    else if ([self.Crs_Gender.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Pls Specify your Gender" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
    
    
    
    
    
    
    
    
    //    else if ([self.crs_County.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your County" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    
    
    
    
    
    
    
    
    
    
    
//
//    else if ([self.crs_Address.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//    else if ([self.crs_city.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//    else if ([self.crs_Adress.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter Post Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
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
//    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//    else if ([self.crs_confirmMpin.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Confirm your Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if (self.crs_CreateMPIn.text   != self.crs_confirmMpin.text)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Pin  Numbers  Should Be Same " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
//
//
//
//    else if (self.crs_CreateMPIn.text.length <4)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
//
//
//
//
//
    
   
    
    
    
    
    
    else if (![_crs_checkoutbutton1outlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    else if (![_crs_checkout2buttonoutlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    else {
        
        
        
        
        
        [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
        
        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            return ;
            
            
            
            
            
            
            
            
            
        }
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_NewRegister];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
//        [mapData setObject:self.crs_FirstName.text forKey:@"firstname"];
//
//        [mapData setObject:self.crs_LastName.text forKey:@"lastname"];
        
        [mapData setObject:self.crs_EmailId.text forKey:@"email"];
        
        [mapData setObject:self.crs_MobileNumber.text forKey:@"mobile"];
        
        [mapData setObject:self.crs_StdCodeFixedLabel.text forKey:@"countrycode"];
         [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
//       [mapData setObject:date1 forKey:@"dateofbirth"];
//
//        [mapData setObject:self.crs_Nationality.text forKey:@"Nationality"];
        [mapData setObject:self.crs_Country.text forKey:@"Country"];
//        [mapData setObject:self.crs_County.text forKey:@"middlename"];
//        [mapData setObject:self.crs_Address.text forKey:@"Address"];
//        [mapData setObject:self.crs_Adress.text forKey:@"Zipcode"];
//        [mapData setObject:self.crs_city.text forKey:@"city"];
//        [mapData setObject:self.crs_Address2.text forKey:@"Address2"];
//        [mapData setObject:self.crs_referalCode.text forKey:@"refcode"];
        [mapData setObject:@"IOS" forKey:@"device"];
//        [mapData setObject:self.crs_idNumberfield.text forKey:@"CusIdNumber"];
//        [mapData setObject:self.crs_facebookField.text forKey:@"source"];
//
//        [mapData setObject:Gender forKey:@"gender"];
//        [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
//
        NSLog(@"%@",mapData);
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [[crs_sharedmethods sharedMySingleton].Ary_view_LoadingBg removeFromSuperview];
                
                NSLog(@"error %@",error);
                NSLog(@"data %@",data);
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@", json );
                
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerNumber = [json valueForKey:@"customerno"];
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId = [json valueForKey:@"user_id"];
                NSLog(@"%@", [json valueForKey:@"message"]);
                message = [json valueForKey:@"message"];
                if ([[json valueForKey:@"message"]isEqualToString:@"Success"]) {
                    OtppopupViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    OtppopupViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];;
                    viewController.otpvalue = [json valueForKey:@"OTP"];
                    viewController.ForOtp = self.crs_MobileNumber.text;
                    [Crs_sharedvariable sharedMySingleton].crs_Otp = [json valueForKey:@"OTP"];
                    
                    [self.navigationController pushViewController:viewController animated:YES];
                    
                    
                    //
                    //                    [self addChildViewController:MenuViewControllerOBJ];
                    //                    [MenuViewControllerOBJ didMoveToParentViewController:self];
                    //                    // MenuViewControllerOBJ.otpvalue=[json valueForKey:@"OTP"];
                    //
                    //                    MenuViewControllerOBJ.otpvalue= [json valueForKey:@"OTP"];
                    //                    MenuViewControllerOBJ.crsVerifiaction = @"Register";
                    //
                    //                    MenuViewControllerOBJ.mobileNumber = self.crs_MobileNumber.text;
                    //
                    //                    MenuViewControllerOBJ.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
                    //                    [self.view addSubview:MenuViewControllerOBJ.view];
                    //
                    
                    
                }
                else{
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                    
                }
                
                
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
        
        
        
        
    }
    
}


-(void)BelgiumValidation{
    
    self.crs_idNumberfield.hidden = YES;
    self.crs_OtherCountriesIdNumber.hidden = YES;
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    if ([self.crs_Country.text isEqualToString:@"Select Country"]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
//    else if ([self.crs_FirstName.text isEqualToString:@""])  {
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//    else if ([self.crs_LastName.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
    
    else if ([self.crs_EmailId.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
    
    else if (self.crs_MobileNumber.text.length <9)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    
    
    
//    else if ([self.crs_Nationality.text isEqualToString:@"Select Nationality"]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Nationality" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if ([self.crs_FirstName.text isEqualToString:@""])  {
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//    else if ([self.crs_LastName.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if ([self.crs_DateOfBirth.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Date Of Birth should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }


    
    
    
    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    else if (self.crs_CreateMPIn.text.length <4)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
//    
//    
//    else if ([self.Crs_Gender.text isEqualToString:@""]){
//        
//        
//        
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Pls Specify your Gender" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        
//        [alert show];
//        
//    }
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
//    //    else if ([self.crs_County.text isEqualToString:@""]){
//    //
//    //
//    //
//    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your County" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//    //
//    //        [alert show];
//    //
//    //    }
//    //
//    //
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
//    else if ([self.crs_Address.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//    else if ([self.crs_city.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//    else if ([self.crs_Adress.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter Post Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
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
//    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//    else if ([self.crs_confirmMpin.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Confirm your Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if (self.crs_CreateMPIn.text   != self.crs_confirmMpin.text)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Pin  Numbers  Should Be Same " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
//
//
//
//    else if (self.crs_CreateMPIn.text.length <4)
//
//
//    {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//
//
//
//
//    }
//
    
    
    
    
    
    
    
    
    
    
    
    else if (![_crs_checkoutbutton1outlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    else if (![_crs_checkout2buttonoutlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    else {
        
        
        
        
        
        [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
        
        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            return ;
            
            
            
            
            
            
            
            
            
        }
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_NewRegister];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
//        [mapData setObject:self.crs_FirstName.text forKey:@"firstname"];
//
//        [mapData setObject:self.crs_LastName.text forKey:@"lastname"];
        
        [mapData setObject:self.crs_EmailId.text forKey:@"email"];
        
        [mapData setObject:self.crs_MobileNumber.text forKey:@"mobile"];
        
        [mapData setObject:self.crs_StdCodeFixedLabel.text forKey:@"countrycode"];
         [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
//        [mapData setObject:date1 forKey:@"dateofbirth"];
//
//        [mapData setObject:self.crs_Nationality.text forKey:@"Nationality"];
        [mapData setObject:self.crs_Country.text forKey:@"Country"];
//        [mapData setObject:self.crs_County.text forKey:@"middlename"];
//        [mapData setObject:self.crs_Address.text forKey:@"Address"];
//        [mapData setObject:self.crs_Adress.text forKey:@"Zipcode"];
//        [mapData setObject:self.crs_city.text forKey:@"city"];
//        [mapData setObject:self.crs_Address2.text forKey:@"Address2"];
//        [mapData setObject:self.crs_referalCode.text forKey:@"refcode"];
        [mapData setObject:@"IOS" forKey:@"device"];
//        [mapData setObject:self.crs_idNumberfield.text forKey:@"CusIdNumber"];
//        [mapData setObject:self.crs_facebookField.text forKey:@"source"];
//
//        [mapData setObject:Gender forKey:@"gender"];
//        [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
        
        NSLog(@"%@",mapData);
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [[crs_sharedmethods sharedMySingleton].Ary_view_LoadingBg removeFromSuperview];
                
                NSLog(@"error %@",error);
                NSLog(@"data %@",data);
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@", json );
                
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerNumber = [json valueForKey:@"customerno"];
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId = [json valueForKey:@"user_id"];
                NSLog(@"%@", [json valueForKey:@"message"]);
                message = [json valueForKey:@"message"];
                if ([[json valueForKey:@"message"]isEqualToString:@"Success"]) {
                    
                    
            OtppopupViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    OtppopupViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];;
                    viewController.otpvalue = [json valueForKey:@"OTP"];
                    viewController.ForOtp = self.crs_MobileNumber.text;
                    [Crs_sharedvariable sharedMySingleton].crs_Otp = [json valueForKey:@"OTP"];
                    
                    [self.navigationController pushViewController:viewController animated:YES];
                    
                    
                    //
                    //                    [self addChildViewController:MenuViewControllerOBJ];
                    //                    [MenuViewControllerOBJ didMoveToParentViewController:self];
                    //                    // MenuViewControllerOBJ.otpvalue=[json valueForKey:@"OTP"];
                    //
                    //                    MenuViewControllerOBJ.otpvalue= [json valueForKey:@"OTP"];
                    //                    MenuViewControllerOBJ.crsVerifiaction = @"Register";
                    //
                    //                    MenuViewControllerOBJ.mobileNumber = self.crs_MobileNumber.text;
                    //
                    //                    MenuViewControllerOBJ.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
                    //                    [self.view addSubview:MenuViewControllerOBJ.view];
                    //
                    
                    
                }
                else{
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                    
                }
                
                
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
        
        
        
        
    }
    
}












-(void) empty {
    
    if ([self.crs_Adress.text isEqualToString:@""]) {
        
//        self.crs_Address2.text = @"";
//        self.crs_Address.text = @"";
//        self.crs_city.text = @"";
        
    }
    
    
    
    
}



//- (void)textFieldDidBeginEditing:(UITextField *)textField {
//    textField.placeholder = textField.text;
//    textField.text = @"";
//}
//
//- (void)textFieldDidEndEditing:(UITextField *)textField {
//    if (textField.text.length == 0) {
//        textField.text = textField.placeholder;
//    }
//    textField.placeholder = @"";
//}

-(void)viewWillAppear:(BOOL)animated
{
    
    
//    
//    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
//    [tracker set:kGAIScreenName value:@"Register  View controller"];
//    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
}




- (IBAction)crs_facebookAction:(id)sender {
    [self.view removeGestureRecognizer:tap];
    NationalityName = @"Facebook";
     self.crs_CountryView.hidden = NO;
     [self.crs_CountryTable reloadData];
}
- (IBAction)crs_CheckoutButton1:(id)sender {
    
    
    
    if ([check1 isEqualToString:@"Checkout"]) {
         [_crs_checkoutbutton1outlet setSelected:YES];
        check1 = @"checkin";
        
        
    }
    else{
        
        [_crs_checkoutbutton1outlet setSelected:NO];
        check1 = @"Checkout";
    }
    }
 

    

- (IBAction)crs_checkout2button:(id)sender {
    
    
    
    if ([check2 isEqualToString:@"Checkout"]) {
        [_crs_checkout2buttonoutlet setSelected:YES];
        check2 = @"checkin";
        
        
    }
    else{
        
        [_crs_checkout2buttonoutlet setSelected:NO];
        check2 = @"Checkout";
    }
}


- (IBAction)Crs_SecondContentButton:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
   PrivacyPolicyViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"PrivacyViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    
}
#pragma mark -Searchmethod

-(void)textFieldDidChanges:(UITextField *)textField
{
    self.searchTextString=textField.text;
   if ([NationalityName isEqualToString:@"country"])
   {
       [self updateSearchArray:self.searchTextString];
       
   }
   else if ([NationalityName isEqualToString:@"PostalCode"]){
       
       
       [self updateSearchArraypostalcode:self.searchTextString];
   }
    
   
   else if ([NationalityName isEqualToString:@"nationality"]){
       
       
       [self nation:self.searchTextString];
   }
    
    
}

-(void)updateSearchArray:(NSString *)searchText
{
    searchArray = [NSMutableArray new];

    if(searchText.length==0)
    {
        isFiltered=NO;
        searchArray = crs_countrylist;
        NSLog(@"%@",searchArray);
        [self.crs_CountryTable reloadData ];
    }
    else
    {
        isFiltered=YES;

        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in crs_countrylist){
            NSString * string=[dic valueForKey:@"country_name"];

            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){

                // NSString * Ary_id=[dic valueForKey:@"id"];

                [searchArray addObject:dic];

                NSLog(@"search %@",searchArray);

                if (!searchArray|| !searchArray.count||searchArray==nil) {
                    self.Crs_HiddenLabel.hidden = NO;
        
                    
                }
                
            }
        }



        /// historyArray = searchArray;
        [self.crs_CountryTable reloadData ];


    }



}
-(void)updateSearchArraypostalcode:(NSString *)searchText
{
    searchArray = [NSMutableArray new];
    
    if(searchText.length==0)
    {
        isFiltered=NO;
        searchArray = postalCompressingArray;
        NSLog(@"%@",searchArray);
        [self.crs_CountryTable reloadData ];
    }
    else
    {
        isFiltered=YES;
        
        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in postalCompressingArray){
            NSString * string=[dic valueForKey:@"addressline1"];
            
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                
                // NSString * Ary_id=[dic valueForKey:@"id"];
                
                [searchArray addObject:dic];
                
                NSLog(@"search %@",searchArray);
                
            }
        }
        
        
        
        /// historyArray = searchArray;
        [self.crs_CountryTable reloadData ];
        
        
    }
    
    
    
}
-(void)nation:(NSString *)searchText
{
    searchArray = [NSMutableArray new];
    
    if(searchText.length==0)
    {
        isFiltered=NO;
        searchArray = NationalityArray;
        NSLog(@"%@",searchArray);
        [self.crs_CountryTable reloadData ];
    }
    else
    {
        isFiltered=YES;
        
        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in NationalityArray){
            NSString * string=[dic valueForKey:@"nationality"];
            
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                
                // NSString * Ary_id=[dic valueForKey:@"id"];
                
                [searchArray addObject:dic];
                
                NSLog(@"search %@",searchArray);
                
            }
        }
        
        
        
        /// historyArray = searchArray;
        [self.crs_CountryTable reloadData ];
        
        
    }
    
    
    
}


    

- (IBAction)crs_Cancel:(id)sender {
    self.crs_CountryView.hidden  = YES;
}
- (IBAction)crs_nation:(id)sender {
}
- (IBAction)crs_OkOtp:(id)sender {
    
}
- (IBAction)TermsButton:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    PrivacyPolicyViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"PrivacyViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

-(void)UsValidation{
    
    self.crs_idNumberfield.hidden = YES;
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    if ([self.crs_Country.text isEqualToString:@"Select Country"]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    //
    //    else if ([self.crs_FirstName.text isEqualToString:@""])  {
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //    else if ([self.crs_LastName.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    //
    else if ([self.crs_EmailId.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
    
    else if (self.crs_MobileNumber.text.length <10)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"00000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"0000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"00000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"000000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"0000000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"1111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"11111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"111111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"1111111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"22222222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    } else if ([self.crs_MobileNumber.text isEqualToString:@"2222222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"2222222222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"3333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"33333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"33333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"3333333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"4444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"44444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"444444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"4444444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"5555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"55555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"555555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"5555555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"6666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"66666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"666666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"6666666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"7777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"77777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"77777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"7777777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"8888888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"88888888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"8888888888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"9999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"99999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"99999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"9999999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    //    else if ([self.crs_Nationality.text isEqualToString:@"Select Nationality"]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Nationality" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    
    
    
    
    
    
    
    //
    //    else if ([self.crs_DateOfBirth.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Date Of Birth should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    
    
    
    
    
    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
    else if (self.crs_CreateMPIn.text.length <4)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    //
    //
    //    else if ([self.Crs_Gender.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Pls Specify your Gender" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    
    
    
    
    
    
    
    
    
    //    else if ([self.crs_County.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your County" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
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
    //    else if ([self.crs_Address.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    //
    //
    //    else if ([self.crs_city.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    //
    //    else if ([self.crs_Adress.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter Post Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
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
    //    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    //    else if ([self.crs_confirmMpin.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Confirm your Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    //
    //
    //
    //    else if (self.crs_CreateMPIn.text   != self.crs_confirmMpin.text)
    //
    //
    //    {
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Pin  Numbers  Should Be Same " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //
    //
    //
    //
    //    }
    //
    //
    //
    //    else if (self.crs_CreateMPIn.text.length <4)
    //
    //
    //    {
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //
    //
    //
    //
    //    }
    //
    
    else if (![_crs_checkoutbutton1outlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    else if (![_crs_checkout2buttonoutlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    else {
        
        
        
        
        
        [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
        
        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            return ;
            
            
            
            
            
            
            
            
            
        }
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_NewRegister];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
        //[mapData setObject:self.crs_FirstName.text forKey:@"firstname"];
        
        //[mapData setObject:self.crs_LastName.text forKey:@"lastname"];
        
        [mapData setObject:self.crs_EmailId.text forKey:@"email"];
        
        [mapData setObject:self.crs_MobileNumber.text forKey:@"mobile"];
        
        [mapData setObject:self.crs_StdCodeFixedLabel.text forKey:@"countrycode"];
        [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
        
        //[mapData setObject:date1 forKey:@"dateofbirth"];
        
        // [mapData setObject:self.crs_Nationality.text forKey:@"Nationality"];
        [mapData setObject:self.crs_Country.text forKey:@"Country"];
        // [mapData setObject:self.crs_County.text forKey:@"middlename"];
        //        [mapData setObject:self.crs_Address.text forKey:@"Address"];
        //        [mapData setObject:self.crs_Adress.text forKey:@"Zipcode"];
        //        [mapData setObject:self.crs_city.text forKey:@"city"];
        //        [mapData setObject:self.crs_Address2.text forKey:@"Address2"];
        //[mapData setObject:self.crs_referalCode.text forKey:@"refcode"];
        [mapData setObject:@"IOS" forKey:@"device"];
        // [mapData setObject:self.crs_facebookField.text forKey:@"source"];
        
        //        [mapData setObject:Gender forKey:@"gender"];
        //        [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
        
        
        ;
        
        NSLog(@"%@",mapData);
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [[crs_sharedmethods sharedMySingleton].Ary_view_LoadingBg removeFromSuperview];
                
                NSLog(@"error %@",error);
                NSLog(@"data %@",data);
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@", json );
                
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerNumber = [json valueForKey:@"customerno"];
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId = [json valueForKey:@"user_id"];
                
                NSLog(@"%@", [json valueForKey:@"message"]);
                message = [json valueForKey:@"message"];
                if ([[json valueForKey:@"message"]isEqualToString:@"Success"]) {
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    OtppopupViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    OtppopupViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];;
                    viewController.otpvalue = [json valueForKey:@"OTP"];
                    viewController.ForOtp = self.crs_MobileNumber.text;
                    [Crs_sharedvariable sharedMySingleton].crs_Otp = [json valueForKey:@"OTP"];
                    
                    [self.navigationController pushViewController:viewController animated:YES];
                    
                }
                
                
                
                else{
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                    
                }
                
                
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
        
        
        
        
    }
    
}


-(void)HongKongValidation{
    
    self.crs_idNumberfield.hidden = YES;
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    if ([self.crs_Country.text isEqualToString:@"Select Country"]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    //
    //    else if ([self.crs_FirstName.text isEqualToString:@""])  {
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //    else if ([self.crs_LastName.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    //
    else if ([self.crs_EmailId.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
    
    else if (self.crs_MobileNumber.text.length <8)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"00000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"0000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"00000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"000000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"0000000000000"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"1111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"11111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"111111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"1111111111111"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"22222222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    } else if ([self.crs_MobileNumber.text isEqualToString:@"2222222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"2222222222222"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"3333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"33333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"33333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"3333333333333"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"4444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"44444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"444444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"4444444444444"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"5555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"55555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"555555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"5555555555555"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"6666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"66666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"666666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"6666666666666"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
        
        
    }
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@"7777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"77777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"77777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"7777777777777"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"8888888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"88888888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"8888888888888"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"9999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"99999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"99999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    else if ([self.crs_MobileNumber.text isEqualToString:@"9999999999999"])
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    //    else if ([self.crs_Nationality.text isEqualToString:@"Select Nationality"]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Nationality" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    
    
    
    
    
    
    
    //
    //    else if ([self.crs_DateOfBirth.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Date Of Birth should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    
    
    
    
    
    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    
    else if (self.crs_CreateMPIn.text.length <4)
        
        
    {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
        
    }
    
    //
    //
    //    else if ([self.Crs_Gender.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Pls Specify your Gender" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    
    
    
    
    
    
    
    
    
    //    else if ([self.crs_County.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your County" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
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
    //    else if ([self.crs_Address.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter  Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    //
    //
    //    else if ([self.crs_city.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    //
    //    else if ([self.crs_Adress.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter Post Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
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
    //    else if ([self.crs_CreateMPIn.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please  Enter  Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    //    else if ([self.crs_confirmMpin.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Confirm your Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //
    //
    //
    //
    //    else if (self.crs_CreateMPIn.text   != self.crs_confirmMpin.text)
    //
    //
    //    {
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Pin  Numbers  Should Be Same " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //
    //
    //
    //
    //    }
    //
    //
    //
    //    else if (self.crs_CreateMPIn.text.length <4)
    //
    //
    //    {
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Enter Valid Pin Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //
    //
    //
    //
    //    }
    //
    
    else if (![_crs_checkoutbutton1outlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    else if (![_crs_checkout2buttonoutlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"  Please accept the statements to proceed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    else {
        
        
        
        
        
        [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
        
        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            return ;
            
            
            
            
            
            
            
            
            
        }
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_NewRegister];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
        //[mapData setObject:self.crs_FirstName.text forKey:@"firstname"];
        
        //[mapData setObject:self.crs_LastName.text forKey:@"lastname"];
        
        [mapData setObject:self.crs_EmailId.text forKey:@"email"];
        
        [mapData setObject:self.crs_MobileNumber.text forKey:@"mobile"];
        
        [mapData setObject:self.crs_StdCodeFixedLabel.text forKey:@"countrycode"];
        [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
        
        //[mapData setObject:date1 forKey:@"dateofbirth"];
        
        // [mapData setObject:self.crs_Nationality.text forKey:@"Nationality"];
        [mapData setObject:self.crs_Country.text forKey:@"Country"];
        // [mapData setObject:self.crs_County.text forKey:@"middlename"];
        //        [mapData setObject:self.crs_Address.text forKey:@"Address"];
        //        [mapData setObject:self.crs_Adress.text forKey:@"Zipcode"];
        //        [mapData setObject:self.crs_city.text forKey:@"city"];
        //        [mapData setObject:self.crs_Address2.text forKey:@"Address2"];
        //[mapData setObject:self.crs_referalCode.text forKey:@"refcode"];
        [mapData setObject:@"IOS" forKey:@"device"];
        // [mapData setObject:self.crs_facebookField.text forKey:@"source"];
        
        //        [mapData setObject:Gender forKey:@"gender"];
        //        [mapData setObject:self.crs_CreateMPIn.text forKey:@"password"];
        
        
        ;
        
        NSLog(@"%@",mapData);
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [[crs_sharedmethods sharedMySingleton].Ary_view_LoadingBg removeFromSuperview];
                
                NSLog(@"error %@",error);
                NSLog(@"data %@",data);
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"%@", json );
                
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerNumber = [json valueForKey:@"customerno"];
                [Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId = [json valueForKey:@"user_id"];
                
                NSLog(@"%@", [json valueForKey:@"message"]);
                message = [json valueForKey:@"message"];
                if ([[json valueForKey:@"message"]isEqualToString:@"Success"]) {
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    OtppopupViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    OtppopupViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"otppopupViewControllerSID"];;
                    viewController.otpvalue = [json valueForKey:@"OTP"];
                    viewController.ForOtp = self.crs_MobileNumber.text;
                    [Crs_sharedvariable sharedMySingleton].crs_Otp = [json valueForKey:@"OTP"];
                    
                    [self.navigationController pushViewController:viewController animated:YES];
                    
                }
                
                
                
                else{
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                    
                }
                
                
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
        
        
        
        
    }
    
}
@end


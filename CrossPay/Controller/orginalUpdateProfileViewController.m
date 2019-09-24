////
////  orginalUpdateProfileViewController.m
////  CrossPay
////
////  Created by sai kiran  on 8/12/17.
////  Copyright © 2017 CrossPay. All rights reserved.
////
//
//#import "orginalUpdateProfileViewController.h"
//#import "Crs_sharedvariable.h"
//#import "orginalUpdateProfileViewController.h"
//#import "profileViewController.h"
//#import "HomeViewController.h"
//#import "HistoryViewController.h"
//#import "notificationViewController.h"
//#import "SettingsViewController.h"
//#import "UpdateProfile.h"
//#import "MBProgressHUD.h"
//#import "crs_sharedmethods.h"
//#import "GlobalUrlsFile.h"
////#import <Google/Analytics.h>
//@interface orginalUpdateProfileViewController ()
//{
//
//    NSString * gender ;
//
//
//
////    NSMutableArray * idProofTypeArray;
//
//
//
//}
//@end
//
//@implementation orginalUpdateProfileViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//
//    self.crs_UpdateProfileScrollView.contentSize = CGSizeMake(self.view.frame.size.width-30, 1350
//
//
//                                                              );
//    gender = @"male";
//
//    //idProofTypeArray = [NSMutableArray arrayWithObjects:@"Passport",@"Driving License", nil];
//
//
//
//
//
//
//    UITapGestureRecognizer * tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
//
//    [self.view addGestureRecognizer:tap];
//
//
//
//
//
//    NSString * first_lastname=[NSString stringWithFormat:@"%@ %@ %@",[self.crs_ProfileDetails valueForKey:@"first_name"],[self.crs_ProfileDetails valueForKey:@"middle_name"],[self.crs_ProfileDetails valueForKey:@"last_name"]];
//
//
//
//
//
//
//
//
//        [self datePick];
//
//
//
//
//
//
////
////
////    self.crs_CountryField.textColor = [UIColor whiteColor];
////    self.crs_FirstNameField.textColor = [UIColor whiteColor];
////    self.crs_MiddleNameField.textColor = [UIColor whiteColor];
////    self.crs_LastName.textColor = [UIColor whiteColor];
////    self.crs_Std.textColor = [UIColor whiteColor];
////    self.crs_PhoneNumber.textColor = [UIColor whiteColor];
////    self.crs_State.textColor = [UIColor whiteColor];
////    self.crs_Adress2.textColor = [UIColor whiteColor];
////    self.crs_Adtess1.textColor = [UIColor whiteColor];
////    self.crs_emailId.textColor = [UIColor whiteColor];
////    self.crs_IssuedBy.textColor = [UIColor whiteColor];
////    self.crs_IdProfType.textColor = [UIColor whiteColor];
////    self.crs_DateOfBirth.textColor = [UIColor whiteColor];
////    self.crs_Nationality.textColor = [UIColor whiteColor];
////    self.crs_MobileNumber.textColor = [UIColor whiteColor];
////    self.crs_CityField.textColor = [UIColor whiteColor];
////    self.crs_PinCodeField.textColor = [UIColor whiteColor];
////    self.crs_ExpieredDate.textColor = [UIColor whiteColor];
////
////
//
//
//
//
//
//
//        //{"firstname":"manish", "lastname":"rai","email":"manish992@gmail.com", "mobile":"8801846074", "countrycode":"91", "dateofbirth":"11-08-1992", "gender":"male", "password":"1234", "user_id":"8", "id_proof_type":"driving license", "issued_by":"gov", "issued_date":"12-02-2011", "expiry_date":"12-12-2030", "phone":"5263562", "address1":"sadasd", "address":"sdasd", "city":"dsads", "state":"sdsadsdasdasd", "pincode":"500098", "nationality":"indian", "country":"india" }
////
////    self.crs_FirstNameField.text   =  [ _crs_ProfileDetails valueForKey:@"first_name"];
////    self.crs_LastName.text        =  [ _crs_ProfileDetails    valueForKey:@"last_name"];
////    self.crs_MiddleNameField.text  =  [ _crs_ProfileDetails    valueForKey:@"middle_name"];
////    self.crs_DateOfBirth.text     =   [ _crs_ProfileDetails    valueForKey:@"dob"];
////    self.crs_Std.text           =    [ _crs_ProfileDetails    valueForKey: @"countrycode"];
////    self.crs_State.text         =    [ _crs_ProfileDetails    valueForKey:@"state"];
////    self.crs_emailId.text       =     [ _crs_ProfileDetails    valueForKey:@"email"];
////    self.crs_MobileNumber.text  =     [ _crs_ProfileDetails    valueForKey:@"mobile"];
////    self.crs_PhoneNumber.text   = [ _crs_ProfileDetails    valueForKey:@"phone_num"];
////    self.crs_Adtess1.text      = [ _crs_ProfileDetails    valueForKey:@"address1"];
////    self.crs_Adress2.text     =  [ _crs_ProfileDetails    valueForKey:@"address2"];
////    self.crs_IssuedBy.text    =  [ _crs_ProfileDetails    valueForKey:@"issued_by"];
////    self.crs_IdProfType.text  =   [ _crs_ProfileDetails    valueForKey:@"id_proof_type"];
////    self.crs_IssuedDate.text  =   [ _crs_ProfileDetails    valueForKey:@"issued_date"];
////    self.crs_CityField.text   =   [ _crs_ProfileDetails    valueForKey:@"city"];
////    self.crs_Nationality.text =  [ _crs_ProfileDetails    valueForKey:@"nationality"];
////    self.crs_ExpieredDate.text = [ _crs_ProfileDetails    valueForKey:@"expiry_date"];
////    self.crs_CountryField.text = [ _crs_ProfileDetails    valueForKey:@"country"];
////    self.crs_PinCodeField.text = [ _crs_ProfileDetails    valueForKey:@"pincode"];
////
////
////
////    self.crs_CountryField.text = @"UNITED KINGDOM";
////
////    self.crs_Std.text = @"+44";
////
////
////    self.crs_EmailId.text = [self.crs_ProfileDetails valueForKey:@"email"];
////
////
////    NSString * fullName = [NSString stringWithFormat:@"%@ %@  ",[_crs_ProfileDetails valueForKey:@"first_name"],[_crs_ProfileDetails valueForKey:@"last_name"]];
////
////    self.crs_CallNameLabel.text = fullName;
////
////
////
//    if ([[self.crs_ProfileDetails valueForKey:@"gender"]isEqualToString:@ "male"]) {
//
//        gender = @"male";
//
//
//        [self.crs_MaleClick setSelected:NO];
//        [self.crs_FemaleClick setSelected:NO];
//
//    }
//
//    else{
//
//
//
//
//        gender = @"female";
//        [self.crs_MaleClick setSelected:YES];
//        [self.crs_FemaleClick setSelected:YES];
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
//    self.crs_CountryField.textColor = [UIColor whiteColor];
//    self.crs_FirstNameField.textColor = [UIColor whiteColor];
//    self.crs_MiddleNameField.textColor = [UIColor whiteColor];
//    self.crs_LastName.textColor = [UIColor whiteColor];
//    self.crs_PinCodeField.textColor = [UIColor whiteColor];
//    self.crs_emailId.textColor = [UIColor whiteColor];
//    self.crs_DateOfBirth.textColor = [UIColor whiteColor];
//    self.crs_Std.textColor = [UIColor whiteColor];
//    self.crs_Nationality.textColor = [UIColor whiteColor];
//    self.crs_CityField.textColor = [UIColor whiteColor];
//    self.crs_State.textColor = [UIColor whiteColor];
//    self.crs_Adtess1.textColor = [UIColor whiteColor];
//    self.crs_IssuedDate.textColor = [UIColor whiteColor];
//    self.crs_IssuedBy.textColor =[UIColor whiteColor];
//    self.crs_Adress2.textColor =[UIColor whiteColor];
//    self.crs_Mpin.textColor =[UIColor whiteColor];
//    self.crs_IdProfType.textColor =[UIColor whiteColor];
//    self.crs_MobileNumber.textColor = [UIColor whiteColor];
//    self.crs_PhoneNumber.textColor = [UIColor whiteColor];
//    self.crs_ExpieredDate.textColor = [UIColor whiteColor];
//
//}
//
//
//
//
//
//-(void)viewWillAppear:(BOOL)animated
//{
////
////    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
////    [tracker set:kGAIScreenName value:@"Terms and Conditions View controller"];
////    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
////
////
//    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"If any Update is Reqiured Please Reach us at info@crosspayments.com" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//    [alert show];
//
//
//
//
//
//}
//
//
//
//
//-(void) dismissKeyboard { [self.crs_FirstNameField resignFirstResponder];
//    [self.crs_LastName resignFirstResponder]; [self.crs_EmailId resignFirstResponder]  ;
//
//    [self.crs_PinCodeField resignFirstResponder];
//
//    [self.crs_PhoneNumber resignFirstResponder];
//
//
//    [self.crs_MobileNumber resignFirstResponder];
//
//
//    [self.crs_DateOfBirth resignFirstResponder];
//
//    [self.crs_State resignFirstResponder];
//
//    [self.crs_CityField resignFirstResponder];
//
//    [self.crs_Nationality resignFirstResponder];
//
//    [self.crs_Adtess1 resignFirstResponder];
//
//    [self.crs_Adress2 resignFirstResponder];
//
//}
//
//
//
//-(void)textFieldDidBeginEditing:(UITextField *)textField {
//    if (textField == _crs_PinCodeField) {
//
//
//
//
//
//
//        CGPoint scrollPoint = CGPointMake(0,0);
//        [  self.crs_UpdateProfileScrollView setContentOffset:scrollPoint animated:YES];
//
//
//
//    }
//
//
//
//
//    else if  (textField == _crs_FirstNameField) {
//
//
//
//
//
//
//        CGPoint scrollPoint = CGPointMake(0,30);
//        [  self.crs_UpdateProfileScrollView setContentOffset:scrollPoint animated:YES];
//
//
//
//    }
//
//
//    else if  (textField == _crs_MiddleNameField) {
//
//
//
//
//
//
//        CGPoint scrollPoint = CGPointMake(0,60);
//        [  self.crs_UpdateProfileScrollView setContentOffset:scrollPoint animated:YES];
//
//
//
//    }
//
//
//    else if  (textField == _crs_LastName) {
//
//
//
//
//
//
//        CGPoint scrollPoint = CGPointMake(0,90);
//        [  self.crs_UpdateProfileScrollView setContentOffset:scrollPoint animated:YES];
//
//
//
//    }
//
//
//    else if  (textField == _crs_EmailId) {
//
//
//
//
//
//
//        CGPoint scrollPoint = CGPointMake(0,120);
//        [  self.crs_UpdateProfileScrollView setContentOffset:scrollPoint animated:YES];
//
//
//
//    }
//
//
//    else if  (textField == _crs_PhoneNumber) {
//
//
//
//
//
//
//        CGPoint scrollPoint = CGPointMake(0,150);
//        [  self.crs_UpdateProfileScrollView setContentOffset:scrollPoint animated:YES];
//
//
//
//    }
//
//
//    else if  (textField == _crs_MobileNumber) {
//
//
//
//
//
//
//        CGPoint scrollPoint = CGPointMake(0,180);
//        [  self.crs_UpdateProfileScrollView setContentOffset:scrollPoint animated:YES];
//
//
//
//    }
//
//
//
//    else if  (textField == _crs_DateOfBirth) {
//
//
//
//
//
//
//        CGPoint scrollPoint = CGPointMake(0,210);
//        [  self.crs_UpdateProfileScrollView setContentOffset:scrollPoint animated:YES];
//
//
//
//    }
//
//
//
//    else if  (textField == _crs_State) {
//
//
//
//
//
//
//        CGPoint scrollPoint = CGPointMake(0,240);
//        [  self.crs_UpdateProfileScrollView setContentOffset:scrollPoint animated:YES];
//
//
//
//    }
//
//
//    else if  (textField == _crs_CityField) {
//
//
//
//
//
//
//        CGPoint scrollPoint = CGPointMake(0,240);
//        [  self.crs_UpdateProfileScrollView setContentOffset:scrollPoint animated:YES];
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
//    else if  (textField == _crs_Nationality) {
//
//
//
//
//
//
//        CGPoint scrollPoint = CGPointMake(0,270);
//        [  self.crs_UpdateProfileScrollView setContentOffset:scrollPoint animated:YES];
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
//    else if (textField == _crs_Adtess1)
//    {
//
//        CGPoint scrollPoint = CGPointMake(0,330);
//        [  self.crs_UpdateProfileScrollView setContentOffset:scrollPoint animated:YES];
//
//
//
//    }
//
//
//
//
//    else if (textField == _crs_Adress2)
//    {
//
//        CGPoint scrollPoint = CGPointMake(0,580);
//        [  self.crs_UpdateProfileScrollView setContentOffset:scrollPoint animated:YES];
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
//    //
//    //    else{
//    //    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
//    //    [  self.scrollForContent setContentOffset:scrollPoint animated:YES];
//    //
//    //
//    //    }
//
//}
//
//-(void) textFieldDidEndEditing:(UITextField *)textField { [self.crs_UpdateProfileScrollView setContentOffset:CGPointZero animated:YES];
//
//
//
//
//}
//
//
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//- (IBAction)crs_MaleAction:(id)sender {
//
//    gender = @"male";
//
//    [self.crs_MaleClick setSelected:NO];
//    [self.crs_FemaleClick setSelected:NO];
//
//
//
//}
//
//- (IBAction)crs_FemaleAction:(id)sender {
//    gender = @"female";
//    [self.crs_MaleClick setSelected:YES];
//    [self.crs_FemaleClick setSelected:YES];
//
//
//
//}
//- (IBAction)crs_BackAction:(id)sender {
//}
//- (IBAction)crs_Update:(id)sender {
//
//
//
//    if ([self.crs_PinCodeField.text isEqualToString:@""])  {
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Post Code Name should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//    else if ([self.crs_FirstNameField.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"First Name should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
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
//    else if ([self.crs_LastName.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Last Name should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//    else if ([self.crs_emailId.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"EmailId should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//    else if ([self.crs_PhoneNumber.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Phone Number should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//    else if ([self.crs_MobileNumber.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Mobile Number should Not Be Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//    else if ([self.crs_State.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your County" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//    else if ([self.crs_CityField.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Yoyur City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//    else if ([self.crs_Nationality.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please select Your Nationality" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//    }
//
//
//
//
//
//    else if ([self.crs_Adtess1.text isEqualToString:@""]){
//
//
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Pls Enter Your Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
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
//    else{
//
//
//        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
//
//            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Pls Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//            [alert show];
//
//            return ;
//
//        }
//
//
//
//[MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    NSError *error;
//
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
//    NSURL *url = [NSURL URLWithString:Crosspay_UpdateProfile];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
//                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                                       timeoutInterval:60.0];
//
//    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
//
//    [request setHTTPMethod:@"POST"];
//    NSMutableDictionary * mapData=[NSMutableDictionary new];
//
//
//    //{"firstname":"manish", "lastname":"rai","email":"manish992@gmail.com", "mobile":"8801846074", "countrycode":"91", "dateofbirth":"11-08-1992", "gender":"male", "password":"1234", "user_id":"8", "id_proof_type":"driving license", "issued_by":"gov", "issued_date":"12-02-2011", "expiry_date":"12-12-2030", "phone":"5263562", "address1":"sadasd", "address":"sdasd", "city":"dsads", "state":"sdsadsdasdasd", "pincode":"500098", "nationality":"indian", "country":"india" }
//
//    // rember userId and Gender
//
//
//    [mapData setObject:self.crs_FirstNameField.text forKey:@"firstname"];
//    [mapData setObject:self.crs_LastName.text forKey:@"lastname"];
//    [mapData setObject:self.crs_emailId.text forKey:@"email"];
//    [mapData setObject:self.crs_MobileNumber.text forKey:@"mobile"];
//    [mapData setObject:self.crs_Std.text forKey:@"countrycode"];
//    [mapData setObject:self.crs_DateOfBirth.text forKey:@"dateofbirth"];
//    [mapData setObject:@"1234"  forKey:@"password"];
//    [mapData setObject:@"passport"  forKey:@"id_proof_type"];
//    [mapData setObject:@"gov"  forKey:@"issued_by"];
//    [mapData setObject:@"21-01-1991"  forKey:@"issued_date"];
//    [mapData setObject:@"21-10-1991" forKey:@"expiry_date"];
//    [mapData setObject:self.crs_PhoneNumber.text forKey:@"phone"];
//    [mapData setObject:self.crs_Adtess1.text forKey:@"address1"];
//    [mapData setObject:self.crs_Adress2.text forKey:@"address"];
//    [mapData setObject:self.crs_CityField.text forKey:@"city"];
//    [mapData setObject:self.crs_State.text forKey:@"state"];
//    [mapData setObject:self.crs_PinCodeField.text forKey:@"pincode"];
//    [mapData setObject:self.crs_Nationality.text forKey:@"nationality"];
//    [mapData setObject:self.crs_CountryField.text forKey:@"country"];
//    [mapData setObject:gender forKey:@"gender"];
//    [mapData setObject:self.crs_MiddleNameField.text forKey:@"middle_name"];
//    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
//            [mapData setObject:@"City" forKey:@"city"];
//                   [mapData setObject:@"state" forKey:@"state"];
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
//
//
//    // [mapData setObject: forKey:@"gender"];
//
//
//    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
//    [request setHTTPBody:postData];
//
//
//    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//            NSLog(@"error %@",error);
//            NSLog(@"data %@",data);
//            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//            NSLog(@"%@", json );
//
//            NSLog(@"%@", [json valueForKey:@"message"]);
//            //message = [json valueForKey:@"message"];
//            if ([[json valueForKey:@"status"]isEqualToString:@"200"])
//
//
//        {
//
//            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message :[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//                                [alert show];
//
//
//
//
//
//
//
//            }
//            else{
//
//
//
//
//            }
//
//
//
//        });
//
//
//
//
//    }];
//
//    [postDataTask resume];
//
//
//
//
//}
//
//
//}
//
//- (IBAction)Back_Action:(id)sender {
//
//    [self.navigationController popViewControllerAnimated:YES];
//}
//
//
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self.view endEditing:YES];// this will do the trick
//}
//
//
//-(BOOL) textFieldShouldReturn: (UITextField *) textField
//{
//    [textField resignFirstResponder];
//
//    return YES;
//}
//
//
//
//-(void)datePick{
//
//    datePicker=[[UIDatePicker alloc]init];
//    datePicker.datePickerMode=UIDatePickerModeDate;
//    [self.crs_DateOfBirth setInputView:datePicker];
//    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
//    [toolBar setTintColor:[UIColor grayColor]];
//    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(ShowSelectedDate)];
//    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
//    [self.crs_DateOfBirth setInputAccessoryView:toolBar];
//
//
//    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
//    NSDate *currentDate = [NSDate date];
//    NSDateComponents *comps = [[NSDateComponents alloc] init];
//    [comps setYear:-21];
//    NSDate *maxDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
//    [comps setYear:-70];
//    NSDate *minDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
//
//    [datePicker setMaximumDate:maxDate];
//    [datePicker setMinimumDate:minDate];
//
//}
//
//-(void)ShowSelectedDate
//{
//    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
//    [formatter setDateFormat:@"dd-MMM-YYYY"];
//
//    self.crs_DateOfBirth.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
//    [self.crs_DateOfBirth resignFirstResponder];
//
//
//
//
//}
//
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//
//    if (textField==self.crs_PinCodeField) {
//        if (self.self.crs_PinCodeField.text.length >=8 && range.length == 0)
//        {
//            return NO; // return NO to not change text
//        }
//        else
//        {
//
//
//
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
//
//
//
//
//
//            return YES;}
//
//    }
//
//    else if (textField == self.crs_PhoneNumber)
//    {
//
//        if (self.self.self.crs_PhoneNumber.text.length >=10 && range.length == 0)
//        {
//            return NO; // return NO to not change text
//        }
//        else
//        {
//
//
//
//
//
//
//
//
//            NSString *validRegEx =@"^[0-9.]*$"; //change this regular expression as your requirement
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
//            return YES;}
//
//    }
//
//
//    else if (textField == self.crs_MobileNumber)
//    {
//
//        if (self.self.self.crs_MobileNumber.text.length >=10 && range.length == 0)
//        {
//            return NO; // return NO to not change text
//        }
//        else
//        {
//
//
//
//
//
//            NSString *validRegEx =@"^[0-9.]*$"; //change this regular expression as your requirement
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
//            return YES;}
//
//    }
//
//
//
//
//
//
////
////    else if (textField == self.crs_PhoneNumber)
////    {
////
////        if (self.self.self.crs_PhoneNumber.text.length >=10 && range.length == 0)
////        {
////            return NO; // return NO to not change text
////        }
////        else
////        {return YES;}
////
////    }
//
//
//    else if (textField == self.crs_FirstNameField)
//    {
//
//        if (self.self.self.crs_FirstNameField.text.length >60 && range.length == 0)
//        {
//            return NO; // return NO to not change text
//        }
//        else
//        {
//
//
//
//
//
//
//            NSString *validRegEx =@"^[A-Z a-z.]*$"; //change this regular expression as your requirement
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
//
//            return YES;}
//
//    }
//
//
//
//
//    else if (textField == self.crs_LastName)
//    {
//
//        if (self.self.self.crs_LastName.text.length >=60 && range.length == 0)
//        {
//            return NO; // return NO to not change text
//        }
//        else
//        {
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
//            NSString *validRegEx =@"^[A-Z a-z.]*$"; //change this regular expression as your requirement
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
//            return YES;}
//
//    }
//
//
//
//    else if (textField == self.crs_MiddleNameField)
//    {
//
//        if (self.self.self.crs_MiddleNameField.text.length >=10 && range.length == 0)
//        {
//            return NO; // return NO to not change text
//        }
//        else
//        {
//
//
//
//
//
//
//            NSString *validRegEx =@"^[A-Z a-z.]*$"; //change this regular expression as your requirement
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
//
//
//
//            return YES;}
//
//    }
//
//    else if (textField == self.crs_CityField)
//    {
//
//        if (self.self.self.crs_CityField.text.length >=25 && range.length == 0)
//        {
//            return NO; // return NO to not change text
//        }
//        else
//        {
//
//
//            NSString *validRegEx =@"^[A-Z a-z.]*$"; //change this regular expression as your requirement
//            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
//            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
//            if (myStringMatchesRegEx)
//                return YES;
//            else
//                return NO;
//
//            return YES;}
//
//    }
//
//
//
//    else if (textField == self.crs_Adtess1)
//    {
//
//        if (self.self.self.crs_Adtess1.text.length >=1120 && range.length == 0)
//        {
//            return NO; // return NO to not change text
//        }
//        else
//        {
//
//
//
//
//
//
//
//
//            NSString *validRegEx =@"^[A-Z a-z .]*$"; //change this regular expression as your requirement
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
//
//            return YES;}
//
//    }
//
//    else if (textField == self.crs_Adress2)
//    {
//
//        if (self.self.self.crs_Adress2.text.length >=120 && range.length == 0)
//        {
//            return NO; // return NO to not change text
//        }
//        else
//        {
//
//
//
//
//
//            NSString *validRegEx =@"^[A-Z a-z.]*$"; //change this regular expression as your requirement
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
//            return YES;}
//
//    }
//
//    else if (textField == self.crs_IdProfType)
//    {
//
//        if (self.self.self.crs_IdProfType.text.length >=20 && range.length == 0)
//        {
//            return NO; // return NO to not change text
//        }
//        else
//        {
//
//
//
//
//
//            NSString *validRegEx =@"^[A-Z a-z.]*$"; //change this regular expression as your requirement
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
//            return YES;}
//
//    }
//
//
//
//    else if (textField == self.crs_IssuedBy)
//    {
//
//        if (self.self.self.crs_IssuedBy.text.length >=20 && range.length == 0)
//        {
//            return NO; // return NO to not change text
//        }
//        else
//        {
//
//
//
//
//
//
//
//            NSString *validRegEx =@"^[A-Z a-z.]*$"; //change this regular expression as your requirement
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
//            return YES;}
//
//    }
//
//
//    else if (textField == self.crs_Nationality)
//    {
//
//        if (self.self.self.crs_Nationality.text.length >=20 && range.length == 0)
//        {
//            return NO; // return NO to not change text
//        }
//        else
//        {
//
//
//
//
//
//
//
//            NSString *validRegEx =@"^[A-Z a-z.]*$"; //change this regular expression as your requirement
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
//            return YES;}
//
//    }
//
//
//    else{
//        {return YES;}
//
//    }
//
//}
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
////-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
////{
////    return 1;
////}
////
////-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
////{
////    return idProofTypeArray.count;
////}
////
////-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
////{
////
////        return [idProofTypeArray objectAtIndex:row];
////
////
////}
////
////-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
////{
////
////    self.crs_IdProfType.text = [idProofTypeArray objectAtIndex:row];
////
////        NSLog(@" component zero %@ ",[idProofTypeArray objectAtIndex:row]);
//////
//////        [pickerView selectRow:row inComponent:1 animated:true];
////
////    self.crs_UpdateProfileView.hidden = YES;
////    }
////
////
////- (IBAction)crs_selectIProofType:(id)sender {
////
////
////
////    self.crs_UpdateProfileView.hidden = NO;
////
////
////
//
//- (IBAction)crs_home:(id)sender {
//
//
//
//
//
//
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//
//    HomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewControllerSID"];;
//
//    [self.navigationController pushViewController:viewController animated:YES];
//
//
//
//
//
//
//
//
//
//}
//
//- (IBAction)crs_history:(id)sender {
//
//
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//
//    HistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"historyViewControllerSID"];;
//
//    [self.navigationController pushViewController:viewController animated:YES];
//
//
//
//
//}
//
//- (IBAction)crs_Profile:(id)sender {
//
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UpdateProfile* viewController = [storyboard instantiateViewControllerWithIdentifier:@"UpdateProfileViewControllerSID"];;
//
//    [self.navigationController pushViewController:viewController animated:YES];
//
//
//
//}
//
//- (IBAction)crs_Notification:(id)sender {
//
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//
//    notificationViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"notificationViewControllerSID"];;
//
//    [self.navigationController pushViewController:viewController animated:YES];
//
//
//
//
//
//}
//
//- (IBAction)crs_Settings:(id)sender {
//
//
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//
//
//    SettingsViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewControllerSid"];;
//
//    [self.navigationController pushViewController:viewController animated:YES];
//
//
//
//
//}
//
//@end

//
//  UpdateProfileNewViewController.m
//  CrossPay
//
//  Created by sai kiran  on 8/29/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "UpdateProfileNewViewController.h"
#import "GlobalUrlsFile.h"
#import "crs_sharedmethods.h"
#import "Crs_sharedvariable.h"
#import "MBProgressHUD.h"
#import "NationalityTableViewCell.h"
#import "HomeViewController.h"

@interface UpdateProfileNewViewController ()
{
       NSString * NationalityName;
    NSString* date1;
    NSString* date2;
     NSString * Gender;
    NSString * Hider;
     NSMutableArray * crs_AboutMeDetails;
    UIActivityIndicatorView *spinner;
    NSMutableArray * searchArray;
    UITapGestureRecognizer * tap;
     NSMutableArray * NationalityArray;
    NSMutableArray * PostalCoderray;
    NSMutableArray * postalCompressingArray;
    NSMutableArray * IdTypeArray;
    NSMutableArray * AddressProofArray;
    BOOL  isFiltered;
    NSString * ConformHide;
    NSString * IsoCode;
    NSString* Idstorer;
    NSString * IdType;
    NSString * Message;
    NSString *tempImageNSString;
    NSString * ToBackendImageString;
    NSString * PhotoCopy;
    NSString * AdressProof;
    NSString * AddressProofPdf;
     NSString * ImagePdf;
    NSString * UserCatogory;
    NSString * CreatedOn;
    NSString * IdDecription;
    NSString * tempImageNSString1;
    NSString * CoustmerId;
    NSInteger * MyCoustmerIdLength;
    NSString * CoustmerLength;
    NSString * AddressProofType;
    NSString * UserCatogoar1;
    NSString * IdTypeImageString;
    
    NSString * Cameradisplayer;
    NSString * AddressProofCamera;
    NSString * PDFString;
    NSString * PDFString1;
    NSString * Country;
     NSString * ImageSizefounder;
    NSString * cameraImagelength;
    NSString * DateOfBirth;
    NSString * Nationality;
    NSString * PdfReader;
    
}

@end

@implementation UpdateProfileNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NationalityArray = [NSMutableArray new];
    postalCompressingArray = [NSMutableArray new];
    PostalCoderray = [NSMutableArray new];
    IdTypeArray = [NSMutableArray new];
    
    self.crs_CameraView.hidden = YES;
    self.crs_CameraView2.hidden = YES;
     arrimg =[[NSMutableArray alloc]init];
    
    self.crs_countryView.hidden = YES;
    
    [self datePick];
    [self datePick1];
    self.crs_UpdatrScroll.contentSize = CGSizeMake(self.view.frame.size.width-30, 1600);
    
  
    
    self.crs_NewIdnumber.delegate = self;
    
    self.crs_Idprooftype.image = self.crs_Idprooftype.image = [self borderedImageFromImage:[UIImage imageNamed:tempImageNSString] andColor:[UIColor whiteColor]];
    _crs_Idprooftype.layer.borderWidth = 3.0f;
    //_crs_Idprooftype.b: [[UIColor blackColor] CGColor];
    _crs_Idprooftype.layer.masksToBounds = YES;
    
    self.crs_AddressProofImagePdf.image = self.crs_AddressProofImagePdf.image = [self borderedImageFromImage:[UIImage imageNamed:tempImageNSString1] andColor:[UIColor blackColor]];
    _crs_AddressProofImagePdf.layer.borderWidth = 3.0f;
    //_crs_Idprooftype.b: [[UIColor blackColor] CGColor];
    _crs_AddressProofImagePdf.layer.masksToBounds = YES;
    
    
    
    self.crs_Update2Out.hidden = YES;
    
    
    
   
    
      Gender=@"male";
    
    //[self datePick];
    self.crs_Country.textColor = [UIColor whiteColor];
    self.crs_FirstName.textColor = [UIColor whiteColor];
    self.crs_MiddleName.textColor = [UIColor whiteColor];
    self.crs_LastName.textColor = [UIColor whiteColor];
    self.crs_DateOfBirth.textColor = [UIColor whiteColor];
    self.crs_NewIdnumber.textColor = [UIColor whiteColor];
    self.crs_Nationality.textColor = [UIColor whiteColor];
    self.crs_IsadCode.textColor = [UIColor whiteColor];
    self.crs_MobileNumber.textColor = [UIColor whiteColor];
    self.crs_address1.textColor = [UIColor whiteColor];
    self.crs_address2.textColor = [UIColor whiteColor];
    self.crs_City.textColor = [UIColor whiteColor];
    self.crs_emailadress.textColor = [UIColor whiteColor];
    self.crs_PostCode.textColor = [UIColor whiteColor];
    self.crs_IdProofField.textColor = [UIColor whiteColor];
    self.crs_ExpiryDate.textColor = [UIColor whiteColor];
    self.crs_AddressProofType.textColor = [UIColor whiteColor];
    self.crs_ChhosseFile.textColor = [UIColor whiteColor];
    _crs_addressProofField.textColor = [UIColor whiteColor];
    
    [self.crs_UpdateOut.layer setBorderWidth:1.0];
    [self.crs_UpdateOut.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    [self.crs_Update2Out.layer setBorderWidth:1.0];
    [self.crs_Update2Out.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
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
    _crs_emailadress.inputAccessoryView = numberToolbar;
    _crs_MobileNumber.inputAccessoryView = numberToolbar;
    _crs_Nationality.inputAccessoryView = numberToolbar;
    _crs_address1.inputAccessoryView = numberToolbar;
    _crs_City.inputAccessoryView = numberToolbar;
    _crs_Country.inputAccessoryView = numberToolbar;
    _crs_address2.inputAccessoryView = numberToolbar;
    _crs_NewIdnumber.inputAccessoryView = numberToolbar;
    ConformHide = @"show";
    Hider = @"show";
    
   

    NSLog(@"Hi My Recieveers Country is %@",_RecieversCountry);
    NSLog(@"Hi My Senders Country is %@",_sendersCountry);
    
    
    
    
    
    
    NationalityArray = [NSMutableArray new];
    // Get method for Nationality
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:Crosspay_Getnationalities] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        dispatch_async(dispatch_get_main_queue(), ^{
           
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NationalityArray = [json valueForKey: @"bank"];
            NSLog(@"%@", NationalityArray);
            
        });
     
    }];
    
    [dataTask resume];
    
    
    
    
    
//    
//    
//    tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
//    
//    [self.view addGestureRecognizer:tap];
//    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    
    
    
    NSURL *url = [NSURL URLWithString:Crosspay_ViewProfile];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
      [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
    
    
    
    // [mapData setObject: forKey:@"gender"];
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            NSLog(@"error %@",error);
            NSLog(@"data %@",data);
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json );
            crs_AboutMeDetails = [[json valueForKey:@"data"] objectAtIndex:0];
            NSLog(@"%@", [json valueForKey:@"message"]);
            //message = [json valueForKey:@"message"];
            if ([[json valueForKey:@"status"]isEqualToString:@"200"])
                
                
            {
                self.crs_MiddleName.text = [ crs_AboutMeDetails valueForKey:@"middle_name"];
                self.crs_FirstName.text=[ crs_AboutMeDetails valueForKey:@"first_name"];
                self.crs_LastName.text = [ crs_AboutMeDetails valueForKey:@"last_name"];

                self.crs_MobileNumber.text = [crs_AboutMeDetails valueForKey:@"mobilewithoutcc"];

               
             
                
                
                
    NSString *unfilteredString = [crs_AboutMeDetails valueForKey:@"coutrycode"];
                NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"+1234567890"] invertedSet];
                NSString *resultString = [[unfilteredString componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
                NSLog (@"Result: %@", resultString);
                
                self.crs_IsadCode.text = [NSString stringWithFormat:@"%@",resultString];
              
               
                
                self.crs_City.text = [crs_AboutMeDetails valueForKey:@"city"];
                self.crs_Country.text = [crs_AboutMeDetails valueForKey:@"country"];

                self.crs_address1.text = [crs_AboutMeDetails valueForKey:@"address1"];

              

               self.crs_emailadress.text = [crs_AboutMeDetails valueForKey:@"email"];
                Country = [crs_AboutMeDetails valueForKey:@"country"];
               self.crs_address2.text = [crs_AboutMeDetails valueForKey:@"address2"];
                self.crs_PostCode.text = [crs_AboutMeDetails valueForKey:@"pincode"];
                
                
                DateOfBirth =  [crs_AboutMeDetails valueForKey:@"dob"];
              
                Nationality =  [crs_AboutMeDetails
                                valueForKey:@"nationality"];
                
                if ([Nationality isEqualToString:@""]) {
                    NSLog(@"Hello Natioanlity is empty");
                    
                    
                    
                } else {
                    
                }
                
                
                if ([_RecieversCountry isEqualToString:@"PKR"]) {
                     self.crs_DateOfBirth.text = [crs_AboutMeDetails valueForKey:@"dob"];
                       self.crs_Nationality.text = [crs_AboutMeDetails valueForKey:@"nationality"];
                }
                
    
                
                UserCatogory  = [crs_AboutMeDetails valueForKey:@"usercategory"];
                CreatedOn = [crs_AboutMeDetails valueForKey:@"createdon"];
              [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
                 [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
               IsoCode = [crs_AboutMeDetails valueForKey:@"countryisocode2"];
                NSLog(@"Hi My Iso Code is %@",IsoCode);
                
                CoustmerId = [NSString stringWithFormat:@"%@",[crs_AboutMeDetails valueForKey:@"customer_id"]] ;
                UserCatogory = [NSString stringWithFormat:@"%@",[crs_AboutMeDetails valueForKey:@"usercategory"]] ;
                
                UserCatogoar1 = [NSString stringWithFormat:@"%@", UserCatogory ];
                
                if ([UserCatogoar1 isEqualToString:@"4"]||[UserCatogoar1 isEqualToString:@"2"]) {
                    self.crs_DateOfBirth.text = [crs_AboutMeDetails valueForKey:@"dob"];
                    self.crs_Nationality.text = [crs_AboutMeDetails valueForKey:@"nationality"];
                
                    
                }
                
                if ([DateOfBirth isEqualToString:@""]||[Nationality isEqualToString:@""]) {
                    self.crs_DateOfBirth.userInteractionEnabled = YES;
                    self.crs_NationalityOut.hidden = NO;
                   // self.crs_Nationality.userInteractionEnabled = YES;
                } else {
                    self.crs_DateOfBirth.userInteractionEnabled = NO;
                   self.crs_NationalityOut.hidden = YES;
                    //self.crs_Nationality.userInteractionEnabled = NO;
                }
                
                
                if ([self.crs_Country.text isEqualToString:@"UNITED KINGDOM"]||[self.crs_Country.text isEqualToString:@"NORWAY"]||[self.crs_Country.text isEqualToString:@"GERMANY"]||[self.crs_Country.text isEqualToString:@"FRANCE"]||[self.crs_Country.text isEqualToString:@"NETHERLANDS"]||[self.crs_Country.text isEqualToString:@"IRELAND"]||[self.crs_Country.text isEqualToString:@"AUSTRIA"]||[self.crs_Country.text isEqualToString:@"BELGIUM"]) {
                
//                    self.crs_Nationality.text = [crs_AboutMeDetails valueForKey:@"nationality"];
//                     self.crs_NewIdnumber.text = [crs_AboutMeDetails valueForKey:@"customer_id"];
                    self.crs_PakistanIdNumber.hidden = YES;
                    self.crs_NewIdnumber.hidden = NO;
                   self.crs_NewIdnumber.placeholder = @"ID NUMBER";
                
                    
                }
                
                
              

                else if ([self.crs_Country.text isEqualToString:@"DENMARK"])
                {
                    self.crs_NewIdnumber.placeholder = @"ID NUMBER";
                    self.crs_NewIdnumber.hidden = NO;
                    
                    
                }
              
                else if ([self.crs_Country.text isEqualToString:@"SWEDEN"])
                {
                     self.crs_NewIdnumber.placeholder = @"ID NUMBER";
                    self.crs_NewIdnumber.hidden = NO;
                    
                    
                }
                else if ([self.crs_Country.text isEqualToString:@"SPAIN"])
                {
                     self.crs_NewIdnumber.placeholder = @"ID NUMBER";
                    self.crs_NewIdnumber.hidden = NO;
                    
                    
                }
                else if ([self.crs_Country.text isEqualToString:@"ITALY"])
                {
                     self.crs_NewIdnumber.placeholder = @"ID NUMBER";
                    self.crs_NewIdnumber.hidden = NO;
                
                    
                }
                
                
                
                NSString * CategoryComparsion = @"";
                
                
                if ([UserCatogory isEqualToString:@"0"]||[UserCatogory isEqualToString:@"2"]||[UserCatogory isEqualToString:@"1"]) {
                    CategoryComparsion = @"Pakistan";
                    
                }
               
              //firts
                if ([_RecieversCountry isEqualToString:@"PKR"]&&[_sendersCountry isEqualToString:@"GBP"]&&[CoustmerId isEqualToString:@""]&&[CategoryComparsion isEqualToString:@"Pakistan"]) {
                     NSLog(@"HEY IAM STOPPING AT 3");
                    _crs_Comparsion = @"UpadteProfilePk";
                    self.crs_Update2Out.hidden = NO;
                    //[_crs_UpdateOut setFrame:CGRectMake(121, 550, 160, 30)];
                    self.crs_AddressProofType.hidden = YES;
                    self.crs_ChhosseFile.hidden = YES;
                    self.crs_addressProofField.hidden = YES;
                    self.crs_Idprooftype.hidden = YES;
                    self.crs_AddressProofTypeLabelPlaceholder.hidden = YES;
                    self.crs_Camera1.hidden = YES;
                    self.crs_camera1image.hidden = YES;
                    self.crs_AddressProofImagePdf.hidden  = YES;
                    self.crs_UpdateOut.hidden = YES;
                    self.crs_IdproofButtonOutlet.hidden = NO;
                    self.crs_Addressproofbuttonoutlet.hidden = YES;
                    self.crs_DropImage1.hidden = YES;
                    self.crs_IdProofField.hidden = NO;
                    self.crs_ExpiryDate.hidden = NO;
                    self.crs_AddressProofPlaceHolderoutlet.hidden = YES;
                    //self.crs_UpdatrScroll.contentSize = CGSizeMake(self.view.frame.size.width-30, 1100);
                }
                
                if ([Country isEqualToString:@"UNITED KINGDOM"]&&[UserCatogory isEqualToString:@"2"]&&![_RecieversCountry isEqualToString:@"PKR"]) {
                     NSLog(@"HEY IAM STOPPING AT 3");
                    _crs_Comparsion = @"UpadteProfileOriginal";
                    self.crs_Update2Out.hidden = NO;
                    //[_crs_UpdateOut setFrame:CGRectMake(121, 550, 160, 30)];
                    self.crs_AddressProofType.hidden = YES;
                    self.crs_ChhosseFile.hidden = YES;
                    self.crs_addressProofField.hidden = YES;
                    self.crs_Idprooftype.hidden = YES;
                    self.crs_AddressProofTypeLabelPlaceholder.hidden = YES;
                    self.crs_NewIdnumber.hidden = YES;
                    self.crs_ExpiryDate.hidden = YES;
                    self.crs_IdproofOutlet.hidden = YES;
                    self.crs_IdProofField.hidden = YES;
                    self.crs_AddressProofPlaceHolderoutlet.hidden = YES;
                    self.crs_Cameraoutlet.hidden = YES;
                    self.crs_Camera1Buttonoutlet.hidden = YES;
                    self.crs_UploadDocuments.hidden = YES;
                    self.crs_IdproofButtonOutlet.hidden = YES;
                    self.crs_DropImage1.hidden = YES;
                     self.crs_AddressProofImagePdf.hidden  = YES;
                    self.crs_UpdateOut.hidden = YES;
                    self.crs_Camera1.hidden = YES;
                    self.crs_camera1image.hidden = YES;
                    self.crs_IdproofButtonOutlet.hidden = YES;
                    self.crs_Addressproofbuttonoutlet.hidden = YES;
                    self.crs_DropImage.hidden = YES;
                    
                   // self.crs_UpdatrScroll.contentSize = CGSizeMake(self.view.frame.size.width-30, 1100);
                    NSLog(@"HEY IAM STOPPING AT 0");
                    
                }
                if ([Country isEqualToString:@"UNITED KINGDOM"]&&[UserCatogory isEqualToString:@"2"]&&![_RecieversCountry isEqualToString:@"PKR"]&&![_sendersCountry isEqualToString:@"GBP"]) {
                     NSLog(@"HEY IAM STOPPING AT 3");
                    _crs_Comparsion = @"UpadteProfileOriginal";
                    self.crs_Update2Out.hidden = NO;
                    //[_crs_UpdateOut setFrame:CGRectMake(121, 550, 160, 30)];
                    self.crs_AddressProofType.hidden = YES;
                    self.crs_ChhosseFile.hidden = YES;
                    self.crs_addressProofField.hidden = YES;
                    self.crs_Idprooftype.hidden = YES;
                    self.crs_AddressProofTypeLabelPlaceholder.hidden = YES;
                    self.crs_NewIdnumber.hidden = YES;
                    self.crs_ExpiryDate.hidden = YES;
                    self.crs_IdproofOutlet.hidden = YES;
                    self.crs_IdProofField.hidden = YES;
                    self.crs_AddressProofPlaceHolderoutlet.hidden = YES;
                    self.crs_Cameraoutlet.hidden = YES;
                    self.crs_Camera1Buttonoutlet.hidden = YES;
                    self.crs_UploadDocuments.hidden = YES;
                    self.crs_IdproofButtonOutlet.hidden = YES;
                    self.crs_DropImage1.hidden = YES;
                    self.crs_AddressProofImagePdf.hidden  = YES;
                    self.crs_UpdateOut.hidden = YES;
                    self.crs_Camera1.hidden = YES;
                    self.crs_camera1image.hidden = YES;
                    self.crs_IdproofButtonOutlet.hidden = YES;
                    self.crs_Addressproofbuttonoutlet.hidden = YES;
                    self.crs_DropImage.hidden = YES;
                    
                    // self.crs_UpdatrScroll.contentSize = CGSizeMake(self.view.frame.size.width-30, 1100);
                     NSLog(@"HEY IAM STOPPING AT 1");
                    
                }
                if ([Country isEqualToString:@"UNITED KINGDOM"]&&[UserCatogory isEqualToString:@"2"]&&[_RecieversCountry isEqualToString:@"PKR"]&&![_sendersCountry isEqualToString:@"GBP"]) {
                    NSLog(@"HEY IAM STOPPING AT 3");
                    _crs_Comparsion = @"UpadteProfileOriginal";
                    self.crs_Update2Out.hidden = NO;
                    //[_crs_UpdateOut setFrame:CGRectMake(121, 550, 160, 30)];
                    self.crs_AddressProofType.hidden = YES;
                    self.crs_ChhosseFile.hidden = YES;
                    self.crs_addressProofField.hidden = YES;
                    self.crs_Idprooftype.hidden = YES;
                    self.crs_AddressProofTypeLabelPlaceholder.hidden = YES;
                    self.crs_NewIdnumber.hidden = YES;
                    self.crs_ExpiryDate.hidden = YES;
                    self.crs_IdproofOutlet.hidden = YES;
                    self.crs_IdProofField.hidden = YES;
                    self.crs_AddressProofPlaceHolderoutlet.hidden = YES;
                    self.crs_Cameraoutlet.hidden = YES;
                    self.crs_Camera1Buttonoutlet.hidden = YES;
                    self.crs_UploadDocuments.hidden = YES;
                    self.crs_IdproofButtonOutlet.hidden = YES;
                    self.crs_DropImage1.hidden = YES;
                    self.crs_AddressProofImagePdf.hidden  = YES;
                    self.crs_UpdateOut.hidden = YES;
                    self.crs_Camera1.hidden = YES;
                    self.crs_camera1image.hidden = YES;
                    self.crs_IdproofButtonOutlet.hidden = YES;
                    self.crs_Addressproofbuttonoutlet.hidden = YES;
                    self.crs_DropImage.hidden = YES;
                    self.crs_UploadDocuments.hidden = YES;
                    // self.crs_UpdatrScroll.contentSize = CGSizeMake(self.view.frame.size.width-30, 1100);
                    NSLog(@"HEY IAM STOPPING AT 1");
                    
                }
                
                
              
                
            if ([_RecieversCountry isEqualToString:@"PKR"]&&[_sendersCountry isEqualToString:@"GBP"]&&[Country isEqualToString:@"UNITED KINGDOM"]) {
                 NSLog(@"HEY IAM STOPPING AT 3");
                _crs_Comparsion = @"UpadteProfilePk";
                    self.crs_Update2Out.hidden = NO;
                    //[_crs_UpdateOut setFrame:CGRectMake(121, 550, 160, 30)];
                    self.crs_AddressProofType.hidden = YES;
                    self.crs_ChhosseFile.hidden = YES;
                    self.crs_addressProofField.hidden = YES;
                    self.crs_Idprooftype.hidden = YES;
                    self.crs_AddressProofTypeLabelPlaceholder.hidden = YES;
                    self.crs_Camera1.hidden = YES;
                    self.crs_camera1image.hidden = YES;
                    self.crs_AddressProofImagePdf.hidden  = YES;
                    self.crs_UpdateOut.hidden = YES;
                    self.crs_IdproofButtonOutlet.hidden = NO;
                    self.crs_Addressproofbuttonoutlet.hidden = YES;
                    self.crs_DropImage1.hidden = YES;
                    self.crs_IdProofField.hidden = NO;
                    self.crs_ExpiryDate.hidden = NO;
                    self.crs_AddressProofTypeLabelPlaceholder.hidden = YES;
                    self.crs_UploadDocuments.hidden = NO;
                 NSLog(@"HEY IAM STOPPING AT 2");
//self.crs_UpdatrScroll.contentSize = CGSizeMake(self.view.frame.size.width-30, 1600);

       //7654345676

                }
                if ([_RecieversCountry isEqualToString:@"PKR"]&&[_sendersCountry isEqualToString:@"GBP"]&&![Country isEqualToString:@"UNITED KINGDOM"]) {
                     NSLog(@"HEY IAM STOPPING AT 3");
                   _crs_Comparsion = @"UpadteProfileOriginal";
                    self.crs_Update2Out.hidden = YES;
                    //[_crs_UpdateOut setFrame:CGRectMake(121, 550, 160, 30)];
                    self.crs_AddressProofType.hidden = NO;
                    self.crs_ChhosseFile.hidden = NO;
                    self.crs_addressProofField.hidden = NO;
                    self.crs_Idprooftype.hidden = NO;
                    self.crs_AddressProofTypeLabelPlaceholder.hidden = NO;
                    self.crs_Camera1.hidden = NO;
                    self.crs_camera1image.hidden = NO;
                    self.crs_AddressProofImagePdf.hidden  = NO;
                    self.crs_UpdateOut.hidden = NO;
                    self.crs_IdproofButtonOutlet.hidden = NO;
                    self.crs_Addressproofbuttonoutlet.hidden = NO;
                    self.crs_DropImage1.hidden = NO;
                    self.crs_IdProofField.hidden = NO;
                    self.crs_ExpiryDate.hidden = NO;
                    self.crs_AddressProofTypeLabelPlaceholder.hidden = NO;
                    self.crs_UploadDocuments.hidden = NO;
                    self.crs_Idprooftype.hidden = NO;
                    //self.crs_UpdatrScroll.contentSize = CGSizeMake(self.view.frame.size.width-30, 1100);
                    //7654345676
                    
                }
                if ([_RecieversCountry isEqualToString:@"PKR"]&&[_sendersCountry isEqualToString:@"GBP"]&&[Country isEqualToString:@"UNITED KINGDOM"]&&[UserCatogory isEqualToString:@"4"]) {
                    NSLog(@"HEY IAM STOPPING AT 4");
                    _crs_Comparsion = @"UpadteProfileOriginal";
                    self.crs_Update2Out.hidden = YES;
                    //[_crs_UpdateOut setFrame:CGRectMake(121, 550, 160, 30)];
                    self.crs_AddressProofType.hidden = NO;
                    self.crs_ChhosseFile.hidden = NO;
                    self.crs_addressProofField.hidden = NO;
                    self.crs_Idprooftype.hidden = NO;
                    self.crs_AddressProofTypeLabelPlaceholder.hidden = NO;
                    self.crs_Camera1.hidden = NO;
                    self.crs_camera1image.hidden = NO;
                    self.crs_AddressProofImagePdf.hidden  = NO;
                    self.crs_UpdateOut.hidden = NO;
                    self.crs_IdproofButtonOutlet.hidden = NO;
                    self.crs_Addressproofbuttonoutlet.hidden = NO;
                    self.crs_DropImage1.hidden = NO;
                    self.crs_IdProofField.hidden = NO;
                    self.crs_ExpiryDate.hidden = NO;
                    self.crs_AddressProofTypeLabelPlaceholder.hidden = NO;
                    self.crs_UploadDocuments.hidden = NO;
                    self.crs_Idprooftype.hidden = NO;
                   // self.crs_UpdatrScroll.contentSize = CGSizeMake(self.view.frame.size.width-30, 1600);
                    //7654345676
                    
                }
                
                
                
                
                
            }
            else{
                //self.crs_UpdatrScroll.contentSize = CGSizeMake(self.view.frame.size.width-30, 1600);
                
                
                
                
            }
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
   
    
    
    
}

-(void)upDateProfile{

    
    
    
    if ([self.crs_FirstName.text isEqualToString:@""]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    else if ([self.crs_LastName.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
    
    
    
    else if ([self.crs_MobileNumber.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
    
    
    
    else if ([self.crs_emailadress.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
    
    
    else if ([self.crs_DateOfBirth.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Date of Birth" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
    else if ([self.crs_Nationality.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Nationality" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
    
 
    else if ([self.crs_PostCode.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Post Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
    else if ([self.crs_address1.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Address1" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
    
    else if ([self.crs_City.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
//
////    else if ([self.crs_Country.text isEqualToString:@"ITALY"]){
////
////
////        if ([self.crs_NewIdnumber.text isEqualToString:@""]) {
////            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Codice Fiscale " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
////            [alert show];
////        }
////
////
////    }
////
////
////    else if ([self.crs_Country.text isEqualToString:@"ITALY"]){
////
////
////        if (self.crs_NewIdnumber.text.length <16) {
////            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter a Valid Codice Fiscale " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
////            [alert show];
////        }
////
////
////    }
////
////
////
////
////
////
////
////    else if ([self.crs_Country.text isEqualToString:@"SWEDEN"]){
////
////
////        if ([self.crs_NewIdnumber.text isEqualToString:@""]) {
////
////            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your National ID Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
////
////            [alert show];
////        }
////
////
////    }
////
////
////
////    else if ([self.crs_Country.text isEqualToString:@"SWEDEN"]){
////
////
////        if (self.crs_NewIdnumber.text.length <10) {
////
////            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter a Valid National ID Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
////
////            [alert show];
////        }
////
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
//    else if ([self.crs_Country.text isEqualToString:@"DENMARK"]){
//
//
//        if ([self.crs_NewIdnumber.text isEqualToString:@""]) {
//
//
//            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your CPR Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//            [alert show];
//        }
//
//
//    }
//
//
//    else if ([self.crs_Country.text isEqualToString:@"DENMARK"]){
//
//
//        if (self.crs_NewIdnumber.text.length <10) {
//
//
//            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid CPR Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//            [alert show];
//        }
//
//
//    }
//    else if ([self.crs_Country.text isEqualToString:@"SPAIN"]){
//
//
//        if ([self.crs_NewIdnumber.text isEqualToString:@""]) {
//
//            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your NIF/NIE Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//            [alert show];
//        }
//
//
//    }
//    else if ([self.crs_Country.text isEqualToString:@"SPAIN"]){
//
//
//        if (self.crs_NewIdnumber.text.length <8){
//
//            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your NIF/NIE Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//            [alert show];
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
//
//
    
    
    
    
    
    else {
        
        
        
        
        
        [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
        
        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            return ;
            
            
            
            
            
            
            
            
            
        }[MBProgressHUD showHUDAddedTo:self.view animated:YES];
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        
        NSURL * url;
        
        if ([_RecieversCountry isEqualToString:@"PKR"]) {
            
            
            
            url  = [NSURL URLWithString:Crosspay_CrosspayPakistanUpadtae];
            
            NSLog(@"Hi Mu Url is%@",url);
            
        }
        
        else{
            
            
            
            url = [NSURL URLWithString:Crosspay_UpdateProfile];
            
            
    NSLog(@"Hi Mu Url is%@",url);
            
            
            
            
            
            
        }
        
       
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
        
        
        
        
        
        
        
        [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
         [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
        [mapData setObject:self.crs_Country.text forKey:@"country"];
        [mapData setObject:self.crs_FirstName.text forKey:@"firstname"];
        [mapData setObject:self.crs_MiddleName.text forKey:@"middlename"];
        [mapData setObject:self.crs_LastName.text forKey:@"lastname"];
        NSString * Hypen = @"-";
        NSString *combined = [NSString stringWithFormat:@"%@%@%@",self.crs_IsadCode.text,Hypen,self.crs_MobileNumber.text];
        
        NSLog(@"Hello There %@",combined);
        
        [mapData setObject:combined forKey:@"mobile"];
        [mapData setObject:self.crs_emailadress.text forKey:@"email"];
        [mapData setObject:Gender forKey:@"gender"];
        [mapData setObject:self.crs_DateOfBirth.text forKey:@"dateofbirth"];
        [mapData setObject:self.crs_PostCode.text forKey:@"pincode"];
        [mapData setObject:self.crs_address1.text forKey:@"Address"];
        [mapData setObject:self.crs_address2.text forKey:@"Address2"];
        
        [mapData setObject:self.crs_City.text forKey:@"city"];
        [mapData setObject:self.crs_Nationality.text forKey:@"Nationality"];
        [mapData setObject:self.crs_NewIdnumber.text forKey:@"CusIdNumber"];
        [mapData setObject:self.crs_IsadCode.text forKey:@"countrycode"];
         [mapData setObject:tempImageNSString forKey:@"countrycode"];
        NSLog(@"Hello %@",tempImageNSString);
        
        
        
        
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                
                NSLog(@"error %@",error);
                NSLog(@" hello Ejhjhj  data %@",data);
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSLog(@"  sai Update Array%@", json );
                NSLog(@"My map data%@",mapData);
                NSLog(@"%@", [json valueForKey:@"message"]);
                //message = [json valueForKey:@"message"];
                if ([[json valueForKey:@"status"]isEqualToString:@"200"])
                    
                    
                    
                    
                    
                {
                    
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Crosspay" message:@"Your Profile has been succesfully updated." preferredStyle:UIAlertControllerStyleAlert];
                    
                    // create the actions handled by each button
                    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        
                       
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                        
                        HomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewControllerSID"];;
                        
                        [self.navigationController pushViewController:viewController animated:YES];
                        
                        
                        
                    }];
                    
                    //                    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Never!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    //                        NSLog(@"User said NEVER!");
                    //                    }];
                    
                    // add actions to our alert
                    [alert addAction:action1];
                    //[alert addAction:action2];
                    
                    // display the alert controller
                    [self presentViewController:alert animated:YES completion:nil];
                   
                    
                  
                    
                    
                    self.crs_MobileNumber.userInteractionEnabled = NO ;
                    
                }
                
                
                
                else{
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                }
                
                
                
                
                
                
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
    }
        
        
        
        
    }
    

    


- (IBAction)crs_NationalityButton:(id)sender {
}
- (IBAction)crs_FemaleAction:(id)sender {
    Gender=@"female";
    [_crs_MaleOut setSelected:YES];
    [_crs_FemaleOut setSelected:YES];
    
}


- (IBAction)crs_FemaleExtraAction:(id)sender {
    Gender=@"female";
    [_crs_MaleOut setSelected:YES];
    [_crs_FemaleOut setSelected:YES];
}
- (IBAction)crs_MaleAction:(id)sender {
    Gender=@"male";
    [_crs_MaleOut setSelected:NO];
    [_crs_FemaleOut setSelected:NO];
   
}

- (IBAction)crs_MaleExtraAction:(id)sender {
    Gender=@"male";
    [_crs_MaleOut setSelected:NO];
    [_crs_FemaleOut setSelected:NO];
}
- (IBAction)crs_Back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
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


-(void)datePick1{
    
    
    datePicker=[[UIDatePicker alloc]init];
    datePicker.datePickerMode=UIDatePickerModeDate;
    [self.crs_ExpiryDate setInputView:datePicker];
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor blackColor]];
    
    
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(ShowSelectedDate1)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    [self.crs_ExpiryDate setInputAccessoryView:toolBar];
    
    
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:20];
    NSDate *maxDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
    [comps setYear:0];
    NSDate *minDate = [calendar dateByAddingComponents:comps toDate:currentDate options:0];
    
    
    [datePicker setMaximumDate:maxDate];
    [datePicker setMinimumDate:minDate];
    
    
}
-(void)ShowSelectedDate1
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd-MM-YYYY"];
    
    
    
    
    NSDateFormatter *Format = [[NSDateFormatter alloc]init];
    [Format setDateFormat:@"YYYY-MM-dd"];
    
    NSLog(@"Hello date%@",[Format stringFromDate:datePicker.date]);
    
    date2 = [NSString stringWithFormat:@"%@",[Format stringFromDate:datePicker.date]];
    
    
    self.crs_ExpiryDate.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:datePicker.date]];
    
    [self.crs_ExpiryDate resignFirstResponder];
    
    
    
    
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

- (IBAction)crs_upadte:(id)sender {
    
    
  
        
        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            return ;
            
            
            
        }
        
        
        
        if ([self.crs_Country.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            return;
        }
        
        else if ([self.crs_FirstName.text isEqualToString:@""])  {
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
             return;
        }
        
        else if ([self.crs_LastName.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
             return;
        }
        
        else if ([self.crs_MobileNumber.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
             return;
        }
        
        
      
        
        
        
    
        
        
        else if ([self.crs_emailadress.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
             return;
            
        }
        
    
    
        else if ([self.crs_DateOfBirth.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Date of Birth" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
             return;
            
        }
    
        else if ([self.crs_Nationality.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Nationality" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
             return;
            
        }
    
    
    
    
        else if ([self.crs_PostCode.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Post code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
             return;
            
        }
    
    
    
        else if ([self.crs_address1.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Address1" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
             return;
            
        }
    
    
    
    
        else if ([self.crs_City.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
             return;
            
        }
    
    
         //imageView.image == nil

 
    
    
        else if ([self.crs_IdProofField.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select ID Proof" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            return;
            
        }
        else if ([self.crs_NewIdnumber.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter ID Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            return;
            
        }
    
    
        else if ([self.crs_ExpiryDate.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Expiry Date" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            return;
            
        }
    
        else if ([self.crs_ChhosseFile.text isEqualToString:@"Choose File"]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Choose Your Id Proof Image" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            return;
            
        }
    
    
    
    
        else if ([self.crs_AddressProofType.text isEqualToString:@""]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Address Proof" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            return;
            
        }
    
    
    
    
    
    
//        else if (cameraImagelength.length <104000){
//
//
//
//            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Address Proof File Should Be Lessthan 3MB" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//            [alert show];
//            return;
//
//        }
    
        else if ([self.crs_addressProofField.text isEqualToString:@"Choose File"]){
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Choose Your Address Proof" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            return;
            
        }
    
    
        else if ([self.crs_Country.text isEqualToString:@"ITALY"]){
            
            
            if ([self.crs_NewIdnumber.text isEqualToString:@""]) {
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Id Number " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                 return;
            }
            
            
//            else if (self.crs_NewIdnumber.text.length <16000){
//
//                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//                [alert show];
//
//                return;
//
//            }
            
//            else if (self.crs_NewIdnumber.text.length <16000){
//                
//                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Codice Fiscale" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                
//                        [alert show];
//                
//                return;
//                
//            }
            
        }
    
    
    
        else if ([self.crs_Country.text isEqualToString:@"SWEDEN"]){
            
            
            if ([self.crs_NewIdnumber.text isEqualToString:@""]) {
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter ID Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                 return;
            }
            
            
//            else if (self.crs_NewIdnumber.text.length <10000)
//
//            {
//
//
//
//                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter a Valid National ID Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//                [alert show];
//                return;
//            }
        }
    
    
    
    
    
        else if ([self.crs_Country.text isEqualToString:@"DENMARK"]){
            
            
            if ([self.crs_NewIdnumber.text isEqualToString:@""]) {
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter ID Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                 return;
            }
            
            
//            else if (self.crs_NewIdnumber.text.length <10000){
//
//                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter a Valid CPR Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//                [alert show];
//                return;
//            }
            
        }
    
    
    
    
        else if ([self.crs_Country.text isEqualToString:@"SPAIN"]){
            
            
            if ([self.crs_NewIdnumber.text isEqualToString:@""]) {
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter ID Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                 return;
            }
            
//            else if (self.crs_NewIdnumber.text.length <8000&&self.crs_NewIdnumber.text.length <9999)
//
//            {
//
//                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter a Valid NIE/NIF Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//                [alert show];
//                return;
//            }
            
            
            
            
            
        }
    
    
    
    
    
            
            
            
            
            
            [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
            
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            
            
            NSError *error;
            
            NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
            NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
             NSURL * url;
    

        
        
        
        url = [NSURL URLWithString:Crosspay_UpdateProfile];
        
        
        
        
        
        
        
        
        

            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                                   cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                               timeoutInterval:60.0];
            
            [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
            
            [request setHTTPMethod:@"POST"];
            NSMutableDictionary * mapData=[NSMutableDictionary new];
           
            [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
     [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
            [mapData setObject:self.crs_Country.text forKey:@"country"];
            [mapData setObject:self.crs_FirstName.text forKey:@"firstname"];
            [mapData setObject:self.crs_MiddleName.text forKey:@"middlename"];
            [mapData setObject:self.crs_LastName.text forKey:@"lastname"];
            NSString * Hypen = @"-";
            NSString *combined = [NSString stringWithFormat:@"%@%@%@",self.crs_IsadCode.text,Hypen,self.crs_MobileNumber.text];
            
            NSLog(@"Hello There %@",combined);
            
            [mapData setObject:combined forKey:@"mobile"];
            [mapData setObject:self.crs_emailadress.text forKey:@"email"];
            [mapData setObject:Gender forKey:@"gender"];
            [mapData setObject:self.crs_DateOfBirth.text forKey:@"dateofbirth"];
            [mapData setObject:self.crs_PostCode.text forKey:@"pincode"];
            [mapData setObject:self.crs_address1.text forKey:@"Address"];
            [mapData setObject:self.crs_address2.text forKey:@"Address2"];
            
            [mapData setObject:self.crs_City.text forKey:@"city"];
            [mapData setObject:self.crs_Nationality.text forKey:@"Nationality"];
    
    @try {
       [mapData setObject:self.crs_NewIdnumber.text forKey:@"CusIdNumber"];
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    
    
    
            //[mapData setObject:self.crs_PakistanIdNumber forKey:@"CusIdNumber"];
            [mapData setObject:self.crs_IsadCode.text forKey:@"countrycode"];
            [mapData setObject:IdType forKey:@"photo_id"];
            [mapData setObject:PhotoCopy forKey:@"proof_of_address"];
             [mapData setObject:date2 forKey:@"expiry_date"];
              [mapData setObject:AdressProof forKey:@"proof_of_address"];
             [mapData setObject:UserCatogory forKey:@"usercategory"];
            [mapData setObject:CreatedOn forKey:@"createdon"];
             [mapData setObject:IdDecription forKey:@"photo_id_name"];
           // [mapData setObject:IdType forKey:@"Idtype"];
    
   
    
    if ([Cameradisplayer isEqualToString:@"Lion"]) {
        
        ImagePdf = [NSString stringWithFormat:@"%@%@",@"data:application/pdf;base64,",PDFString1];
        
//        NSString * ToPdf = [NSString stringWithFormat:@"%@%@",@"data:pdf/png;base64,",PDFString1];
        [mapData setObject:ImagePdf forKey:@"photo_id_file"];
    }
    else{
        
        
        CGSize imagsize=CGSizeMake(500,500);
        UIImage *convertimage= [self imageWithImage:self.crs_Idprooftype.image convertToSize:imagsize];
        NSString *tempImageNSString = [self encodeToBase64String:convertimage];
        NSLog(@"My Image%@",tempImageNSString);
        ToBackendImageString = [NSString stringWithFormat:@"%@%@",@"data:image/png;base64,",tempImageNSString];
        
        NSLog(@"Hello My Base 64 Image is %@",ToBackendImageString);
        [mapData setObject:ToBackendImageString forKey:@"photo_id_file"];
        
    }
    
    
    if ([ AddressProofCamera isEqualToString:@"Pdf"]) {
      
        
        
        AddressProofPdf = [NSString stringWithFormat:@"%@%@",@"data:application/pdf;base64,",PDFString];
        
        NSLog(@"Hello My Base 64 Image is %@",AddressProofPdf);
        
        [mapData setObject:AddressProofPdf forKey:@"proof_of_address_file"];
        
        
    }
//    else if ([Cameradisplayer isEqualToString:@"Lion"]){
//
//        ImagePdf = [NSString stringWithFormat:@"%@%@",@"data:application/pdf;base64,",PDFString1];
//
//        NSString * ToPdf = [NSString stringWithFormat:@"%@%@",@"data:pdf/png;base64,",PDFString1];
//          [mapData setObject:ToPdf forKey:@"photo_id_file"];
//    }
//
    else{
        CGSize imagsize1 =CGSizeMake(500,500);
        UIImage *convertimage1= [self imageWithImage:self.crs_AddressProofImagePdf.image convertToSize:imagsize1];
        tempImageNSString1 = [self encodeToBase64String:convertimage1];
        NSLog(@"My Image%@",tempImageNSString1);
        
        
        
        AddressProofPdf = [NSString stringWithFormat:@"%@%@",@"data:image/png;base64,",tempImageNSString1];
        
        NSLog(@"Hello My Base 64 Image is %@",AddressProofPdf);
        
        [mapData setObject:AddressProofPdf forKey:@"proof_of_address_file"];
        
        
        
        
    }
   
    
    
   
    
    
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
                   
                    if ([[json valueForKey:@"status"]isEqualToString:@"200"]) {
                        
                        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Crosspay" message:@"Profile updated successfully." preferredStyle:UIAlertControllerStyleAlert];
                        
                        // create the actions handled by each button
                        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            
                            
                            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                            
                            HomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewControllerSID"];;
                            
                            [self.navigationController pushViewController:viewController animated:YES];
                            
                            
                            
                        }];
                        
                        //                    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Never!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        //                        NSLog(@"User said NEVER!");
                        //                    }];
                        
                        // add actions to our alert
                        [alert addAction:action1];
                        //[alert addAction:action2];
                        
                        // display the alert controller
                        [self presentViewController:alert animated:YES completion:nil];
                        
                        
                    }
                    else{
                        
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        
                        
                        
                        
                        
                    }
                    
                    
                    
                });
                
                
                
                
            }];
            
            [postDataTask resume];
            
            
            
            
            
            
            
            
        }
        
    

    


//


        



- (IBAction)crs_nationlaity1:(id)sender {
    isFiltered=NO;
    
    
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
    self.crs_countryView.hidden = NO;
    
    self.crs_CountryTable.hidden = NO;
    [self.crs_CountryTable reloadData];
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if ([NationalityName isEqualToString:@"nationality"]) {
        
        
        if (!isFiltered) {
            
            return NationalityArray.count;
            
        }
        
        
        else{
            
            
            
            return searchArray.count;
        }
        
    }
    
    
    
    else if ([NationalityName isEqualToString:@"PostalCode"]){
        
        if (!isFiltered) {
            return PostalCoderray.count;
            
            
        }
        
        
        else{
            
            return searchArray.count;
        }
        
    }
    
    else if ([NationalityName isEqualToString:@"IdType"]){
        
        if (!isFiltered) {
            return IdTypeArray.count;
            
            
        }
        
        
        else{
            
            return searchArray.count;
        }
        
    }
    
    else if ([NationalityName isEqualToString:@"AddressType"]){
        
        if (!isFiltered) {
            return IdTypeArray.count;
            
            
        }
        
        
        else{
            
            return searchArray.count;
        }
        
    }
    else{
        
        
        if (!isFiltered) {
            
            return postalCompressingArray.count;
        }
        
        
        else{
            
            return searchArray.count;
        }
        
    }
    
}
    
    


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    
    
    
    NationalityTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"NationalitySID"];
    if ([NationalityName isEqualToString:@"nationality"]) {
        
        if (!isFiltered) {
            
            
            cell.crs_NationalityName.text = [[NationalityArray valueForKey:@"nationality"]objectAtIndex:indexPath.row ];
            
            
        }
        else{
            
            
            
            cell.crs_NationalityName.text = [[searchArray valueForKey:@"nationality"]objectAtIndex:indexPath.row ];
            
        }
        
        
    }

    
    
    
    else if ([NationalityName isEqualToString:@"PostalCode"]){
        
        if (!isFiltered) {
            cell.crs_NationalityName.text = [[PostalCoderray valueForKey:@"addressline1"]objectAtIndex:indexPath.row ];
            
        }
        
        else{
            
            
            cell.crs_NationalityName.text = [[searchArray valueForKey:@"addressline1"]objectAtIndex:indexPath.row ];
            
            
        }
        
        
        
        
    }
    
    else if ([NationalityName isEqualToString:@"PostalCode1"]){
        
        if (!isFiltered) {
            cell.crs_NationalityName.text = [[postalCompressingArray valueForKey:@"addressline2"]objectAtIndex:indexPath.row ];
            
        }
        
        else{
            
            
            cell.crs_NationalityName.text = [[searchArray valueForKey:@"addressline2"]objectAtIndex:indexPath.row ];
            
            
        }
        
        
        
        
    }
    else if ([NationalityName isEqualToString:@"IdType"]){
        
        if (!isFiltered) {
        cell.crs_NationalityName.text = [[IdTypeArray valueForKey:@"IDDescription"]objectAtIndex:indexPath.row ];
            
        }
        
        else{
            
            
//            cell.crs_NationalityName.text = [[searchArray valueForKey:@"addressline"]objectAtIndex:indexPath.row ];
//
            
        }
        
        
        
        
    }
    
    else if ([NationalityName isEqualToString:@"AddressType"]){
        
        if (!isFiltered) {
            cell.crs_NationalityName.text = [[IdTypeArray valueForKey:@"IDDescription"]objectAtIndex:indexPath.row ];
            
        }
        
        else{
            
            
            //            cell.crs_NationalityName.text = [[searchArray valueForKey:@"addressline"]objectAtIndex:indexPath.row ];
            //
            
        }
        
        
        
        
    }
    return cell;
}














-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.crs_countryView.hidden = YES;
    
    
    
    
    
    
    if ([NationalityName isEqualToString:@"nationality"]) {
        
        if (!isFiltered) {
            self.crs_Nationality.text = [[NationalityArray valueForKey:@"nationality"]objectAtIndex:indexPath.row ];
           
            
        }
        
        else{
            
            
            self.crs_Nationality.text = [[searchArray valueForKey:@"nationality"]objectAtIndex:indexPath.row ];
            
            
        }
        
        
        
    }
    
    
    
    else if ([NationalityName isEqualToString:@"PostalCode"]){
        if (!isFiltered) {
            
            self.crs_address1.text = [[PostalCoderray valueForKey:@"addressline1"]objectAtIndex:indexPath.row ];
            
            self.crs_City.text = [[PostalCoderray valueForKey:@"posttown"] objectAtIndex:indexPath.row];
            
            
            
        }
        
        else{
            
            
            self.crs_address1.text = [[searchArray valueForKey:@"addressline1"]objectAtIndex:indexPath.row ];
            self.crs_City.text = [[searchArray valueForKey:@"posttown"] objectAtIndex:indexPath.row];
            
            
            
        }
        
        
        
    }
    
    
    else if ([NationalityName isEqualToString:@"PostalCode1"]){
        if (!isFiltered) {
            
            self.crs_address2.text = [[postalCompressingArray valueForKey:@"addressline2"]objectAtIndex:indexPath.row ];
            
            self.crs_City.text = [[postalCompressingArray valueForKey:@"posttown"] objectAtIndex:indexPath.row];
            
            
            
        }
        
        else{
            
            
            self.crs_address2.text = [[searchArray valueForKey:@"addressline2"]objectAtIndex:indexPath.row ];
            self.crs_City.text = [[searchArray valueForKey:@"posttown"] objectAtIndex:indexPath.row];
            
            
            
        }
        
        
        
    }
    
    
    else if ([NationalityName isEqualToString:@"IdType"]){
        if (!isFiltered) {
            
            self.crs_IdProofField.text = [[IdTypeArray valueForKey:@"IDDescription"]objectAtIndex:indexPath.row ];
           
         IdType = [[IdTypeArray valueForKey:@"IDType"] objectAtIndex:indexPath.row];
          PhotoCopy = [[IdTypeArray valueForKey:@"PhotoIDOrNot"] objectAtIndex:indexPath.row];
          AdressProof = [[IdTypeArray valueForKey:@"IDType"] objectAtIndex:indexPath.row];
        IdDecription =  [[IdTypeArray valueForKey:@"IDDescription"]objectAtIndex:indexPath.row ];
            
            
            
        }
        
        else{
            
            
//            self.crs_address2.text = [[searchArray valueForKey:@"addressline2"]objectAtIndex:indexPath.row ];
//            self.crs_City.text = [[searchArray valueForKey:@"posttown"] objectAtIndex:indexPath.row];
//
            
            
        }
        
        
        
    }
    
    else if ([NationalityName isEqualToString:@"AddressType"]){
        if (!isFiltered) {
            
            self.crs_AddressProofType.text = [[IdTypeArray valueForKey:@"IDDescription"]objectAtIndex:indexPath.row ];
            
      AddressProofType = [[IdTypeArray valueForKey:@"IDType"] objectAtIndex:indexPath.row];
             PhotoCopy = [[IdTypeArray valueForKey:@"PhotoIDOrNot"] objectAtIndex:indexPath.row];
             AdressProof = [[IdTypeArray valueForKey:@"IDType"] objectAtIndex:indexPath.row];
        }
        
        else{
            
            
            //            self.crs_address2.text = [[searchArray valueForKey:@"addressline2"]objectAtIndex:indexPath.row ];
            //            self.crs_City.text = [[searchArray valueForKey:@"posttown"] objectAtIndex:indexPath.row];
            //
            
            
        }
        
        
        
    }
    
    
    
    
    
    
}














-(void)PostCodeAdress {
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString * CountryCodeChanger ;
    if ([self.crs_Country.text isEqualToString:@"UNITED KINGDOM"]) {
        CountryCodeChanger = @"uk";
    }
    
    
    else
    {
        
        CountryCodeChanger = @"" ;
        
    }
    NSString *str = self.crs_PostCode.text;
    
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
                //postalCompressingArray = json;
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
                self.crs_Address1.hidden = YES;
                self.crs_Address2Out.hidden = YES;
                self.crs_CityOut.hidden = YES;
                self.crs_Address2Image.hidden = YES;
                self.crs_address1Image.hidden = YES;
                self.crs_countryView.hidden = YES;
                
            }
            else{
                
                
                if ([NationalityName isEqualToString:@"PostalCode1"]) {
                    postalCompressingArray = [NSMutableArray new];
                    for (int i = 0; i<PostalCoderray.count; i++) {
                        
                        
                        
                        [postalCompressingArray addObject:[[PostalCoderray valueForKey:@"addressline1"]objectAtIndex: i] ];
                        
                        
                        
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
                self.crs_countryView.hidden = NO;
                //NSLog(@"%@ PostCode",json);
                
                
                
                
                
            }
            
        });
    }];
    
    [dataTask resume];
    
    
    
    
}


-(void)PostCodeAdress1 {
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString * CountryCodeChanger ;
    if ([self.crs_Country.text isEqualToString:@"UNITED KINGDOM"]) {
        CountryCodeChanger = @"uk";
    }
    
    
    else
    {
        
        CountryCodeChanger = @"" ;
        
    }
    NSString *str = self.crs_PostCode.text;
    
    str = [str stringByReplacingOccurrencesOfString:@" "withString:@""];;
    NSLog(@"%@ Anusha",str);
    
    NSString * postCodeUrl = [NSString stringWithFormat:@"https://ws.postcoder.com/pcw/PCWBD-CB592-Q66XH-3KQ6R/address/%@/%@?lines=5&format=json",CountryCodeChanger,str];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:postCodeUrl] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            
            @try {
                
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                
               // PostalCoderray = json;
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
                self.crs_Address1.hidden = YES;
                self.crs_Address2Out.hidden = YES;
                self.crs_CityOut.hidden = YES;
                self.crs_Address2Image.hidden = YES;
                self.crs_address1Image.hidden = YES;
                 self.crs_countryView.hidden = YES;
                
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
                self.crs_countryView.hidden = NO;
                //NSLog(@"%@ PostCode",json);
                
                
                
                
                
            }
            
        });
    }];
    
    [dataTask resume];
    
    
    
    
}












- (IBAction)crs_Address1Action:(id)sender {
    
    
    self.crs_countryView.hidden = NO;
    NationalityName = @"PostalCode";
    [self PostCodeAdress];
    
    [_crs_CountryTable reloadData];
    
    
    
    
    if ([self.crs_PostCode.text isEqualToString:@""]) {
      
            
            
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"For Address1 Please Enter Post Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
     
        
    }
    
}
- (IBAction)crs_Address2Action:(id)sender {
    
     self.crs_countryView.hidden = NO;
    NationalityName = @"PostalCode1";
    [self PostCodeAdress1];
    [_crs_CountryTable reloadData];
    
    if ([self.crs_PostCode.text isEqualToString:@""]) {
        
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"For Address2 Please Enter Post Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
    }
}
- (IBAction)crs_CityAction:(id)sender {
}
- (IBAction)crs_TableviewHider:(id)sender {
    
    self.crs_countryView.hidden = YES;
}


-(void)textFieldDidBeginEditing:(UITextField *)textField {
  
    
    if  (textField == _crs_DateOfBirth) {
        
        [self datePick];
        
        
        
        
        CGPoint scrollPoint = CGPointMake(0,250);
        [  self.crs_UpdatrScroll setContentOffset:scrollPoint animated:YES];
        
        
        
    }
else if  (textField == _crs_Nationality) {
        
        
        
        
        
        
        CGPoint scrollPoint = CGPointMake(0,250);
        [  self.crs_UpdatrScroll setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
 else if  (textField ==_crs_address1 ) {
     
     
     
     
     
     
     CGPoint scrollPoint = CGPointMake(0,280);
     [  self.crs_UpdatrScroll setContentOffset:scrollPoint animated:YES];
     
     
     
 }
  
    
    else if  (textField ==_crs_address2 ) {
        
        
        
        
        
        
        CGPoint scrollPoint = CGPointMake(0,320);
        [  self.crs_UpdatrScroll setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    else if  (textField == _crs_City) {
        
        
        
        
        
        
        CGPoint scrollPoint = CGPointMake(0,370);
        [ self.crs_UpdatrScroll setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    else if  (textField == _crs_NewIdnumber) {
        
        
        
        
        
        
        CGPoint scrollPoint = CGPointMake(0,650);
        [  self.crs_UpdatrScroll setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    else if  (textField == _crs_ExpiryDate) {
        
        
        
        
        
        [self datePick1];
        CGPoint scrollPoint = CGPointMake(0,650);
        [  self.crs_UpdatrScroll setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    else if (textField == _crs_address1)
    {
        
        
        self.crs_Address1.hidden = YES;
        self.crs_Address2Out.hidden = YES;
        self.crs_CityOut.hidden = YES;
        self.crs_Address2Image.hidden = YES;
        self.crs_address1Image.hidden = YES;

        CGPoint scrollPoint = CGPointMake(0,520);
        [  _crs_UpdatrScroll setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    
    
    //    }
    
}












-(void) dismissKeyboard { [self.crs_FirstName resignFirstResponder];
    [self.crs_LastName resignFirstResponder]; [self.crs_emailadress resignFirstResponder]  ;
    
    [self.crs_City resignFirstResponder];
    [self.crs_address2 resignFirstResponder];
    [self.crs_address1 resignFirstResponder];
    [self.crs_Country resignFirstResponder];
    [self.crs_FirstName resignFirstResponder];
    [self.crs_LastName resignFirstResponder];
    [self.crs_emailadress resignFirstResponder];
    [self.crs_MobileNumber resignFirstResponder];
    [_crs_Address2 resignFirstResponder];
    [self.crs_NewIdnumber resignFirstResponder];
    [_crs_MiddleName resignFirstResponder];
    
}
-(void)clearNumberPad{
    
    [self.crs_City resignFirstResponder];
    [self.crs_address2 resignFirstResponder];
    [self.crs_address1 resignFirstResponder];
    [self.crs_Country resignFirstResponder];
    [self.crs_FirstName resignFirstResponder];
    [self.crs_LastName resignFirstResponder];
    [self.crs_emailadress resignFirstResponder];
    [self.crs_MobileNumber resignFirstResponder];
    [_crs_Address2 resignFirstResponder];
    [self.crs_NewIdnumber resignFirstResponder];
    [_crs_MiddleName resignFirstResponder];
}

-(void)doneWithNumberPad{
    
    [self.crs_City resignFirstResponder];
    [self.crs_address2 resignFirstResponder];
    [self.crs_address1 resignFirstResponder];
    [self.crs_Country resignFirstResponder];
    [self.crs_FirstName resignFirstResponder];
    [self.crs_LastName resignFirstResponder];
    [self.crs_emailadress resignFirstResponder];
    [self.crs_MobileNumber resignFirstResponder];
    [_crs_Address2 resignFirstResponder];
    [self.crs_NewIdnumber resignFirstResponder];
    [_crs_MiddleName resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_crs_PostCode resignFirstResponder];
    
    [self.crs_City resignFirstResponder];
    [self.crs_address2 resignFirstResponder];
    [self.crs_address1 resignFirstResponder];
    [self.crs_Country resignFirstResponder];
    [self.crs_FirstName resignFirstResponder];
    [self.crs_LastName resignFirstResponder];
    [self.crs_emailadress resignFirstResponder];
    [self.crs_MobileNumber resignFirstResponder];
    [_crs_Address2 resignFirstResponder];
    [self.crs_NewIdnumber resignFirstResponder];
    [_crs_MiddleName resignFirstResponder];
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//
//    if (textField==self.crs_NewIdnumber)
//
//    {
//
//        if ([self.crs_Country.text isEqualToString:@"ITALY"]||[self.crs_Country.text isEqualToString:@"AUSTRIA"]||[self.crs_Country.text isEqualToString:@"IRELAND"]) {
//
//
//            if (self.self.crs_NewIdnumber.text.length >=1699999 && range.length == 0)
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
//                NSString *validRegEx =@"^[a-z,A-Z,0-9,+.]*$"; //change this regular expression as your requirement
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
//
//
//        else if ([self.crs_Country.text isEqualToString:@"SWEDEN"]||[self.crs_Country.text isEqualToString:@"DENMARK"]||[self.crs_Country.text isEqualToString:@"UNITED KINGDOM"]) {
//
//
//            if (self.self.crs_NewIdnumber.text.length >=100000 && range.length == 0)
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
//                NSString *validRegEx =@"^[a-z,A-Z,0-9,+.]*$"; //change this regular expression as your requirement
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
//        else if ([self.crs_Country.text isEqualToString:@"SPAIN"]||[self.crs_Country.text isEqualToString:@"NETHERLANDS"]) {
//
//
//            if (self.self.crs_NewIdnumber.text.length >=90000 && range.length == 0)
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
//                NSString *validRegEx =@"^[a-z,A-Z,0-9,+.]*$"; //change this regular expression as your requirement
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
//
//
//
//        else{
//
//            if (self.self.crs_MobileNumber.text.length >=11 && range.length == 0)
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
//                NSString *validRegEx =@"^[a-z,A-Z,0-9,+.]*$"; //change this regular expression as your requirement
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
//
//
//
//
//        }
//
//
//
//    }
//
//
//
//
//
//    else if (textField == self.crs_FirstName)
//    {
//
//        if (self.self.self.self.crs_FirstName.text.length >=120 && range.length == 0)
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
//            return YES;}
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
//    }
//
//
//    else if (textField == self.crs_LastName)
//    {
//
//        if (self.self.self.self.crs_LastName.text.length >=120 && range.length == 0)
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
//
//
//
//
//            return YES;}
//
//
//    }
//
//    else if (textField == self.crs_emailadress)
//    {
//
//        if (self.self.self.self.crs_emailadress.text.length >=60 && range.length == 0)
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
//            return YES;}
//
//
//
//
//
//    }
//
//
//
//    else if (textField == self.crs_Nationality)
//    {
//
//        if (self.self.self.self.crs_Nationality.text.length >=60 && range.length == 0)
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
//    else if (textField == self.crs_Country)
//    {
//
//        if (self.self.self.self.crs_Country.text.length >=60 && range.length == 0)
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
//    else if (textField == self.crs_Country)
//    {
//
//        if (self.self.self.self.crs_Country.text.length >=60 && range.length == 0)
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
//
//
//
//
//    else if (textField == self.crs_City)
//    {
//
//        if (self.self.self.self.crs_City.text.length >=60 && range.length == 0)
//        {
//            return NO; // return NO to not change text
//        }
//        else
//        {
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
//
//
//
//
//    }
//
//
//
//    else if (textField == self.crs_NewIdnumber)
//    {
//
//        if (self.self.self.self.crs_NewIdnumber.text.length >=100000 && range.length == 0)
//        {
//            return NO; // return NO to not change text
//        }
//        else
//        {
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
//
//
//            return YES;}
//
//
//    }
//
//
//
//
//
//    else if ([self.crs_Country.text isEqualToString:@"SPAIN"]) {
//
//
//        if (self.self.crs_NewIdnumber.text.length >=9909090 && range.length == 0)
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
//            NSString *validRegEx =@"^[A-Z,a-z,0-9,+.]*$"; //change this regular expression as your requirement
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
//
//
//
//    else if ([self.crs_Country.text isEqualToString:@"ITALY"]||[self.crs_Country.text isEqualToString:@"AUSTRIA"]) {
//
//
//        if (self.self.crs_NewIdnumber.text.length >=1690909 && range.length == 0)
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
//            NSString *validRegEx =@"^[A-Z,a-z,0-9,+.]*$"; //change this regular expression as your requirement
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
//
//
//
//
//
//    else if ([self.crs_Country.text isEqualToString:@"SWEDEN"]||[self.crs_Country.text isEqualToString:@"DENMARK"]) {
//
//
//        if (self.self.crs_NewIdnumber.text.length >=16909909 && range.length == 0)
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
//            NSString *validRegEx =@"^[A-Z,a-z,0-9,+.]*$"; //change this regular expression as your requirement
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
//
//
//    else if ([self.crs_Country.text isEqualToString:@"UNITED KINGDOM"]) {
//
//
//        if (self.self.crs_IdNumber.text.length >=16 && range.length == 0)
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
//            NSString *validRegEx =@"^[A-Z,a-z,0-9,+.]*$"; //change this regular expression as your requirement
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
//
//
//
//
//
//
//    else{
//        {return YES;}
//
//    }
//
//}







- (IBAction)crs_IdProofTypebutton:(id)sender {
    
    
  
    [self.view endEditing:YES];
    [self IdTypeMethod];
    NationalityName = @"IdType";
    [_crs_CountryTable reloadData];
    
    
}
- (IBAction)crs_CameraButton:(id)sender {
    
    IdTypeImageString = @"IDPROOFIMAGE";
    self.crs_CameraView.hidden = NO;
  
}
- (IBAction)crs_AddressproofButton:(id)sender {
    

    
    
    self.crs_countryView.hidden = NO;
    
    NationalityName = @"AddressType";
    [self IdTypeMethod1];
    
    [_crs_CountryTable reloadData];
}

- (IBAction)crs_Camera1Action:(id)sender {
    
    IdTypeImageString = @"ADDRESSPROOFIMAGE";
    self.crs_CameraView2.hidden = NO;
    
//    NSString *actionSheetTitle = @"Do you want to Choose your Address Proof?"; //Action Sheet Title
//    NSString *destructiveTitle = @"Destructive Button"; //Action Sheet Button Titles
//    NSString *other = @"Use Camera";
//    NSString *other9 = @"Use Photo Gallery";
//     NSString *otherPdf = @"Upload PDF";
//    NSString *cancelTitle = @"Cancel Button";
//
//    UIActionSheet *actionSheet = [[UIActionSheet alloc]
//                                  initWithTitle:actionSheetTitle
//                                  delegate:self
//                                  cancelButtonTitle:cancelTitle
//                                  destructiveButtonTitle:nil
//                                  otherButtonTitles:other, other9, otherPdf, nil];
//
//    [actionSheet showInView:self.view];
}




-(void)IdTypeMethod {
    
    

        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        
        NSError *error;
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_idType];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
        
        @try {
            
            
            
            [mapData setObject:IsoCode forKey:@"Country"];
            
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
                Message = [json valueForKey:@"status"];
               
                
                isFiltered = NO;
                
              IdTypeArray = [NSMutableArray new];
               
        IdTypeArray =  [json valueForKey: @"bank"];
                NSMutableArray * Ary=[NSMutableArray new];
                
                for (int i=0; i<IdTypeArray.count; i++) {
        if ([[[IdTypeArray valueForKey:@"PhotoIDOrNot"]objectAtIndex:i]isEqualToString:@"1"]) {
                        
                        
            NSMutableDictionary * dict=[NSMutableDictionary new];
                        
                        //           dict =[IdTypeArray objectAtIndex:i];
                        [Ary addObject:[IdTypeArray objectAtIndex:i]];
                    }
                    
                    
                    
                }
                
                
                
                
                //[IdTypeArray removeAllObjects];
                IdTypeArray = [Ary mutableCopy];
                NationalityName = @"IdType";
                
                self.crs_countryView.hidden = NO;
                [_crs_CountryTable reloadData];
               
              
                
            });
            
            
            
            
        }];
        
        [postDataTask resume];
        
        
        
        
        
 
    
}


-(void)IdTypeMethod1 {
    
    
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_idType];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    @try {
        
        
        
        [mapData setObject:IsoCode forKey:@"Country"];
        
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
            Message = [json valueForKey:@"status"];
            
            
            isFiltered = NO;
            
            IdTypeArray = [NSMutableArray new];
            
            IdTypeArray =  [json valueForKey: @"bank"];
            NSMutableArray * Ary=[NSMutableArray new];
            
            for (int i=0; i<IdTypeArray.count; i++) {
                if ([[[IdTypeArray valueForKey:@"PhotoIDOrNot"]objectAtIndex:i]isEqualToString:@"2"]) {
                    
                    
                    NSMutableDictionary * dict=[NSMutableDictionary new];
                    
                    //           dict =[IdTypeArray objectAtIndex:i];
                    [Ary addObject:[IdTypeArray objectAtIndex:i]];
                }
                
                
                
            }
            
            
            
            
            //[IdTypeArray removeAllObjects];
            IdTypeArray = [Ary mutableCopy];
         
            
            self.crs_countryView.hidden = NO;
            [_crs_CountryTable reloadData];
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
    
    
    
}

//- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
//    
//    
//    
//    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
//    
//    if  ([buttonTitle isEqualToString:@"Use Camera"]) {
//        AddressProofCamera = @"Camera";
//        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//        picker.delegate = self;
//        picker.allowsEditing = YES;
//        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//        
//        [self presentViewController:picker animated:YES completion:NULL];
//        
//        tempImageNSString1 = [self encodeToBase64String:_crs_Idprooftype.image];
//        NSLog(@"Hello Sai Kiran Kunchala You Have Pressed Camera ");
//        
//        NSLog(@" hello There %@",tempImageNSString);
//        
//        
//    }
//    if ([buttonTitle isEqualToString:@"Use Photo Gallery"]) {
//        AddressProofCamera = @"Gallery";
//        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//        picker.delegate = self;
//        picker.allowsEditing = YES;
//        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//        
//        [self presentViewController:picker animated:YES completion:NULL];
//
//        NSLog(@"Hello Sai Kiran Kunchala You Have Opted For Photo Library  ");
//    }
//    if ([buttonTitle isEqualToString:@"Upload PDF"]) {
//        AddressProofCamera = @"Pdf";
//        UIDocumentPickerViewController *documentPicker = [[UIDocumentPickerViewController
//                                                           alloc] initWithDocumentTypes:@[@"public.composite-content"]
//                                                          
//                                                          inMode:UIDocumentPickerModeImport];
//        documentPicker.delegate = self;
//        
//        documentPicker.modalPresentationStyle =
//        UIModalPresentationFormSheet;
//[self presentViewController:documentPicker animated:YES completion:nil];
//        
//        NSLog(@"Hello Sai Kiran Kunchala You Have Opted For Pdf ");
//    }
//    
//    
//    
//    
//    
//    if ([buttonTitle isEqualToString:@"Other Button 2"]) {
//        NSLog(@"Other 2 pressed");
//    }
//    
//}

-(UIImage *)borderedImageFromImage:(UIImage *)source andColor:(UIColor *)borderColor{
    CGFloat scale = 0.95;//this determines how big the border will be, the smaller it is the bigger the border
    UIImage *borderImage = [source imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIGraphicsBeginImageContextWithOptions(source.size, NO, source.scale);
    [borderColor set];
    [borderImage drawInRect:CGRectMake(0, 0, source.size.width, source.size.height)];
    [source drawInRect:CGRectMake(source.size.width*(1-scale)/2,
                                  source.size.height*(1-scale)/2,
                                  source.size.width * scale,
                                  source.size.height * scale)];
    borderImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return borderImage;
}

//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//
//    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
//
//    _crs_Idprooftype = chosenImage;
//    [picker dismissViewControllerAnimated:YES completion:NULL];
//
//}
//- (NSString *)encodeToBase64String:(UIImage *)image {
//    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//}

#pragma mark - UIImage Delegate

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    
    if ([IdTypeImageString isEqualToString:@"IDPROOFIMAGE"]) {
        if ([Cameradisplayer isEqualToString:@"Gallery"]) {
            NSString * GalleryImage = [NSString stringWithFormat:@"%@",[editingInfo objectForKey:@"UIImagePickerControllerImageURL"]];
            NSArray * ImagesGalleruArray = [GalleryImage componentsSeparatedByString:@"/"];
            NSString * Imagepath = [ImagesGalleruArray lastObject];
            NSString * ImageNamedisplayer = [NSString stringWithFormat:@"%@.jpeg",[Imagepath substringToIndex:5]];
            ImageSizefounder = Imagepath;
            
             NSLog(@"Size of Image999(bytes):%lu",(unsigned long)[Imagepath length]);
            
            _crs_ChhosseFile.text = ImageNamedisplayer;
            
            NSData *imgData=UIImagePNGRepresentation(image);
            NSLog(@"Hi camera legth is %lu",(unsigned long)[imgData length]);
            // cameraImagelength = imgData;
            if ([imgData length]>104000) {
                self.crs_Idprooftype.image = image;
            }
            else{
                
                
                _crs_ChhosseFile.text = @"";
                _crs_Idprooftype.image= [UIImage imageNamed:@""];
              
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"File Size Should be more than 104 Kb" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                
                
                
            }
        }
        else{
            
            _crs_ChhosseFile.text =  [NSString stringWithFormat:@"Camera.jpeg"];
            
            NSData *imgData=UIImagePNGRepresentation(image);
            // If we dont  valiadtion for camera un hide these
            
            self.crs_Idprooftype.image = image;
            NSLog(@"Hi camera legth is %lu",(unsigned long)[imgData length]);
            // cameraImagelength = imgData;
            
//// If validation for camera means dont hide these
//            if ([imgData length]>1040000) {
//
//                self.crs_Idprooftype.image = image;
//            }
//            else{
//
//
//                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//                [alert show];
//
//
//
//
//            }
        }
        
        
        self.crs_CameraView.hidden = YES;
        
        [picker dismissModalViewControllerAnimated:YES];
    }
    else{
        if ([AddressProofCamera isEqualToString:@"Gallery"]) {
            NSString * GalleryImage = [NSString stringWithFormat:@"%@",[editingInfo objectForKey:@"UIImagePickerControllerImageURL"]];
            NSArray * ImagesGalleruArray = [GalleryImage componentsSeparatedByString:@"/"];
            NSString * Imagepath = [ImagesGalleruArray lastObject];
            NSString * ImageNamedisplayer = [NSString stringWithFormat:@"%@.jpeg",[Imagepath substringToIndex:5]];
            NSLog(@"Size of Image(bytes):%lu",(unsigned long)[Imagepath length]);
            _crs_addressProofField.text = ImageNamedisplayer;
            NSData * imgData1 = UIImageJPEGRepresentation(image, 10);
            //NSData *imgData1=UIImagePNGRepresentation(image);
            //        cameraImagelength = imgData1;
            NSLog(@"Size of your image is %lu bytes", (unsigned long)[imgData1 length]);
            if ([imgData1 length]>104000) {
                self.crs_AddressProofImagePdf.image = image;
            }
            
          
            else{

                _crs_AddressProofType.text = @"";
                _crs_AddressProofImagePdf.image= [UIImage imageNamed:@""];
                NSLog(@"Hi ");
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"File Size Should be more than 104 Kb" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
               




            }
        }
        else{
            
            _crs_addressProofField.text =  [NSString stringWithFormat:@"Camera.jpeg"];
            NSData * imgData1 = UIImageJPEGRepresentation(image, 10);
            // Validation
            self.crs_AddressProofImagePdf.image = image;
            NSLog(@"Size of your image is %lu bytes", (unsigned long)[imgData1 length]);
//            if ([imgData1 length]>1040000) {
//                self.crs_AddressProofImagePdf.image = image;
//            }
//            else{
//
//
//                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//                [alert show];
//
//
//
//
//            }
        }
        
       
        
        self.crs_CameraView.hidden = YES;
        
        
        [picker dismissModalViewControllerAnimated:YES];
    }
    
    
    
    
    
    
}
- (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0,size.height,size.width)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}
- (NSString *)encodeToBase64String:(UIImage *)image {
    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}







- (IBAction)crs_OpenCamera:(id)sender {
   
    Cameradisplayer = @"Camera";
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    tempImageNSString = [self encodeToBase64String:_crs_Idprooftype.image];
    
    
    
}

- (IBAction)crs_OpenPhotoGallery:(id)sender {
 
    Cameradisplayer = @"Gallery";
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}



- (IBAction)crs_CancelForCameraView:(id)sender {
    self.crs_CameraView.hidden = YES;
}
- (IBAction)crs_Update2Action:(id)sender {
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    
    if ([self.crs_Country.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Country" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        return;
    }
    
    else if ([self.crs_FirstName.text isEqualToString:@""])  {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter First Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        return;
    }
    
    else if ([self.crs_LastName.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Last Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        return;
    }
    
    else if ([self.crs_MobileNumber.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Mobile Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        return;
    }
    
    
    
    
    
    
    
    
    
    else if ([self.crs_emailadress.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Email Address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        return;
        
    }
    
    
    
    else if ([self.crs_DateOfBirth.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Date Of Birth" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        return;
        
    }
    
    else if ([self.crs_Nationality.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Nationality" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        return;
        
    }
    
    
    
    
    else if ([self.crs_PostCode.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Post code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        return;
        
    }
    
    
    
    else if ([self.crs_address1.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Address1" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        return;
        
    }
    
    
    
    
    else if ([self.crs_City.text isEqualToString:@""]){
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter City" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        return;
        
    }
    //    else if ([tempImageNSString isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Choose Iamge" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //        return;
    //
    //    }
    
    //imageView.image == nil
    
    //
    //    if (_crs_Idprooftype.image == nil) {
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Choose Image" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //        return;
    //
    //    }
    
    
    //    if (_crs_AddressProofImagePdf.image == nil) {
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Choose Image Or Pdf File" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //        return;
    //
    //    }
    //
    
    
    
    //
    //    else if ([self.crs_IdProofField.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select ID Proof Type" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //        return;
    //
    //    }
    //
    
    //
    //    else if ([self.crs_ExpiryDate.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Expiry Date" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //        return;
    //
    //    }
    
    //    else if ([self.crs_addressProofField.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Expiry Datekjkjkj" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //        return;
    //
    //    }
    //
    //    else if ([self.crs_NewIdnumber.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter ID Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //        return;
    //
    //    }
    //
    
    
    //
    //    else if ([self.crs_Country.text isEqualToString:@"ITALY"]){
    //
    //
    //        if ([self.crs_NewIdnumber.text isEqualToString:@""]) {
    //            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Codice Fiscale " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //            [alert show];
    //            return;
    //        }
    //
    //
    //        else if (self.crs_NewIdnumber.text.length <16){
    //
    //            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Codice Fiscale" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //            [alert show];
    //
    //            return;
    //
    //        }
    //
    //        else if (self.crs_NewIdnumber.text.length <16){
    //
    //            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter a Valid Codice Fiscale" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //            [alert show];
    //
    //            return;
    //
    //        }
    //
    //    }
    
    
    
    //    else if ([self.crs_Country.text isEqualToString:@"SWEDEN"]){
    //
    //
    //        if ([self.crs_NewIdnumber.text isEqualToString:@""]) {
    //
    //            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your National ID Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //            [alert show];
    //            return;
    //        }
    //
    //
    //        else if (self.crs_NewIdnumber.text.length <10)
    //
    //        {
    //
    //
    //
    //            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter a Valid National ID Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //            [alert show];
    //            return;
    //        }
    //    }
    
    
    
    
    
    //    else if ([self.crs_Country.text isEqualToString:@"DENMARK"]){
    //
    //
    //        if ([self.crs_NewIdnumber.text isEqualToString:@""]) {
    //
    //            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter CPR Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //            [alert show];
    //            return;
    //        }
    //
    //
    //        else if (self.crs_NewIdnumber.text.length <10){
    //
    //            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter a Valid CPR Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //            [alert show];
    //            return;
    //        }
    //
    //    }
    
    
    
    
    //    else if ([self.crs_Country.text isEqualToString:@"SPAIN"]){
    //
    //
    //        if ([self.crs_NewIdnumber.text isEqualToString:@""]) {
    //
    //            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please Enter NIE/NIF Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //            [alert show];
    //            return;
    //        }
    //
    //        else if (self.crs_NewIdnumber.text.length <8&&self.crs_NewIdnumber.text.length <9)
    //
    //        {
    //
    //            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter a Valid NIE/NIF Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //            [alert show];
    //            return;
    //        }
    //
    //
    //
    //
    //
    //    }
    
    
    
    
    
    
    
    
    
    
    [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    
    NSURL * url;
    
    if ([_crs_Comparsion isEqualToString:@"UpadteProfilePk"]) {
        
         url = [NSURL URLWithString:Crosspay_CrosspayPakistanUpadtae];
        
       
        
        
        
    }
    
    else{
        
        
        
       
        
         url  = [NSURL URLWithString:Crosspay_UpdateProfile];
        
        
        
        
        
        
        
    }
    
    
    
    
   
    
    
    
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
     [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
    [mapData setObject:self.crs_Country.text forKey:@"country"];
    [mapData setObject:self.crs_FirstName.text forKey:@"firstname"];
    [mapData setObject:self.crs_MiddleName.text forKey:@"middlename"];
    [mapData setObject:self.crs_LastName.text forKey:@"lastname"];
    NSString * Hypen = @"-";
    NSString *combined = [NSString stringWithFormat:@"%@%@%@",self.crs_IsadCode.text,Hypen,self.crs_MobileNumber.text];
    
    NSLog(@"Hello There %@",combined);
    
    [mapData setObject:combined forKey:@"mobile"];
    [mapData setObject:self.crs_emailadress.text forKey:@"email"];
    [mapData setObject:Gender forKey:@"gender"];
    [mapData setObject:self.crs_DateOfBirth.text forKey:@"dateofbirth"];
    [mapData setObject:self.crs_PostCode.text forKey:@"pincode"];
    [mapData setObject:self.crs_address1.text forKey:@"Address"];
    [mapData setObject:self.crs_address2.text forKey:@"Address2"];
    
    [mapData setObject:self.crs_City.text forKey:@"city"];
    [mapData setObject:self.crs_Nationality.text forKey:@"Nationality"];
    
    [mapData setObject:@"" forKey:@"proof_of_address_file"];
    
    [mapData setObject:@"" forKey:@"photo_id_file"];
    
    [mapData setObject:@"" forKey:@"photo_id"];
    [mapData setObject:@"" forKey:@"proof_of_address"];
    [mapData setObject:@"" forKey:@"expiry_date"];
    [mapData setObject:@"" forKey:@"proof_of_address"];
   [mapData setObject:@"" forKey:@"photo_id_name"];
    
    
    @try {
        [mapData setObject:self.crs_NewIdnumber.text forKey:@"CusIdNumber"];
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    @try {
        [mapData setObject:date2 forKey:@"expiry_date"];
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    @try {
        [mapData setObject:IdType forKey:@"photo_id"];
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    
    
    
    //    if ([_RecieversCountry isEqualToString:@"PKR"]){
    //        @try {
    //            //            [mapData setObject:IdType forKey:@"photo_id"];
    //            //            [mapData setObject:PhotoCopy forKey:@"proof_of_address"];
    //            //            [mapData setObject:date1 forKey:@"expiry_date"];
    //            //            [mapData setObject:AdressProof forKey:@"proof_of_address"];
    //            //            [mapData setObject:IdDecription forKey:@"photo_id_name"];
    //            //            [mapData setObject:ToBackendImageString forKey:@"photo_id_file"];
    //            //            [mapData setObject:AddressProofPdf forKey:@"proof_of_address_file"];
    //        }
    //        @catch (NSException * e) {
    //            NSLog(@"Exception: %@", e);
    //        }
    //        @finally {
    //            NSLog(@"finally");
    //        }
    //
    //
    //    }
    
    
    
    // [mapData setObject:self.crs_PakistanIdNumber forKey:@"CusIdNumber"];
    [mapData setObject:self.crs_IsadCode.text forKey:@"countrycode"];
    //    [mapData setObject:IdType forKey:@"photo_id"];
    //    [mapData setObject:PhotoCopy forKey:@"proof_of_address"];
    //    [mapData setObject:date1 forKey:@"expiry_date"];
    //    [mapData setObject:AdressProof forKey:@"proof_of_address"];
    [mapData setObject:UserCatogory forKey:@"usercategory"];
    [mapData setObject:CreatedOn forKey:@"createdon"];
    //[mapData setObject:IdDecription forKey:@"photo_id_name"];
    // [mapData setObject:IdType forKey:@"Idtype"];
    
    
    //    CGSize imagsize=CGSizeMake(150,150);
    //    UIImage *convertimage= [self imageWithImage:self.crs_Idprooftype.image convertToSize:imagsize];
    //    NSString *tempImageNSString = [self encodeToBase64String:convertimage];
    //    NSLog(@"My Image%@",tempImageNSString);
    //    ToBackendImageString = [NSString stringWithFormat:@"%@%@",@"data:image/png;base64,",tempImageNSString];
    //
    //    NSLog(@"Hello My Base 64 Image is %@",ToBackendImageString);
    //    [mapData setObject:ToBackendImageString forKey:@"photo_id_file"];
    //
    //
    //
    //
    //    CGSize imagsize1 =CGSizeMake(150,150);
    //    UIImage *convertimage1= [self imageWithImage:self.crs_AddressProofImagePdf.image convertToSize:imagsize1];
    //    tempImageNSString1 = [self encodeToBase64String:convertimage1];
    //    NSLog(@"My Image%@",tempImageNSString1);
    //    AddressProofPdf = [NSString stringWithFormat:@"%@%@",@"data:application/pdf;base64,",tempImageNSString1];
    //
    //    NSLog(@"Hello My Base 64 Image is %@",AddressProofPdf);
    //    [mapData setObject:AddressProofPdf forKey:@"proof_of_address_file"];
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
            
            NSLog(@"%@", [json valueForKey:@"message"]);
            
            if ([[json valueForKey:@"status"]isEqualToString:@"200"]) {
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
                HomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewControllerSID"];;
                
                [self.navigationController pushViewController:viewController animated:YES];
                
                
            }
            else{
                
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                
                
                
                
            }
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
    
    
    
}

- (IBAction)crs_PakistanView:(id)sender {
   
    
}


-(void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentsAtURLs:(NSArray<NSURL *> *)urls
{
    if ([PdfReader isEqualToString:@"FirstPdf"]) {
        if (controller.documentPickerMode==UIDocumentPickerModeImport) {
            NSString * GalleryImage = [NSString stringWithFormat:@"%@",[urls objectAtIndex:0]];
            NSArray * ImagesGalleruArray = [GalleryImage componentsSeparatedByString:@"/"];
            NSString * Imagepath = [ImagesGalleruArray lastObject];
            
            _crs_addressProofField.text = Imagepath;
            NSData * Bytes = [[NSData alloc]initWithContentsOfURL:[urls objectAtIndex:0]];
            PDFString = [Bytes base64EncodedStringWithOptions:0];
            NSLog(@"Hi My pdf is %@",PDFString);
            self.crs_AddressProofImagePdf.image = [UIImage imageNamed:@"pdf.png"];
            
            
        }
    }
    else if ([PdfReader isEqualToString:@"SecondPdf"]){
        
        if (controller.documentPickerMode==UIDocumentPickerModeImport) {
            NSString * GalleryImage = [NSString stringWithFormat:@"%@",[urls objectAtIndex:0]];
            NSArray * ImagesGalleruArray = [GalleryImage componentsSeparatedByString:@"/"];
            NSString * Imagepath = [ImagesGalleruArray lastObject];
            
            _crs_ChhosseFile.text = Imagepath;
            NSData * Bytes = [[NSData alloc]initWithContentsOfURL:[urls objectAtIndex:0]];
            PDFString1 = [Bytes base64EncodedStringWithOptions:0];
            NSLog(@"Hi My pdf is %@",PDFString1);
            self.crs_Idprooftype.image = [UIImage imageNamed:@"pdf.png"];
            
            
        }
    }
   
    
    
    
    
}

-(void)documentPicker1:(UIDocumentPickerViewController *)controller didPickDocumentsAtURLs:(NSArray<NSURL *> *)urls
{
    
    if ([PdfReader isEqualToString:@"FirstPdf"]) {
        if (controller.documentPickerMode==UIDocumentPickerModeImport) {
            NSString * GalleryImage = [NSString stringWithFormat:@"%@",[urls objectAtIndex:0]];
            NSArray * ImagesGalleruArray = [GalleryImage componentsSeparatedByString:@"/"];
            NSString * Imagepath = [ImagesGalleruArray lastObject];
            
            _crs_addressProofField.text = Imagepath;
            NSData * Bytes = [[NSData alloc]initWithContentsOfURL:[urls objectAtIndex:0]];
            PDFString = [Bytes base64EncodedStringWithOptions:0];
            NSLog(@"Hi My pdf is %@",PDFString);
            self.crs_AddressProofImagePdf.image = [UIImage imageNamed:@"pdf.png"];
            
            
        }
    }
    else if ([PdfReader isEqualToString:@"SecondPdf"]){
        
        if (controller.documentPickerMode==UIDocumentPickerModeImport) {
            NSString * GalleryImage = [NSString stringWithFormat:@"%@",[urls objectAtIndex:0]];
            NSArray * ImagesGalleruArray = [GalleryImage componentsSeparatedByString:@"/"];
            NSString * Imagepath = [ImagesGalleruArray lastObject];
            
            _crs_ChhosseFile.text = Imagepath;
            NSData * Bytes = [[NSData alloc]initWithContentsOfURL:[urls objectAtIndex:0]];
            PDFString1 = [Bytes base64EncodedStringWithOptions:0];
            NSLog(@"Hi My pdf is %@",PDFString1);
            self.crs_Idprooftype.image = [UIImage imageNamed:@"pdf.png"];
            
            
        }
    }
    
    
    
}

- (IBAction)crs_CameraPak:(id)sender {
    AddressProofCamera = @"Camera";
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    tempImageNSString = [self encodeToBase64String:_crs_Idprooftype.image];
    
}

- (IBAction)crs_Gallerypak:(id)sender {
    AddressProofCamera = @"Gallery";
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    if (![self.crs_addressProofField.text isEqualToString:@""]) {
        self.crs_CameraView2.hidden = YES;
    }
}

- (IBAction)crs_PdfPak:(id)sender {
 
    PdfReader = @"FirstPdf";
    AddressProofCamera = @"Pdf";
    UIDocumentPickerViewController *documentPicker = [[UIDocumentPickerViewController
                                                       alloc] initWithDocumentTypes:@[@"public.composite-content"]
                                                      
                                                      inMode:UIDocumentPickerModeImport];
    documentPicker.delegate = self;
    
    documentPicker.modalPresentationStyle =
    UIModalPresentationFormSheet;
    [self presentViewController:documentPicker animated:YES completion:nil];
    if (![self.crs_addressProofField.text isEqualToString:@""]) {
        self.crs_CameraView2.hidden = YES;
    }
    NSLog(@"Hello Sai Kiran Kunchala You Have Opted For Pdf ");
    
}


- (IBAction)crs_PakCancel:(id)sender {
    self.crs_CameraView2.hidden = YES;
    
}



- (UIImage *)imageWithImage:(UIImage *)image scaledToFillSize:(CGSize)size
{
    CGFloat scale = MAX(size.width/image.size.width, size.height/image.size.height);
    CGFloat width = image.size.width * scale;
    CGFloat height = image.size.height * scale;
    CGRect imageRect = CGRectMake((size.width - width)/2.0f,
                                  (size.height - height)/2.0f,
                                  width,
                                  height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [image drawInRect:imageRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
//    NSLog(@"Hi My New Length is %@",[newImage.size]);
    
}

- (IBAction)PDF:(id)sender {
    
     Cameradisplayer = @"Lion";
    PdfReader = @"SecondPdf";
    UIDocumentPickerViewController *documentPicker = [[UIDocumentPickerViewController
                                                       alloc] initWithDocumentTypes:@[@"public.composite-content"]
                                                      
                                                      inMode:UIDocumentPickerModeImport];
    documentPicker.delegate = self;
    
    documentPicker.modalPresentationStyle =
    UIModalPresentationFormSheet;
    [self presentViewController:documentPicker animated:YES completion:nil];
    if (![self.crs_ChhosseFile.text isEqualToString:@""]) {
        self.crs_CameraView.hidden = YES;
    }
    NSLog(@"Hello Sai Kiran Kunchala You Have Opted For Pdf ");
}
@end

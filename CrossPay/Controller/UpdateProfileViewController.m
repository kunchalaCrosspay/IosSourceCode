
//
//  UpdateProfileViewController.h
//  Payment
//
//  Created by Saikiran on 8/12/17.
//  Copyright © 2017 Crosspay. All rights reserved.
//

#import "UpdateProfileViewController.h"
#import "HomeViewController.h"
#import "HistoryViewController.h"
#import "notificationViewController.h"
#import "profileViewController.h"
#import "UpdateProfile.h"
#import "orginalUpdateProfileViewController.h"
#import "Crs_sharedvariable.h"
#import "AddreciverTableViewCell.h"
#import "TransactionViewController.h"
#import "SettingsViewController.h"
#import "RecieverDetailedViewController.h"
#import "RecieverTotaldetailedPageViewController.h"
#import "MBProgressHUD.h"
#import "GlobalUrlsFile.h"
#import "UpdateProfileNewViewController.h"
//#import <Google/Analytics.h>
#import "crs_sharedmethods.h"
#import "UpDateProfileLatestViewController.h"
#import "NewHomeViewController.h"
@interface UpdateProfileViewController ()
{
    NSMutableArray * Crs_Addreviver;
    NSString *userCtegoary;
    NSMutableArray * crs_AboutMeDetails;
    NSMutableArray * crs_ransactionDetails;
    NSString * CatgoryId;
    NSString * Country;
}

@end

@implementation UpdateProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.crs_AlertView.hidden = YES;
    
    
    self.Crs_UpdateAlert.hidden = YES;

    [self CheckCateogory];
  
 
    
    
    self.Crs_Profile.layer.cornerRadius = self.Crs_Profile.frame.size.height/2;
    self.Crs_Profile.clipsToBounds = YES;
    self.Crs_Profile.layer.borderColor = [UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0].CGColor;
    self.Crs_Profile.layer.borderWidth = 1.0f;

    
    self.Crs_Scrollview.contentSize = CGSizeMake(self.view.frame.size.width-30, 800);
    self.Crs_Lbl_recivers_bgcolor.hidden=YES;
    self.Crs_view_receiver.hidden=YES;
   
    
    
    
    
    
    self.crs_ZipCode.textColor = [UIColor whiteColor];
    self.crs_FirstName.textColor = [UIColor whiteColor];
    self.crs_LastName.textColor = [UIColor whiteColor];
    self.crs_IdProofType.textColor = [UIColor whiteColor];
    self.crs_Adress1.textColor = [UIColor whiteColor];
    self.crs_Country.textColor = [UIColor whiteColor];
    self.crs_Email.textColor = [UIColor whiteColor];
    self.crs_City.textColor = [UIColor whiteColor];
    self.crs_IssuedBy.textColor = [UIColor whiteColor];
    self.crs_ExpireDtae.textColor =[UIColor whiteColor];
    self.crs_Gender.textColor = [UIColor whiteColor];
    self.crs_DateOfBirth.textColor = [UIColor whiteColor];
    self.crs_Adress1.textColor = [UIColor whiteColor];
    self.crs_MiddleName.textColor = [UIColor whiteColor];
    self.crs_MobileNumber.textColor = [UIColor whiteColor];
    self.crs_PhoneNumber.textColor = [UIColor whiteColor];
    self.crs_Address2.textColor = [UIColor whiteColor];
    self.crs_state.textColor = [UIColor whiteColor];
    self.rs_Nationality.textColor = [UIColor whiteColor];
    self.crs_IdNumber.textColor = [UIColor whiteColor];
    
    
    
    
    
    
    
    
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    
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
                self.crs_PhoneNumber.text = [ crs_AboutMeDetails valueForKey:@"phone_num"];
                self.crs_MobileNumber.text = [crs_AboutMeDetails valueForKey:@"mobile"];
                self.crs_IssuedBy.text = [crs_AboutMeDetails valueForKey:@"issued_by"];
                self.crs_Email.text =   [crs_AboutMeDetails valueForKey:@"email"];
                

//                NSString *myString = [crs_AboutMeDetails valueForKey:@"dob"];;// @"2012-11-22 10:19:04";
//                NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
//                dateFormatter.dateFormat = @"yyyy-MM-dd";
//                NSDate *yourDate = [dateFormatter dateFromString:myString];
//                dateFormatter.dateFormat = @"dd-MM-yyyy";
//                //NSLog(@"%@",[dateFormatter stringFromDate:yourDate]);
//
//                
                
                self.crs_DateOfBirth.text = [crs_AboutMeDetails valueForKey:@"dob"]; //[crs_AboutMeDetails valueForKey:@"dob"];
                
                
                
                  self.crs_IdNumber.text = [crs_AboutMeDetails valueForKey:@"customer_id"];
                self.crs_City.text = [crs_AboutMeDetails valueForKey:@"city"];
                self.crs_Country.text = [crs_AboutMeDetails valueForKey:@"country"];
                self.crs_IdProofType.text = [crs_AboutMeDetails valueForKey:@"id_proof"];
                self.crs_Adress1.text = [crs_AboutMeDetails valueForKey:@"address1"];
                self.crs_state.text = [crs_AboutMeDetails valueForKey:@"state"];
                self.crs_Gender.text = [crs_AboutMeDetails valueForKey:@"gender"];
                self.rs_Nationality.text = [crs_AboutMeDetails valueForKey:@"nationality"];
                self.crs_ProfileViewCountry.text = [crs_AboutMeDetails valueForKey:@"country"];
                self.crs_ProfileViewEmailId.text = [crs_AboutMeDetails valueForKey:@"email"];
                self.crs_ZipCode.text = [crs_AboutMeDetails valueForKey:@"pincode"];
                self.crs_Address2.text = [crs_AboutMeDetails valueForKey:@"address2"];
                NSString * fullName = [NSString stringWithFormat:@"%@ %@ %@ ",[ crs_AboutMeDetails valueForKey:@"first_name"],[ crs_AboutMeDetails valueForKey:@"middle_name"],[ crs_AboutMeDetails valueForKey:@"last_name"]];
                
                self.crs_ProfileViewName.text = fullName;

                [Crs_sharedvariable sharedMySingleton].crs_Name = fullName;
                
                [Crs_sharedvariable sharedMySingleton].crs_EmailId =  [crs_AboutMeDetails valueForKey:@"email"];
                
    Country = [crs_AboutMeDetails valueForKey:@"country"];
                if ([Country isEqualToString:@"UNITED STATES"]||[Country isEqualToString:@"HONG KONG"]||[Country isEqualToString:@"GHANA"]) {
                    self.crs_UpdateprofileButtonOutlet.hidden = YES;
                    self.crs_AddRecieverButtonOutlet.hidden = YES;
                    
                    self.crs_HistoryLabel.hidden = YES;
                    self.crs_HistoryButtonoutlet.hidden = YES;
                    [self.crs_ProfileBottomOutlet setFrame:CGRectMake(165,8,25,25)];
                     [self.crs_ProfileLabel setFrame:CGRectMake(162,22,60,50)];
                    
                   //[_crs_PaySecureout setFrame:CGRectMake(120, 360, 120, 30)];
                }
                else{
                    
                    self.crs_UpdateprofileButtonOutlet.hidden = NO;
                    self.crs_AddRecieverButtonOutlet.hidden = NO;
                    
                    self.crs_HistoryLabel.hidden = NO;
                    self.crs_HistoryButtonoutlet.hidden = NO;
                }
                
                
                
                
                if ([self.crs_Country.text isEqualToString:@"UNITED KINGDOM"]||[self.crs_Country.text isEqualToString:@"NORWAY"]||[self.crs_Country.text isEqualToString:@"GERMANY"]||[self.crs_Country.text isEqualToString:@"FRANCE"]||[self.crs_Country.text isEqualToString:@"NETHERLANDS"]||[self.crs_Country.text isEqualToString:@"IRELAND"]||[self.crs_Country.text isEqualToString:@"AUSTRIA"]||[self.crs_Country.text isEqualToString:@"BELGIUM"]) {
                    self.crs_Idnumber.hidden = YES;
                    self.crs_IdNumber.hidden = YES;
                }
                
                
                
                
                else if ([self.crs_Country.text isEqualToString:@"SWEDEN"]){
                    
                    
                     self.crs_IdNumber.text = [crs_AboutMeDetails valueForKey:@"customer_id"];
                    
                    self.crs_Idnumber.text = @"ID Number";
                    
                }
                
                
                
                else if ([self.crs_Country.text isEqualToString:@"ITALY"]){
                    
                     self.crs_IdNumber.text = [crs_AboutMeDetails valueForKey:@"customer_id"];
                    
                    self.crs_Idnumber.text = @"ID Number";
                }
                
                else if ([self.crs_Country.text isEqualToString:@"SPAIN"]){
                    
                    
                    
                     self.crs_IdNumber.text = [crs_AboutMeDetails valueForKey:@"customer_id"];
                    
                     self.crs_Idnumber.text = @"ID Number";
                }
                
                else{
                    
                    
                     self.crs_IdNumber.text = [crs_AboutMeDetails valueForKey:@"customer_id"];
                     self.crs_Idnumber.text = @"ID Number";
                }
                
                
                
                
                
                
               
                
            }
            else{
                
                
                
                
            }
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
 [self reciverdetails];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    
    
    
    
    return  Crs_Addreviver.count;
    
    
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}



-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    AddreciverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddReciverSID"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"AddReciverSID"];
    }
    
    
    
    
    
    cell.crs_AddRecieverIamge.layer.cornerRadius =     cell.crs_AddRecieverIamge.frame.size.height/2;
    cell.crs_AddRecieverIamge.clipsToBounds = YES;
    cell.crs_AddRecieverIamge.layer.borderColor = [UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0].CGColor;
    cell.crs_AddRecieverIamge.layer.borderWidth = 1.0f;

    

    
    cell.Crs_name.text=[[Crs_Addreviver objectAtIndex:(Crs_Addreviver.count - indexPath.row - 1)]valueForKey:@"call_name"];
    
    
    NSString * Acountnumber=[[Crs_Addreviver objectAtIndex:(Crs_Addreviver.count - indexPath.row - 1)]valueForKey:@"account_num"];
   
    
    
    
    
    
    if ([Acountnumber isEqualToString:@"null"]||[Acountnumber isEqualToString:@""]||[Acountnumber length] == 0) {
        NSLog(@"Venkatesh");
        
         cell.Crs_Account_no.text = [[Crs_Addreviver objectAtIndex:(Crs_Addreviver.count - indexPath.row - 1)]valueForKey:@"country"]; ;
        
        
        
    }
    else{
        
        
        cell.Crs_Account_no.text = [NSString stringWithFormat:@"A/C : %@",Acountnumber];
        
        
        
        
    }
    
    
    
    //NSString * image=[[Crs_Addreviver objectAtIndex:(Crs_Addreviver.count - indexPath.row - 1)]valueForKey:@"image"];
    
    //cell.crs_AddRecieverIamge.image = [self decodeBase64ToImage:image];
    
    
    
//    
//    NSString * image=[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - indexPath.row - 1)]valueForKey:@"image"];
//
//    cell.crs_SelectRecieverImage.image = [self decodeBase64ToImage:image];
//
//    
    
    
    //tableView.tableFooterView=[[UIView alloc]init];
    cell.crs_UpdateAction.tag = indexPath.row;
    [cell.crs_UpdateAction addTarget:self action:@selector(Bookaction:) forControlEvents:UIControlEventTouchUpInside];

    
    return cell;
    
    
    
}
-(UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

- (IBAction)Bookaction:(UIButton*)sender
{
   
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    NSString * countrys = [[Crs_Addreviver objectAtIndex:(Crs_Addreviver.count - sender.tag - 1)]valueForKey:@"country"];
    if ([countrys isEqualToString:@"VIETNAM"]) {
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"If any of the above details are incorrect, please email info@crosspaymt.com or call              +44 (0) 203 096 2255 " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        return ;
    }
    
    int i = 0 ;
    
    NSString *tagString = [NSString stringWithFormat:@"%d",(int)sender.tag];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    profileViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"ProfileViewControllerSID"];;
    viewController.crs_Comparsion = @"update";
    
    viewController.crs_UpdateRecieverDetails = [Crs_Addreviver objectAtIndex:(Crs_Addreviver.count - sender.tag - 1)];
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    

    
    
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    


    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    RecieverTotaldetailedPageViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"RecieverTotaldetailedPageViewControllerSID"];
    viewController.crs_recieverProfileDetails = [Crs_Addreviver objectAtIndex:(Crs_Addreviver.count - indexPath.row - 1)];
    
    //viewController.Crs_Comparsion  = @"proceed";
    [self.navigationController pushViewController:viewController animated:YES];


    

    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Crs_aboutme_Action:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    self.Crs_Receivers.backgroundColor = [UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0];
    
    
    self.Crs_Aboutme.backgroundColor = [UIColor colorWithRed:20.0/255.0 green:119.0/255.0 blue:112.0/255.0 alpha:1.0];
    
    self.Crs_Lbl_recivers_bgcolor.hidden=YES;
    self.Crs_Lbl_aboutme_bgcolor.hidden=NO;
    
    self.Crs_view_receiver.hidden=YES;
    self.Crs_view_aboutme.hidden=NO;
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
}

- (IBAction)Crs_Recivers_Action:(id)sender {

    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    [self reciverdetails];

    
    
    
    
    
}

-(void)reciverdetails
{
    
    
    self.Crs_Aboutme.backgroundColor = [UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0];
    
    
    self.Crs_Receivers.backgroundColor = [UIColor colorWithRed:20.0/255.0 green:119.0/255.0 blue:112.0/255.0 alpha:1.0];
    
    
    self.Crs_Lbl_recivers_bgcolor.hidden=NO;
    self.Crs_Lbl_aboutme_bgcolor.hidden=YES;
    
    self.Crs_view_receiver.hidden=NO;
    self.Crs_view_aboutme.hidden=YES;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_BenificiaryView];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    
    
    //    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
    
    
    
    [mapData setObject:[ Crs_sharedvariable sharedMySingleton] .crs_userId forKey:@"user_id"];
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
            
            NSLog(@"%@", [json valueForKey:@"message"]);
            //message = [json valueForKey:@"message"];
            if ([[json valueForKey:@"status"]isEqualToString:@"200"])
                
                
            {
                
                
                
                Crs_Addreviver=[json valueForKey:@"data"];
                
                [self.Crs_tableview_Addreciver reloadData];
                
                
                
                
            }
            else{
                
                
                
                
            }
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
}







- (IBAction)Crs_Opencamera:(id)sender {
    
    
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
                    //#if 0
                    //                    UzysAppearanceConfig *appearanceConfig = [[UzysAppearanceConfig alloc] init];
                    //                    appearanceConfig.finishSelectionButtonColor = [UIColor blueColor];
                    //                    appearanceConfig.assetsGroupSelectedImageName = @"checker.png";
                    //                    [UzysAssetsPickerController setUpAppearanceConfig:appearanceConfig];
                    //#endif
                    //
                    //                    UzysAssetsPickerController *picker = [[UzysAssetsPickerController alloc] init];
                    //                    picker.delegate = self;
                    //
                    //                    picker.maximumNumberOfSelectionVideo = 0;
                    //                    picker.maximumNumberOfSelectionPhoto = 10;
                    //
                    //                    [self presentViewController:picker animated:YES completion:^{
                    //
                    //                    }];
                    //
                    
                    
                    
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
    self.Crs_Profile.image = image;
    
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



- (IBAction)crs_OkZction:(id)sender {
//    
//    self.crs_AlertView.hidden = YES;
//    
    
}

- (IBAction)crs_BackAction:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    [self .navigationController popViewControllerAnimated:YES];
    
    
}

- (IBAction)settings:(id)sender {
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    SettingsViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewControllerSid"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    

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

- (IBAction)crs_Home:(id)sender {
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NewHomeViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
    
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

- (IBAction)crs_UpdateProfile:(id)sender {
    
//    self.Crs_UpdateAlert.hidden = NO;
  
    
    
    if ([CatgoryId isEqualToString:@"2"])
        
        
    {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UpdateProfileNewViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"upDateProfileSID"];
        [self.navigationController pushViewController:viewController animated:YES];
        // viewController.crs_ProfileDetai[self.navigationController pushViewController:viewController animated:YES];
        NSLog(@"Hi There");
        self.Crs_UpdateAlert.hidden = YES;
        
        
    }
    else{
        // create an alert controller with the appearance of an alert view
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Crosspay" message:@"In order to update any fields that are already updated/populated, please " preferredStyle:UIAlertControllerStyleAlert];
        
        // create the actions handled by each button
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Email us at :info@crosspaymt.com" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSString *url = [URLEMail stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
            [[UIApplication sharedApplication]  openURL: [NSURL URLWithString: url]];
            
            NSLog(@"User said DEFO!");
        }];
        
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Call us at:+44 (0) 203 096 2255 " style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",@"4402030962255"]]];
            NSLog(@"User said NEVER!");
        }];
        
        
        UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"User said NEVER!");
        }];
        
        // add actions to our alert
        [alert addAction:action1];
        [alert addAction:action2];
        [alert addAction:action3];
        // display the alert controller
        [self presentViewController:alert animated:YES completion:nil];
        
        self.Crs_UpdateAlert.hidden = YES;
        
    }
    
    
    
   
    
    
    
}

- (IBAction)crs_AddReciever:(id)sender {
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   profileViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"ProfileViewControllerSID"];;
    viewController.crs_Comparsion = @"add";
    
    [self.navigationController pushViewController:viewController animated:YES];
    

}




- (IBAction)crs_OkActionForUpdate:(id)sender {
    self.Crs_UpdateAlert.hidden = YES;
}

- (IBAction)crs_CallMe:(id)sender {
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",@"4402030962255"]]];
}

- (IBAction)crs_EmailClick:(id)sender {
    
    NSString *url = [URLEMail stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
    [[UIApplication sharedApplication]  openURL: [NSURL URLWithString: url]];
}

- (IBAction)crs_Closeaction:(id)sender {
     self.Crs_UpdateAlert.hidden = YES;
}
-(void)CheckCateogory
{
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    
    // [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_CatgoryCheck];
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
            //[MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"error %@",error);
            NSLog(@"data %@",data);
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json );
            NSLog(@"%@", [json valueForKey:@"message"]);
            //message = [json valueForKey:@"message"];
            
            CatgoryId = [json valueForKey:@"usercategory"];
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}

@end

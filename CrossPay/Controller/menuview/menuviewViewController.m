//
//  menuviewViewController.m
//  Payment
//
//  Created by saikiran kunchala on 7/15/17.
//  Copyright © 2017 saikiran kunchala. All rights reserved.
//

#import "menuviewViewController.h"
#import "menuTableViewCell.h"
#import "popupViewController.h"
#import "LoginViewController.h"
#import "HomeViewController.h"
#import "profileViewController.h"
#import "HistoryViewController.h"
#import "notificationViewController.h"
#import "UpdateProfile.h"
#import "UpdateProfileViewController.h"
#import "Crs_sharedvariable.h"
#import "SettingsViewController.h"
#import "supportViewController.h"
#import "ReferalViewController.h"
#import "crs_sharedmethods.h"
#import "GlobalUrlsFile.h"
#import "Reachability.h"
#import "MBProgressHUD.h"
#import "TrustPilotViewController.h"
#import "CharityPayViewController.h"
#import "NewHomeViewController.h"
#import "CharityWebViewController.h"
@interface menuviewViewController ()

@end

@implementation menuviewViewController
{
    NSArray *Menuicon;

    NSString * UserCatgory;
    NSString * CHarityCountry;
    NSString * CatgoryId;
    NSString * userCatogoryMessage;
    NSString * ForOnlyUk;
    NSString * ReferalCode;
    NSString * Country;
    NSString * MyStatus;
    NSString * FirstName;
    NSString * MiddleName;
    NSString * LastName;
    NSString * FullName;
    NSString *iosReview;
    NSString * urlString;
    NSString * deviceCode;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self profileDetails];
    
    [self CheckCateogory];
    
    [self Referral];
    deviceCode = @"555";
    
    self.crs_profileImage.layer.cornerRadius = self.crs_profileImage.frame.size.height/2;
    self.crs_profileImage.clipsToBounds = YES;
    self.crs_profileImage.layer.borderColor = [UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0].CGColor;
    self.crs_profileImage.layer.borderWidth = 1.0f;
    

    
    self.Ary_Array_MenuItems=[[NSMutableArray alloc]initWithObjects:@"Home",@"Money Transfer",@"Giving",@"Profile",@"History",@"Settings",@"Support",@"Refer a Friend",@"Review",@"Logout", nil];

    Menuicon = [NSArray arrayWithObjects:@"home_1.png",@"kiran.png",@"love (1).png",@"profile_1.png",@"history_1.png",@"settings_1.png",@"support.png",@"side-menu-icon2.png",@"trust.png",@"logiut.png", nil];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    
   // FullName = [NSString stringWithFormat:@"%@%@%@,"];
//    self.crs_UserName.text = [Crs_sharedvariable sharedMySingleton].crs_Name;
//    self.crs_UserEmailId.text = [Crs_sharedvariable sharedMySingleton].crs_EmailId;
//
//    MiddleName = [NSString stringWithFormat:@"%@",MiddleName];
//    FullName = [NSString stringWithFormat:@"%@ %@",FirstName,LastName];
//    self.crs_UserName.text = FullName;
//    self.crs_UserEmailId.text = MiddleName;
//
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.Ary_Array_MenuItems.count;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}



-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    menuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MENU_CELL"];
    
    if (cell == nil)
    {
        cell = [[menuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                           reuseIdentifier:@"MENU_CELL"];
    }
    
    
    cell.menu_names.text=[self.Ary_Array_MenuItems objectAtIndex:indexPath.row];
    //
    
    cell.menu_icons.image = [UIImage imageNamed:[Menuicon objectAtIndex:indexPath.row]];
    
    
    
    
    
    //tableView.tableFooterView=[[UIView alloc]init];
    
    
    return cell;
    
    
    
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    
//    popupViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"popupViewControllerSID"];
//
//    [self addChildViewController:MenuViewControllerOBJ];
//    [MenuViewControllerOBJ didMoveToParentViewController:self];
//    MenuViewControllerOBJ.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
//    [self.view addSubview:MenuViewControllerOBJ.view];

    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
   

    
    
    switch (indexPath.row)
    {
        case 0:
        {
        
            
            if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                return ;
                
                
                
            }
          
            
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            
            NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
            
            [self.navigationController pushViewController:viewController animated:YES];
            
                       break;
        }
        case 1:
        {
            
            if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                return ;
                
                
                
            }
          
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
                HomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewControllerSID"];;
                
                [self.navigationController pushViewController:viewController animated:YES];
                
                
                break;
        
            
           
        }
            
        case 2:
        {
            
            if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                return ;
                
                
                
                
                
            }
         
            
            if ([UserCatgory isEqualToString:@""]) {
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:userCatogoryMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                return;
            }
            
            
            
            else if ([UserCatgory isEqualToString:@""]){
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:userCatogoryMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                return;
                
            }
            
            
            
            else if (([Country isEqualToString:@"UNITED KINGDOM"]&&[iosReview isEqualToString:@"2"])||[Country isEqualToString:@"UNITED STATES"]||[Country isEqualToString:@"HONG KONG"]||[Country isEqualToString:@"GERMANY"]){
              
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
                CharityPayViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityPayViewControllerSID"];;
                
                [self.navigationController pushViewController:viewController animated:YES];
                break;
                
                
            }
            
            
            else if ([Country isEqualToString:@"SPAIN"]&&[Country isEqualToString:@"DENMARK"]&&[Country isEqualToString:@"SWEDEN"]&&[Country isEqualToString:@"ITALY"]&&[Country isEqualToString:@"IRELAND"]&&[Country isEqualToString:@"NORWAY"]&&[Country isEqualToString:@"AUSTRIA"]&&[Country isEqualToString:@"FRANCE"]&&[Country isEqualToString:@"NETHERLANDS"]&&[Country isEqualToString:@"BELGIUM"]&&[Country isEqualToString:@"GERMANY"]&&[iosReview isEqualToString:@"1"]){
               
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"" message:@"Coming Soon" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                return;
            }
            
            
            
            
            else{
                
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"" message:@"Coming Soon" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                return;
                //break;
            }
           
        }
        case 3:
        {
            
            if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                return ;
                
                
                
            }
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            
            UpdateProfileViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"UpdateProfileViewControllerSID"];;
            
            [self.navigationController pushViewController:viewController animated:YES];
           
            
            break;
        }
        case 4:
        {
            
            if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                return ;
                
                
                
            }
            
            if ([Country isEqualToString:@"UNITED STATES"]||[Country isEqualToString:@"HONG KONG"]) {
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Money Transfer currently not available in your location" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                return;
            } else {
               
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
                HistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"historyViewControllerSID"];;
                viewController.crs_BackToHome = @"Back";
                [self.navigationController pushViewController:viewController animated:YES];
                
                
                
                break;
            }
            
        }
        case 5:
        {
            
            if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                return ;
                
                
                
            }
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            
            SettingsViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewControllerSid"];;
            
            [self.navigationController pushViewController:viewController animated:YES];
           
          
            
            break;
            
        }
            
        case 6:
        {
            
            
            if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                return ;
                
                
                
            }
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            
            supportViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"supportViewControllerSID"];;
            
            [self.navigationController pushViewController:viewController animated:YES];
            
           
            
            
            break;
            
        }
        case 7:
        {
          
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            
            ReferalViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"ReferalViewControllerSID"];;
            viewController.referalCode = ReferalCode;
            viewController.referalstatus = MyStatus;
            viewController.ReferalCountry = Country;
            [self.navigationController pushViewController:viewController animated:YES];
           
            
         
            break;
            
            
           
        }
            
        case 8:
        {
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            
            TrustPilotViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"TrustViewControllerSID"];;
            
            [self.navigationController pushViewController:viewController animated:YES];
            
            
            break;
            
            
            
        }
            
            
        case 9:
        {
            
            
            if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                return ;
                
                
                
            }
            
            popupViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"popupViewControllerSID"];
            
                [self addChildViewController:MenuViewControllerOBJ];
                [MenuViewControllerOBJ didMoveToParentViewController:self];
                MenuViewControllerOBJ.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
                [self.view addSubview:MenuViewControllerOBJ.view];
            break;
        }

    }
    
    
    
    
    
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Removemenu_Action:(id)sender {
    
    
    
    [self.view removeFromSuperview];
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
            NSLog(@"MY MESSAGE      %@", [json valueForKey:@"user_category_messgae"]);
            //message = [json valueForKey:@"message"];
            if ([[json valueForKey:@"status"] isEqualToString:@"200"]) {
                CatgoryId = [json valueForKey:@"usercategory"];
                userCatogoryMessage = [json valueForKey:@"user_category_messgae"];
                UserCatgory = [json valueForKey:@"usercategory"];
                NSLog(@"My Catogory is@@@%@",CatgoryId);
                ForOnlyUk = [json valueForKey:@"country"];
                
                
            }
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}

-(void)profileDetails
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
            NSLog(@"%@", [json valueForKey:@"message"]);
              NSLog(@"%@", [json valueForKey:@"country"]);
            //message = [json valueForKey:@"message"];
            if ([[json valueForKey:@"status"]isEqualToString:@"200"])
                
            {
                
                
                urlString = [NSString stringWithFormat:@"http://54.200.111.119:6099/CrosspayCustomer/charitypay?username=%@&devicecode=%@&firstname=%@&mobile=%@&category=%@&usercountry=%@",[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"user_id"],deviceCode,[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"first_name"],[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"mobile"],[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"usercategory"],[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"countryisocode2"]];
                
                NSLog(@"Helo My Url is %@",self->urlString);
                
                
                  NSMutableArray * crs_ProfileNameArray = [[json valueForKey:@"data"] objectAtIndex:0];
               
                
                
                FullName = [crs_ProfileNameArray valueForKey:@"name"];
                self.crs_UserName.text = FullName;
              MiddleName =  [crs_ProfileNameArray valueForKey:@"email"];
                self.crs_UserEmailId.text = MiddleName;
                Country = [ crs_ProfileNameArray valueForKey:@"country"];
                
                iosReview = [NSString stringWithFormat:@"%@", [ crs_ProfileNameArray valueForKey:@"IOSREVIEW"]];
                NSLog(@"MY Country%@",Country);
            }
            
            else{
                
                
                
                
            }
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}
-(void)ReferalCode
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
    NSURL *url = [NSURL URLWithString:Crosspay_ReferalCode];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"UserId"];
    
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
            NSLog(@"My Referal    %@", [json valueForKey:@"ref_code"]);
            ReferalCode = [json valueForKey:@"ref_code"];
            NSLog(@"%@", [json valueForKey:@"country"]);
            
            //message = [json valueForKey:@"message"];
            if ([[json valueForKey:@"status"]isEqualToString:@"200"])
                
            {
                
            }
            
            else{
                
                
                
                
            }
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}
-(void)Referral
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
    NSURL *url = [NSURL URLWithString:Crosspay_ReferalCode];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"UserId"];
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
            NSLog(@"My status Is %@",[json valueForKey:@"status"]);
            MyStatus = [json valueForKey:@"status"];
            //message = [json valueForKey:@"message"];
            if ([[json valueForKey:@"status"] isEqualToString:@"200"]) {
              ReferalCode = [json valueForKey:@"ref_code"];
              
                
                
            }
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}

@end

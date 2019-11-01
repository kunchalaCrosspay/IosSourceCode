//
//  NewHomeViewController.m
//  CrossPay
//
//  Created by sai kiran  on 1/9/19.
//  Copyright © 2019 CrossPay. All rights reserved.
//

#import "NewHomeViewController.h"
#import "HomeViewController.h"
#import "menuviewViewController.h"
#import "AddRecieverPage.h"
#import "profileViewController.h"
#import "SelectRecieverViewController.h"
#import "Crs_sharedvariable.h"
#import "crs_sharedmethods.h"
#import "CountryListTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"
#import "GlobalUrlsFile.h"
#import "FingerPrintViewController.h"
//#import <Google/Analytics.h>
#import "RecieverDetailedViewController.h"
#import "UpdateProfileNewViewController.h"
#import "CharityPayViewController.h"
#import "CharityWebViewController.h"
@interface NewHomeViewController ()
{
    NSString * CHarityCountry;
    NSString *iosReview;
    NSString *MyUser;
    NSMutableDictionary * crs_PassingToWebview;
    NSString * UrlSTring;
    NSString * UserId;
    NSString * CoustmerId;
    NSString * firstName;
    NSString * mobile;
    NSString * devieCode;
    NSMutableArray * CharityNameArray;
    NSString * CountryCode;
    NSString * CharityStatus;
    
}
@end

@implementation NewHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.crs_CharityImage.hidden = YES;
//    self.crs_CharityOut.hidden = YES;
    
    [self profileDetails];
    
    CharityStatus = @"200";
    devieCode = @"IOS";
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Crs_CharityAction:(id)sender {
    
    [self CharityDetails];

    
  

}

- (IBAction)crs_HomeAction:(id)sender {
//    if ([CHarityCountry isEqualToString:@"HONG KONG"]||[CHarityCountry isEqualToString:@"UNITED STATES"]) {
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Money transfer is not currently available in your location" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//    }
   
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
    NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewControllerSID"];;
        
        [self.navigationController pushViewController:viewController animated:YES];
  
   
}

- (IBAction)crs_menuAction:(id)sender {
    
    NewHomeViewController * MenuViewControllerOBJ = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"MenuViewControllerSID"];
    
    
    
    [self addChildViewController:MenuViewControllerOBJ];
    [MenuViewControllerOBJ didMoveToParentViewController:self];
    MenuViewControllerOBJ.view.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
    [self.view addSubview:MenuViewControllerOBJ.view];
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
    
    
    
MyUser =[[Crs_sharedvariable sharedMySingleton ].crs_UserDetails valueForKey:@"user_id"];
    
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
            //message = [json valueForKey:@"message"];
            crs_PassingToWebview = json;
            if ([[json valueForKey:@"status"]isEqualToString:@"200"])
                
                
            {
                [Crs_sharedvariable sharedMySingleton].crs_EmailId = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"email"];
                [Crs_sharedvariable sharedMySingleton].crs_country = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"country"];
                
                NSMutableArray * crs_ProfileNameArray = [[json valueForKey:@"data"] objectAtIndex:0];
                
                
                NSString * fullName = [NSString stringWithFormat:@"%@ %@ %@ ",[ crs_ProfileNameArray valueForKey:@"first_name"],[ crs_ProfileNameArray valueForKey:@"middle_name"],[ crs_ProfileNameArray valueForKey:@"last_name"]];
                
                [Crs_sharedvariable sharedMySingleton].crs_Name = fullName;
                
   
                
                
                
                CHarityCountry = [ crs_ProfileNameArray valueForKey:@"country"];
               
                iosReview = [NSString stringWithFormat:@"%@", [ crs_ProfileNameArray valueForKey:@"IOSREVIEW"]];
                
                
                
                UrlSTring = [NSString stringWithFormat:@"https://www.crosspaymt.com/charitypay?username=%@&devicecode=%@&firstname=%@&mobile=%@&category=%@&usercountry=%@&isCharityAvailable=%@",[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"user_id"],devieCode,[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"first_name"],[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"mobile"],[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"usercategory"],[[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"countryisocode2"],CharityStatus];
                
                
                CountryCode = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"countryisocode2"];
                NSLog(@"my Country Code is %@",CountryCode);
                NSLog(@"Helo My Url is %@",self->UrlSTring);
                
                

                
                if ([CHarityCountry isEqualToString:@"UNITED KINGDOM"]) {
                    
                }
                else{
                    
                    
                 
                    
                }
                
                
                
                
            }
            else{
                
                
                
                
            }
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}

-(void)CharityDetails{
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_GetCharityName];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    @try {
        //
        
        
        [mapData setObject:CountryCode forKey:@"countryCode"];
        
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
            
            NSString * Message = [json valueForKey:@"message"];
             NSLog(@"My Message is %@",Message);
            NSString * Status = [json valueForKey:@"status"];
            
            
            if ([Status isEqualToString:@"200"]) {
                NSURL *url = [NSURL URLWithString:UrlSTring];
                
                if (![[UIApplication sharedApplication] openURL:url]) {
                    NSLog(@"%@%@",@"Failed to open url:",[url description]);
                }
            } else {
                
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
            }
            
            CharityNameArray = [NSMutableArray new];
            CharityNameArray = [json valueForKey:@"data"];
            
            NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"OrganisationName" ascending:YES];
            
            NSArray *sortDescriptors = [NSArray arrayWithObject:descriptor];
            
            // here you will get sorted array in 'sortedArray'
            CharityNameArray= [[CharityNameArray sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
            
            
            CharityNameArray = [json valueForKey:@"data"];
            
            
            
           
            
            if (CharityNameArray.count == 0) {
               
              
            }
            
            else{
                
                
                
            }
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
    
    
}
@end

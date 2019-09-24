//
//  CharityDetailedViewController.m
//  CrossPay
//
//  Created by sai kiran  on 9/3/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "CharityDetailedViewController.h"
#import "Crs_sharedvariable.h"
#import "CharitypayHistoryViewController.h"
#import "MBProgressHUD.h"
#import "GlobalUrlsFile.h"
#import "crs_sharedmethods.h"
#import "CharitypayHistoryViewController.h"
#import "CharityFavouriteViewController.h"

@interface CharityDetailedViewController ()
{
    NSString * Count;
    NSString * transactionNumber;
    NSString * CoustmerNumber;
    NSMutableDictionary * Favaorite;
    NSString* Ccycode;
    NSString* Amount;
}
@end

@implementation CharityDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.crs_UnFav.layer setBorderWidth:1.0];
    [self.crs_UnFav.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    self.crs_Image1.hidden = YES;
    
    NSLog(@"Charity details%@",_crs_HistoryDetails);
    
    self.crs_FavaoriteLabel.hidden = YES;
    
    transactionNumber = [_crs_HistoryDetails valueForKey:@"CTNo"];
     [Crs_sharedvariable sharedMySingleton].crs_CharityFavr = [_crs_HistoryDetails valueForKey:@"CustomerNo"];
    CoustmerNumber = [_crs_HistoryDetails valueForKey:@"CustomerNo"];
    [Crs_sharedvariable sharedMySingleton].crs_CharityCoustmerNumber = [_crs_HistoryDetails valueForKey:@"CTNo"];
    
    self.crs_CharityNameLabel.text = [_crs_HistoryDetails valueForKey:@"OrganisationName"];
     self.crs_CoustmerNumber.text = [_crs_HistoryDetails valueForKey:@"PurposeDescription"];
     self.crs_Paidwity.text = [_crs_HistoryDetails valueForKey:@"CardType"];
    
    self.crs_TransactioNumber.text = [_crs_HistoryDetails valueForKey:@"CTNo"];
    
    Amount = [_crs_HistoryDetails valueForKey:@"AmountPaid"];
    Ccycode = [_crs_HistoryDetails valueForKey:@"CcyCode"];
    
    
  
    Count = [[_crs_HistoryDetails valueForKey:@"count"] stringValue];
    
    NSLog(@"My Count is %@",Count);
    
    if ([Count isEqualToString:@"1"]) {
        self.crs_AddOut.hidden = YES;
        self.crs_UnFav.hidden = NO;
        
    }
    
    
    else{
        
        self.crs_AddOut.hidden = NO;
        self.crs_UnFav.hidden = YES;
      self.crs_Image1.hidden = YES;
        
        
    }
    NSString * AmountDisplayer = [NSString stringWithFormat:@"%@ %@",Amount,Ccycode];
    self.crs_DonationAmount.text =  AmountDisplayer;
    
    
    
    // Do any additional setup after loading the view.
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

- (IBAction)crs_Add:(id)sender {
    
    
        if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
            
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            
            return ;
            
            
            
            
            
            
            
            
            
        }
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        NSError * error;
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
        NSURL *url = [NSURL URLWithString:Crosspay_AddFavourite];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:60.0];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        [request setHTTPMethod:@"POST"];
        NSMutableDictionary * mapData=[NSMutableDictionary new];
        
        
        
        
        
     
        
         [mapData setObject:transactionNumber forKey:@"txnno"];
        
    
        
        
        
        
        
        NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
        [request setHTTPBody:postData];
        
        
        
        
        
        
        
        NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                              {
                                                  dispatch_async(dispatch_get_main_queue(), ^{
                                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                                                      NSLog(@"error %@",error);
                                                      NSLog(@" My data %@",data);
                                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                        NSLog(@"%@", json );
                                                      
                                NSLog(@"%@", [json valueForKey:@"data"]);
                                                      
                                  
                                                     
                                                      
                                                      
                        if ([[json valueForKey:@"status"] isEqualToString:@"200"]) {
                                                          
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                          
        CharityFavouriteViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityFavouriteViewControllerSID"];;
                                                          
        [self.navigationController pushViewController:viewController animated:YES];
                                                          
            UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                          
                                                          [alert show];
                                                          
                                                          return ;
                                      
                                                          
                                                      }
                                                      
                                                      
                                                      else{
                                                          
                                                          
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                          
                                                          [alert show];
                                                          
                                                          return ;
                                                       
                                                          
                                                          
                                                      }
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      
                                                     
                                                      
                                                  });
                                                  
                                                  
                                              }];
        
        
        
        
        
        
        [postDataTask resume];
        
    
}
- (IBAction)crs_Back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)crs_Favourite:(id)sender {
}
- (IBAction)crs_unFavAction:(id)sender {
}

- (IBAction)crs_UnFavr:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSError * error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_CharityUnFavorites];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    
    
    
    
    [mapData setObject:transactionNumber forKey:@"txnno"];
    
     [mapData setObject:CoustmerNumber forKey:@"customerno"];
    
    
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    
    
    
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                          {
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  [MBProgressHUD hideHUDForView:self.view animated:YES];
                                                  NSLog(@"error %@",error);
                                                  NSLog(@" My data %@",data);
                                                  NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                  NSLog(@"%@", json );
                                                  
                                                  NSLog(@"%@", [json valueForKey:@"data"]);
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  if ([[json valueForKey:@"status"] isEqualToString:@"200"]) {
                                                      
                                                      UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                      
                                                      CharityFavouriteViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityFavouriteViewControllerSID"];;
                                                      
                                                      [self.navigationController pushViewController:viewController animated:YES];
                                                      
                                                      UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                      
                                                      [alert show];
                                                      
                                                      return ;
                                                      
                                                      
                                                  }
                                                  
                                                  
                                                  else{
                                                      
                                                      
                                                      UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                      
                                                      [alert show];
                                                      
                                                      return ;
                                                      
                                                      
                                                      
                                                  }
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                              });
                                              
                                              
                                          }];
    
    
    
    
    
    
    [postDataTask resume];
    
}
@end

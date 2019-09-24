//
//  CharityFavouriteViewController.m
//  CrossPay
//
//  Created by sai kiran  on 8/21/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "CharityFavouriteViewController.h"
#import "FavouriteTableViewCell.h"
#import "GlobalUrlsFile.h"
#import "MBProgressHUD.h"
#import "CharityPayViewController.h"
#import "CharitypayHistoryViewController.h"
#import "crs_sharedmethods.h"
#import "Crs_sharedvariable.h"
@interface CharityFavouriteViewController ()
{
    NSMutableArray * btnselection;
    NSString * Amount;
    NSString * CcyCode;
    NSMutableArray * searchArray;
    NSMutableArray * historyArray;
    NSString * TransactionNumber;
    NSString * CoustmerNumber;
    BOOL  isFiltered;
}
@end

@implementation CharityFavouriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self History_WebService];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if (!isFiltered) {
        
        
        
        
        
        
        //return   historyArray.reverseObjectEnumerator.allObjects;
        return historyArray.count;
    }
    
    else{
        
        
        
        
        return searchArray.count;
    }
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}



-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    
    FavouriteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HistoryViewcontollerSID"];
    
    if (cell == nil)
    {
        cell = [[ FavouriteTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                       reuseIdentifier:@"HistoryViewcontollerSID"];
    }
    if (!isFiltered) {
//        NSString  * str = [NSString stringWithFormat:@"%@",[[historyArray valueForKey:@"txn_status"]objectAtIndex:indexPath.row]];
        
        
        
        cell.crs_NameLabel.text = [[historyArray valueForKey:@"OrganisationName"] objectAtIndex:indexPath.row];
        cell.crs_DateLabel.text = [[historyArray valueForKey:@"PurposeDescription"] objectAtIndex:indexPath.row];
        CcyCode = [[historyArray valueForKey:@"CcyCode"] objectAtIndex:indexPath.row];
        Amount = [[historyArray valueForKey:@"AmountPaid"] objectAtIndex:indexPath.row];
        NSString * AmountDisplayer = [NSString stringWithFormat:@"%@ %@",Amount,CcyCode];
        
        cell.Crs_amount.text = AmountDisplayer;
        
        
       
      
        
        cell.crs_UnFavroiteOut.tag =indexPath.row;
        [cell.crs_UnFavroiteOut addTarget:self
                                         action:@selector(Favorite:)
                               forControlEvents:UIControlEventTouchUpInside];
        if ([[[btnselection valueForKey:@"selection"]objectAtIndex:indexPath.row]isEqualToString:@"0"]) {
            cell.crs_UnFavroiteOut.selected =NO;
        }
        else
        {
            cell.crs_UnFavroiteOut.selected =YES;
        }
        
        
    }
    else{
        
        
        
        
       cell.crs_NameLabel.text = [[searchArray valueForKey:@"OrganisationName"] objectAtIndex:indexPath.row];
        cell.crs_DateLabel.text = [[searchArray valueForKey:@"TxnDate"] objectAtIndex:indexPath.row];
        CcyCode = [[searchArray valueForKey:@"CcyCode"] objectAtIndex:indexPath.row];
        Amount = [[searchArray valueForKey:@"AmountPaid"] objectAtIndex:indexPath.row];
    NSString * AmountDisplayer = [NSString stringWithFormat:@"%@ %@",Amount,CcyCode];
          cell.Crs_amount.text = AmountDisplayer;
    }
    
    
    
    
    //tableView.tableFooterView=[[UIView alloc]init];
    
    
    return cell;
    
    
    
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!isFiltered) {
        
        
        
        for (int k=0; k<btnselection.count; k++) {
            if (indexPath.row==k) {
                NSMutableDictionary * dict  =[NSMutableDictionary new];
                [dict setObject:@"1" forKey:@"selection"];
                [btnselection replaceObjectAtIndex:indexPath.row withObject:dict];
            }
            else
            {
                NSMutableDictionary * dict  =[NSMutableDictionary new];
                [dict setObject:@"0" forKey:@"selection"];
                [btnselection replaceObjectAtIndex:k withObject:dict];
                
            }
            
            
        }
        NSLog(@"Hi Transa%@",TransactionNumber);
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        CharityPayViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityPayViewControllerSID"];;
          viewController.crs_HistoryDetails = [historyArray objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:viewController animated:YES];
        
        
    }
    
    else{
        
        //        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        //
        //        HistoryDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"HistoryDetailedSID"];;
        //        viewController.crs_HistoryDetails = [searchArray objectAtIndex:indexPath.row];
        //        [self.navigationController pushViewController:viewController animated:YES];
        
        
    }
    
}

- (void)History_WebService {
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSError * error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_GetCharityFavourite];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
    
    
     [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_CoustmerUserId forKey:@"user_id"];
    
    
    
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    
    
    
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                          {
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  [MBProgressHUD hideHUDForView:self.view animated:YES];
                                                  NSLog(@"error %@",error);
                                                  NSLog(@"data %@",data);
                                                  NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                  NSLog(@"%@", json );
                                                  
                                                  NSLog(@"%@", [json valueForKey:@"data"]);
                                                  
                                                  
                                                  if ([[json valueForKey:@"status"] isEqualToString:@"200"]) {
                                                      
                                                      
                                                      historyArray = [json valueForKey:@"data"];
                                                      // historyArray = [[[historyArray reverseObjectEnumerator] allObjects] mutableCopy];
                                                      //  NSInteger *i=0;
                                                      
                                                      
                                                  }
                                                  
                                                  
                                                  else{
                                                      
                                                      
                                                      
                                                      
                                                      //historyArray =  [NSMutableArray
                                                      
                                                      
                                                  }
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  [self.crs_historyTable reloadData];
                                                  
                                              });
                                              
                                              
                                          }];
    
    
    
    
    
    
    [postDataTask resume];
    
}

- (IBAction)crs_HomeAction:(id)sender {
    
    self.crs_Homeout.backgroundColor = [UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0];
    
    
    self.crs_Historyout.backgroundColor = [UIColor clearColor];
    
    self.crs_FavouriteOut.backgroundColor =  [UIColor clearColor];
    
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    CharityPayViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityPayViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
  
    
    
}
- (IBAction)crs_HistoryAction:(id)sender {
    
    
    self.crs_Homeout.backgroundColor =  [UIColor clearColor];
    
    
    self.crs_Historyout.backgroundColor = [UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0];
    
    self.crs_FavouriteOut.backgroundColor =  [UIColor clearColor];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    CharitypayHistoryViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityhistoryViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    
    
}
- (IBAction)crs_favouriteAction:(id)sender {
    
    
    self.crs_Homeout.backgroundColor =  [UIColor clearColor];
    
    
    self.crs_Historyout.backgroundColor = [UIColor clearColor];
    
    self.crs_FavouriteOut.backgroundColor =  [UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0];
    
    
    
}

- (IBAction)crs_Back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)Favorite:(UIButton*)sender
{
    
    
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
    
    
    
    TransactionNumber = [[historyArray valueForKey:@"CTNo"] objectAtIndex:sender.tag];
    CoustmerNumber = [[historyArray valueForKey:@"CustomerNo"]objectAtIndex:sender.tag];
    
    
    
    
    [mapData setObject:TransactionNumber forKey:@"txnno"];
    
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
                                                      UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                      
                                                      [alert show];
                                                      UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                      
                                                      CharityFavouriteViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityFavouriteViewControllerSID"];;
                                                      
                                                      [self.navigationController pushViewController:viewController animated:YES];
                                                      
                                                  }
                                                  
                                                  
                                                  else{
                                                      
                                                      
                                                      UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                      
                                                      [alert show];
                                                      
                                                      return ;
                                                      
                                                      
                                                      
                                                  }
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                                  
                                              });
                                              
                                              
                                          }];
    
    
    
    
    
    
    [postDataTask resume];
    
    
//    for (int k=0; k<btnselection.count; k++) {
//        if (sender.tag==k) {
//            NSMutableDictionary * dict  =[NSMutableDictionary new];
//            [dict setObject:@"1" forKey:@"selection"];
//            [btnselection replaceObjectAtIndex:sender.tag withObject:dict];
//        }
//        else
//        {
//            NSMutableDictionary * dict  =[NSMutableDictionary new];
//            [dict setObject:@"0" forKey:@"selection"];
//            [btnselection replaceObjectAtIndex:k withObject:dict];
//
//        }
//
//
//    }
//
//
//    [self.crs_historyTable reloadData];
    
    
    
    
}

- (IBAction)addFriend:(id)sender
{
   
}

@end

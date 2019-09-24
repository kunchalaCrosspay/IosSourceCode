//
//  CharitypayHistoryViewController.m
//  CrossPay
//
//  Created by sai kiran  on 8/20/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "CharitypayHistoryViewController.h"
#import "CharityPayHistoryTableViewCell.h"
#import "MBProgressHUD.h"
#import "Crs_sharedvariable.h"
#import "crs_sharedmethods.h"
#import "GlobalUrlsFile.h"
#import "CharityFavouriteViewController.h"
#import "CharityPayViewController.h"
#import "CharityDetailedViewController.h"
//#import "CharityDetailedViewController.h"
@interface CharitypayHistoryViewController ()
{
    NSString * PayinAmount;
    NSString * CcyCode;
    NSMutableArray * searchArray;
    NSMutableArray * historyArray;
    
    BOOL  isFiltered;
}
@end

@implementation CharitypayHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self History_WebService];
    // Do any additional setup after loading the view.
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
    
    CharityPayHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HistoryViewcontollerSID"];
    
    if (cell == nil)
    {
        cell = [[  CharityPayHistoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                            reuseIdentifier:@"HistoryViewcontollerSID"];
    }
    if (!isFiltered) {
//        NSString  * str = [NSString stringWithFormat:@"%@",[[historyArray valueForKey:@"txn_status"]objectAtIndex:indexPath.row]];
        NSString  * str = [NSString stringWithFormat:@"%@",[[historyArray valueForKey:@"TxnStatus"]objectAtIndex:indexPath.row]];
        
        if ([ str isEqualToString:@"5"]) {
            [cell.crs_ColorChanger setBackgroundColor:[UIColor greenColor]];
            [cell.crs_ColorChanger setTitle:@"Success" forState:UIControlStateNormal];
        }
        else 
        {
            [cell.crs_ColorChanger setTitle:@"Failed" forState:UIControlStateNormal];
            [cell.crs_ColorChanger setBackgroundColor:[UIColor redColor]];
        }
       
        
        cell.crs_NameLabel.text = [[historyArray valueForKey:@"OrganisationName"] objectAtIndex:indexPath.row];
        
        cell.crs_DateLabel.text = [[historyArray valueForKey:@"TxnDate"] objectAtIndex:indexPath.row];
     
        CcyCode =  [[historyArray valueForKey:@"CcyCode"] objectAtIndex:indexPath.row];
        PayinAmount = [[historyArray valueForKey:@"AmountPaid"] objectAtIndex:indexPath.row];
       NSString * Display = [NSString stringWithFormat:@"%@ %@",PayinAmount,CcyCode];
        
        cell.crs_PayeeAmount.text = Display;
    }
    
    
    else{
        NSString  * str = [NSString stringWithFormat:@"%@",[[historyArray valueForKey:@"TxnStatus"]objectAtIndex:indexPath.row]];
        
        
        if ([str isEqualToString:@"5"]) {
            [cell.crs_ColorChanger setBackgroundColor:[UIColor greenColor]];
            
            [cell.crs_ColorChanger setTitle:@"Success" forState:UIControlStateNormal];
            
        }
        else
        {
            [cell.crs_ColorChanger setTitle:@"Failed" forState:UIControlStateNormal];
            
            
            [cell.crs_ColorChanger setBackgroundColor:[UIColor redColor]];
        }
        
        
        
       
        
        
//        
//        cell.crs_FundLabel.text = [[searchArray valueForKey:@"accout_type"] objectAtIndex:indexPath.row];
//        cell.crs_Datelabel.text = [[searchArray valueForKey:@"txn_date"] objectAtIndex:indexPath.row];
        
    }
    
    
    
    
    //tableView.tableFooterView=[[UIView alloc]init];
    
    
    return cell;
    
    
    
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!isFiltered) {
        
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        CharityDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityDetailedSID"];;
        viewController.crs_HistoryDetails = [historyArray objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    
    else{
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        CharityDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityDetailedSID"];;
        viewController.crs_HistoryDetails = [historyArray objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:viewController animated:YES];
        
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
    NSURL *url = [NSURL URLWithString:Crosspay_CharityHistory];
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



- (IBAction)crs_HistoryAction:(id)sender {
    
    self.crs_History.backgroundColor = [UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0];
    
    self.crs_Home.backgroundColor = [UIColor clearColor];
    
    self.crs_Favorite.backgroundColor = [UIColor clearColor];
    
    
    
}
- (IBAction)crs_HomeAction:(id)sender {
    self.crs_History.backgroundColor = [UIColor clearColor];
    
    self.crs_Home.backgroundColor = [UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0];
    
    self.crs_Favorite.backgroundColor = [UIColor clearColor];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    CharityPayViewController* viewController =
    [storyboard instantiateViewControllerWithIdentifier:@"CharityPayViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}
- (IBAction)crs_FavoriteAction:(id)sender {
    
    self.crs_History.backgroundColor = [UIColor clearColor];
    
    self.crs_Home.backgroundColor = [UIColor clearColor];
    
    self.crs_Favorite.backgroundColor =[UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    CharityFavouriteViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityFavouriteViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    
}

- (IBAction)crs_Back:(id)sender {
    
    
    
    if ([self.crs_BackToHome isEqualToString:@"Home"]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        CharityPayViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityPayViewControllerSID"];
        // viewController.crs_ProfileDetails =
        [self.navigationController pushViewController:viewController animated:YES];
        
        
    }
    
    
    
    else{
        [self.navigationController popViewControllerAnimated:YES];
        
        
        
    }
    
    
    
   
}
@end

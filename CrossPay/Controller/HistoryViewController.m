//
//  HistoryViewController.m
//  Payment
//
//  Created by WELCOME on 7/29/17.
//  Copyright © 2017 WELCOME. All rights reserved.
//

#import "HistoryViewController.h"
#import "HomeViewController.h"
#import "crs_sharedmethods.h"
#import "notificationViewController.h"
#import "profileViewController.h"
#import "UpdateProfile.h"
#import "SettingsViewController.h"
#import "Crs_sharedvariable.h"
#import "HistoryCellTableViewCell.h"
#import "RecieverDetailedViewController.h"
#import "HistoryViewController.h"
#import "HistoryDetailedViewController.h"
#import "MBProgressHUD.h"
#import "crs_sharedmethods.h"
#import "GlobalUrlsFile.h"
#import "NewHomeViewController.h"
//#import <Google/Analytics.h>

@interface HistoryViewController ()
{
    
    NSMutableArray * searchArray;
    NSMutableArray * historyArray;
    
    BOOL  isFiltered;
    // Extra button Has been sdded for temporary 
    
}
@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //   InterNet Connection Code For Checking net Connection
    
    
    
    
    isFiltered=NO;
    
    

    
    
    
    
    
    
    
    [self.crs addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];

    
    searchArray = [NSMutableArray new];
    
    historyArray = [NSMutableArray new];
    [self History_WebService];
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
    }
    
    
    
    
    
    
    
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
    
    HistoryCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HistoryViewcontollerSID"];
    
    if (cell == nil)
    {
        cell = [[HistoryCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"HistoryViewcontollerSID"];
    }
    if (!isFiltered) {
        NSString  * str = [NSString stringWithFormat:@"%@",[[historyArray valueForKey:@"txn_status"]objectAtIndex:indexPath.row]];
        
        if ([ str isEqualToString:@"1"]) {
            [cell.crs_ColorChanger setBackgroundColor:[UIColor redColor]];
            [cell.crs_ColorChanger setTitle:@"Sucess" forState:UIControlStateNormal];
        }
        else if ([str isEqualToString:@"4"])
        {
             [cell.crs_ColorChanger setTitle:@"In Process" forState:UIControlStateNormal];
            [cell.crs_ColorChanger setBackgroundColor:[UIColor blueColor]];
        }
        else
        {
            
            [cell.crs_ColorChanger setTitle:@"In Process" forState:UIControlStateNormal];
            
            [cell.crs_ColorChanger setBackgroundColor:[UIColor orangeColor]];
        }
        
        
        cell.Crs_AccountNumber.text = [[historyArray valueForKey:@"name"] objectAtIndex:indexPath.row];
        
        
        cell.crs_Name.text = [[historyArray valueForKey:@"accout_type"] objectAtIndex:indexPath.row];
        cell.crs_Country.text = [[historyArray valueForKey:@"txn_date"] objectAtIndex:indexPath.row];
        
    }
    else{
        NSString  * str = [NSString stringWithFormat:@"%@",[[historyArray valueForKey:@"txn_status"]objectAtIndex:indexPath.row]];
        
        
        if ([str isEqualToString:@"-3"]) {
            [cell.crs_ColorChanger setBackgroundColor:[UIColor redColor]];
            
            [cell.crs_ColorChanger setTitle:@"In Process" forState:UIControlStateNormal];
            
        }
        else if ([str isEqualToString:@"-2"])
        {
            [cell.crs_ColorChanger setTitle:@"In Process" forState:UIControlStateNormal];
            

               [cell.crs_ColorChanger setBackgroundColor:[UIColor orangeColor]];
        }
        
        
        
        else if ([str isEqualToString:@"3"])
        {
            [cell.crs_ColorChanger setTitle:@"In Process" forState:UIControlStateNormal];
            
            
            [cell.crs_ColorChanger setBackgroundColor:[UIColor orangeColor]];
        }
        
        else if ([str isEqualToString:@"7"])
        {
            [cell.crs_ColorChanger setTitle:@"In Process" forState:UIControlStateNormal];
            
            
            [cell.crs_ColorChanger setBackgroundColor:[UIColor orangeColor]];
        }
        
        else
        {
               [cell.crs_ColorChanger setBackgroundColor:[UIColor orangeColor]];
            [cell.crs_ColorChanger setTitle:@"In Process" forState:UIControlStateNormal];

        }
        
        cell.Crs_AccountNumber.text = [[searchArray valueForKey:@"name"] objectAtIndex:indexPath.row];
        
        
        cell.crs_Name.text = [[searchArray valueForKey:@"accout_num"] objectAtIndex:indexPath.row];
        cell.crs_Country.text = [[searchArray valueForKey:@"txn_date"] objectAtIndex:indexPath.row];
        
    }
   
    
    
    cell.crs_HistoryImage.layer.cornerRadius = cell.crs_HistoryImage.frame.size.height/2;
    cell.crs_HistoryImage.clipsToBounds = YES;
    cell.crs_HistoryImage.layer.borderColor = [UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0].CGColor;
    cell.crs_HistoryImage.layer.borderWidth = 1.0f;

    
    //tableView.tableFooterView=[[UIView alloc]init];
    
    
    return cell;
    
    
    
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!isFiltered) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        HistoryDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"HistoryDetailedSID"];;
        viewController.crs_HistoryDetails = [historyArray objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:viewController animated:YES];

        
    }
    
    else{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HistoryDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"HistoryDetailedSID"];;
    viewController.crs_HistoryDetails = [searchArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];

    
}

}





- (IBAction)back_Action:(id)sender {

    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}


// Tab bar navigation part



- (IBAction)crs_HomeAction:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    [self.navigationController popViewControllerAnimated:YES];

    
}

- (IBAction)crs_ProfileAction:(id)sender {
    


}





- (IBAction)crs_NotificationAction:(id)sender {
}
- (IBAction)crs_SettingsAction:(id)sender {
}

- (IBAction)Crs_Home_Action:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
   NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)Crs_History_Action:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"historyViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];

}
- (IBAction)Crs_Profile_Action:(id)sender {
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UpdateProfile* viewController = [storyboard instantiateViewControllerWithIdentifier:@"UpdateProfileViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    

}

- (IBAction)Crs_Notification_Action:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    notificationViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"notificationViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];

}

- (IBAction)Crs_Setting_Action:(id)sender {
    
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    SettingsViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewControllerSid"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    

    
    
    
    
    
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}


-(BOOL) textFieldShouldReturn: (UITextField *) textField
{
    [textField resignFirstResponder];
    
    return YES;
}
- (IBAction)crs_BackHistory:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    [self.navigationController popToRootViewControllerAnimated:NO];
    //[self.navigationController popViewControllerAnimated:YES];
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
    NSURL *url = [NSURL URLWithString:Crosspay_TransactionHistory];
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
                                                  
                                                  
                else if ([[json valueForKey:@"status"] isEqualToString:@"201"]){
                      
                      
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"No Transactions Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                      
                      [alert show];
                  }
                                                  


                  else{




                      


                  }
                                                 



                                                  
                                                  
[self.crs_historyTable reloadData];
                                                  
                                              });
                                              
                                              
                                          }];
    
    
    
    
    
    
    [postDataTask resume];
    
}
    
    









#pragma mark -Searchmethod

-(void)textFieldDidChange:(UITextField *)textField
{
    self.searchTextString=textField.text;
    [self updateSearchArray:self.searchTextString];
}

-(void)updateSearchArray:(NSString *)searchText
{
    searchArray = [NSMutableArray new];
    
    if(searchText.length==0)
    {
 isFiltered=NO;
        searchArray = historyArray;
        NSLog(@"%@",searchArray);
          [self.crs_historyTable reloadData ];
    }
    else
    {
        isFiltered=YES;
        
        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in historyArray){
            NSString * string=[dic valueForKey:@"name"];
            
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                
                // NSString * Ary_id=[dic valueForKey:@"id"];
                
                [searchArray addObject:dic];
                
                NSLog(@"search %@",searchArray);
                
            }
        }
        
        
        
       /// historyArray = searchArray;
        [self.crs_historyTable reloadData ];
        
        
    }
    
  
    
}

 
    
    
    
    



- (IBAction)crs_back:(id)sender {

    
  
    if ([self.crs_BackToHome isEqualToString:@"Home"]) {
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        HomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewControllerSID"];;
        
        [self.navigationController pushViewController:viewController animated:YES];
        
        
    }
    
    
    
    else{
        [self.navigationController popViewControllerAnimated:YES];
        
        
        
    }
    
    
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
    
    
//    
//    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
//    [tracker set:kGAIScreenName value:@"History  View controller"];
//    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
//    
}



@end

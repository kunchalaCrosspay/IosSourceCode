//
//  InitialViewController.m
//  CrossPay Manish/Sai
//
//  Created by saikiran kunchala on 28/07/17.
//  Copyright © 2017 CrossPay. All rights reserved.


#import "InitialViewController.h"
#import "LoginViewController.h"
#import "registerViewController.h"
#import "loginmpinViewController.h"
#import "CountryListTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "crs_sharedmethods.h"
#import "VerifyMobileScreen.h"
#import "MBProgressHUD.h"
#import "GlobalUrlsFile.h"
//#import <Google/Analytics.h>
//#import "MBProgressHUD.h"
@interface InitialViewController ()
{
    NSMutableArray * crs_CountryList ;
       NSMutableArray * crs_CountryList1 ;
    NSString * countryListCompare;
    NSString * formattedNumber;
    NSMutableArray * searchArray;
 BOOL  isFiltered;
}
@end

@implementation InitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isFiltered=NO;
    

    
    
    
    self.crs_noresultLabel.hidden = YES;
    
    self.crs_HideTheView.hidden = YES;
    
//    
[self.crs_search addTarget:self action:@selector(textFieldDidChanges:) forControlEvents:UIControlEventEditingChanged];
//    
    
    searchArray = [NSMutableArray new];
    
    
    
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Clear" style:UIBarButtonItemStyleBordered target:self action:@selector(clearNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    _crs_texfiled2.inputAccessoryView = numberToolbar;
    _crs_textfiled1.inputAccessoryView = numberToolbar;
    _crs_search.inputAccessoryView = numberToolbar;
    
    // Do any additional setup after loading the view.
     [self.crs_textfiled1 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
     [self.crs_texfiled2 addTarget:self action:@selector(textFieldDidChange1:) forControlEvents:UIControlEventEditingChanged];
    
    //   InterNet Connection Code For Checking net Connection
    
    self.crs_CurrencyName1.text=@"INR";
    self.crs_CurrencyName.text=@"GBP";
    

    
    
//    self.crs_RateLabel.hidden = YES;
    
    
    
    
    
    [self.crs_LoginOut.layer setBorderWidth:1.0];
    [self.crs_LoginOut.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    [self.crs_RegisterOut.layer setBorderWidth:1.0];
    [self.crs_RegisterOut.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    [self.crs_Login1Out.layer setBorderWidth:1.0];
    [self.crs_Login1Out.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    [self.crs_Register1Out.layer setBorderWidth:1.0];
    [self.crs_Register1Out.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    
    
    [self.crs_textfiled1 setValue:[UIColor whiteColor]
                        forKeyPath:@"_placeholderLabel.textColor"];
    
//
//
//    [self.crs_texfiled2 setValue:[UIColor whiteColor]
//                       forKeyPath:@"_placeholderLabel.textColor"];
//
//    

    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];

        return ;
    }

 
    
    
    
    
    
    
    crs_CountryList = [NSMutableArray new];
    crs_CountryList1 = [NSMutableArray new];
    self.country_list_view.hidden=YES;
     [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:Crosspay_getCountry] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        crs_CountryList = [json valueForKey: @"country"];
         crs_CountryList1 = [json valueForKey: @"country"];
        NSLog(@"%@", crs_CountryList);
        
        [self.countryList_TableView reloadData];
        });
        
        }];
    
    [dataTask resume];
    
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
   // return crs_CountryList.count;
    if (!isFiltered) {
        
        
        
        
        
        
        //return   historyArray.reverseObjectEnumerator.allObjects;
        return crs_CountryList.count;
    }
    
    else{
        
        
        
    
        if (searchArray.count ==0) {
           
              self.crs_HideTheView.hidden = NO;
            return searchArray.count;
          
        }
        else{
          
            
            return searchArray.count;
            
        }
    }
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}



-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
CountryListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LOGIN_CELL"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"DashboardSID"];
    }
    
    if (!isFiltered){
    cell.countryName.text = [[crs_CountryList valueForKey:@"country_name" ]  objectAtIndex:indexPath.row];
    
    
    NSString *urlStTemp =[NSString stringWithFormat:@"%@",[[crs_CountryList valueForKey:@"country_image" ]  objectAtIndex:indexPath.row]];
    
    NSURL *urlim    = [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlStTemp]];
    
    [cell.countryImage sd_setImageWithURL:urlim];
    }
    else{
        
        cell.countryName.text = [[searchArray valueForKey:@"country_name" ]  objectAtIndex:indexPath.row];
        
        
        NSString *urlStTemp =[NSString stringWithFormat:@"%@",[[searchArray valueForKey:@"country_image" ]  objectAtIndex:indexPath.row]];
        
        NSURL *urlim    = [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlStTemp]];
        
        [cell.countryImage sd_setImageWithURL:urlim];
        
        
    }
    
    
    //tableView.tableFooterView=[[UIView alloc]init];
    
    
    return cell;
    
    
    
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([countryListCompare isEqualToString:@"CountryNames"]) {
//        self.crs_textfiled1.text = @"";
//        self.crs_texfiled2.text = @"";
//        self.crs_RateLabel.text = @"";
        
        self.crs_search.text = @"";
        if (!isFiltered){
            
            
            
        
      
        
        self.country_list_view.hidden=YES;
        NSString *urlStTemp =[NSString stringWithFormat:@"%@",[[crs_CountryList valueForKey:@"country_image" ]  objectAtIndex:indexPath.row]];
        
        NSURL *urlim    = [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlStTemp]];
        
        [ self.crs_CountryImage2 sd_setImageWithURL : urlim ];
        
        self.crs_CurrencyName1.text = [[crs_CountryList valueForKey:@"country_code" ]  objectAtIndex:indexPath.row];
          
            [self TextClear:_crs_textfiled1.text];
        }
        
        else{
            
            
            self.country_list_view.hidden=YES;
            NSString *urlStTemp =[NSString stringWithFormat:@"%@",[[searchArray valueForKey:@"country_image" ]  objectAtIndex:indexPath.row]];
            
            NSURL *urlim    = [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlStTemp]];
            
            [ self.crs_CountryImage2 sd_setImageWithURL : urlim ];
            
            self.crs_CurrencyName1.text = [[searchArray valueForKey:@"country_code" ]  objectAtIndex:indexPath.row];
            
            [self TextClear:_crs_textfiled1.text];
        }
    }
    else
    {
        if (!isFiltered){
    
        
        self.country_list_view.hidden=YES;
        NSString *urlStTemp =[NSString stringWithFormat:@"%@",[[crs_CountryList valueForKey:@"country_image" ]  objectAtIndex:indexPath.row]];
        
        NSURL *urlim    = [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlStTemp]];
        
        [ self.crs_CountryImage1 sd_setImageWithURL : urlim ];
        
        self.crs_CurrencyName.text = [[crs_CountryList valueForKey:@"country_code" ]  objectAtIndex:indexPath.row];
        [self TextClear:_crs_textfiled1.text];
    }
        else{
            
            self.country_list_view.hidden=YES;
            NSString *urlStTemp =[NSString stringWithFormat:@"%@",[[searchArray valueForKey:@"country_image" ]  objectAtIndex:indexPath.row]];
            
            NSURL *urlim    = [NSURL URLWithString:[NSString stringWithFormat:@"%@",urlStTemp]];
            
            [ self.crs_CountryImage1 sd_setImageWithURL : urlim ];
            
            self.crs_CurrencyName.text = [[searchArray valueForKey:@"country_code" ]  objectAtIndex:indexPath.row];
            [self TextClear:_crs_textfiled1.text];
            
        }
    
    }
    }
    
////-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
// 
//
//    //1. Setup the CATransform3D structure
//    CATransform3D rotation;
//    rotation = CATransform3DMakeRotation( (2.5*M_PI)/360, 0.0, 4, 0.4);
//    rotation.m34 = 1/ 1000;
//
//
//    //2. Define the initial state (Before the animation)
//    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//    cell.alpha = 0;
//
//    cell.layer.transform = rotation;
//    cell.layer.anchorPoint = CGPointMake(0, 10);
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
//




-(void)textFieldDidChange :(UITextField *)theTextField{
    
    NSLog( @"text changed: %@", theTextField.text);
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    //[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_GetExchangeRate];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
   
    [mapData setObject: self.crs_CurrencyName.text forKey:@"ccyfrom"];
    
    [mapData setObject:self.crs_CurrencyName1.text forKey:@"ccyto"];
    
    [mapData setObject:theTextField.text forKey:@"fromvalue"];
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSLog(@"error %@",error);
            NSLog(@"data %@",data);
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json );
            
            
            if([[json valueForKey:@"message"]isEqualToString:@"Success"])
                
            {
                
                
                NSString * totalRate = [NSString stringWithFormat:@"%.2f",[[json valueForKey:@"TotalRate"]floatValue]];
                self.crs_texfiled2.text = totalRate;
                
       // formattedNumber = [NSString stringWithFormat:@"%.02f", myFloat];
                float f1=[[json valueForKey:@"INR"]floatValue];
                NSString *Crs_rate=[NSString stringWithFormat:@"%.3f",f1];

                
                NSLog(@"%@",[json valueForKey:@"TotalRate"]);
                _crs_RateLabel.text=[NSString stringWithFormat:@"Rate: 1 %@ = %@ %@ ",[json valueForKey:@"ccyfrom"],Crs_rate,[json valueForKey:@"ccyto"]];
            }
            
            
            
            
            
            
            
            else{
                self.crs_texfiled2.text=@"";
                 _crs_RateLabel.text=[NSString stringWithFormat:@""];
                
            }
            
            
            
            
            
            
            
            NSLog(@"%@", [json valueForKey:@"message"]);
            
            
        });

        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}



-(void)textFieldDidChange1 :(UITextField *)theTextField{
    NSLog( @"text changed: %@", theTextField.text);
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_GetExchangeReverese];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    [mapData setObject: self.crs_CurrencyName.text forKey:@"ccyfrom"];
    
    [mapData setObject:self.crs_CurrencyName1.text forKey:@"ccyto"];
    
    [mapData setObject:theTextField.text forKey:@"tovalue"];
    
     [mapData setObject:self.crs_RateLabel.text forKey:@"GBP"];
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSLog(@"error %@",error);
            NSLog(@"data %@",data);
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json );
            
            
            if([[json valueForKey:@"message"]isEqualToString:@"Success"])
            {
                NSString * totalRate = [NSString stringWithFormat:@"%.2f",[[json valueForKey:@"TotalRate"]floatValue]];
                self.crs_textfiled1.text = totalRate;
                
                NSLog(@"%@",[json valueForKey:@"TotalRate"]);
                
                NSString * rateChanger = [NSString stringWithFormat:@"%@",[json valueForKey:@"INR"] ];
                
                float f1=[[json valueForKey:@"INR"]floatValue];
                NSString *Crs_rate=[NSString stringWithFormat:@"%.3f",f1];
              
self.crs_RateLabel.text=[NSString stringWithFormat:@"Rate: 1 %@ = %@ %@",self.crs_CurrencyName.text,Crs_rate,self.crs_CurrencyName1.text];
                
                // self.Crs_RateLabel.text=[NSString stringWithFormat:@"Rate:1 %@ = %@ %@ ",[json valueForKey:@"ccyfrom"],Crs_rate,[json valueForKey:@"ccyto"]];
            }
            else{
                self.crs_textfiled1.text=@"";
                _crs_RateLabel.text=[NSString stringWithFormat:@""];
                
                
            }
            
            NSLog(@"%@", [json valueForKey:@"message"]);
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}






- (IBAction)Display_Country_Popup:(id)sender {
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    //crs_CountryList=crs_CountryList1;
    NSMutableArray * Ary;
    Ary=[NSMutableArray new];

    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"country_name" ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:descriptor];
    
    // here you will get sorted array in 'sortedArray'
    crs_CountryList = [[crs_CountryList1 sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
    

    for (int i=0; i<crs_CountryList.count; i++) {

        
        
       // if ([[[crs_CountryList valueForKey:@"country_status"]objectAtIndex:i]isEqualToString:@"1"]) {
            
            
            NSMutableDictionary * dict=[NSMutableDictionary new];
            dict =[crs_CountryList objectAtIndex:i];
            [Ary addObject:dict];
        //}
        
        
//        if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"INDIA"]) {
//
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//
//        }
//
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"PHILIPPINES"]) {
//
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//
//        }
//
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"UNITED STATES"]) {
//
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//
//        }
//        
//        
//        
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"NORWAY"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        
//        
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"SRI LANKA"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        
//        
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"UNITED KINGDOM"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"IRELAND"]) {
//
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//
//        }
//
//
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"POLAND"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"GERMANY"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"ROMANIA"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"ITALY"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"FRANCE"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"NETHERLANDS"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"AUSTRIA"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }   else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"BELGIUM"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"BULGARIA"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"CYPRUS"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"CZECH REPUBLIC"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"ESTONIA"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"FINLAND"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"GREECE"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }   else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"HUNGARY"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"LATVIA"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"LITHUANIA"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"LUXEMBOURG"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"MALTA"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"PORTUGAL"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"SLOVAKIA"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"SLOVENIA"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"SPAIN"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"PAKISTAN"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//
//
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"AUSTRALIA"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"NEPAL"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"DENMARK"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"SWEDEN"]) {
//            
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//            
//        }
//        else{
//
//        }
//

    }

    crs_CountryList =Ary;

    countryListCompare = @"CountryNames";
    self.country_list_view.hidden=NO;
    [self.countryList_TableView reloadData];
    
}

- (IBAction)Register_Action:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    registerViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"RegisterViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
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
    
    }
- (IBAction)crs_CountryListButtonAction:(id)sender {
    
    
//    
//    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
//        
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        
//        [alert show];
//        
//        return ;
//        
//        
//        
//    }
    
    NSMutableArray * Ary=[NSMutableArray new];
    crs_CountryList=crs_CountryList1;
    
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"country_name" ascending:YES];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:descriptor];
    
    // here you will get sorted array in 'sortedArray'
    crs_CountryList = [[crs_CountryList1 sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
    
    for (int i=0; i<crs_CountryList.count; i++) {
      
        
        if ([[[crs_CountryList valueForKey:@"country_status"]objectAtIndex:i]isEqualToString:@"2"]) {
            
            
            NSMutableDictionary * dict=[NSMutableDictionary new];
            dict =[crs_CountryList objectAtIndex:i];
            [Ary addObject:dict];
        
        
        }
        
//
//        if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"DENMARK"]) {
//
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//
//        }
//
//
//       else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"FRANCE"]) {
//
//            NSMutableDictionary * dict=[NSMutableDictionary new];
//            dict =[crs_CountryList objectAtIndex:i];
//            [Ary addObject:dict];
//
//
//
//
//
//        }
//
//
//       else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"GERMANY"]) {
//
//           NSMutableDictionary * dict=[NSMutableDictionary new];
//           dict =[crs_CountryList objectAtIndex:i];
//           [Ary addObject:dict];
//
//       }
//       else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"SWEDEN"]) {
//
//           NSMutableDictionary * dict=[NSMutableDictionary new];
//           dict =[crs_CountryList objectAtIndex:i];
//           [Ary addObject:dict];
//
//       }
//       else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"NORWAY"]) {
//
//           NSMutableDictionary * dict=[NSMutableDictionary new];
//           dict =[crs_CountryList objectAtIndex:i];
//           [Ary addObject:dict];
//
//       }
//       else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"NETHERLANDS"]) {
//
//           NSMutableDictionary * dict=[NSMutableDictionary new];
//           dict =[crs_CountryList objectAtIndex:i];
//           [Ary addObject:dict];
//
//       }
//       else if ([[[crs_CountryList valueForKey:@"country_name"]objectAtIndex:i]isEqualToString:@"UNITED KINGDOM"]) {
//
//           NSMutableDictionary * dict=[NSMutableDictionary new];
//           dict =[crs_CountryList objectAtIndex:i];
//           [Ary addObject:dict];
//
//       }
//
    }
    
      crs_CountryList =Ary;
    
    countryListCompare = @"CountryNames1";
    
    self.country_list_view.hidden=NO;
    
    [self.countryList_TableView reloadData];
    

    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField==self.crs_textfiled1) {
        if (self.self.crs_textfiled1.text.length >=10 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            return YES;}
        
        NSString *validRegEx =@"^[0-9.]*$"; //change this regular expression as your requirement
        NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
        BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
        if (myStringMatchesRegEx)
            return YES;
        else
            return NO;
        
        
    }
    
    else if (textField == self.crs_texfiled2)
    {
        
        if (self.self.self.crs_texfiled2.text.length >=10 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {return YES;}
     
        
    }
    else if (textField == self.crs_search)
    {
        
        if (self.self.self.self.crs_search.text.length >=120 && range.length == 0)
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
    
    
    
    else{
        {return YES;}
        
    }
    
}
-(void)TextClear :(NSString * )str{
    //NSLog( @"text changed: %@", theTextField.text);
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    //[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_GetExchangeRate];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    [mapData setObject: self.crs_CurrencyName.text forKey:@"ccyfrom"];
    
    [mapData setObject:self.crs_CurrencyName1.text forKey:@"ccyto"];
    
    [mapData setObject:str forKey:@"fromvalue"];
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSLog(@"error %@",error);
            NSLog(@"data %@",data);
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json );
            
            
            if([[json valueForKey:@"message"]isEqualToString:@"Success"])
                
            {
                
                
                NSString * totalRate = [NSString stringWithFormat:@"%.2f",[[json valueForKey:@"TotalRate"]floatValue]];
                self.crs_texfiled2.text = totalRate;
                
                // formattedNumber = [NSString stringWithFormat:@"%.02f", myFloat];
                float f1=[[json valueForKey:@"INR"]floatValue];
                NSString *Crs_rate=[NSString stringWithFormat:@"%.3f",f1];
                
                
                NSLog(@"%@",[json valueForKey:@"TotalRate"]);
                _crs_RateLabel.text=[NSString stringWithFormat:@" Rate: 1 %@ = %@ %@ ",[json valueForKey:@"ccyfrom"],Crs_rate,[json valueForKey:@"ccyto"]];
            }
            
            
            
            
            
            
            
            else{
                self.crs_texfiled2.text=@"";
                _crs_RateLabel.text=[NSString stringWithFormat:@""];
                
            }
            
            
            
            
            
            
            
            NSLog(@"%@", [json valueForKey:@"message"]);
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}


-(void)clearNumberPad{
    [_crs_textfiled1 resignFirstResponder];
    [_crs_texfiled2 resignFirstResponder];
    
    
        self.crs_texfiled2.text = @"";
    _crs_textfiled1.text = @"";
    
     [_crs_search resignFirstResponder];
    
    
    
    
    
    
    
}

-(void)doneWithNumberPad{
    
    [_crs_textfiled1 resignFirstResponder];
    [_crs_texfiled2 resignFirstResponder];
    [_crs_search resignFirstResponder];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    
//    
//    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
//    [tracker set:kGAIScreenName value:@"intial View controller"];
//    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];

}

#pragma mark -Searchmethod

-(void)textFieldDidChanges:(UITextField *)textField
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
        searchArray = crs_CountryList;
        NSLog(@"%@",searchArray);
        [self.countryList_TableView reloadData ];
    }
    else
    {
        isFiltered=YES;
        
        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in crs_CountryList){
            NSString * string= [NSString stringWithFormat:@"%@",[dic valueForKey:@"country_name"]] ;
            
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                
                // NSString * Ary_id=[dic valueForKey:@"id"];
                
                [searchArray addObject:dic];
                
                NSLog(@"search %@",searchArray);
                
            }
        }
        
        
        
        /// historyArray = searchArray;
        [self.countryList_TableView reloadData ];
        
        
    }
    
    
    
}

//
//-(BOOL) textFieldShouldReturn:(UITextField *)textField{
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
//
//
//    return NO;
//
//}








- (IBAction)crs_Cancel:(id)sender {
    self.country_list_view.hidden = YES;
}

- (IBAction)Crs_register1Action:(id)sender {
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    registerViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"RegisterViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}
- (IBAction)crs_Login1Action:(id)sender {
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    VerifyMobileScreen * viewController = [storyboard instantiateViewControllerWithIdentifier:@"VerifyMobileScreenViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}
- (IBAction)crs_Login1:(id)sender {
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    VerifyMobileScreen * viewController = [storyboard instantiateViewControllerWithIdentifier:@"VerifyMobileScreenViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)crs_Login2:(id)sender {
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    VerifyMobileScreen * viewController = [storyboard instantiateViewControllerWithIdentifier:@"VerifyMobileScreenViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}
@end

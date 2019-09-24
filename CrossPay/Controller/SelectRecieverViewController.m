//
//  SelectRecieverViewController.m
//  CrossPay
//
//  Created by sai kiran  on 8/13/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//Please Select Wallet Name

#import "SelectRecieverViewController.h"
#import "profileViewController.h"
#import "RecieverDetailedViewController.h"
#import "HomeViewController.h"
#import "notificationViewController.h"
#import "HistoryViewController.h"
#import "UpdateProfile.h"
#import "Crs_sharedvariable.h"
#import "AddreciverTableViewCell.h"
#import "SettingsViewController.h"
#import "crs_sharedmethods.h"
#import "SelectPaymentModeViewController.h"
#import "crs_sharedmethods.h"
//#import <Google/Analytics.h>
#import "MBProgressHUD.h"
#import "GlobalUrlsFile.h"
#import "NewHomeViewController.h"
@interface SelectRecieverViewController ()
{
    NSString * Acountnumber;
    NSString * crs_str_CountryComparsion;
    NSMutableArray * crs_RecieverDetails;
    NSMutableArray * Crs_Array_banklist;
    NSMutableArray * payOutType;
    
    NSMutableArray * crs_PaymentAgent;
    NSString * crs_str_CashPay;
    NSString * EntityType;
    NSMutableArray * Crs_ary_BankDetails;
    NSMutableArray * Crs_Array_list;
    NSMutableArray * Crs_PaymentArray;
    NSString * crs_Str_BankComparsion;
    NSMutableDictionary * dic;
    
    NSString * Crs_str_tableviewcompare;
    
    NSString * MobileComparision;
    //bank names
    NSMutableArray  * Crs_Array_banknames;
    
    NSMutableArray  * Crs_Array_banknameslist;
    NSString * branchCode;
    NSString * bankcode;
    UIActivityIndicatorView *spinner;
    NSString * isdCode;
    NSMutableArray * searchArray;
    NSMutableArray * MobileWalletArray;
    NSString * KenyaComparsion;
    NSMutableArray *  KenyanArray;
    NSMutableArray * branchArray;
    NSString *banglaBranchCode;
    BOOL  isFiltered;
}

@end

@implementation SelectRecieverViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    isFiltered = NO;
    
     self.crs_search.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    
    [self Crs_MobileWallet];
    spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center=self.view.center;
    
    [spinner setColor:[UIColor blackColor]];
    [self.view addSubview:spinner];
    
    KenyanArray = [NSMutableArray new];
    branchArray = [NSMutableArray new];
    
    // MobileWalletArray = [NSMutableArray new];
    
    
    [Crs_sharedvariable sharedMySingleton].crs_RemitanceFundLabel = @"";
    [Crs_sharedvariable sharedMySingleton].crs_RemitanceFundid = @"";
    [Crs_sharedvariable sharedMySingleton].crs_SourceofFundLabel= @"";
    [Crs_sharedvariable sharedMySingleton].crs_SourceofFundid = @"";
    
    self.crs_ForCashVietnam.hidden= YES;
    
    
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Clear" style:UIBarButtonItemStyleBordered target:self action:@selector(clearNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    _crs_NewBranch.inputAccessoryView = numberToolbar;
    _crs_PhpBankName.inputAccessoryView = numberToolbar;
    _crs_PhpAccountNumbe.inputAccessoryView = numberToolbar;
    _crs_BankAccount.inputAccessoryView = numberToolbar;
    _crs_Branch.inputAccessoryView = numberToolbar;
    _crs_Ifsc.inputAccessoryView = numberToolbar;
    
    
    
    
    
    
    
    
    self.crs_PhpBranchName.textColor =[UIColor whiteColor];
    self.crs_PhpAccountNumbe.textColor = [UIColor whiteColor];
    self.crs_PhpBankName.textColor = [UIColor whiteColor];
    
    self.crs_TableViewview.hidden = NO;
    self.crs_BankViewHider.hidden = YES;
    
    
    self.crs_NewBranch.textColor = [UIColor whiteColor];
    self.crs_BankAccount.textColor = [UIColor whiteColor];
    self.crs_Branch.textColor = [UIColor whiteColor];
    self.crs_Ifsc.textColor = [UIColor whiteColor];
    
    
    //self.crs_bankView.hidden = YES;
    // self.crs_CashPayView.hidden = YES;
    
    self.crs_NODataContentLabel.hidden = YES;
    self.crs_ViewBankMode.hidden = YES;
    //self.crs_PaymentModeView.hidden = YES;
    
    crs_PaymentAgent = [NSMutableArray new];
    
    self.crs_pickerView.hidden = YES;
    
    self.crs_PaymentModeView.hidden = YES;
    self.crs_bankView.hidden = YES;
    
    [self Crs_PaymentModeType];
    
    
    payOutType = [NSMutableArray arrayWithObjects:@"MUTHOOT FINANCE",@"MUTHOOT FINCORP", nil];
    
    self.crs_selectRecieverscroll.contentSize = CGSizeMake(self.view.frame.size.width-30, 420);
    
    
    
    
    
    [self.crs_addRecieverOut.layer setBorderWidth:1.0];
    [self.crs_addRecieverOut.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    
    
    [self.crs_ProceedOut.layer setBorderWidth:1.0];
    [self.crs_ProceedOut.layer setBorderColor:[[UIColor colorWithRed:15.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    
    [self.crs_search addTarget:self action:@selector(textFieldDidChanges:) forControlEvents:UIControlEventEditingChanged];
    
    
    
    
    // Do any additional setup after loading the view.
}






- (void)BankDetails{
    
    Crs_Array_banklist=[NSMutableArray new];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:Crosspay_GetAgent] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        Crs_Array_list=[NSMutableArray new];
        Crs_Array_banklist=[json valueForKey:@"agent"];
        
        
        
    }];
    
    [dataTask resume];
    
    
    Crs_Array_banknames=[NSMutableArray new];
    
    NSURLSession *session1 = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask1 = [session1 dataTaskWithURL:[NSURL URLWithString:Crosspay_GetBank] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        // Crs_Array_list=[NSMutableArray new];
        Crs_Array_banknames=[json valueForKey:@"bank"];
        
        
        NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"bank_name" ascending:YES];
        
        NSArray *sortDescriptors = [NSArray arrayWithObject:descriptor];
        
        // here you will get sorted array in 'sortedArray'
        Crs_Array_banknames = [[ Crs_Array_banknames sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
        
        
    }];
    
    [dataTask1 resume];
    
    
    
    
    
}




-(void)viewWillAppear:(BOOL)animated
{
    
    //
    //
    //
    //
    //        id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //        [tracker set:kGAIScreenName value:@"Select Reciever  View controller"];
    //        [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    //
    
    
    // [Crs_sharedvariable sharedMySingleton].crs_AgentCode = @"";
    
    
    
    self.Crs_Banknameview.hidden =YES;
    
    
    [self BankDetails];
    
    
    
    
    
    
    [self.view addSubview:[[crs_sharedmethods sharedMySingleton] GetLoadingview]];
    self.crs_NODataContentLabel.hidden = YES;
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
    }
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    [ Crs_sharedvariable sharedMySingleton].crs_CheckMark_SelectList = @"" ;
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate: self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_BenificiaryViewByCountry];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    
    
    //    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
    
    
    [mapData setObject:self.crs_PassingFromHome forKey:@"country"];
    
    [mapData setObject:[ Crs_sharedvariable sharedMySingleton] .crs_userId forKey:@"user_id"];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // [mapData setObject: forKey:@"gender"];
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            [[crs_sharedmethods sharedMySingleton].Ary_view_LoadingBg removeFromSuperview];
            
            NSLog(@"error %@",error);
            NSLog(@"data %@",data);
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@" Venky Pelli %@", json );
            Crs_Array_banknameslist=[NSMutableArray new];
            NSLog(@"%@", [json valueForKey:@"message"]);
            //message = [json valueForKey:@"message"];
            if ([[json valueForKey:@"status"]isEqualToString:@"200"])
                
                
            {
                
                
                
                crs_RecieverDetails=[json valueForKey:@"data"];
                
                [self.crs_SelecRecieverTableView reloadData];
                
                
                
                
            }
            else{
                
                
                
                
            }
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
    
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView ==self.Crs_BankName_Tableview) {
        
        if ( [Crs_str_tableviewcompare isEqualToString: @"cashpay"]) {
            if (!isFiltered) {
                return Crs_Array_list.count;
                
            }
            
            else{
                
                
                return searchArray.count;
            }
            
        }
        else if ([Crs_str_tableviewcompare isEqualToString:@"MOBILEWALLET"]){
            
            if (!isFiltered) {
                return MobileWalletArray.count;
                
            }
            
            else{
                
                
                return searchArray.count;
            }
            
            
        }
        
        else if ([Crs_str_tableviewcompare isEqualToString:@"BranchGetter"]){
            
            if (!isFiltered) {
                return branchArray.count;
                
            }
            
            else{
                
                
                return searchArray.count;
            }
            
            
        }
        else{
            if (!isFiltered) {
                
                
                return Crs_Array_banknameslist.count;
            }
            
            
            else{
                
                
                return searchArray.count;
            }
            
        }
        
        
    }
    
    else{
        if (crs_RecieverDetails.count == 0 ) {
            self.crs_NODataContentLabel.hidden = NO;
            return 0;
        }
        else
        {
            
            self.crs_NODataContentLabel.hidden = YES;
            return crs_RecieverDetails.count;
            
        }
    }
    
    
    
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

-(UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView ==self.Crs_BankName_Tableview) {
        
        AddreciverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CountryNamesTabelViewCellSID"];
        
        if (cell == nil)
        {
            cell = [[AddreciverTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:@"CountryNamesTabelViewCellSID"];
        }
        
        if ( [Crs_str_tableviewcompare isEqualToString: @"cashpay"]) {
            if (!isFiltered) {
                
                cell.crs_lbl_countryname.text=[[Crs_Array_list valueForKey:@"agent_name"] objectAtIndex:indexPath.row];
            }
            
            
            
            else{
                
                
                cell.crs_lbl_countryname.text=[[searchArray valueForKey:@"agent_name"] objectAtIndex:indexPath.row];
                
            }
        }
        else if ([Crs_str_tableviewcompare isEqualToString:@"MOBILEWALLET"]){
            if (!isFiltered) {
                
                cell.crs_lbl_countryname.text=[[MobileWalletArray valueForKey:@"WalletName"] objectAtIndex:indexPath.row];
            }
            
            
            
            else{
                
                
                cell.crs_lbl_countryname.text=[[searchArray valueForKey:@"WalletName"] objectAtIndex:indexPath.row];
                
            }
            
        }
        
        else if ([Crs_str_tableviewcompare isEqualToString:@"BranchGetter"]){
            if (!isFiltered) {
                
                cell.crs_lbl_countryname.text=[[branchArray valueForKey:@"branch_name"] objectAtIndex:indexPath.row];
                
            }
            
            
            
            else{
                
                
                cell.crs_lbl_countryname.text=[[searchArray valueForKey:@"branch_name"] objectAtIndex:indexPath.row];
                
            }
            
        }
        else
        {
            if (!isFiltered) {
                
                
                
                cell.crs_lbl_countryname.text=[[Crs_Array_banknameslist valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
                
            }
            else{
                
                
                
                cell.crs_lbl_countryname.text=[[searchArray valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
                
            }
            
            
        }
        
        
        
        
        
        
        
        return  cell;
        
        
    }
    else{
        
        
        AddreciverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SelectRecieverSID"];
        
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:@"SelectRecieverSID"];
        }
        
        
        
        
        
        
        
        
        
        cell.crs_SelectRecieverImage.layer.cornerRadius =     cell.crs_SelectRecieverImage.frame.size.height/2;
        cell.crs_SelectRecieverImage.clipsToBounds = YES;
        cell.crs_SelectRecieverImage.layer.borderColor = [UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0].CGColor;
        cell.crs_SelectRecieverImage
        .layer.borderWidth = 1.0f;
        
        
        cell.crs_NameLabel.text=[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - indexPath.row - 1)]valueForKey:@"call_name"];
        
        
        
        
        NSString * Acountnumber=[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - indexPath.row - 1)]valueForKey:@"account_num"];
        
        
        if ([Acountnumber isEqualToString:@"null"]||[Acountnumber isEqualToString:@""]||[Acountnumber length] == 0) {
            NSLog(@"Venkatesh");
            
            cell.crs_AccountLabel.text = [[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - indexPath.row - 1)]valueForKey:@"country"]; ;
            
            
            
        }
        else{
            
            
            cell.crs_AccountLabel.text = [NSString stringWithFormat:@" %@   A/C  : %@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - indexPath.row - 1)]valueForKey:@"country"],Acountnumber];
            
            
            
            
        }
        
        
        
        
        //
        //    NSString * image=[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - indexPath.row - 1)]valueForKey:@"image"];
        //
        //    cell.crs_SelectRecieverImage.image = [self decodeBase64ToImage:image];
        //
        if ([[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - indexPath.row - 1)]valueForKey:@"gender"]isEqualToString:@"male"]) {
            cell.crs_SelectRecieverImage.image = [UIImage imageNamed:@"noimage (1).png"];
        }
        else{
            
            cell.crs_SelectRecieverImage.image = [UIImage imageNamed:@"noimage (1).png"];
        }
        NSString *str = @"This is a string";
        
        str = [str stringByReplacingOccurrencesOfString:@"string"
                                             withString:@"duck"];
        
        
        //
        //         NSLog(@"%luSravntu",(unsigned long)[Acountnumber length]);
        //
        //         if ([Acountnumber length ]==0) {
        //              cell.crs_AccountLabel.text=@"INDIA";
        //
        //         }
        //         else{
        //
        //
        //             cell.crs_AccountLabel.text=Acountnumber;
        //
        //         }
        //
        
        [cell.crs_SelectMark setTag:indexPath.row];
        
        [cell.crs_SelectMark addTarget:self action:@selector(crs_selected:) forControlEvents:UIControlEventTouchUpInside];
        
        
        //tableView.tableFooterView=[[UIView alloc]init];
        
        //  cell.crs_NameLabel.text=[[crs_RecieverDetails objectAtIndex:indexPath.row
        
        // ]valueForKey:@"first_name"];
        
        
        
        
        
        
        //tableView.tableFooterView=[[UIView alloc]init];
        
        if ([Crs_sharedvariable sharedMySingleton].checkMarks == indexPath.row) {
            NSString * crs_selectValue = [NSString stringWithFormat:@"%d",[Crs_sharedvariable sharedMySingleton].checkMarks];
            if ([[Crs_sharedvariable sharedMySingleton ].crs_CheckMark_SelectList isEqualToString:crs_selectValue]) {
                
                [cell.crs_SelectMark setSelected:YES];
                
                self.crs_bankView.hidden = NO;
                
                
            }
            
            
        }
        
        
        else{
            
            
            
            
            [cell.crs_SelectMark setSelected:NO];
            
            
        }
        
        
        return cell;
        
        
    }
}
-(IBAction)crs_selected:(UIButton *)sender
{
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    NSMutableDictionary * crs_sorting = [NSMutableDictionary new];
    crs_sorting = [crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)];
    NSArray * ram = [crs_sorting allKeys];
    NSLog(@"Triple_hhh %lu",(unsigned long)ram.count);
    
    self.crs_PhpView.hidden = YES;
    
    self.crs_TableViewview.hidden = YES;
    self.crs_BankViewHider.hidden = NO;
    
    self.crs_SelectPaymentLabel.text=@"Select Payout-Network";
    
    NSLog(@"JohnRambo %@",crs_RecieverDetails );
    [Crs_sharedvariable sharedMySingleton].crs_BenificiaryNo = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"beneficiary_no"]];
    
    
    
    
    
    
    NSLog(@"%@",sender);
    Crs_ary_BankDetails = [NSMutableArray new];
    
    [Crs_sharedvariable sharedMySingleton].checkMarks = sender.tag;
    [Crs_sharedvariable sharedMySingleton].crs_CheckMark_SelectList = [NSString stringWithFormat:@"%ld",(long)sender.tag];
    Acountnumber = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"account_num"]];
    
    Crs_ary_BankDetails = [crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)];
    
    NSLog(@" sai %@",Crs_ary_BankDetails);
    if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"USA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UNITED STATES"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SIERRA LEONE"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"AUSTRALIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"CANADA"])   {
        
        
        
        
        if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PAKISTAN"]) {
            self.crs_Bankoutlet.hidden = NO;
        }
        else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UNITED STATES"]){
            
            
            self.crs_EurpoeCountryAccount.text = @"IBAN / Account Number ";
        }
        
        else{
            self.crs_Bankoutlet.hidden = YES;
            
            
        }
        self.crs_PhpCashPickUpoutlet.hidden = YES;
        self.crs_CashPayOutlet.hidden = YES;
        self.crs_PhpView.hidden = YES;
        self.crs_bankView.hidden= NO;
        self.crs_CashPickup.text = @"ACCOUNT CREDIT";
        [self.crs_accountCredit setSelected:NO];
        self.crs_EurpoeCountryAccount.text = @"Account Number";
        self.crs_AccountCredit.hidden = YES;
        self.crs_CashPayView.hidden = YES;
        self.crs_BankIfscChanger.text = @"Swift Code";
        self.crs_DropDownOmage.hidden = YES;
        self.crs_BanglaBranch.hidden = YES;
        if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PAKISTAN"]) {
            
            self.crs_Ifsc.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"ifsc"]];
            self.crs_pobDob.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"dob"]];
            
            
            
        }
        
        else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SRI LANKA"])
            
        {
            
            
            
            self.crs_Ifsc.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"branch_code"]];
            
            bankcode = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_code"]];
            [_crs_BankAccount setKeyboardType:UIKeyboardTypeNumberPad];
        }
        else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UNITED STATES"])
            
        {
            
            self.crs_Bankoutlet.hidden = YES;
            self.crs_EurpoeCountryAccount.text = @"IBAN / Account Number ";
            
            self.crs_Ifsc.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"ifsc"]];
            
            //bankcode = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_code"]];
        }
        
        
        
        
        else{
            
            
            self.crs_Ifsc.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"ifsc"]];
            
        }
        
        self.crs_Branch.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_name"]];
        
        self.crs_NewBranch.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"branch_name"]];
        
        self.crs_BankAccount.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"account_num"]];
        self.crs_BranchNamelabel.hidden = NO;
        
        //
        //
        
        //crs_str_CashPay = @"AccountCredit";
        //        [self.crs_CashPayOutlet setSelected:YES];
        //        [self.crs_accountCredit setSelected:YES];
        //
        //        self.crs_CashPayView.hidden = YES;
        //        [self.crs_SelecRecieverTableView reloadData];
        //self.crs_bankView.hidden= YES;
        crs_Str_BankComparsion = @"Bank";
        
        
    }
    
    //    ([self.crs_CounryField.text isEqualToString:@"IRELAND"]||[self.crs_CounryField.text isEqualToString:@"GERMANY"]||[self.crs_CounryField.text isEqualToString:@"POLAND"]||[self.crs_CounryField.text isEqualToString:@"PORTUGAL"]||[self.crs_CounryField.text isEqualToString:@"NETHERLANDS"]||[self.crs_CounryField.text isEqualToString:@"GREECE"]||[self.crs_CounryField.text isEqualToString:@"SPAIN"]||[self.crs_CounryField.text isEqualToString:@"ROMANIA"]||[self.crs_CounryField.text isEqualToString:@"AUSTRIA"]||[self.crs_CounryField.text isEqualToString:@"BELGIUM"]||[self.crs_CounryField.text isEqualToString:@"BULGARIA"]||[self.crs_CounryField.text isEqualToString:@"CYPRUS"]||[self.crs_CounryField.text isEqualToString:@"CZECHREPUBLIC"]||[self.crs_CounryField.text isEqualToString:@"ITALY"]||[self.crs_CounryField.text isEqualToString:@"SLOVAKIA"]||[self.crs_CounryField.text isEqualToString:@"SLOVENIA"]||[self.crs_CounryField.text isEqualToString:@"HUNGARY"]||[self.crs_CounryField.text isEqualToString:@"MALTA"]||[self.crs_CounryField.text isEqualToString:@"LATVIA"]||[self.crs_CounryField.text isEqualToString:@"ESTONIA"]||[self.crs_CounryField.text isEqualToString:@"FINLAND"]||[self.crs_CounryField.text isEqualToString:@"LITHUANIA"]||[self.crs_CounryField.text isEqualToString:@"FRANCE"]||[self.crs_CounryField.text isEqualToString:@"LUXEMBOURG"])
    //
    //
    //    BULGARIA,ROMANIA, ISREAL, KUWAIT,QATAR,UNITED ARAB EMIRATES,SAUDI ARABIA
    //
    //    TURKEY,SWITZERLAND,CROATIA,BAHRAIN,POLAND
    
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"IRELAND"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GERMANY"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"FRANCE"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PORTUGAL"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"LATVIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ITALY"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"FINLAND"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"FRANCE"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"LITHUANIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"LUXEMBOURG"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"MALTA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ESTONIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SLOVENIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"HUNGARY"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BELGIUM"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"CYPRUS"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"AUSTRIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SLOVAKIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GREECE"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NETHERLANDS"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PORTUGAL"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SPAIN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"CZECH REPUBLIC"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UNITED KINGDOM"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NORWAY"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SWEDEN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"DENMARK"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@""]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@""]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"DENMARK"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@""]){
        self.crs_bankView.hidden= NO;
        
        self.crs_PhpView.hidden = YES;
        self.crs_CashPayOutlet.hidden = YES;
        self.crs_CashPickup.text = @"ACCOUNT CREDIT";
        [self.crs_accountCredit setSelected:NO];
        self.crs_AccountCredit.hidden = YES;
        self.crs_CashPayView.hidden = YES;
        self.crs_BankIfscChanger.text = @"Swift Code";
        self.crs_EurpoeCountryAccount.text = @" IBAN / Account Number";
        self.crs_Ifsc.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"ifsc"]];
        self.crs_Branch.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_name"]];
        // self.crs_NewBranch.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"branch_name"]];
        self.crs_BankAccount.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"account_num"]];
        self.crs_NewBranch.hidden = YES;
        self.crs_BranchNamelabel.hidden = YES;
        self.crs_PhpCashPickUpoutlet.hidden = YES;
        self.crs_Ifsc.hidden = NO;
        self.crs_BankIfscChanger.hidden = NO;
        self.crs_DropDownOmage.hidden = YES;
         self.crs_BanglaBranch.hidden = YES;
        
        //
        //
        
        //crs_str_CashPay = @"AccountCredit";
        //        [self.crs_CashPayOutlet setSelected:YES];
        //        [self.crs_accountCredit setSelected:YES];
        //
        //        self.crs_CashPayView.hidden = YES;
        //        [self.crs_SelecRecieverTableView reloadData];
        //        self.crs_bankView.hidden= YES;
        crs_Str_BankComparsion = @"Bank";
        self.crs_Bankoutlet.hidden = YES;
        
        
        
    }
    //    IBAN-BULGARIA,ROMANIA, ISREAL, KUWAIT,QATAR,UNITED ARAB EMIRATES,SAUDI ARABIA,TURKEY,SWITZERLAND,CROATIA,BAHRAIN,POLANDND,CROATIA,BAHRAIN,POLAND
    
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BULGARIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ROMANIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ISRAEL"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KUWAIT"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"QATAR"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UNITED ARAB EMIRATES"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SAUDI ARABIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"TURKEY"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SWITZERLAND"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"CROATIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BAHRAIN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"POLAND"]){
        
        
        
        
        
        self.crs_bankView.hidden= NO;
        //        [_crs_BankAccount setKeyboardType:UIKeyboardTypeNumberPad];
        [self.crs_Ifsc setKeyboardType:UIKeyboardTypeNamePhonePad];
        [self.crs_BankAccount setKeyboardType:UIKeyboardTypeNamePhonePad];
        self.crs_PhpView.hidden = YES;
        self.crs_CashPayOutlet.hidden = YES;
        self.crs_CashPickup.text = @"ACCOUNT CREDIT";
        [self.crs_accountCredit setSelected:NO];
        self.crs_AccountCredit.hidden = YES;
        self.crs_CashPayView.hidden = YES;
        self.crs_BankIfscChanger.text = @"Swift Code";
        self.crs_EurpoeCountryAccount.text = @"IBAN";
        self.crs_Ifsc.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"ifsc"]];
        self.crs_Branch.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_name"]];
        // self.crs_NewBranch.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"branch_name"]];
        self.crs_BankAccount.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"account_num"]];
        self.crs_NewBranch.hidden = YES;
        self.crs_BranchNamelabel.hidden = YES;
        self.crs_PhpCashPickUpoutlet.hidden = YES;
        self.crs_Ifsc.hidden = NO;
        self.crs_BankIfscChanger.hidden = NO;
        self.crs_DropDownOmage.hidden = YES;
         self.crs_BanglaBranch.hidden = YES;
        //
        //
        
        //crs_str_CashPay = @"AccountCredit";
        //        [self.crs_CashPayOutlet setSelected:YES];
        //        [self.crs_accountCredit setSelected:YES];
        //
        //        self.crs_CashPayView.hidden = YES;
        //        [self.crs_SelecRecieverTableView reloadData];
        //        self.crs_bankView.hidden= YES;
        crs_Str_BankComparsion = @"Bank";
        self.crs_Bankoutlet.hidden = YES;
        
        
        
        
        
        
        
        
        
        
        
        // SINGAPORE,HONKONG, THAILAND,JAPAN,NEW ZEALAND,OMAN,SOUTH AFRICA
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SINGAPORE"]||
             [[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"HONG KONG"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"THAILAND"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"JAPAN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"QATAR"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NEW ZEALAND"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"OMAN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SOUTH AFRICA"]){
        self.crs_bankView.hidden= NO;
        [_crs_BankAccount setKeyboardType:UIKeyboardTypeNumberPad];
        self.crs_PhpView.hidden = YES;
        self.crs_CashPayOutlet.hidden = YES;
        self.crs_CashPickup.text = @"ACCOUNT CREDIT";
        [self.crs_accountCredit setSelected:NO];
        self.crs_AccountCredit.hidden = YES;
        self.crs_CashPayView.hidden = YES;
        self.crs_BankIfscChanger.text = @"Swift Code";
        self.crs_EurpoeCountryAccount.text = @"Account Number";
        self.crs_Ifsc.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"ifsc"]];
        self.crs_Branch.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_name"]];
        // self.crs_NewBranch.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"branch_name"]];
        self.crs_BankAccount.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"account_num"]];
        self.crs_NewBranch.hidden = YES;
        self.crs_BranchNamelabel.hidden = YES;
        self.crs_PhpCashPickUpoutlet.hidden = YES;
        self.crs_Ifsc.hidden = NO;
        self.crs_BankIfscChanger.hidden = NO;
        self.crs_DropDownOmage.hidden = YES;
         self.crs_BanglaBranch.hidden = YES;
        //
        //
        
        //crs_str_CashPay = @"AccountCredit";
        //        [self.crs_CashPayOutlet setSelected:YES];
        //        [self.crs_accountCredit setSelected:YES];
        //
        //        self.crs_CashPayView.hidden = YES;
        //        [self.crs_SelecRecieverTableView reloadData];
        //        self.crs_bankView.hidden= YES;
        crs_Str_BankComparsion = @"Bank";
        self.crs_Bankoutlet.hidden = YES;
        
        
        
    }
    
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ZAMBIA"]||
             [[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ZIMBABWE"]){
        self.crs_bankView.hidden= NO;
        [_crs_BankAccount setKeyboardType:UIKeyboardTypeNumberPad];
        self.crs_PhpView.hidden = YES;
        self.crs_Bankoutlet.hidden = NO;
        self.crs_CashPayOutlet.hidden = YES;
        self.crs_CashPickup.text = @"ACCOUNT CREDIT";
        [self.crs_accountCredit setSelected:NO];
        self.crs_Ifsc.hidden = YES;
        self.crs_AccountCredit.hidden = YES;
        self.crs_CashPayView.hidden = YES;
        self.crs_BankIfscChanger.hidden = YES;
        self.crs_EurpoeCountryAccount.text = @"Account Number";
        self.crs_Ifsc.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"ifsc"]];
        self.crs_Branch.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_name"]];
        // self.crs_NewBranch.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"branch_name"]];
        self.crs_BankAccount.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"account_num"]];
         bankcode = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_code"]];
        self.crs_NewBranch.hidden = YES;
        self.crs_BranchNamelabel.hidden = YES;
        self.crs_PhpCashPickUpoutlet.hidden = YES;
        self.crs_Ifsc.hidden = YES;
        self.crs_BankIfscChanger.hidden = YES;
        self.crs_DropDownOmage.hidden = YES;
         self.crs_BanglaBranch.hidden = YES;
        //
        //
        
        //crs_str_CashPay = @"AccountCredit";
        //        [self.crs_CashPayOutlet setSelected:YES];
        //        [self.crs_accountCredit setSelected:YES];
        //
        //        self.crs_CashPayView.hidden = YES;
        //        [self.crs_SelecRecieverTableView reloadData];
        //        self.crs_bankView.hidden= YES;
        crs_Str_BankComparsion = @"Bank";
        self.crs_Bankoutlet.hidden = NO;
        
        
        
    }
    
    
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GAMBIA"]){
        self.crs_bankView.hidden= NO;
        
        self.crs_PhpView.hidden = YES;
        self.crs_CashPayOutlet.hidden = YES;
        self.crs_CashPickup.text = @"CASH PICK-UP";
        [self.crs_accountCredit setSelected:NO];
        self.crs_AccountCredit.hidden = YES;
        self.crs_CashPayView.hidden = NO;
        
        self.crs_PhpCashPickUpoutlet.hidden = YES;
        self.crs_Ifsc.hidden = YES;
        self.crs_BankIfscChanger.hidden = YES;
         self.crs_BanglaBranch.hidden = YES;
        
        //
        //
        
        //crs_str_CashPay = @"AccountCredit";
        //        [self.crs_CashPayOutlet setSelected:YES];
        //        [self.crs_accountCredit setSelected:YES];
        //
        //        self.crs_CashPayView.hidden = YES;
        //        [self.crs_SelecRecieverTableView reloadData];
        //        self.crs_bankView.hidden= YES;
        
        
        crs_Str_BankComparsion = @"Cashpay";
        crs_str_CashPay = @"CashPay";
        self.crs_Bankoutlet.hidden = YES;
        
        
        
    }
    
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KENYA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"TANZANIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UGANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"RWANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NIGERIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GHANA"]){
        Crs_str_tableviewcompare = @"MOBILEWALLET";
        KenyaComparsion = @"MOBILEWALLET";
        self.crs_CashPayOutlet.hidden = NO;
        self.crs_kenyaLabel.hidden = NO;
        self.crs_CashPickup.hidden = NO;
        self.crs_ForCashVietnam.hidden = YES;
        self.crs_Bankoutlet.hidden = NO;
        self.crs_SelectPaymentLabel.text = @"Please Select Wallet Name";
        self.crs_PhpView.hidden = NO;
        self.crs_PhpBranchName.userInteractionEnabled = NO;
        self.crs_PhpBankName.userInteractionEnabled = NO;
        self.crs_PhpAccountNumbe.userInteractionEnabled = YES;
        [self.crs_PhpAccountNumbe setKeyboardType:UIKeyboardTypeNumberPad];
        self.crs_PhpBranchName.hidden = YES;
        self.crs_CashPickup.text = @"MOBILE WALLET";
         self.crs_BanglaBranch.hidden = YES;
        self.crs_Vtn_Branchname.hidden = YES;
        //self.crs_Bankoutlet.hidden = YES;
        self.crs_PhpBankOutlet.hidden = NO;
        //                self.crs_PhpBranchName.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"branch_name"]];
        self.crs_PhpBankName.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_name"]];
        
        self.crs_PhpAccountNumbe.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"account_num"]];
        bankcode = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_code"]];
        
        
        crs_str_CashPay = @"AccountCredit";
        [self.crs_CashPayOutlet setSelected:YES];
        [self.crs_accountCredit setSelected:YES];
        
        self.crs_CashPayView.hidden = YES;
        [self.crs_SelecRecieverTableView reloadData];
        self.crs_bankView.hidden= YES;
        crs_Str_BankComparsion = @"Bank";
        //                 payMentTypeComparsion = @"Account Credit";
        
    }
    
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BANGLADESH"]){
        Crs_str_tableviewcompare = @"MOBILEWALLET";
        KenyaComparsion = @"MOBILEWALLET";
        self.crs_CashPayOutlet.hidden = NO;
        self.crs_kenyaLabel.hidden = NO;
        self.crs_CashPickup.hidden = NO;
        self.crs_ForCashVietnam.hidden = YES;
        self.crs_Bankoutlet.hidden = NO;
        self.crs_SelectPaymentLabel.text = @"Please Select Wallet Name";
        self.crs_PhpView.hidden = NO;
        self.crs_PhpBranchName.userInteractionEnabled = NO;
        self.crs_PhpBankName.userInteractionEnabled = NO;
        self.crs_PhpAccountNumbe.userInteractionEnabled = YES;
        [self.crs_PhpAccountNumbe setKeyboardType:UIKeyboardTypeNumberPad];
        self.crs_PhpBranchName.hidden = NO;
        self.crs_BanglaBranch.hidden = NO;
        self.crs_CashPickup.text = @"MOBILE WALLET";
        self.crs_Vtn_Branchname.hidden = NO;
         self.crs_BanglaBranch.hidden = NO;
        //self.crs_Bankoutlet.hidden = YES;
        self.crs_PhpBankOutlet.hidden = NO;
        //                self.crs_PhpBranchName.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"branch_name"]];
        self.crs_PhpBankName.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_name"]];
        
        self.crs_PhpAccountNumbe.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"account_num"]];
        bankcode = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_code"]];
        banglaBranchCode = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"branch_code"]];
        self.crs_PhpBranchName.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"branch_name"]];
        crs_str_CashPay = @"AccountCredit";
        [self.crs_CashPayOutlet setSelected:YES];
        [self.crs_accountCredit setSelected:YES];
        
        self.crs_CashPayView.hidden = YES;
        [self.crs_SelecRecieverTableView reloadData];
        self.crs_bankView.hidden= YES;
        crs_Str_BankComparsion = @"Bank";
        //                 payMentTypeComparsion = @"Account Credit";
        
    }
    
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GAMBIA"]){
        self.crs_bankView.hidden= NO;
        
        self.crs_PhpView.hidden = YES;
        self.crs_CashPayOutlet.hidden = YES;
        self.crs_CashPickup.text = @"Mobile Wallet";
        [self.crs_accountCredit setSelected:NO];
        self.crs_AccountCredit.hidden = NO;
        self.crs_CashPayView.hidden = NO;
        
        self.crs_PhpCashPickUpoutlet.hidden = YES;
        self.crs_Ifsc.hidden = YES;
        self.crs_BankIfscChanger.hidden = YES;
        
         self.crs_BanglaBranch.hidden = YES;
        //
        //
        
        //crs_str_CashPay = @"AccountCredit";
        //        [self.crs_CashPayOutlet setSelected:YES];
        //        [self.crs_accountCredit setSelected:YES];
        //
        //        self.crs_CashPayView.hidden = YES;
        //        [self.crs_SelecRecieverTableView reloadData];
        //        self.crs_bankView.hidden= YES;
        
        
        crs_Str_BankComparsion = @"Cashpay";
        crs_str_CashPay = @"CashPay";
        self.crs_Bankoutlet.hidden = YES;
        
        
        
    }
    
    
    
    
    else{
        
        
        self.crs_CashPayOutlet.hidden = NO;
        self.crs_CashPickup.text = @"CASH PICK-UP";
        self.crs_AccountCredit.hidden = NO;
        self.crs_CashPayView.hidden = NO;
        
        //        if ([Acountnumber isEqualToString:@""]) {
        
        if (ram.count<=13||ram.count<=15||[Acountnumber isEqualToString:@""]) {
            crs_str_CashPay = @"CashPay";
            self.crs_Bankoutlet.hidden = NO;
            self.crs_CashPayView.hidden = NO;
            [self.crs_SelecRecieverTableView reloadData];
            self.crs_bankView.hidden= YES;
            self.crs_ViewBankMode.hidden = YES;
            self.crs_Bankoutlet.hidden = NO;
            
            
            [self.crs_CashPayOutlet setSelected:NO
             ];
            [self.crs_accountCredit setSelected:NO];
            crs_str_CountryComparsion = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"country"]];
            crs_Str_BankComparsion = @"Cashpay";
            
            self.crs_BankAccount.text = @"";
            self.crs_Ifsc.text = @"";
            self.crs_Branch.text = @"";
            
            
            if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]){
                
                //
                //          self.crs_CashPayOutlet.hidden = YES;
                //          self.crs_AccountCredit.hidden = YES;
                //          self.crs_CashPayOutlet.userInteractionEnabled = NO;
                //          self.crs_AccountCredit.userInteractionEnabled = NO;
                //          self.crs_PhpView.hidden = YES;
                
                //_crs_CashPayOutlet.userInteractionEnabled = NO;
                self.crs_CashPayOutlet.hidden = YES;
                self.crs_PhpCashPickUpoutlet.hidden = YES;
                self.crs_ForCashVietnam.hidden = NO;
                
                
            }
            
            
            
        }
        else {
            
            if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PHILIPPINES"]) {
                
                self.crs_Bankoutlet.hidden = NO;
                self.crs_PhpView.hidden = NO;
                self.crs_PhpBranchName.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"branch_name"]];
                self.crs_PhpBankName.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_name"]];
                
                self.crs_PhpAccountNumbe.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"account_num"]];
                bankcode = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_code"]];
                
                 self.crs_BanglaBranch.hidden = YES;
                crs_str_CashPay = @"AccountCredit";
                [self.crs_CashPayOutlet setSelected:YES];
                [self.crs_accountCredit setSelected:YES];
                
                self.crs_CashPayView.hidden = YES;
                [self.crs_SelecRecieverTableView reloadData];
                self.crs_bankView.hidden= YES;
                crs_Str_BankComparsion = @"Bank";
            }
            
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]){
                self.crs_ForCashVietnam.hidden = YES;
                self.crs_Bankoutlet.hidden = NO;
                self.crs_PhpView.hidden = NO;
                self.crs_PhpBranchName.userInteractionEnabled = NO;
                self.crs_PhpBankName.userInteractionEnabled = NO;
                self.crs_PhpAccountNumbe.userInteractionEnabled = NO;
                //self.crs_Bankoutlet.hidden = YES;
                self.crs_PhpBankOutlet.hidden = YES;
                 self.crs_BanglaBranch.hidden = YES;
                self.crs_PhpBranchName.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"branch_name"]];
                self.crs_PhpBankName.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_name"]];
                
                self.crs_PhpAccountNumbe.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"account_num"]];
                bankcode = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_code"]];
                
                
                crs_str_CashPay = @"AccountCredit";
                [self.crs_CashPayOutlet setSelected:YES];
                [self.crs_accountCredit setSelected:YES];
                
                self.crs_CashPayView.hidden = YES;
                [self.crs_SelecRecieverTableView reloadData];
                self.crs_bankView.hidden= YES;
                crs_Str_BankComparsion = @"Bank";
                
                
            }
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NEPAL"]){
                
                
                self.crs_Bankoutlet.hidden = NO;
                 self.crs_BanglaBranch.hidden = YES;
                self.crs_PhpView.hidden = NO;
                self.crs_PhpBranchName.userInteractionEnabled = NO;
                self.crs_PhpBranchName.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"branch_name"]];
                self.crs_PhpBankName.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_name"]];
                
                self.crs_PhpAccountNumbe.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"account_num"]];
                
                bankcode = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_code"]];
                branchCode = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"branch_code"]];
                
                crs_str_CashPay = @"AccountCredit";
                [self.crs_CashPayOutlet setSelected:YES];
                [self.crs_accountCredit setSelected:YES];
                
                self.crs_CashPayView.hidden = YES;
                [self.crs_SelecRecieverTableView reloadData];
                self.crs_bankView.hidden= YES;
                crs_Str_BankComparsion = @"Bank";
                self.crs_BanglaBranch.hidden = YES;
                
            }
            
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KENYA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"TANZANIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UGANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"RWANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NIGERIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GHANA"]){
                Crs_str_tableviewcompare =@"MOBILEWALLET";
                KenyaComparsion = @"MOBILEWALLET";
                self.crs_CashPayOutlet.hidden = NO;
                 self.crs_BanglaBranch.hidden = YES;
                self.crs_kenyaLabel.hidden = NO;
                self.crs_CashPickup.hidden = NO;
                self.crs_ForCashVietnam.hidden = YES;
                self.crs_Bankoutlet.hidden = NO;
                self.crs_SelectPaymentLabel.text = @"Please Select Wallet Name";
                self.crs_PhpView.hidden = NO;
                self.crs_PhpBranchName.userInteractionEnabled = NO;
                self.crs_PhpBankName.userInteractionEnabled = NO;
                self.crs_PhpAccountNumbe.userInteractionEnabled = YES;
                [self.crs_PhpAccountNumbe setKeyboardType:UIKeyboardTypeNumberPad];
                self.crs_PhpBranchName.hidden = YES;
                self.crs_CashPickup.text = @"MOBILE WALLET";
                self.crs_Vtn_Branchname.hidden = YES;
                //self.crs_Bankoutlet.hidden = YES;
                self.crs_PhpBankOutlet.hidden = NO;
                //                self.crs_PhpBranchName.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"branch_name"]];
                self.crs_PhpBankName.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_name"]];
                
                self.crs_PhpAccountNumbe.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"account_num"]];
                bankcode = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_code"]];
                
                
                crs_str_CashPay = @"AccountCredit";
                [self.crs_CashPayOutlet setSelected:YES];
                [self.crs_accountCredit setSelected:YES];
                
                self.crs_CashPayView.hidden = YES;
                [self.crs_SelecRecieverTableView reloadData];
                self.crs_bankView.hidden= YES;
                crs_Str_BankComparsion = @"Bank";
                //                 payMentTypeComparsion = @"Account Credit";
                
            }
            
            
            else  if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"INDIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PAKISTAN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SRI LANKA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NEPAL"]){
                if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PAKISTAN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SRI LANKA"]) {
                    self.crs_BankIfscChanger.text = @"Branch Code";
                    [_crs_BankAccount setKeyboardType:UIKeyboardTypeNumberPad];
                }
                else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NEPAL"]){
                    
                    self.crs_PhpBranchName.userInteractionEnabled = NO;
                    
                }
                else
                {
                    self.crs_BankIfscChanger.text = @"IFSC";
                    
                }
                self.crs_Bankoutlet.hidden = NO;
                self.crs_PhpView.hidden = YES;
                
                if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PAKISTAN"]) {
                    
                    self.crs_Ifsc.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"ifsc"]];
                    
                    self.crs_pobDob.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"dob"]];
                    
                }
                else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SRI LANKA"]){
                    
                    
                    self.crs_Ifsc.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"branch_code"]];
                    
                    bankcode = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_code"]];
                }
                
                
                
                else
                {
                    
                    
                    self.crs_Ifsc.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"ifsc"]];
                    
                }
                
                self.crs_Branch.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_name"]];
                self.crs_NewBranch.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"branch_name"]];
                self.crs_BankAccount.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"account_num"]];
                
                
                crs_str_CashPay = @"AccountCredit";
                [self.crs_CashPayOutlet setSelected:YES];
                [self.crs_accountCredit setSelected:YES];
                
                self.crs_CashPayView.hidden = YES;
                [self.crs_SelecRecieverTableView reloadData];
                self.crs_bankView.hidden= YES;
                crs_Str_BankComparsion = @"Bank";
                self.crs_BranchNamelabel.hidden = NO;
            }
            else
            {
                
                 self.crs_BanglaBranch.hidden = YES;
                
                self.crs_bankView.hidden= NO;
                self.crs_PhpView.hidden = YES;
                self.crs_CashPayOutlet.hidden = YES;
                self.crs_CashPickup.text = @"ACCOUNT CREDIT";
                [self.crs_accountCredit setSelected:NO];
                self.crs_AccountCredit.hidden = YES;
                self.crs_CashPayView.hidden = YES;
                self.crs_BankIfscChanger.text = @"IBAN";
                self.crs_Ifsc.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"ifsc"]];
                self.crs_Branch.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"bank_name"]];
                self.crs_NewBranch.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"branch_name"]];
                self.crs_BankAccount.text = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"account_num"]];
                self.crs_BranchNamelabel.hidden = NO;
                //
                //
                
                //crs_str_CashPay = @"AccountCredit";
                //        [self.crs_CashPayOutlet setSelected:YES];
                //        [self.crs_accountCredit setSelected:YES];
                //
                //        self.crs_CashPayView.hidden = YES;
                //        [self.crs_SelecRecieverTableView reloadData];
                //        self.crs_bankView.hidden= YES;
                crs_Str_BankComparsion = @"Bank";
                self.crs_Bankoutlet.hidden = YES;
                
                
                
                
                
                
                
            }
            
        }
        
        
        //
        //        else if ([crs_Str_BankComparsion isEqualToString:@"MOBILEWALLET"]){
        //            if ([self.crs_SelectPaymentLabel.text isEqualToString:@"Please Select Wallet Name"]) {
        //
        //                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Select Payeweweewout-Network" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        //
        //                [alert show];
        //                return;
        //            }
        //
        //        }
        
        
        
    }
    
    MobileComparision = [NSString stringWithFormat:@"%@",[[crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - sender.tag - 1)]valueForKey:@"mobile"]];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (tableView ==self.Crs_BankName_Tableview) {
        
        if ( [Crs_str_tableviewcompare isEqualToString: @"cashpay"]) {
            if (!isFiltered) {
                
                self.crs_SelectPaymentLabel.text =  [[Crs_Array_list valueForKey:@"agent_name"] objectAtIndex:indexPath.row];
                
                
                
                
                [Crs_sharedvariable sharedMySingleton].crs_AgentCode =  [[Crs_Array_list valueForKey:@"agent_code"] objectAtIndex:indexPath.row];
                
                ;
                
                
                self.Crs_Banknameview.hidden =YES;
                
                
                
            }
            
            
            
            
            else{
                
                
                
                
                self.crs_SelectPaymentLabel.text =  [[searchArray valueForKey:@"agent_name"] objectAtIndex:indexPath.row];
                
                
                
                
                [Crs_sharedvariable sharedMySingleton].crs_AgentCode =  [[searchArray valueForKey:@"agent_code"] objectAtIndex:indexPath.row];
                
                ;
                
                
                self.Crs_Banknameview.hidden =YES;
                
                
            }
            
        }
        else if ([Crs_str_tableviewcompare isEqualToString:@"MOBILEWALLET"]){
            
            if (!isFiltered) {
                
                self.crs_SelectPaymentLabel.text =  [[MobileWalletArray valueForKey:@"WalletName"] objectAtIndex:indexPath.row];
                
                
                
                
                [Crs_sharedvariable sharedMySingleton].crs_AgentCode =  [[MobileWalletArray valueForKey:@"WalletProviderCode"] objectAtIndex:indexPath.row];
                [Crs_sharedvariable sharedMySingleton].crs_Mobilewallet =  [[MobileWalletArray valueForKey:@"WalletProviderCode"] objectAtIndex:indexPath.row];
                ;
                
                
                self.Crs_Banknameview.hidden =YES;
                
                
                
            }
            
            
            
            
            else{
                
                
                
                
                self.crs_SelectPaymentLabel.text =  [[searchArray valueForKey:@"WalletName"] objectAtIndex:indexPath.row];
                
                
                
                
                [Crs_sharedvariable sharedMySingleton].crs_AgentCode =  [[searchArray valueForKey:@"WalletProviderCode"] objectAtIndex:indexPath.row];
                
                ;
                
                
                self.Crs_Banknameview.hidden =YES;
                
                
            }
            
            
            
        }
        
        else if ([Crs_str_tableviewcompare isEqualToString:@"BranchGetter"]){
            
            if (!isFiltered) {
                
                self.crs_PhpBranchName.text =  [[branchArray valueForKey:@"branch_name"] objectAtIndex:indexPath.row];
                banglaBranchCode = [[branchArray valueForKey:@"branch_code"] objectAtIndex:indexPath.row];
                
                
                
//                [Crs_sharedvariable sharedMySingleton].crs_AgentCode =  [[MobileWalletArray valueForKey:@"WalletProviderCode"] objectAtIndex:indexPath.row];
//                [Crs_sharedvariable sharedMySingleton].crs_Mobilewallet =  [[MobileWalletArray valueForKey:@"WalletProviderCode"] objectAtIndex:indexPath.row];
                ;
                
                
                self.Crs_Banknameview.hidden =YES;
                
                
                
            }
            
            
            
            
            else{
                
                
                
                
                self.crs_PhpBranchName.text =  [[searchArray valueForKey:@"branch_name"] objectAtIndex:indexPath.row];
                
                banglaBranchCode = [[searchArray valueForKey:@"branch_code"] objectAtIndex:indexPath.row];
                
//
//                [Crs_sharedvariable sharedMySingleton].crs_AgentCode =  [[searchArray valueForKey:@"WalletProviderCode"] objectAtIndex:indexPath.row];
                
                ;
                
                
                self.Crs_Banknameview.hidden =YES;
                
                
            }
            
            
            
        }
        else
        {
            
            if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PHILIPPINES"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KENYA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"TANZANIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UGANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"RWANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NIGERIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GHANA"])
            {
                if (!isFiltered) {
                    self.crs_PhpBankName.text=[[Crs_Array_banknameslist valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
                    bankcode = [[Crs_Array_banknameslist valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                    
                }
                else{
                    
                    
                    self.crs_PhpBankName.text=[[searchArray valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
                    bankcode = [[searchArray valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                }
                
                
            }
            
            
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ZAMBIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ZIMBABWE"]){
                
                if (!isFiltered) {
                    self.crs_Branch.text=[[Crs_Array_banknameslist valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
                    
                    bankcode = [[Crs_Array_banknameslist valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                    
                    
                    
               
                    
                }
                
                
                
                
                else{
                    
                    
                    self.crs_Branch.text=[[Crs_Array_banknameslist valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
                    
                    bankcode = [[Crs_Array_banknameslist valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                   
                }
                
            }
            
            
            
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NEPAL"]){
                
                if (!isFiltered) {
                    self.crs_PhpBankName.text=[[Crs_Array_banknameslist valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
                    self.crs_PhpBranchName.text = [[Crs_Array_banknameslist valueForKey:@"branch_name"] objectAtIndex:indexPath.row];
                    bankcode = [[Crs_Array_banknameslist valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                    branchCode = [[Crs_Array_banknameslist valueForKey:@"branch_code"] objectAtIndex:indexPath.row];
                    
                    
                    
                    self.crs_PhpBranchName.userInteractionEnabled = NO;
                    
                }
                
                
                
                
                else{
                    
                    
                    self.crs_PhpBankName.text=[[searchArray valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
                    self.crs_PhpBranchName.text = [[searchArray valueForKey:@"branch_name"] objectAtIndex:indexPath.row];
                    bankcode = [[searchArray valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                    branchCode = [[searchArray valueForKey:@"branch_code"] objectAtIndex:indexPath.row];
                    
                    
                    
                    self.crs_PhpBranchName.userInteractionEnabled = NO;
                }
                
            }
            
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BANGLADESH"]){
                
                if (!isFiltered) {
                    self.crs_PhpBankName.text=[[Crs_Array_banknameslist valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
                   
                    bankcode = [[Crs_Array_banknameslist valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                  
                    
                    
                    
                    self.crs_PhpBranchName.userInteractionEnabled = NO;
                    
                }
                
                
                
                
                else{
                    
                    
                    self.crs_PhpBankName.text=[[searchArray valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
                    
                    bankcode = [[searchArray valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                  
                    
                    
                    self.crs_PhpBranchName.userInteractionEnabled = NO;
                }
                
            }
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SRI LANKA"])
            {
                if (!isFiltered) {
                    
                    
                    bankcode = [[Crs_Array_banknameslist valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                    
                    self.crs_Branch.text=[[Crs_Array_banknameslist valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
                    
                }
                else{
                    
                    bankcode = [[searchArray valueForKey:@"bank_code"] objectAtIndex:indexPath.row];
                    
                    self.crs_Branch.text=[[searchArray valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
                    
                }
                
            }
            
            
            
            else{
                if (!isFiltered) {
                    self.crs_Branch.text=[[Crs_Array_banknameslist valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
                }
                else{
                    
                    self.crs_Branch.text=[[searchArray valueForKey:@"bank_name"] objectAtIndex:indexPath.row];
                }
                
                
                
            }
            
            
            self.Crs_Banknameview.hidden =YES;
            
        }
        
        
    }
    
    
    
    
    
    [tableView reloadData];
    
    //    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //
    //   RecieverDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"RecieverDetailedViewControllerSID"];;
    //    viewController.Addreciverdetails = [crs_RecieverDetails objectAtIndex:(crs_RecieverDetails.count - indexPath.row - 1)];
    // viewController.Crs_Comparsion = @"unhideProceed";
    //    [self.navigationController pushViewController:viewController animated:YES];
    //
    //
    
    
    
    
    
    
    
}
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//
//
//    //1. Setup the CATransform3D structure
//    CATransform3D rotation;
//    rotation = CATransform3DMakeRotation( (55.0*M_PI)/180, 0.0, 10.4, 0.4);
//    rotation.m34 = 20.0/ 1000;
//
//
//    //2. Define the initial state (Before the animation)
//    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    cell.layer.shadowOffset = CGSizeMake(10, 10);
//    cell.alpha = 0;
//
//    cell.layer.transform = rotation;
//    cell.layer.anchorPoint = CGPointMake(0, 0.5);
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


- (IBAction)crs_AddRecieverAction:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    profileViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"ProfileViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    
    
    
    
}

- (IBAction)crs_BackAction:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    self.crs_CashPayView.hidden = YES;
    self.crs_PhpBranchName.text = @"";
    self.crs_PhpBankName.text = @"";
    self.crs_PhpAccountNumbe.text = @"";
    
}






- (IBAction)crs_HomePage:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

- (IBAction)crs_HistoryPage:(id)sender {
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HistoryViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"historyViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}

//- (IBAction)crs_profilePage:(id)sender {
//
//
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//
//UpdateProfile* viewController = [storyboard instantiateViewControllerWithIdentifier:@"UpdateProfileViewControllerSID"];;
//
//    [self.navigationController pushViewController:viewController animated:YES];
//
////}

- (IBAction)crs_Notification:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    notificationViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"notificationViewControllerSID"];;
    
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

- (IBAction)crs:(id)sender {
}

- (IBAction)crs_settingsPage:(id)sender {
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    SettingsViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewControllerSid"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
    
    
    
    
    
    
}
- (IBAction)crs_cashPayAction:(id)sender {
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    self.crs_ViewBankMode.hidden = YES;
    if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"INDIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PAKISTAN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SRI LANKA"]){
        
        if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PAKISTAN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SRI LANKA"]) {
            self.crs_BankIfscChanger.text = @"Branch Code";
        }
        
        else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SRI LANKA"]){
            
            
            self.crs_Bankoutlet.hidden = NO;
            self.crs_BankIfscChanger.text = @"Branch Code";
        }
        
        
        
        else
        {
            self.crs_BankIfscChanger.text = @"IFSC";
            
        }
        
        self.crs_PhpView.hidden = YES;
        
    }
    
    
    else{
        
        self.crs_PhpView.hidden = NO;
        
    }
    
    
    crs_Str_BankComparsion = @"bank";
    crs_str_CashPay = @"AccountCredit";
    [self.crs_CashPayOutlet setSelected:YES];
    [self.crs_accountCredit setSelected:YES];
    
    self.crs_CashPayView.hidden = YES;
    if ([Acountnumber isEqualToString:@""]) {
        
        
        [self.crs_ProceedOut setTitle:@"UpDate Bank Details" forState:UIControlStateNormal];
    }
    else{
        
        
        [self.crs_ProceedOut setTitle:@"Proceed" forState:UIControlStateNormal];
        
    }
    
    
    
}

- (IBAction)crs_AccountCredit:(id)sender {
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    if ([MobileComparision isEqualToString:@""]) {
        
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Mobile Number is Mandatory for Cashpick-up Service." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
    }
    
    
    self.crs_PhpView.hidden = YES;
    
    
    if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"USA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"IRELAND"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UNITED STATES"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GERMANY"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@""]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"FRANCE"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PORTUGAL"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"LATVIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ITALY"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"FINLAND"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"FRANCE"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"LITHUANIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"LUXEMBOURG"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"MALTA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ESTONIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SLOVENIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"HUNGARY"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"CYPRUS"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"AUSTRIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SLOVAKIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GREECE"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NETHERLANDS"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PORTUGAL"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SPAIN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BELGIUM"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"CZECH REPUBLIC"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UNITED KINGDOM"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NORWAY"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"AUSTRALIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"DENMARK"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SWEDEN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SIERRA LEONE"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"CANADA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@""]) {
        
        
        
        
        
        self.crs_CashPayOutlet.hidden = YES;
        crs_Str_BankComparsion = @"bank";
        crs_str_CashPay = @"AccountCredit";
        self.crs_EurpoeCountryAccount.text = @"IBAN / Account Number ";
        
        [self.crs_ProceedOut setTitle:@"Proceed" forState:UIControlStateNormal];
        
    }
    else{
        
        
        
        
        
        
        
        
        crs_Str_BankComparsion = @"Cashpay";
        crs_str_CashPay = @"CashPay";
        [self.crs_CashPayOutlet setSelected:NO];
        [self.crs_accountCredit setSelected:NO];
        
        
        self.crs_CashPayView.hidden = NO;
        
        [self.crs_ProceedOut setTitle:@"Proceed" forState:UIControlStateNormal];
        
    }
    
}
- (IBAction)crs_SelectPayout:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    
    //self.crs_pickerView.hidden = NO;
    
    
    
    
    
}

//
////- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
////{
////    NSString *title = @"sample title";
////    NSAttributedString *attString =
////    [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
////
////    return attString;
//}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //    UILabel* pickerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width, 37)];
    //    pickerLabel.text = @"text";
    //    pickerLabel.textColor = [UIColor redColor];
    //    return pickerLabel;
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return Crs_Array_list.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [[Crs_Array_list valueForKey:@"agent_name"] objectAtIndex:row];
    
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    self.crs_SelectPaymentLabel.text =  [[Crs_Array_list valueForKey:@"agent_name"] objectAtIndex:row];
    
    // NSLog(@" component zero %@ ",[idProofTypeArray objectAtIndex:row]);
    //
    //        [pickerView selectRow:row inComponent:1 animated:true];
    
    
    [Crs_sharedvariable sharedMySingleton].crs_AgentCode =  [[Crs_Array_list valueForKey:@"agent_code"] objectAtIndex:row];
    
    ;
    
    
    self.crs_ViewBankMode.hidden = YES;
}


- (IBAction)crs_selectIProofType:(id)sender {
    
    
    
    
    
}






- (IBAction)crs_SelectPaymentModeAction:(id)sender {
    isFiltered = NO;
    self.crs_search.text = @"";
    Crs_str_tableviewcompare=@"cashpay";
    self.crs_search.placeholder = @"Search By Agent Name";
    self.crs_AgentChanger.text = @"Choose Your Agents here";
    
    if ([Crs_str_tableviewcompare isEqualToString:@"MOBILE WALLET"]) {
        self.crs_search.placeholder = @"Search By Wallet Name";
        self.crs_AgentChanger.text = @"Choose Your Agents here";
    }
    else{
        
        self.crs_search.placeholder = @"Search By Agent Name";
        self.crs_AgentChanger.text = @"Choose Your Agents here";
        
    }
    
    if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"INDIA"]||[[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"India"]) {
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"agent_country_code"]objectAtIndex:i]isEqualToString:@"INR"] ) {
                
                NSString * statusString = [NSString stringWithFormat:@"%@",[[Crs_Array_banklist valueForKey:@"agent_status"]objectAtIndex:i]];
                if  ([statusString isEqualToString:@"1"]) {
                    [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                }
                
                
                
                
            }
            else{
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        [_crs_PickerViewBankMode reloadAllComponents];
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"PHILIPPINES"])
    {
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"agent_country_code"]objectAtIndex:i]isEqualToString:@"PHL"] ) {
                
                NSString * statusString1 = [NSString stringWithFormat:@"%@",[[Crs_Array_banklist valueForKey:@"agent_status"]objectAtIndex:i]];
                
                if ([statusString1 isEqualToString:@"1"]){
                    [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                    
                }
                
                
                
                
            }
            else{
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"GAMBIA"])
    {
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"agent_country_code"]objectAtIndex:i]isEqualToString:@"GMB"] ) {
                
                NSString * statusString1 = [NSString stringWithFormat:@"%@",[[Crs_Array_banklist valueForKey:@"agent_status"]objectAtIndex:i]];
                
                if ([statusString1 isEqualToString:@"1"]){
                    [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                    
                }
                
                
                
                
            }
            else{
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PAKISTAN"])
    {
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"agent_country_code"]objectAtIndex:i]isEqualToString:@"PKR"] ) {
                
                
                [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
        
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NEPAL"])
    {
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"agent_country_code"]objectAtIndex:i]isEqualToString:@"NPR"] ) {
                
                
                [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
        
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"])
    {
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"agent_country_code"]objectAtIndex:i]isEqualToString:@"VND"] ) {
                
                
                [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
        
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SRI LANKA"])
    {
        [Crs_Array_list removeAllObjects];
        for (int i=0; i<Crs_Array_banklist.count; i++) {
            
            if ([[[Crs_Array_banklist valueForKey:@"agent_country_code"]objectAtIndex:i]isEqualToString:@"LKR"] ) {
                
                
                [Crs_Array_list addObject:[Crs_Array_banklist objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_list);
        
        
        
        
        
        
    }
    
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KENYA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"TANZANIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UGANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"RWANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NIGERIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GHANA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BANGLADESH"])
    {
        Crs_str_tableviewcompare=@"MOBILEWALLET";
        crs_str_CashPay = @"MOBILEWALLET";
        
        
        MobileWalletArray = [NSMutableArray new];
        for (int i = 0 ;i<KenyanArray.count;i++) {
            
            if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KENYA"]){
                if ([[[KenyanArray valueForKey:@"WalletCountryCode"]objectAtIndex:i]isEqualToString:@"KE"]) {
                    [MobileWalletArray addObject:[KenyanArray objectAtIndex:i]];
                }
                
            }
           else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UGANDA"]){
                if ([[[KenyanArray valueForKey:@"WalletCountryCode"]objectAtIndex:i]isEqualToString:@"UG"]) {
                    [MobileWalletArray addObject:[KenyanArray objectAtIndex:i]];
                }
                
            }
            
            
           else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GHANA"]){
               if ([[[KenyanArray valueForKey:@"WalletCountryCode"]objectAtIndex:i]isEqualToString:@"GH"]) {
                   [MobileWalletArray addObject:[KenyanArray objectAtIndex:i]];
               }
               
           }
            
           else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BANGLADESH"]){
               if ([[[KenyanArray valueForKey:@"WalletCountryCode"]objectAtIndex:i]isEqualToString:@"BD"]) {
                   [MobileWalletArray addObject:[KenyanArray objectAtIndex:i]];
               }
               
           }
           else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"RWANDA"]){
               if ([[[KenyanArray valueForKey:@"WalletCountryCode"]objectAtIndex:i]isEqualToString:@"RW"]) {
                   [MobileWalletArray addObject:[KenyanArray objectAtIndex:i]];
               }
               
           }
            
           else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NIGERIA"]){
               if ([[[KenyanArray valueForKey:@"WalletCountryCode"]objectAtIndex:i]isEqualToString:@"NG"]) {
                   [MobileWalletArray addObject:[KenyanArray objectAtIndex:i]];
               }
               
           }
            else{
                
                if ([[[KenyanArray valueForKey:@"WalletCountryCode"]objectAtIndex:i]isEqualToString:@"TZ"]) {
                    [MobileWalletArray addObject:[KenyanArray objectAtIndex:i]];
                }
                
            }
            
        }
        
        //[self Crs_MobileWallet];
        
        
        
        
        
    }
    
    
    
    
    self.Crs_Banknameview.hidden =NO;
    
    [self.Crs_BankName_Tableview reloadData];
    
    //self.crs_PaymentModeView.hidden = NO;
    // self.crs_ViewBankMode.hidden = NO;
    //[self.crs_PickerViewBankMod
}


-(void)Crs_PaymentModeType
{
    
    
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:Crosspay_GetAgent] completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@",json);
        crs_PaymentAgent = [json valueForKey:@"agent"];
        
        
        
        
    }];
    
    [dataTask resume];
    
    
    
    
    
    
    
    
    
    
    
    
}








-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    [[self view] endEditing:YES];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}



- (IBAction)crs_ProceedAction:(id)sender {
    
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GAMBIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KENYA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"TANZANIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UGANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"RWANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NIGERIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GHANA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BANGLADESH"]){
        if ([crs_Str_BankComparsion isEqualToString:@"Cashpay"]){
            if ([self.crs_SelectPaymentLabel.text isEqualToString:@"Select Payout-Network"]) {
                
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  Select Payout-Network" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                return;
                
            }
            else if ([KenyaComparsion isEqualToString:@"MOBILEWALLET"]){
                if ([self.crs_SelectPaymentLabel.text isEqualToString:@"Please Select Wallet Name"]) {
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Wallet Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    return;
                }
                else{
                    //                    self.crs_PhpBankOutlet.userInteractionEnabled = NO;
                    //                    self.crs_PhpAccountNumbe.userInteractionEnabled = NO;
                    //                    self.crs_PhpBankName.userInteractionEnabled = NO;
                    
                    
                    [Crs_sharedvariable sharedMySingleton].Crs_CashComparsion890 = crs_str_CashPay;
                    
                    [Crs_sharedvariable sharedMySingleton].Crs_str_BankName890 = self.crs_SelectPaymentLabel.text;
                    [Crs_sharedvariable sharedMySingleton].crs_Ary_CashPayDetails890 =  [Crs_ary_BankDetails mutableCopy];
                    
                    NSLog(@"Sehwag=======%@", [Crs_sharedvariable sharedMySingleton].Crs_CashComparsion890);
                    NSLog(@"Sehwage=======%@",  [Crs_sharedvariable sharedMySingleton].Crs_str_BankName890);
                    NSLog(@"Sehwageee=======%@",[Crs_sharedvariable sharedMySingleton].crs_Ary_CashPayDetails890);
                    NSLog(@"Sehwageee23=======%@", [Crs_sharedvariable sharedMySingleton].crs_DictionarybankDetails890);
                    
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    
                    
                    RecieverDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"RecieverDetailedViewControllerSID"];;
                    
                    
                    [self.navigationController pushViewController:viewController animated:YES];
                    
                    
                }
                
            }
            
            
            
            
            
            //            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KENYA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"TANZANAI"]){
            //                if ([crs_Str_BankComparsion isEqualToString:@"MOBILEWALLET"]) {
            //                    if ([self.crs_SelectPaymentLabel.text isEqualToString:@"Please Select Wallet Name"]) {
            //
            //
            //                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@" Please  dsdsdSelect Payout-Network" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            //
            //                        [alert show];
            //
            //
            //                    }
            //                }
            //
            //
            //            }
            
            
            
            else{
                //                self.crs_PhpBankOutlet.userInteractionEnabled = NO;
                //                self.crs_PhpAccountNumbe.userInteractionEnabled = NO;
                //                self.crs_PhpBankName.userInteractionEnabled = NO;
                
                
                [Crs_sharedvariable sharedMySingleton].Crs_CashComparsion890 = crs_str_CashPay;
                
                [Crs_sharedvariable sharedMySingleton].Crs_str_BankName890 = self.crs_SelectPaymentLabel.text;
                [Crs_sharedvariable sharedMySingleton].crs_Ary_CashPayDetails890 =  [Crs_ary_BankDetails mutableCopy];
                
                NSLog(@"Sehwag=======%@", [Crs_sharedvariable sharedMySingleton].Crs_CashComparsion890);
                NSLog(@"Sehwage=======%@",  [Crs_sharedvariable sharedMySingleton].Crs_str_BankName890);
                NSLog(@"Sehwageee=======%@",[Crs_sharedvariable sharedMySingleton].crs_Ary_CashPayDetails890);
                NSLog(@"Sehwageee23=======%@", [Crs_sharedvariable sharedMySingleton].crs_DictionarybankDetails890);
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
                
                RecieverDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"RecieverDetailedViewControllerSID"];;
                
                
                [self.navigationController pushViewController:viewController animated:YES];
                
                
            }
        }
        else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BANGLADESH"]){
          
            dic = [NSMutableDictionary new];
            [dic setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
            [dic setObject:self.crs_PhpBankName.text forKey:@"bank"];
            [dic setObject:self.crs_PhpAccountNumbe.text forKey:@"account"];
            [dic setObject:bankcode forKey:@"bank_code"];
             [dic setObject:banglaBranchCode forKey:@"branch_code"];
            
            if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BANGLADESH"]) {
                if ([crs_str_CashPay isEqualToString:@"AccountCredit"]) {
                    
                    if ([self.crs_PhpBankName.text isEqualToString:@""]||[self.crs_PhpBankName.text isEqualToString:@"(null)"]) {
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Choose Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        
                    }
                    
                    else if ([self.crs_PhpAccountNumbe.text isEqualToString:@""]||[self.crs_PhpAccountNumbe.text isEqualToString:@"(null)"]){
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        
                        
                    }
                    
                    else if (self.crs_PhpAccountNumbe.text.length<6){
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter a Valid Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        
                        
                    }
                    
                    else if ([self.crs_PhpBranchName.text isEqualToString:@""]){
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Choose Branch Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        
                        
                    }
                    
                    
                    else{
                        [self updateBank1];
                        [Crs_sharedvariable sharedMySingleton].Crs_CashComparsion890 = crs_str_CashPay;
                        
                        [Crs_sharedvariable sharedMySingleton].Crs_str_BankName890 = self.crs_SelectPaymentLabel.text;
                        [Crs_sharedvariable sharedMySingleton].crs_Ary_CashPayDetails890 =  [Crs_ary_BankDetails mutableCopy];
                        [Crs_sharedvariable sharedMySingleton].crs_DictionarybankDetails890 = dic;
                        
                        NSLog(@"Sehwag=======%@", [Crs_sharedvariable sharedMySingleton].Crs_CashComparsion890);
                        NSLog(@"Sehwage=======%@",  [Crs_sharedvariable sharedMySingleton].Crs_str_BankName890);
                        NSLog(@"Sehwageee=======%@",[Crs_sharedvariable sharedMySingleton].crs_Ary_CashPayDetails890);
                        NSLog(@"Sehwageee23=======%@", [Crs_sharedvariable sharedMySingleton].crs_DictionarybankDetails890);
                        
                        
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                        
                        
                        RecieverDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"RecieverDetailedViewControllerSID"];;
                        viewController.Crs_PhpBankName = self.crs_PhpBranchName.text;
                        
                        [self.navigationController pushViewController:viewController animated:YES];
                        
                    }
                }
            }
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]) {
                if ([crs_str_CashPay isEqualToString:@"AccountCredit"]) {
                    
                    if ([self.crs_PhpBankName.text isEqualToString:@""]||[self.crs_PhpBankName.text isEqualToString:@"(null)"]) {
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Choose Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        
                    }
                    
                    else if ([self.crs_PhpAccountNumbe.text isEqualToString:@""]||[self.crs_PhpAccountNumbe.text isEqualToString:@"(null)"]){
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        
                        
                    }
                    
                    else if (self.crs_PhpAccountNumbe.text.length<6){
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter a Valid Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        
                        
                    }
                    
                    
                    
                    else{
                        [self updateBank1];
                        [Crs_sharedvariable sharedMySingleton].Crs_CashComparsion890 = crs_str_CashPay;
                        
                        [Crs_sharedvariable sharedMySingleton].Crs_str_BankName890 = self.crs_SelectPaymentLabel.text;
                        [Crs_sharedvariable sharedMySingleton].crs_Ary_CashPayDetails890 =  [Crs_ary_BankDetails mutableCopy];
                        [Crs_sharedvariable sharedMySingleton].crs_DictionarybankDetails890 = dic;
                        
                        NSLog(@"Sehwag=======%@", [Crs_sharedvariable sharedMySingleton].Crs_CashComparsion890);
                        NSLog(@"Sehwage=======%@",  [Crs_sharedvariable sharedMySingleton].Crs_str_BankName890);
                        NSLog(@"Sehwageee=======%@",[Crs_sharedvariable sharedMySingleton].crs_Ary_CashPayDetails890);
                        NSLog(@"Sehwageee23=======%@", [Crs_sharedvariable sharedMySingleton].crs_DictionarybankDetails890);
                        
                        
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                        
                        
                        RecieverDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"RecieverDetailedViewControllerSID"];;
                        viewController.Crs_PhpBankName = self.crs_PhpBranchName.text;
                        
                        [self.navigationController pushViewController:viewController animated:YES];
                        
                    }
                }
            }
            
        }
        
        else{
            //            self.crs_PhpBankOutlet.userInteractionEnabled = NO;
            //            self.crs_PhpAccountNumbe.userInteractionEnabled = NO;
            //            self.crs_PhpBankName.userInteractionEnabled = NO;
            dic = [NSMutableDictionary new];
            [dic setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
            [dic setObject:self.crs_PhpBankName.text forKey:@"bank"];
            [dic setObject:self.crs_PhpAccountNumbe.text forKey:@"account"];
            [dic setObject:bankcode forKey:@"bank_code"];
            
            if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KENYA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"TANZANIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UGANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"RWANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NIGERIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GHANA"]) {
                if ([crs_str_CashPay isEqualToString:@"AccountCredit"]) {
                    
                    if ([self.crs_PhpBankName.text isEqualToString:@""]||[self.crs_PhpBankName.text isEqualToString:@"(null)"]) {
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Choose Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        
                    }
                    
                    else if ([self.crs_PhpAccountNumbe.text isEqualToString:@""]||[self.crs_PhpAccountNumbe.text isEqualToString:@"(null)"]){
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        
                        
                    }
                    
                    else if (self.crs_PhpAccountNumbe.text.length<6){
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter a Valid Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        
                        
                    }
                    
                    
                    
                    else{
                        [self updateBank1];
                        [Crs_sharedvariable sharedMySingleton].Crs_CashComparsion890 = crs_str_CashPay;
                        
                        [Crs_sharedvariable sharedMySingleton].Crs_str_BankName890 = self.crs_SelectPaymentLabel.text;
                        [Crs_sharedvariable sharedMySingleton].crs_Ary_CashPayDetails890 =  [Crs_ary_BankDetails mutableCopy];
                        [Crs_sharedvariable sharedMySingleton].crs_DictionarybankDetails890 = dic;
                        
                        NSLog(@"Sehwag=======%@", [Crs_sharedvariable sharedMySingleton].Crs_CashComparsion890);
                        NSLog(@"Sehwage=======%@",  [Crs_sharedvariable sharedMySingleton].Crs_str_BankName890);
                        NSLog(@"Sehwageee=======%@",[Crs_sharedvariable sharedMySingleton].crs_Ary_CashPayDetails890);
                        NSLog(@"Sehwageee23=======%@", [Crs_sharedvariable sharedMySingleton].crs_DictionarybankDetails890);
                        
                        
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                        
                        
                        RecieverDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"RecieverDetailedViewControllerSID"];;
                        viewController.Crs_PhpBankName = self.crs_PhpBranchName.text;
                        
                        [self.navigationController pushViewController:viewController animated:YES];
                        
                    }
                }
            }
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]) {
                if ([crs_str_CashPay isEqualToString:@"AccountCredit"]) {
                    
                    if ([self.crs_PhpBankName.text isEqualToString:@""]||[self.crs_PhpBankName.text isEqualToString:@"(null)"]) {
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Choose Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        
                    }
                    
                    else if ([self.crs_PhpAccountNumbe.text isEqualToString:@""]||[self.crs_PhpAccountNumbe.text isEqualToString:@"(null)"]){
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        
                        
                    }
                    
                    else if (self.crs_PhpAccountNumbe.text.length<6){
                        
                        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter a Valid Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        
                        [alert show];
                        
                        
                    }
                    
                    
                    
                    else{
                        [self updateBank1];
                        [Crs_sharedvariable sharedMySingleton].Crs_CashComparsion890 = crs_str_CashPay;
                        
                        [Crs_sharedvariable sharedMySingleton].Crs_str_BankName890 = self.crs_SelectPaymentLabel.text;
                        [Crs_sharedvariable sharedMySingleton].crs_Ary_CashPayDetails890 =  [Crs_ary_BankDetails mutableCopy];
                        [Crs_sharedvariable sharedMySingleton].crs_DictionarybankDetails890 = dic;
                        
                        NSLog(@"Sehwag=======%@", [Crs_sharedvariable sharedMySingleton].Crs_CashComparsion890);
                        NSLog(@"Sehwage=======%@",  [Crs_sharedvariable sharedMySingleton].Crs_str_BankName890);
                        NSLog(@"Sehwageee=======%@",[Crs_sharedvariable sharedMySingleton].crs_Ary_CashPayDetails890);
                        NSLog(@"Sehwageee23=======%@", [Crs_sharedvariable sharedMySingleton].crs_DictionarybankDetails890);
                        
                        
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                        
                        
                        RecieverDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"RecieverDetailedViewControllerSID"];;
                        viewController.Crs_PhpBankName = self.crs_PhpBranchName.text;
                        
                        [self.navigationController pushViewController:viewController animated:YES];
                        
                    }
                }
            }
            
        }
    }
    
    else{
        
        
        
        if ([crs_Str_BankComparsion isEqualToString:@"Cashpay"]) {
            if ([self.crs_SelectPaymentLabel.text isEqualToString:@"Select Payout-Network"]) {
                
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please  Select Payout-Network" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                
                
                //Select Payout-Network
                
                
            }
            
            else if ([KenyaComparsion isEqualToString:@"MOBILEWALLET"]){
                if ([self.crs_SelectPaymentLabel.text isEqualToString:@"Please Select Wallet Name"]) {
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Wallet Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    return;
                }
                
            }
            
            
            else{
                
                [Crs_sharedvariable sharedMySingleton].Crs_CashComparsion890 = crs_str_CashPay;
                [Crs_sharedvariable sharedMySingleton].Crs_str_BankName890 = self.crs_SelectPaymentLabel.text;
                [Crs_sharedvariable sharedMySingleton].crs_Ary_CashPayDetails890 =  [Crs_ary_BankDetails mutableCopy];
                
                
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
                
                RecieverDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"RecieverDetailedViewControllerSID"];;
                
                
                //
                //            viewController.Crs_CashComparsion = crs_str_CashPay;
                //            viewController.crs_Ary_CashPayDetails = Crs_ary_BankDetails;
                //            viewController.Crs_str_BankName =  self.crs_SelectPaymentLabel.text;
                //
                //
                [self.navigationController pushViewController:viewController animated:YES];
                
                
            }
        }
        
        else{
            
            
            if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"INDIA"]){
                
                
                
                
                
                
                if ([self.crs_Branch.text isEqualToString:@""]||[self.crs_Branch.text isEqualToString:@"(null)"]){
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                
                
                
                
                
                
                
                else if ([self.crs_BankAccount.text isEqualToString:@""]||[self.crs_BankAccount.text isEqualToString:@"(null)"]){
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                
                
                
                else  if ([self.crs_Ifsc.text isEqualToString:@""]||[self.crs_Ifsc.text isEqualToString:@"(null)"])  {
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter IFSC" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                else if (self.crs_Ifsc.text.length <11) {
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Valid IFSC " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                }
                
                
                
                
                
                else if ([self.crs_NewBranch.text isEqualToString:@""]||[self.crs_NewBranch.text isEqualToString:@"(null)"]){
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter your Branch" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                
                
                else{
                    
                    
                    [self updateBank];
                    
                    
                    
                }
                
            }
            
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PAKISTAN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SRI LANKA"]){
                
                
                
                
                if ([self.crs_Ifsc.text isEqualToString:@""]||[self.crs_Ifsc.text isEqualToString:@"(null)"])  {
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Branch Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                
                else if ([self.crs_BankAccount.text isEqualToString:@""]||[self.crs_BankAccount.text isEqualToString:@"(null)"]){
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                else if ([self.crs_NewBranch.text isEqualToString:@""]||[self.crs_NewBranch.text isEqualToString:@"(null)"]){
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter your Branch" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                else if ([self.crs_Branch.text isEqualToString:@""]||[self.crs_Branch.text isEqualToString:@"(null)"]){
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                
                else{
                    
                    
                    [self updateBank];
                    
                    
                    
                }
                
            }
            
            
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UNITED STATES"]){
                
                
                if ([self.crs_Branch.text isEqualToString:@""])  {
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                }
                
                
                else if ([self.crs_BankAccount.text isEqualToString:@""]||[self.crs_BankAccount.text isEqualToString:@"(null)"]){
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your IBAN / ACCOUNT NUMBER" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                else if ([self.crs_Ifsc.text isEqualToString:@""]||[self.crs_Ifsc.text isEqualToString:@"(null)"]){
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Swift Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                }
                else if ([self.crs_NewBranch.text isEqualToString:@""]||[self.crs_NewBranch.text isEqualToString:@"(null)"]){
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Branch" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                
                else{
                    
                    
                    [self updateBank];
                    
                    
                    
                }
                
            }
            
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"AUSTRALIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SIERRA LEONE"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"CANADA"])
            {
                
                
                
                if ([self.crs_Branch.text isEqualToString:@""])  {
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                }
                
                
                else if ([self.crs_BankAccount.text isEqualToString:@""]){
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                else if ([self.crs_Ifsc.text isEqualToString:@""]||[self.crs_Ifsc.text isEqualToString:@"(null)"]){
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Swift Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                }
                else if ([self.crs_NewBranch.text isEqualToString:@""]||[self.crs_NewBranch.text isEqualToString:@"(null)"]){
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Branch" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                
                else{
                    
                    
                    [self updateBank];
                    
                    
                    
                }
                
            }
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KENYA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"TANZANIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UGANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"RWANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NIGERIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GHANA"])
            {
                
                
                
                if ([self.crs_PhpBankName.text isEqualToString:@""]||[self.crs_PhpBankName.text isEqualToString:@"(null)"]){
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Choose Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                
                
                
                
                
                
                else if ([self.crs_PhpAccountNumbe.text isEqualToString:@""]||[self.crs_PhpAccountNumbe.text isEqualToString:@"(null)"]){
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                }
                
                else if (self.crs_PhpAccountNumbe.text.length < 8 ){
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter a Valid Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                }
                
                
                else{
                    
                    
                    [self updateBank];
                    
                    
                    
                }
                
                
                
                
            }
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PHILIPPINES"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NEPAL"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BANGLADESH"])
            {
                
                
                
                if ([self.crs_PhpBankName.text isEqualToString:@""]||[self.crs_PhpBankName.text isEqualToString:@"(null)"]){
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Choose Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                
                
                
                
                
                
                else if ([self.crs_PhpAccountNumbe.text isEqualToString:@""]||[self.crs_PhpAccountNumbe.text isEqualToString:@"(null)"]){
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                }
                else if ([self.crs_PhpBranchName.text isEqualToString:@""]||[self.crs_PhpBranchName.text isEqualToString:@"(null)"]){
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Branch" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                
                
                else{
                    
                    
                    [self updateBank];
                    
                    
                    
                }
                
                
                
                
            }
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BULGARIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ROMANIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ISRAEL"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KUWAIT"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"QATAR"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UNITED ARAB EMIRATES"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SAUDI ARABIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"TURKEY"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SWITZERLAND"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"CROATIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BAHRAIN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ESTONIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"POLAND"])
            {
                
                
                
                if ([self.crs_Branch.text isEqualToString:@""])  {
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                }
                
                
                
                
                else if ([self.crs_BankAccount.text isEqualToString:@""]||[self.crs_BankAccount.text isEqualToString:@"(null)"]){
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter IBAN" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                }
                else if (self.crs_BankAccount.text.length <15) {
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Valid IBAN" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                }
                
                else if ([self.crs_Ifsc.text isEqualToString:@""]||[self.crs_Ifsc.text isEqualToString:@"(null)"]){
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Swift Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                }
                else if (self.crs_Ifsc.text.length <8) {
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Valid Swift Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                }
                
                
                
                else{
                    
                    
                    [self updateBank];
                    
                    
                    
                }
                
                
                
                
            }
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SINGAPORE"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"HONG KONG"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"THAILAND"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"JAPAN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"QATAR"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NEW ZEALAND"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"OMAN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SOUTH AFRICA"])
            {
                
                
                
                if ([self.crs_Branch.text isEqualToString:@""])  {
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                }
                
                
                else if ([self.crs_BankAccount.text isEqualToString:@""]||[self.crs_BankAccount.text isEqualToString:@"(null)"]){
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Enter Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                }
                else if ([self.crs_Ifsc.text isEqualToString:@""]||[self.crs_Ifsc.text isEqualToString:@"(null)"]){
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Swift Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                
                
                else{
                    
                    
                    [self updateBank];
                    
                    
                    
                }
                
                
                
                
            }
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ZAMBIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ZIMBABWE"])
            {
                
                
                
                if ([self.crs_Branch.text isEqualToString:@""])  {
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                }
                
                
                else if ([self.crs_BankAccount.text isEqualToString:@""]||[self.crs_BankAccount.text isEqualToString:@"(null)"]){
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Enter Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                }
               
                
                
                else{
                    
                    
                    [self updateBank];
                    
                    
                    
                }
                
                
                
                
            }
            else
            {
                
                if ([self.crs_Branch.text isEqualToString:@""])  {
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Bank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                    
                }
                
                
                else if ([self.crs_BankAccount.text isEqualToString:@""]||[self.crs_BankAccount.text isEqualToString:@"(null)"]){
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter IBAN /Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    
                    
                }
                else if ([self.crs_Ifsc.text isEqualToString:@""]||[self.crs_Ifsc.text isEqualToString:@"(null)"]){
                    
                    
                    
                    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Swift Code" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                
                
                else{
                    
                    
                    [self updateBank];
                    
                    
                    
                }
                
            }
            
            
            
            
            
            
        }
        
    }
    
    
    
}




-(void)updateBank
{
    
    //    if ([self.crs_Ifsc.text isEqualToString:@""])  {
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter IFSC" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //    else if ([self.crs_BankAccount.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
    }
    
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    
    NSError * error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_UpdateReciever];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    
    @try {
        [mapData setObject:@"AC" forKey:@"payment_type"];;
        
        [mapData setObject:@"1234" forKey:@"pincode"];
        
        [mapData setObject:[ Crs_ary_BankDetails valueForKey:@"first_name"]  forKey:@"first_name"];
        
        [mapData setObject:[ Crs_ary_BankDetails valueForKey:@"middle_name"] forKey:@"middle_name"];
        [mapData setObject:[ Crs_ary_BankDetails valueForKey:@"entitytype"] forKey:@"entitytype"];
        [mapData setObject:[ Crs_ary_BankDetails valueForKey:@"last_name"] forKey:@"last_name"];
        [mapData setObject:[ Crs_ary_BankDetails valueForKey:@"country"] forKey:@"country"];
        [mapData setObject:[ Crs_ary_BankDetails valueForKey:@"mobile"] forKey:@"mobile"];
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    
  
    
    
    // [mapData setObject:self.crs_EmailIdField.text forKey:@"email"];
    
    
    
    @try {
        [mapData setObject: [ Crs_ary_BankDetails valueForKey:@"ccycode"] forKey:@"ccycode"];
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    
    @try {
        [mapData setObject: [ Crs_ary_BankDetails valueForKey:@"ccycode"] forKey:@"ccycode"];
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    
    //[mapData setObject:self.crs_DateOfBirthField.text forKey:@"dob"];
    
    // [mapData setObject:self.crs_PhoneNumber.text forKey:@"phone"];
    
    // NSLog(@"%@",self.crs_PhoneNumber);
    
    
    
    if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PHILIPPINES"])
        
    {
        
        
        [mapData setObject:self.crs_PhpBankName.text  forKey:@"bank_name"];
        [mapData setObject:self.crs_PhpAccountNumbe.text forKey:@"account_number"];
        [mapData setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
        [mapData setObject:bankcode forKey:@"bank_code"];
    }
    
    
    
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]){
        [mapData setObject:self.crs_PhpBankName.text  forKey:@"bank_name"];
        [mapData setObject:self.crs_PhpAccountNumbe.text forKey:@"account_number"];
        [mapData setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
        [mapData setObject:bankcode forKey:@"bank_code"];
        
    }
    
    
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KENYA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UGANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"RWANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NIGERIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GHANA"]){
        [mapData setObject:self.crs_PhpBankName.text  forKey:@"bank_name"];
        [mapData setObject:self.crs_PhpAccountNumbe.text forKey:@"account_number"];
        //[mapData setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
        [mapData setObject:bankcode forKey:@"bank_code"];
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"TANZANIA"]){
        [mapData setObject:self.crs_PhpBankName.text  forKey:@"bank_name"];
        [mapData setObject:self.crs_PhpAccountNumbe.text forKey:@"account_number"];
        //[mapData setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
        [mapData setObject:bankcode forKey:@"bank_code"];
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ZAMBIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ZIMBABWE"]){
        [mapData setObject:self.crs_Branch.text  forKey:@"bank_name"];
        [mapData setObject:self.crs_BankAccount.text forKey:@"account_number"];
        //[mapData setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
        @try {
             [mapData setObject:bankcode forKey:@"bank_code"];
            
        } @catch (NSException *exception) {
            NSLog(@"Exception @@@@@%@",exception);
        }
       
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NEPAL"]){
        
        [mapData setObject:self.crs_PhpBankName.text  forKey:@"bank_name"];
        [mapData setObject:self.crs_PhpAccountNumbe.text forKey:@"account_number"];
        [mapData setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
        
        [mapData setObject:branchCode forKey:@"branch_code"];
        
        [mapData setObject:bankcode forKey:@"bank_code"];
        
        
    }
    
    
    
    
    else{
        
        if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"INDIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UNITED STATES"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"AUSTRALIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SRI LANKA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PAKISTAN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SIERRA LEONE"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"CANADA"]) {
            
            if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SRI LANKA"]) {
                [mapData setObject:self.crs_Ifsc.text   forKey:@"branch_code"];
                [mapData setObject:bankcode   forKey:@"bank_code"];
            }
            
            
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UNITED STATES"]){
                self.crs_EurpoeCountryAccount.text = @"IBAN / Account Number ";
                //[mapData setObject:bankcode   forKey:@"bank_code"];
                [mapData setObject:self.crs_Ifsc.text   forKey:@"ifsc"];
            }
            
            
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PAKISTAN"]){
                
                [mapData setObject:self.crs_Ifsc.text   forKey:@"ifsc"];
                [mapData setObject:self.crs_pobDob.text   forKey:@"dob"];
                
            }
            else{
                
                [mapData setObject:self.crs_Ifsc.text   forKey:@"ifsc"];
            }
            
            
            [mapData setObject:self.crs_Branch.text  forKey:@"bank_name"];
            [mapData setObject:self.crs_BankAccount.text forKey:@"account_number"];
            [mapData setObject:self.crs_NewBranch.text forKey:@"branch_name"];
            
            
            
            
            
            
        }
        
        
        
        
        else
            
        {
            
            
            [mapData setObject:self.crs_Ifsc.text   forKey:@"ifsc"];
            [mapData setObject:self.crs_Branch.text  forKey:@"bank_name"];
            [mapData setObject:self.crs_BankAccount.text forKey:@"account_number"];
            //[mapData setObject:self.crs_NewBranch.text forKey:@"branch_name"];
            
            
            
            
            
        }
        
    }
    
    
    
    
    // [mapData setObject:tempImageNSString forKey:@"image"];
    [mapData setObject:[ Crs_ary_BankDetails valueForKey:@"city"]forKey:@"city"];
    [mapData setObject:@"state"forKey:@"state"];
    
    
    
    
    
    
    [mapData setObject:[ Crs_ary_BankDetails valueForKey:@"call_name"] forKey:@"call_name"];
    
    [mapData setObject:[ Crs_ary_BankDetails valueForKey:@"gender"] forKey:@"gender"];
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_AgentCode forKey:@"agent_code"];
    
    
    
    [mapData setObject: [Crs_ary_BankDetails valueForKey:@"beneficiary_no"] forKey:@"beneficiary_no"];
    
    
    
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"error %@",error);
            NSLog(@"saki data %@",data);
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json );
            
            NSLog(@"%@", [json valueForKey:@"message"]);
            if ([[json valueForKey :@"message" ]isEqualToString:@"Success"]
                )
            {
                
                // NSMutableDictionary * dic = [NSMutableDictio];
                
                if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PHILIPPINES"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"])
                    
                {
                    dic = [NSMutableDictionary new];
                    [dic setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
                    [dic setObject:self.crs_PhpBankName.text forKey:@"bank"];
                    [dic setObject:self.crs_PhpAccountNumbe.text forKey:@"account"];
                    [dic setObject:bankcode forKey:@"bank_code"];
                    
                    
                    NSString *str = bankcode;
                    
                    str = [str stringByReplacingOccurrencesOfString:@"null"withString:@""];;
                    NSLog(@"%@ Anusha",str);
                    
                    
                    
                }
                
                
                
                
                else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NEPAL"]){
                    
                    dic = [NSMutableDictionary new];
                    [dic setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
                    [dic setObject:self.crs_PhpBankName.text forKey:@"bank"];
                    [dic setObject:self.crs_PhpAccountNumbe.text forKey:@"account"];
                    [dic setObject:bankcode forKey:@"bank_code"];
                    [dic setObject:branchCode forKey:@"branch_code"];
                    
                    
                }
                
                
                else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UNITED STATES"]){
                    
                    dic = [NSMutableDictionary new];
                    [dic setObject:self.crs_Branch.text forKey:@"bank_name"];
                    [dic setObject:self.crs_BankAccount.text forKey:@"account"];
                    [dic setObject:self.crs_Ifsc.text forKey:@"ifsc"];
                    [dic setObject:self.crs_NewBranch.text forKey:@"branch_name"];
                    // [dic setObject:bankcode forKey:@"bank_code"];
                    
                    
                }
                
                else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KENYA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"TANZANIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UGANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"RWANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NIGERIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GHANA"]){
                    
                    dic = [NSMutableDictionary new];
                    
                    [dic setObject:self.crs_PhpBankName.text forKey:@"bank"];
                    [dic setObject:self.crs_PhpAccountNumbe.text forKey:@"account"];
                    [dic setObject:bankcode forKey:@"bank_code"];
                    
                }
                
                
                else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BULGARIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ROMANIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ISREAL"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KUWAIT"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"QATAR"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UNITED ARAB EMIRATES"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SAUDI ARABIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"TURKEY"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SWITZERLAND"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"CROATIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BAHRAIN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ESTONIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"POLAND"]){
                    
                    dic = [NSMutableDictionary new];
                    [dic setObject:self.crs_Ifsc.text forKey:@"ifsc"];
                    [dic setObject:self.crs_Branch.text forKey:@"bank_name"];
                    [dic setObject:self.crs_BankAccount.text forKey:@"account"];
                    
                    
                }
                
                
                else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SINGAPORE"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"HONG KONG"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"THAILAND"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"JAPAN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"QATAR"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NEW ZEALAND"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"OMAN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SOUTH AFRICA"]){
                    
                    dic = [NSMutableDictionary new];
                    [dic setObject:self.crs_Ifsc.text forKey:@"ifsc"];
                    [dic setObject:self.crs_Branch.text forKey:@"bank_name"];
                    [dic setObject:self.crs_BankAccount.text forKey:@"account"];
                    
                    
                }
                else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ZAMBIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ZIMBABWE"]){
                    
                    dic = [NSMutableDictionary new];
                    
                    [dic setObject:self.crs_Branch.text forKey:@"bank_name"];
                    [dic setObject:self.crs_BankAccount.text forKey:@"account"];
                    [dic setObject:bankcode forKey:@"bank_code"];
                    
                }
                
                else{
                    dic = [NSMutableDictionary new];
                    [dic setObject:self.crs_Ifsc.text forKey:@"ifsc"];
                    [dic setObject:self.crs_Branch.text forKey:@"bank_name"];
                    [dic setObject:self.crs_BankAccount.text forKey:@"account"];
                }
                
                
                
                NSLog(@" rock %@",dic);
                
                [Crs_sharedvariable sharedMySingleton].Crs_CashComparsion890 = crs_str_CashPay;
                
                [Crs_sharedvariable sharedMySingleton].Crs_str_BankName890 = self.crs_SelectPaymentLabel.text;
                [Crs_sharedvariable sharedMySingleton].crs_Ary_CashPayDetails890 =  [Crs_ary_BankDetails mutableCopy];
                [Crs_sharedvariable sharedMySingleton].crs_DictionarybankDetails890 = dic;
                
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                
                
                RecieverDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"RecieverDetailedViewControllerSID"];;
                //
                //                viewController.Crs_CashComparsion = crs_str_CashPay;
                //                viewController.crs_Ary_CashPayDetails = Crs_ary_BankDetails;
                //                viewController.Crs_str_BankName =  self.crs_SelectPaymentLabel.text;
                //                viewController.crs_DictionarybankDetails = dic;
                
                [self.navigationController pushViewController:viewController animated:YES];
                
            }
            else
                
                
            {
                
                
                
                
                
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                
                
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        });
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}










- (IBAction)crs_RemoveAction:(id)sender {
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    self.crs_ViewBankMode.hidden = YES;
    //    [self.navigationController popViewControllerAnimated:YES];
    self.crs_TableViewview.hidden = NO;
    self.crs_BankViewHider.hidden = YES;
    
    // For Clearing Text Fields
    
    self.crs_PhpAccountNumbe.text = @"";
    self.crs_PhpBankName.text = @"";
    self.crs_PhpBranchName.text = @"";
    
    
    
    
}
- (IBAction)Crs_bankAction:(id)sender {
    
    isFiltered = NO;
    self.crs_search.text = @"";
    self.crs_search.placeholder = @"Search By Bank Name";
     self.crs_AgentChanger.text = @"Choose Your Bank's  here";
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    Crs_str_tableviewcompare=@"bank";
    
    if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"INDIA"]) {
        [Crs_Array_banknameslist removeAllObjects];
        for (int i=0; i<Crs_Array_banknames.count; i++) {
            
            if ([[[Crs_Array_banknames valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"IN"] ) {
                
                
                [Crs_Array_banknameslist addObject:[Crs_Array_banknames objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_banknameslist);
        
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"PHILIPPINES"])
    {
        [Crs_Array_banknameslist removeAllObjects];
        for (int i=0; i<Crs_Array_banknames.count; i++) {
            
            if ([[[Crs_Array_banknames valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"PH"] ) {
                
                
                [Crs_Array_banknameslist addObject:[Crs_Array_banknames objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        
        
        NSLog(@"%@",Crs_Array_banknameslist);
        
        
        
        
    }
    
    else if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"BANGLADESH"])
    {
        self.crs_PhpBranchName.text = @"";
        [Crs_Array_banknameslist removeAllObjects];
        for (int i=0; i<Crs_Array_banknames.count; i++) {
            
        if ([[[Crs_Array_banknames valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"BD"] ) {
                
                
                [Crs_Array_banknameslist addObject:[Crs_Array_banknames objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        
        
        NSLog(@"%@",Crs_Array_banknameslist);
        
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"UNITED STATES"])
    {
        [Crs_Array_banknameslist removeAllObjects];
        for (int i=0; i<Crs_Array_banknames.count; i++) {
            
            if ([[[Crs_Array_banknames valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"US"] ) {
                
                
                [Crs_Array_banknameslist addObject:[Crs_Array_banknames objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        
        
        NSLog(@"%@",Crs_Array_banknameslist);
        
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"ZIMBABWE"])
    {
        [Crs_Array_banknameslist removeAllObjects];
        for (int i=0; i<Crs_Array_banknames.count; i++) {
            
            if ([[[Crs_Array_banknames valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"ZW"] ) {
                
                
                [Crs_Array_banknameslist addObject:[Crs_Array_banknames objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        
        
        NSLog(@"%@",Crs_Array_banknameslist);
        
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"ZAMBIA"])
    {
        [Crs_Array_banknameslist removeAllObjects];
        for (int i=0; i<Crs_Array_banknames.count; i++) {
            
            if ([[[Crs_Array_banknames valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"ZM"] ) {
                
                
                [Crs_Array_banknameslist addObject:[Crs_Array_banknames objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        
        
        NSLog(@"%@",Crs_Array_banknameslist);
        
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"SRI LANKA"])
    {
        [Crs_Array_banknameslist removeAllObjects];
        for (int i=0; i<Crs_Array_banknames.count; i++) {
            
            if ([[[Crs_Array_banknames valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"LK"] ) {
                
                
                [Crs_Array_banknameslist addObject:[Crs_Array_banknames objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_banknameslist);
        
        
        
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"NEPAL"])
    {
        [Crs_Array_banknameslist removeAllObjects];
        for (int i=0; i<Crs_Array_banknames.count; i++) {
            
            if ([[[Crs_Array_banknames valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"NP"] ) {
                
                
                [Crs_Array_banknameslist addObject:[Crs_Array_banknames objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_banknameslist);
        
        
        
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"PAKISTAN"])
    {
        [Crs_Array_banknameslist removeAllObjects];
        for (int i=0; i<Crs_Array_banknames.count; i++) {
            
            if ([[[Crs_Array_banknames valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"PK"] ) {
                
                
                [Crs_Array_banknameslist addObject:[Crs_Array_banknames objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_banknameslist);
        
        
        
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"VIETNAM"])
    {
        [Crs_Array_banknameslist removeAllObjects];
        for (int i=0; i<Crs_Array_banknames.count; i++) {
            
            if ([[[Crs_Array_banknames valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"VN"] ) {
                
                
                [Crs_Array_banknameslist addObject:[Crs_Array_banknames objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_banknameslist);
        
        
        
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"KENYA"])
    {
        [Crs_Array_banknameslist removeAllObjects];
        for (int i=0; i<Crs_Array_banknames.count; i++) {
            
            if ([[[Crs_Array_banknames valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"KE"] ) {
                
                
                [Crs_Array_banknameslist addObject:[Crs_Array_banknames objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_banknameslist);
        
        
        
        
        
        
    }
    
    else if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"TANZANIA"])
    {
        [Crs_Array_banknameslist removeAllObjects];
        for (int i=0; i<Crs_Array_banknames.count; i++) {
            
            if ([[[Crs_Array_banknames valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"TZ"] ) {
                
                
                [Crs_Array_banknameslist addObject:[Crs_Array_banknames objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_banknameslist);
        
        
        
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"GHANA"])
    {
        [Crs_Array_banknameslist removeAllObjects];
        for (int i=0; i<Crs_Array_banknames.count; i++) {
            
            if ([[[Crs_Array_banknames valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"GH"] ) {
                
                
                [Crs_Array_banknameslist addObject:[Crs_Array_banknames objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_banknameslist);
        
        
        
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"UGANDA"])
    {
        [Crs_Array_banknameslist removeAllObjects];
        for (int i=0; i<Crs_Array_banknames.count; i++) {
            
            if ([[[Crs_Array_banknames valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"UG"] ) {
                
                
                [Crs_Array_banknameslist addObject:[Crs_Array_banknames objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_banknameslist);
        
        
        
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"NIGERIA"])
    {
        [Crs_Array_banknameslist removeAllObjects];
        for (int i=0; i<Crs_Array_banknames.count; i++) {
            
            if ([[[Crs_Array_banknames valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"NG"] ) {
                
                
                [Crs_Array_banknameslist addObject:[Crs_Array_banknames objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_banknameslist);
        
        
        
        
        
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"] isEqualToString:@"RWANDA"])
    {
        [Crs_Array_banknameslist removeAllObjects];
        for (int i=0; i<Crs_Array_banknames.count; i++) {
            
            if ([[[Crs_Array_banknames valueForKey:@"bank_country_code"]objectAtIndex:i]isEqualToString:@"RW"] ) {
                
                
                [Crs_Array_banknameslist addObject:[Crs_Array_banknames objectAtIndex:i]];
                
                
            }
            else{
                
            }
            
            
        }
        NSLog(@"%@",Crs_Array_banknameslist);
        
        
        
        
        
        
    }
    
    self.Crs_Banknameview.hidden =NO;
    
    
    [self.Crs_BankName_Tableview reloadData];
    
    
    
    
}

- (IBAction)Crs_view_hide:(id)sender {
    self.Crs_Banknameview.hidden =YES;
    
    //self.Crs_BankName_Tableview.hidden = YES;
}

-(void)clearNumberPad{
    
    
    
    [_crs_NewBranch resignFirstResponder];
    [_crs_PhpBankName resignFirstResponder];
    [_crs_PhpAccountNumbe resignFirstResponder];
    [_crs_BankAccount resignFirstResponder];
    [_crs_Branch resignFirstResponder];
    [_crs_Ifsc resignFirstResponder];
    
    
    
    
    
    
    
    
    
    
}

-(void)doneWithNumberPad{
    //NSString *numberFromTheKeyboard = self.crs_SelectBranch.text;
    [_crs_NewBranch resignFirstResponder];
    [_crs_PhpBankName resignFirstResponder];
    [_crs_PhpAccountNumbe resignFirstResponder];
    [_crs_BankAccount resignFirstResponder];
    [_crs_Branch resignFirstResponder];
    [_crs_Ifsc resignFirstResponder];
    
    
}

#pragma mark -Searchmethod

-(void)textFieldDidChanges:(UITextField *)textField
{
    self.searchTextString=textField.text;
    if ([Crs_str_tableviewcompare isEqualToString: @"cashpay"])
    {
        [self updateSearchArray:self.searchTextString];
        
    }
    
   else if([Crs_str_tableviewcompare isEqualToString: @"MOBILEWALLET"])
    {
        [self updateSearchArrayWallet:self.searchTextString];
        
    }
    
   else if([Crs_str_tableviewcompare isEqualToString: @"BranchGetter"])
   {
       [self updateSearchArraybranch:self.searchTextString];
       
   }
    
    
    else {
        
        [self updateSearchArrays:self.searchTextString];
    }
    
}

-(void)updateSearchArray:(NSString *)searchText
{
    searchArray = [NSMutableArray new];
    
    if(searchText.length==0)
    {
        isFiltered=NO;
        searchArray = Crs_Array_list;
        NSLog(@"%@",searchArray);
        [self.Crs_BankName_Tableview reloadData ];
    }
    else
    {
        isFiltered=YES;
        
        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in Crs_Array_list){
            NSString * string= [NSString stringWithFormat:@"%@",[dic valueForKey:@"agent_name"]] ;
            
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                
                // NSString * Ary_id=[dic valueForKey:@"id"];
                
                [searchArray addObject:dic];
                
                NSLog(@"search %@",searchArray);
                
            }
        }
        
        
        
        /// historyArray = searchArray;
        [self.Crs_BankName_Tableview reloadData ];
        
        
    }
    
    
    
}

-(void)updateSearchArrays:(NSString *)searchText
{
    searchArray = [NSMutableArray new];
    
    if(searchText.length==0)
    {
        isFiltered=NO;
        searchArray =  Crs_Array_banknameslist;
        NSLog(@"%@",searchArray);
        [self.Crs_BankName_Tableview reloadData ];
    }
    else
    {
        isFiltered=YES;
        
        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in  Crs_Array_banknameslist){
            NSString * string= [NSString stringWithFormat:@"%@",[dic valueForKey:@"bank_name"]] ;
            
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                
                // NSString * Ary_id=[dic valueForKey:@"id"];
                
                [searchArray addObject:dic];
                
                NSLog(@"search %@",searchArray);
                
            }
        }
        
        
        
        /// historyArray = searchArray;
        [self.Crs_BankName_Tableview reloadData ];
        
        
    }
    
    
    
}

-(void)updateSearchArrayWallet:(NSString *)searchText
{
    searchArray = [NSMutableArray new];
    
    if(searchText.length==0)
    {
        isFiltered=NO;
        searchArray =  MobileWalletArray;
        NSLog(@"%@",searchArray);
        [self.Crs_BankName_Tableview reloadData ];
    }
    else
    {
        isFiltered=YES;
        
        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in  MobileWalletArray){
            NSString * string= [NSString stringWithFormat:@"%@",[dic valueForKey:@"WalletName"]] ;
            
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                
                // NSString * Ary_id=[dic valueForKey:@"id"];
                
                [searchArray addObject:dic];
                
                NSLog(@"search %@",searchArray);
                
            }
        }
        
        
        
        /// historyArray = searchArray;
        [self.Crs_BankName_Tableview reloadData ];
        
        
    }
    
    
    
}
-(void)updateSearchArraybranch:(NSString *)searchText
{
    searchArray = [NSMutableArray new];
    
    if(searchText.length==0)
    {
        isFiltered=NO;
        searchArray =  branchArray;
        NSLog(@"%@",searchArray);
        [self.Crs_BankName_Tableview reloadData ];
    }
    else
    {
        isFiltered=YES;
        
        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in  branchArray){
            NSString * string= [NSString stringWithFormat:@"%@",[dic valueForKey:@"branch_name"]] ;
            
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                
                // NSString * Ary_id=[dic valueForKey:@"id"];
                
                [searchArray addObject:dic];
                
                NSLog(@"search %@",searchArray);
                
            }
        }
        
        
        
        /// historyArray = searchArray;
        [self.Crs_BankName_Tableview reloadData ];
        
        
    }
    
    
    
}
- (IBAction)crs_ForVietnam:(id)sender {
    
    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"The account details of the beneficiary are missing. Please call us at +44 (0) 203 096 2255 to modify or update the details. " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
    
    return ;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField==self.crs_BankAccount) {
        if (self.self.crs_BankAccount.text.length >=34 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            
            
            
            NSString *validRegEx =@"^[A-Z a-z 0-9.]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            
            
            
            
            return YES;}
        
    }
    
    
    else if (textField==self.crs_search) {
        if (self.self.crs_BankAccount.text.length >=34 && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        else
        {
            
            
            
            
            
            
            NSString *validRegEx =@"^[A-Z]*$"; //change this regular expression as your requirement
            NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
            BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
            if (myStringMatchesRegEx)
                return YES;
            else
                return NO;
            
            
            
            
            
            
            
            
            return YES;}
        
    }
    
    
    //
    //    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KENYA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"TANZANIA"]) {
    //
    //
    //        if (self.self.crs_PhpAccountNumbe.text.length >=20 && range.length == 0)
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
    //            return YES;}
    //
    //
    //
    //    }
    
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BULGARIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ROMANIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ISRAEL"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KUWAIT"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"QATAR"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UNITED ARAB EMIRATES"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SAUDI ARABIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"TURKEY"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SWITZERLAND"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"CROATIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BAHRAIN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ESTONIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"POLAND"]) {
        
        
        if (self.self.crs_Ifsc.text.length >=11 && range.length == 0)
            
        {
            return NO; // return NO to not change text
        }
        else
            
            
            
            
            
        {
            
            
            
            NSString *validRegEx =@"^[A-Z a-z 0-9.]*$"; //change this regular expression as your requirement
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
-(void)Crs_MobileWallet
{
    
    
    
    
    // [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSError * error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_KenyaMobileWallet];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            //[MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"error %@",error);
            NSLog(@"data %@",data);
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json );
            
            
            KenyanArray = [json valueForKey:@"agent"];
            
            
            
            NSLog(@"My Mobile Wallet array is %@",MobileWalletArray);
            
            
            
            
            
            
            
            
            
            
            
        });
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
    
    
    
    
}

-(void)updateBank1
{
    
    //    if ([self.crs_Ifsc.text isEqualToString:@""])  {
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter IFSC" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    //
    //    else if ([self.crs_BankAccount.text isEqualToString:@""]){
    //
    //
    //
    //        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Your Account Number" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //
    //        [alert show];
    //
    //    }
    
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
    }
    
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    
    NSError * error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_UpdateReciever];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    
    
    @try {
        [mapData setObject:crs_str_CashPay forKey:@"payment_type"];;
        [mapData setObject:@"1234" forKey:@"pincode"];
        
        [mapData setObject:[ Crs_ary_BankDetails valueForKey:@"first_name"]  forKey:@"first_name"];
        
        [mapData setObject:[ Crs_ary_BankDetails valueForKey:@"entitytype"]  forKey:@"entitytype"];
        [mapData setObject:[ Crs_ary_BankDetails valueForKey:@"middle_name"] forKey:@"middle_name"];
        
        [mapData setObject:[ Crs_ary_BankDetails valueForKey:@"last_name"] forKey:@"last_name"];
        [mapData setObject:[ Crs_ary_BankDetails valueForKey:@"country"] forKey:@"country"];
        [mapData setObject:[ Crs_ary_BankDetails valueForKey:@"mobile"] forKey:@"mobile"];
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        
    }
    @finally {
        NSLog(@"finally");
    }
    
    
    
   
    
    
    // [mapData setObject:self.crs_EmailIdField.text forKey:@"email"];
    
    
    
    @try {
        [mapData setObject: [ Crs_ary_BankDetails valueForKey:@"ccycode"] forKey:@"ccycode"];
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    
    @try {
        [mapData setObject: [ Crs_ary_BankDetails valueForKey:@"ccycode"] forKey:@"ccycode"];
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    
    //[mapData setObject:self.crs_DateOfBirthField.text forKey:@"dob"];
    
    // [mapData setObject:self.crs_PhoneNumber.text forKey:@"phone"];
    
    // NSLog(@"%@",self.crs_PhoneNumber);
    
    
    
    if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PHILIPPINES"])
        
    {
        
        
        [mapData setObject:self.crs_PhpBankName.text  forKey:@"bank_name"];
        [mapData setObject:self.crs_PhpAccountNumbe.text forKey:@"account_number"];
        [mapData setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
        [mapData setObject:bankcode forKey:@"bank_code"];
    }
    
    
    
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"]){
        [mapData setObject:self.crs_PhpBankName.text  forKey:@"bank_name"];
        [mapData setObject:self.crs_PhpAccountNumbe.text forKey:@"account_number"];
        [mapData setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
        [mapData setObject:bankcode forKey:@"bank_code"];
        
    }
    
    
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KENYA"]){
        [mapData setObject:self.crs_PhpBankName.text  forKey:@"bank_name"];
        [mapData setObject:self.crs_PhpAccountNumbe.text forKey:@"account_number"];
        //[mapData setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
        [mapData setObject:bankcode forKey:@"bank_code"];
        
    }
    
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BANGLADESH"]){
        [mapData setObject:self.crs_PhpBankName.text  forKey:@"bank_name"];
        [mapData setObject:self.crs_PhpAccountNumbe.text forKey:@"account_number"];
    [mapData setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
          [mapData setObject:banglaBranchCode forKey:@"branch_code"];
        [mapData setObject:bankcode forKey:@"bank_code"];
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"TANZANIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UGANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"RWANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NIGERIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GHANA"]){
        [mapData setObject:self.crs_PhpBankName.text  forKey:@"bank_name"];
        [mapData setObject:self.crs_PhpAccountNumbe.text forKey:@"account_number"];
        //[mapData setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
        [mapData setObject:bankcode forKey:@"bank_code"];
        
    }
    else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NEPAL"]){
        
        [mapData setObject:self.crs_PhpBankName.text  forKey:@"bank_name"];
        [mapData setObject:self.crs_PhpAccountNumbe.text forKey:@"account_number"];
        [mapData setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
        
        [mapData setObject:branchCode forKey:@"branch_code"];
        
        [mapData setObject:bankcode forKey:@"bank_code"];
        
        
    }
    
    
    
    
    else{
        
        if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"INDIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UNITED STATES"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"AUSTRALIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SRI LANKA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PAKISTAN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SIERRA LEONE"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"CANADA"]) {
            
            if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SRI LANKA"]) {
                [mapData setObject:self.crs_Ifsc.text   forKey:@"branch_code"];
                [mapData setObject:bankcode   forKey:@"bank_code"];
            }
            
            
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UNITED STATES"]){
                self.crs_EurpoeCountryAccount.text = @"IBAN / Account Number ";
                //[mapData setObject:bankcode   forKey:@"bank_code"];
                [mapData setObject:self.crs_Ifsc.text   forKey:@"ifsc"];
            }
            
            
            else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PAKISTAN"]){
                
                [mapData setObject:self.crs_Ifsc.text   forKey:@"ifsc"];
                [mapData setObject:self.crs_pobDob.text   forKey:@"dob"];
                
            }
            else{
                
                [mapData setObject:self.crs_Ifsc.text   forKey:@"ifsc"];
            }
            
            
            [mapData setObject:self.crs_Branch.text  forKey:@"bank_name"];
            [mapData setObject:self.crs_BankAccount.text forKey:@"account_number"];
            [mapData setObject:self.crs_NewBranch.text forKey:@"branch_name"];
            
            
            
            
            
            
        }
        
        
        
        
        else
            
        {
            
            
            [mapData setObject:self.crs_Ifsc.text   forKey:@"ifsc"];
            [mapData setObject:self.crs_Branch.text  forKey:@"bank_name"];
            [mapData setObject:self.crs_BankAccount.text forKey:@"account_number"];
            //[mapData setObject:self.crs_NewBranch.text forKey:@"branch_name"];
            
            
            
            
            
        }
        
    }
    
    
    
    
    // [mapData setObject:tempImageNSString forKey:@"image"];
    [mapData setObject:[ Crs_ary_BankDetails valueForKey:@"city"]forKey:@"city"];
    [mapData setObject:@"state"forKey:@"state"];
    
    
    
    
    
    
    [mapData setObject:[ Crs_ary_BankDetails valueForKey:@"call_name"] forKey:@"call_name"];
    
    [mapData setObject:[ Crs_ary_BankDetails valueForKey:@"gender"] forKey:@"gender"];
    
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
    
    [mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_AgentCode forKey:@"agent_code"];
    
    
    
    [mapData setObject: [Crs_ary_BankDetails valueForKey:@"beneficiary_no"] forKey:@"beneficiary_no"];
    
    
    
    
    
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            NSLog(@"error %@",error);
            NSLog(@"saki data %@",data);
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"%@", json );
            
            NSLog(@"%@", [json valueForKey:@"message"]);
            if ([[json valueForKey :@"message" ]isEqualToString:@"Success"]
                )
            {
                
                // NSMutableDictionary * dic = [NSMutableDictio];
                
                if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"PHILIPPINES"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"VIETNAM"])
                    
                {
                    dic = [NSMutableDictionary new];
                    [dic setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
                    [dic setObject:self.crs_PhpBankName.text forKey:@"bank"];
                    [dic setObject:self.crs_PhpAccountNumbe.text forKey:@"account"];
                    [dic setObject:bankcode forKey:@"bank_code"];
                    
                    
                    NSString *str = bankcode;
                    
                    str = [str stringByReplacingOccurrencesOfString:@"null"withString:@""];;
                    NSLog(@"%@ Anusha",str);
                    
                    
                    
                }
                
                
                
                
                else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NEPAL"]){
                    
                    dic = [NSMutableDictionary new];
                    [dic setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
                    [dic setObject:self.crs_PhpBankName.text forKey:@"bank"];
                    [dic setObject:self.crs_PhpAccountNumbe.text forKey:@"account"];
                    [dic setObject:bankcode forKey:@"bank_code"];
                    [dic setObject:branchCode forKey:@"branch_code"];
                    
                    
                }
                
                else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BANGLADESH"]){
                    
                    dic = [NSMutableDictionary new];
                    [dic setObject:self.crs_PhpBranchName.text forKey:@"branch_name"];
                    [dic setObject:self.crs_PhpBankName.text forKey:@"bank"];
                    [dic setObject:self.crs_PhpAccountNumbe.text forKey:@"account"];
                    [dic setObject:bankcode forKey:@"bank_code"];
                    [dic setObject:banglaBranchCode forKey:@"branch_code"];
                    
                    
                }
                
                
                else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UNITED STATES"]){
                    
                    dic = [NSMutableDictionary new];
                    [dic setObject:self.crs_Branch.text forKey:@"bank_name"];
                    [dic setObject:self.crs_BankAccount.text forKey:@"account"];
                    [dic setObject:self.crs_Ifsc.text forKey:@"ifsc"];
                    [dic setObject:self.crs_NewBranch.text forKey:@"branch_name"];
                    // [dic setObject:bankcode forKey:@"bank_code"];
                    
                    
                }
                
                else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KENYA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"TANZANIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UGANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"RWANDA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NIGERIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"GHANA"]){
                    
                    dic = [NSMutableDictionary new];
                    
                    [dic setObject:self.crs_PhpBankName.text forKey:@"bank"];
                    [dic setObject:self.crs_PhpAccountNumbe.text forKey:@"account"];
                    [dic setObject:bankcode forKey:@"bank_code"];
                    
                }
                
                
                else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BULGARIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ROMANIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ISREAL"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"KUWAIT"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"QATAR"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"UNITED ARAB EMIRATES"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SAUDI ARABIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"TURKEY"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SWITZERLAND"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"CROATIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"BAHRAIN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"ESTONIA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"POLAND"]){
                    
                    dic = [NSMutableDictionary new];
                    [dic setObject:self.crs_Ifsc.text forKey:@"ifsc"];
                    [dic setObject:self.crs_Branch.text forKey:@"bank_name"];
                    [dic setObject:self.crs_BankAccount.text forKey:@"account"];
                    
                    
                }
                
                
                else if ([[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SINGAPORE"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"HONG KONG"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"THAILAND"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"JAPAN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"QATAR"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"NEW ZEALAND"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"OMAN"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"SOUTH AFRICA"]||[[Crs_ary_BankDetails valueForKey:@"country"]isEqualToString:@"HONG KONG"]){
                    
                    dic = [NSMutableDictionary new];
                    [dic setObject:self.crs_Ifsc.text forKey:@"ifsc"];
                    [dic setObject:self.crs_Branch.text forKey:@"bank_name"];
                    [dic setObject:self.crs_BankAccount.text forKey:@"account"];
                    
                    
                }
                
                else{
                    dic = [NSMutableDictionary new];
                    [dic setObject:self.crs_Ifsc.text forKey:@"ifsc"];
                    [dic setObject:self.crs_Branch.text forKey:@"bank_name"];
                    [dic setObject:self.crs_BankAccount.text forKey:@"account"];
                }
                
                
                
                NSLog(@" rock %@",dic);
                
                [Crs_sharedvariable sharedMySingleton].Crs_CashComparsion890 = crs_str_CashPay;
                
                [Crs_sharedvariable sharedMySingleton].Crs_str_BankName890 = self.crs_SelectPaymentLabel.text;
                [Crs_sharedvariable sharedMySingleton].crs_Ary_CashPayDetails890 =  [Crs_ary_BankDetails mutableCopy];
                [Crs_sharedvariable sharedMySingleton].crs_DictionarybankDetails890 = dic;
                
                //
                //                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                //
                //
                //                RecieverDetailedViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"RecieverDetailedViewControllerSID"];;
                //                //
                //                //                viewController.Crs_CashComparsion = crs_str_CashPay;
                //                //                viewController.crs_Ary_CashPayDetails = Crs_ary_BankDetails;
                //                //                viewController.Crs_str_BankName =  self.crs_SelectPaymentLabel.text;
                //                //                viewController.crs_DictionarybankDetails = dic;
                //
                //                //[self.navigationController pushViewController:viewController animated:YES];
                
            }
            else
                
                
            {
                
                
                
                
                
                
                UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
                
                
                
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        });
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}


-(void)BranchCodes{
    
    
    
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_GetBranchCode];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    @try {
        
        
        
        [mapData setObject:bankcode forKey:@"bankcode"];
        
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
            
            branchArray =   [NSMutableArray new ];
            
            branchArray = [json valueForKey:@"branch"];
            
            
            
            
            
            //NSLog(@"HEllo City %@",self.crs_VietnamCity.text);
          Crs_str_tableviewcompare = @"BranchGetter";
          [self.Crs_BankName_Tableview reloadData ];
//
            //NSLog(@" You Have Tapped On Me %@",W);
            
//
//            self.crs_VitenamView.hidden = YES;
//            self.crs_CountrySelectorView.hidden = NO;
//            [self.crs_pickerview_data reloadAllComponents];
//            [self.crs_CountryTableView reloadData];
//
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
    
    
    
    
    
}
- (IBAction)crs_BanglaAction:(id)sender {
    isFiltered = NO;
    self.crs_search.text = @"";
    self.crs_search.placeholder = @"Search BY Branch Name";
    Crs_str_tableviewcompare = @"BranchGetter";
    self.Crs_Banknameview.hidden = NO;
    
    [self.Crs_BankName_Tableview reloadData ];
    self.crs_SelecRecieverTableView.hidden = YES;
    self.Crs_BankName_Tableview.hidden = NO;
    [self BranchCodes];
    
}
@end

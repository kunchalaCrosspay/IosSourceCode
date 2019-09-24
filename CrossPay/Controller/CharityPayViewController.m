//
//  CharityPayViewController.m
//  CrossPay
//
//  Created by sai kiran  on 8/20/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "CharityPayViewController.h"
#import "CharitypayHistoryViewController.h"
#import "CharityFavouriteViewController.h"
#import "CharityTableViewCell.h"
#import "Crs_sharedvariable.h"
#import "MBProgressHUD.h"
#import "GlobalUrlsFile.h"
#import "crs_sharedmethods.h"
#import "CharityPayViewController.m"
#import "CharityGroupTableViewCell.h"
#import "CharityClearSettleViewController.h"
#import "SecureTradingViewController.h"
#import "SecureTradingCharityViewController.h"
#import "GiftAidViewController.h"
#import "PrivacyPolicyViewController.h"
#import "TermsandCondtionsViewController.h"
#import "NewTermsViewController.h"
#import "HomeViewController.h"
#import "CharitySecuretrading1ViewController.h"
#import "NewHomeViewController.h"
@interface CharityPayViewController ()
{
    NSString * cardType;
    NSString * click1;
    NSString * click2;
    NSString * click3;
    
    NSString * PurposeOfCharity;
    NSMutableArray * CharityNameArray;
    NSMutableArray * PurposeOfCharityArray;
    NSString * organisationCode;
    NSString * PurposeCode;
    NSString * CurrencyCode;
    NSMutableArray * searchArray;
    NSString * MyUserId;
    NSMutableDictionary * crs_PassingToWebview;
    NSMutableDictionary * DataArray;
    NSString * TransactionNumber;
    NSString * CoustmerNumber;
    NSString * Link;
    NSString * OrderId;
    NSString * SiteReference;
    NSString * Version;
    NSString * SecuteTradingLink ;
    NSString * OrganisationName;
    NSString * Cardtype1;
    NSString * siteReference;
    NSString * CharityOrganName;
    NSString * trusts;
     NSString * NewCard;
    NSString * BackEndString;
    int MinAmount;
    int Maxamount;
    int Donation;
    
    NSMutableDictionary * PassingToSecureTrading;
    BOOL  isFiltered;
}
@end

@implementation CharityPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.crs_NoResultsImage.hidden = YES;
    self.crs_CharityScroll.contentSize = CGSizeMake(self.view.frame.size.width-30, 890);
    [self.crs_creditCardOutlet setSelected:NO];
    [self.crs_DebitCardoutlet setSelected:YES];
 Cardtype1 = @"Debit";
    [_crs_Checkout2out setSelected:YES];
    BackEndString = @"Y";
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackOpaque;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Hide" style:UIBarButtonItemStyleBordered target:self action:@selector(clearNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    _crs_DonationAmount.inputAccessoryView = numberToolbar;
    _crs_Search.inputAccessoryView = numberToolbar;
    self.crs_Charityname.text = [_crs_HistoryDetails valueForKey:@"OrganisationName"];
    self.crs_DonationAmount.text = [_crs_HistoryDetails valueForKey:@"AmountPaid"];
    self.crs_ReasonForDonation.text = [_crs_HistoryDetails valueForKey:@"PurposeDescription"];
    PurposeCode = [_crs_HistoryDetails valueForKey:@"PurposeCode"];
    CurrencyCode = [_crs_HistoryDetails valueForKey:@"CcyCode"];
    
    organisationCode = [NSString stringWithFormat:@"%@",[_crs_HistoryDetails valueForKey:@"OrganisationCode"]];
    CharityOrganName = [NSString stringWithFormat:@"%@",[_crs_HistoryDetails valueForKey:@"OrganisationName"]];
   
    if ([CharityOrganName isEqualToString:@"(null)"]) {
        trusts = @"NoTrust";
        NSLog(@"Mahir %@",trusts);
    }
    else if (![CharityOrganName isEqualToString:@"(null)"]){
        
        trusts = @"Trust";
        NSLog(@"Mahir %@",trusts);
    }
    
    NSString * MaxamountString = [NSString stringWithFormat:@"%@",[_crs_HistoryDetails valueForKey:@"MaxAmount"]];
    Maxamount  = [MaxamountString intValue];
    
    NSString * MinamountString = [NSString stringWithFormat:@"%@",[_crs_HistoryDetails valueForKey:@"MinAmount"]];
    MinAmount  = [MinamountString  intValue];
    
    
    
    self.crs_Charityview.hidden = YES;
//    organisationCode = @"";
//    PurposeOfCharity = @"";
    
    [self.crs_ProceedToPay.layer setBorderWidth:1.0];
    [self.crs_ProceedToPay.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    
    [self.crs_Search addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    searchArray = [NSMutableArray new];
    
    CharityNameArray = [NSMutableArray new];
    PurposeOfCharityArray = [NSMutableArray new];
    self.crs_DonationAmount.textColor = [UIColor whiteColor];
    isFiltered=NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)crs_ProceedAction:(id)sender {
    
    NSString * Maik = [NSString stringWithFormat:@"%@",_crs_DonationAmount.text];
    Donation = [Maik intValue];
    NSLog (@"Int value is %i", Donation);
    
    
    NSString * Minimumamount = @"Please enter amount between";
    
    NSString * Maxmimumamount = @"Please enter amount between";
    NSString * Pound = @"-";
    
    if ([self.crs_Charityname.text isEqualToString:@""]){
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Select Charity Name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
        
    }
    
    
    
    else if ([self.crs_ReasonForDonation.text isEqualToString:@""]){
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please select purpose of donation" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
        
    }
    else if ([self.crs_DonationAmount.text isEqualToString:@""])
    {
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Enter Donation Amount" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        
    }
    else if ( Donation<MinAmount) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[NSString stringWithFormat:@"%@ %d %@%d",Minimumamount,MinAmount,Pound,Maxamount] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
        
    }
    
    else if ( Donation>Maxamount) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[NSString stringWithFormat:@"%@ %d %@%d",Maxmimumamount,MinAmount,Pound,Maxamount] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
        
    }
    
    else if (![_crs_creditCardOutlet isSelected]&&![_crs_DebitCardoutlet isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please select card type" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }
    
    
    else if (![_crs_Checkout1 isSelected]) {
        
        
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please accept Terms and Conditions  to Proceed " delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return;
        
        
        
    }
    
    
//    else if (![_crs_Checkout2out isSelected]) {
//
//        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please accept Gift Aid's Terms and conditions" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//
//        [alert show];
//
//        return;
//
//    }
    
    
    
    else{
        
        
        
        
        [self webserviceClearSettle];
    }
    
    
    
    
    
    
    
    
    
    
}
- (IBAction)crs_HomeAction:(id)sender {
    
    self.crs_HistoryOutLet.backgroundColor = [UIColor clearColor];
    
    
    self.crs_Homeoutlet.backgroundColor = [UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0];
    
    self.crs_FavoriteOutlet.backgroundColor = [UIColor clearColor];
    
    
}

- (IBAction)crs_HIstoryAction:(id)sender {
    
    
    self.crs_HistoryOutLet.backgroundColor = [UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0];
    
    self.crs_FavoriteOutlet.backgroundColor = [UIColor clearColor];
    
    self.crs_Homeoutlet.backgroundColor = [UIColor clearColor];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    CharitypayHistoryViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityhistoryViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}

- (IBAction)crs_FavoriteAction:(id)sender {
    
    
    self.crs_HistoryOutLet.backgroundColor = [UIColor clearColor];
    
    self.crs_FavoriteOutlet.backgroundColor = [UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0];
    
    self.crs_Homeoutlet.backgroundColor = [UIColor clearColor];
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    CharityFavouriteViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"CharityFavouriteViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}

- (IBAction)crs_Back:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NewHomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"NewHomeSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}
- (IBAction)crs_CharityTableHider:(id)sender {
    
}
- (IBAction)crs_DonationButton:(id)sender {
    
   _crs_Search.text = @"";
    
    if ([self.crs_Charityname.text isEqualToString:@""]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please select Charity Name For Purpose Of Donation" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
    else{
    
    PurposeOfCharity = @"OrganisationNames";
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_GetPurposeOfDonation];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    
    @try {
        
        
        
        [mapData setObject:organisationCode forKey:@"organisationCode"];
        
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
            
            
            
            PurposeOfCharityArray = [json valueForKey:@"data"];
            
            
            
            
            if (PurposeOfCharityArray.count == 0) {
                self.crs_Charityview.hidden = YES;
                self.crs_CharityTableView.hidden = YES;
            }
            else
                
                
            {
                
                self.crs_Charityview.hidden = NO;
                
                
            }
            
            
            [self.crs_CharityTableView reloadData];
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    }
    
    
    
}

- (IBAction)crs_CharityNameButton:(id)sender {
    
    PurposeOfCharity = @"ChariryGetter";
    _crs_Search.text = @"";
    
    
    
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
        
        
        
        [mapData setObject:@"UK" forKey:@"countryCode"];
        
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
            
            CharityNameArray = [NSMutableArray new];
            CharityNameArray = [json valueForKey:@"data"];
            
            NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"OrganisationName" ascending:YES];
            
            NSArray *sortDescriptors = [NSArray arrayWithObject:descriptor];
            
            // here you will get sorted array in 'sortedArray'
            CharityNameArray= [[CharityNameArray sortedArrayUsingDescriptors:sortDescriptors] mutableCopy];
            
            
            CharityNameArray = [json valueForKey:@"data"];
            
            //elf.crs_Charityview.hidden = NO;
            [self.crs_CharityTableView reloadData];
            
            if (CharityNameArray.count == 0) {
                self.crs_Charityview.hidden = YES;
                
            }
            
            else{
                
                
                self.crs_Charityview.hidden = NO;
            }
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
    
    
    
    
    
}



- (IBAction)crs_creditCardAction:(id)sender {
    //    cardType = @"CreditCard";
    
    cardType  = @"Debit";
    if ([cardType isEqualToString:@"Debit"]) {
        Cardtype1 = @"Credit";
    }
    
    [self.crs_creditCardOutlet setSelected:YES];
    [self.crs_DebitCardoutlet setSelected:NO];
    
    
    
}
- (IBAction)crs_Debitcard:(id)sender {
    
    cardType  = @"Credit";
    if ([cardType isEqualToString:@"Credit"]) {
        Cardtype1 = @"Debit";
    }
    [self.crs_creditCardOutlet setSelected:NO];
    [self.crs_DebitCardoutlet setSelected:YES];
    
    
}






-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if ([PurposeOfCharity isEqualToString:@"ChariryGetter"]) {
        
        
        if (!isFiltered) {
            
            return CharityNameArray.count;
            
        }
        
        
        else{
            
            
            
            return searchArray.count;
        }
        
    }
    
    else{
        if (!isFiltered) {
            
            return PurposeOfCharityArray.count;
        }
        
        
        else{
            
            return searchArray.count;
        }
    }
    
    
    
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    
    
    
    CharityGroupTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CharityGroupSID"];
    if ([PurposeOfCharity isEqualToString:@"ChariryGetter"]) {
        
        if (!isFiltered) {
            
            
            cell.crs_CharityName.text = [[CharityNameArray valueForKey:@"OrganisationName"]objectAtIndex:indexPath.row ];
            
            
        }
        else{
            
            
            
            cell.crs_CharityName.text = [[searchArray valueForKey:@"OrganisationName"]objectAtIndex:indexPath.row ];
            
        }
        
        
    }
    
    else{   if (!isFiltered) {
        cell.crs_CharityName.text = [[PurposeOfCharityArray valueForKey:@"PurposeDescription"]objectAtIndex:indexPath.row ];
        PurposeCode = [[PurposeOfCharityArray valueForKey:@"PurposeCode"]objectAtIndex:indexPath.row ];
        CurrencyCode = [[PurposeOfCharityArray valueForKey:@"CcyCode"]objectAtIndex:indexPath.row ];
        @try {
            siteReference = [[PurposeOfCharityArray valueForKey:@"sitereference"]objectAtIndex:indexPath.row ];
            
        }
        @catch (NSException * e) {
            NSLog(@"Exception: %@", e);
        }
        @finally {
            NSLog(@"finally");
        }
    }
        
    else{
        
        
        cell.crs_CharityName.text = [[searchArray valueForKey:@"PurposeDescription"]objectAtIndex:indexPath.row ];
        PurposeCode = [[searchArray valueForKey:@"PurposeCode"]objectAtIndex:indexPath.row ];
        CurrencyCode = [[PurposeOfCharityArray valueForKey:@"CcyCode"]objectAtIndex:indexPath.row ];
    }
        
    }
    
    return cell;
}














-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.crs_Charityview.hidden = YES;
    
    
    
    
    
    
    if ([PurposeOfCharity isEqualToString:@"ChariryGetter"]) {
        
        if (!isFiltered) {
            self.crs_Charityname.text = [[CharityNameArray valueForKey:@"OrganisationName"]objectAtIndex:indexPath.row ];
            organisationCode = [[CharityNameArray valueForKey:@"OrganisationCode"]objectAtIndex:indexPath.row ];
            OrganisationName = [[CharityNameArray valueForKey:@"OrganisationName"]objectAtIndex:indexPath.row ];
            @try {
            siteReference = [[CharityNameArray valueForKey:@"sitereference"]objectAtIndex:indexPath.row ];
                
            }
            @catch (NSException * e) {
                NSLog(@"Exception: %@", e);
            }
            @finally {
                NSLog(@"finally");
            }

            
        }
        
        else{
            
            
            self.crs_Charityname.text = [[searchArray valueForKey:@"OrganisationName"]objectAtIndex:indexPath.row ];
            organisationCode = [[searchArray valueForKey:@"OrganisationCode"]objectAtIndex:indexPath.row ];
            OrganisationName = [[searchArray valueForKey:@"OrganisationName"]objectAtIndex:indexPath.row ];
            @try {
                siteReference = [[searchArray valueForKey:@"sitereference"]objectAtIndex:indexPath.row ];
                
            }
            @catch (NSException * e) {
                NSLog(@"Exception: %@", e);
            }
            @finally {
                NSLog(@"finally");
            }
            
        }
        
        
        
    }
    
    
    else
    {
        if (!isFiltered) {
            
            self.crs_ReasonForDonation.text = [[PurposeOfCharityArray valueForKey:@"PurposeDescription"]objectAtIndex:indexPath.row ];
            
            @try {
                siteReference = [[PurposeOfCharityArray valueForKey:@"sitereference"]objectAtIndex:indexPath.row ];
                
            }
            @catch (NSException * e) {
                NSLog(@"Exception: %@", e);
            }
            @finally {
                NSLog(@"finally");
            }
            PurposeCode = [[PurposeOfCharityArray valueForKey:@"PurposeCode"]objectAtIndex:indexPath.row ];
            NSString * MaxamountString = [NSString stringWithFormat:@"%@",[[PurposeOfCharityArray valueForKey:@"MaxAmount"]objectAtIndex:indexPath.row ]];
            Maxamount  = [MaxamountString intValue];
            
            NSString * MinamountString = [NSString stringWithFormat:@"%@",[[PurposeOfCharityArray valueForKey:@"MinAmount"]objectAtIndex:indexPath.row ]];
            MinAmount  = [MinamountString  intValue];
            
            
            
            
            
        }
        
        else{
            
            
            self.crs_ReasonForDonation.text = [[searchArray valueForKey:@"PurposeDescription"]objectAtIndex:indexPath.row ];
            @try {
                siteReference = [[searchArray valueForKey:@"sitereference"]objectAtIndex:indexPath.row ];
                
            }
            @catch (NSException * e) {
                NSLog(@"Exception: %@", e);
            }
            @finally {
                NSLog(@"finally");
            }
             PurposeCode = [[searchArray valueForKey:@"PurposeCode"]objectAtIndex:indexPath.row ];
            NSString * MaxamountString = [NSString stringWithFormat:@"%@",[[searchArray valueForKey:@"MaxAmount"]objectAtIndex:indexPath.row ]];
            Maxamount  = [MaxamountString intValue];
            
            NSString * MinamountString = [NSString stringWithFormat:@"%@",[[searchArray valueForKey:@"MinAmount"]objectAtIndex:indexPath.row ]];
            MinAmount  = [MinamountString  intValue];
        }
        
    }
    
    
    
    
    
    
    isFiltered=NO;
    
    
}






- (IBAction)crs_ViewHider:(id)sender {
    self.crs_Charityview.hidden = YES;
}
- (IBAction)crs_CharityButtonActionForHiding:(id)sender {
    self.crs_Charityview.hidden = YES;
}

- (IBAction)crs_Checkout1Action:(id)sender {
    if ([click1 isEqualToString:@"Checkout"]) {
        [_crs_Checkout1 setSelected:YES];
        click1 = @"checkin";
        
        
    }
    else{
        
        [_crs_Checkout1 setSelected:NO];
        click1 = @"Checkout";
    }
}
- (IBAction)crs_Checkout2Action:(id)sender {
    if ([click2 isEqualToString:@"Checkout"]) {
        [_crs_Checkout2out setSelected:YES];
        click2 = @"checkin";
        BackEndString = @"Y";
        
    }
    else{
        
        [_crs_Checkout2out setSelected:NO];
        click2 = @"Checkout";
        BackEndString = @"N";
    }
}


-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField ==self.crs_DonationAmount) {
        
        
        
        
        
        
        CGPoint scrollPoint = CGPointMake(0,30);
        [  self.crs_CharityScroll setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    
    
    else if  (textField == _crs_DonationAmount) {
        
        
        
        CGPoint scrollPoint = CGPointMake(0,800);
        [  self.crs_CharityScroll setContentOffset:scrollPoint animated:YES];
        
        
        
    }
}











-(void) dismissKeyboard {
    
    [_crs_DonationAmount resignFirstResponder];
    [_crs_Search resignFirstResponder];
}
-(void)clearNumberPad{
    [_crs_Search resignFirstResponder];
    [_crs_DonationAmount resignFirstResponder];
}

-(void)doneWithNumberPad{
    [_crs_Search resignFirstResponder];
    [_crs_DonationAmount resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_crs_DonationAmount resignFirstResponder];
    [_crs_Search resignFirstResponder];
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}




-(void)webserviceClearSettle{
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Pls Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
        
        
        
        
        
        
    }
    
    UITextField * textFieldIndustry = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 465, 68)];
    textFieldIndustry.font = [UIFont systemFontOfSize:17.0];
    textFieldIndustry.placeholder = @"Tap to..";
    textFieldIndustry.textAlignment = NSTextAlignmentCenter;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSError * error;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Crosspay_CharityInitateTransaction];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSMutableDictionary * mapData=[NSMutableDictionary new];
    
    //    userId
    //    organisationCode
    //    purposeCode
    //    amount
    //    currencyCode
    //    cardType
    //
    [mapData setObject:@"IOS" forKey:@"device"];
    
    [mapData setObject:self.crs_DonationAmount.text forKey:@"amount"];
    
    
    
    
    //[mapData setObject:[Crs_sharedvariable sharedMySingleton].crs_userId forKey:@"user_id"];
    
    MyUserId =  [Crs_sharedvariable sharedMySingleton].crs_userId ;
    NSString* myNewString = [NSString stringWithFormat:@"%@", MyUserId];
    
    
    
    
    
    [mapData setObject:myNewString forKey:@"userId"];
    
    [mapData setObject:PurposeCode forKey:@"purposeCode"];
    [mapData setObject:organisationCode forKey:@"organisationCode"];
    [mapData setObject:CurrencyCode forKey:@"currencyCode"];
    [mapData setObject:Cardtype1 forKey:@"cardType"];
    [mapData setObject:BackEndString forKey:@"giftaid"];
   
    @try {
         [mapData setObject:siteReference forKey:@"sitereference"];
        [mapData setObject:@"Debit" forKey:@"cardType"];
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
    }
    @finally {
        NSLog(@"finally");
    }
    
    
    
    
    NSLog(@"%@",mapData);
    
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
                                                  
                                                  NSLog(@"%@", [json valueForKey:@"message"]);
                                                  NSLog(@"%@",[json valueForKey:@"data"]);
                                                  
                                                  NSLog(@"Transaction Number%@",[[json valueForKey:@"data"] valueForKey:@"txnno"]);
                                                  TransactionNumber = [[json valueForKey:@"data"] valueForKey:@"txnno"];
                                                  CoustmerNumber = [[json valueForKey:@"data"] valueForKey:@"customerno"];
                                                  SecuteTradingLink = [[json valueForKey:@"data"] valueForKey:@"link"];
                                                  OrderId = [[json valueForKey:@"data"] valueForKey:@"orderreference"];
                                                  SiteReference = [[json valueForKey:@"data"] valueForKey:@"sitereference"];
                                                  Version = [[json valueForKey:@"data"] valueForKey:@"version"];
                                                  PassingToSecureTrading = [[json valueForKey:@"data"] valueForKey:@"link"];
                                                  crs_PassingToWebview = [json valueForKey:@"data"];
                                                  
                                                  
                            if ([[json valueForKey:@"status"]isEqualToString:@"200"]) {
                                                      
                                                      
                                                      NSLog(@"My data%@",mapData);
                                                      
                                                      
                                                      if ([Cardtype1 isEqualToString:@"Debit"]) {
                                                          // crs_PassingToWebview = json;
                                                          //Crs_OrderID = [json valueForKey:@"orderreference"];
                                                          UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                                          CharitySecuretrading1ViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"Charity1SID"];;
                                                          viewController.crs_CHARITYAmount = _crs_DonationAmount.text;
                                                          @try {
                                                              viewController.crs_CHARITYCardType = @"Debit";
                                                          } @catch (NSException *exception) {
                                                              NSLog(@"Hello%@",exception);
                                                          } @finally {
                                                              NSLog(@"Hello");
                                                          }  viewController.CardGetter = @"Debit";
                                                          viewController.crs_CHARITYPurposeCode = PurposeCode;
                                                          viewController.crs_CHARITYCurrencyCode = CurrencyCode;
                                                          viewController.CharityReference = siteReference;           viewController.crs_CHARITYOrganisationCode = organisationCode;
                                                          viewController.crs_CHARITYCoustmerNo = CoustmerNumber;
                                                          viewController.crs_CHARITYTransactionNumber = TransactionNumber;
                                                          viewController.crs_CHARITYOrderId = OrderId;
                                                          viewController.crs_SecureTradingLink = SecuteTradingLink;
                                                          viewController.crs_CHARITYSiteReference = SiteReference;
                                                          viewController.crs_CHARITYVersion = Version;
                                                          viewController.passingData = crs_PassingToWebview;
                                                          viewController.CharityOrganisationName = OrganisationName;
                                                  viewController.TrustGetter = trusts;
                                                          viewController.CharityOrganisationName1 = CharityOrganName;
                                                          [self.navigationController pushViewController:viewController animated:YES];
                                                          
                                                          
                                                          
                                                          
                                                      }
                                                      else{
                                                          
                                                          
                                                          
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CharityClearSettleViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"CHaritySID"];;
    viewController.crs_CHARITYAmount = _crs_DonationAmount.text;
    viewController.crs_CHARITYCardType = Cardtype1;
    viewController.crs_CHARITYPurposeCode = PurposeCode;
    viewController.crs_CHARITYCurrencyCode = CurrencyCode;
    viewController.crs_CHARITYOrganisationCode = organisationCode;
    viewController.crs_CHARITYCoustmerNo = CoustmerNumber;
    viewController.crs_CHARITYTransactionNumber = TransactionNumber;
    viewController.crs_CHARITYOrderId = OrderId;
    [self.navigationController pushViewController:viewController animated:YES];
                                                          
                                                          
                                                      }
                                                      
                                                      
                                                  }
                                                  else {
                                                      
                                                      UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:[json valueForKey:@"message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                      
                                                      [alert show];
                                                      return ;
                                                  }
                                                  
                                                  
                                                  
                                                  
                                                  
                                              });
                                              
                                              
                                          }];
    
    
    
    
    
    
    [postDataTask resume];
    
}








- (IBAction)crs_CreditExtraAction:(id)sender {
    cardType  = @"Credit";
    
    [self.crs_creditCardOutlet setSelected:YES];
    [self.crs_DebitCardoutlet setSelected:NO];
    
}

- (IBAction)crs_DebitCardExraAction:(id)sender {
    cardType  = @"Debit";
    
    [self.crs_creditCardOutlet setSelected:NO];
    [self.crs_DebitCardoutlet setSelected:YES];
}

- (IBAction)crs_UkGiftAidButton:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    GiftAidViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"GiftSID"];;
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}

- (IBAction)crs_PrivacyButton:(id)sender {
}

- (IBAction)crs_Privacybutton:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NewTermsViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"TermsandConditionsViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)crs_TermsButton:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    PrivacyPolicyViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"PrivacyViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}
- (IBAction)crs_Checkout3Action:(id)sender {
    if ([click3 isEqualToString:@"Checkout"]) {
        [_checkOut3 setSelected:YES];
        click3 = @"checkin";
        
        
    }
    else{
        
        [_checkOut3 setSelected:NO];
        click2 = @"Checkout";
    }
}

- (IBAction)crs_ExtraCheckout1:(id)sender {
    if ([click1 isEqualToString:@"Checkout"]) {
        [_crs_Checkout1 setSelected:YES];
        click1 = @"checkin";
        
        
    }
    else{
        
        [_crs_Checkout1 setSelected:NO];
        click1 = @"Checkout";
    }
}

- (IBAction)crs_ExtraCheckout2:(id)sender {
    if ([click2 isEqualToString:@"Checkout"]) {
        [_crs_Checkout2out setSelected:YES];
        click2 = @"checkin";
        BackEndString = @"Y";
        
    }
    else{
        
        [_crs_Checkout2out setSelected:NO];
        click2 = @"Checkout";
        BackEndString = @"N";
    }
}
-(void)textFieldDidChange:(UITextField *)textField
{
    self.searchTextString=textField.text;
    //self.searchTextString = _crs_Search.text;
//    [self updateSearchArray:self.searchTextString];
////     [self updateSearchArrays:self.searchTextString];
    
    
    self.searchTextString=textField.text;
    if ([PurposeOfCharity isEqualToString:@"ChariryGetter"]){
        
        [self updateSearchArray:self.searchTextString];
    }
    
    else if ([PurposeOfCharity isEqualToString:@"OrganisationNames"])
    {
        
         [self nation:self.searchTextString];
    }
   
    
}

-(void)updateSearchArray:(NSString *)searchText
{
    searchArray = [NSMutableArray new];
   
    if(searchText.length==0)
    {
        isFiltered=NO;
        
        searchArray = CharityNameArray;
        self.crs_NoResultsLabel.hidden = NO;
        
        NSLog(@"%@",searchArray);
        [self.crs_CharityTableView reloadData ];
    }
    else
    {
        isFiltered=YES;
        
        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in CharityNameArray){
            NSString * string=[dic valueForKey:@"OrganisationName"];
  
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                
                // NSString * Ary_id=[dic valueForKey:@"id"];
                
                [searchArray addObject:dic];
                self.crs_NoResultsLabel.hidden = YES;
                //self.crs_NoResultsImage.hidden = YES;
                NSLog(@"search %@",searchArray);
                
            }
        }
        
        
        
        /// historyArray = searchArray;
        [self.crs_CharityTableView reloadData ];
        
        
    }
    
    
    
}


-(void)nation:(NSString *)searchText
{
    searchArray = [NSMutableArray new];
    
    if(searchText.length==0)
    {
        isFiltered=NO;
        searchArray = PurposeOfCharityArray;
        NSLog(@"%@",searchArray);
        [self.crs_CharityTableView reloadData ];
    }
    else
    {
        isFiltered=YES;
        
        searchArray =[[NSMutableArray alloc]init];
        for(NSDictionary *dic in PurposeOfCharityArray){
            NSString * string=[dic valueForKey:@"PurposeDescription"];
            
            NSRange stringRange=[string rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location !=NSNotFound){
                @try {
                      [searchArray addObject:dic];
                } @catch (NSException *exception) {
                    NSLog(@"expection%@",exception);
                    NSLog(@"search %@",searchArray);
                } @finally {
                    
                }
                // NSString * Ary_id=[dic valueForKey:@"id"];
                
              
                
               
                
            }
        }
        
        
        
        /// historyArray = searchArray;
        [self.crs_CharityTableView reloadData ];
        
        
    }
    
    
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField==self.crs_Search)
    {
        if (self.self.crs_Search.text.length >=20 && range.length == 0)        {
            return NO; // return NO to not change text
        }        else
        {
            
            
                        NSString *validRegEx =@"^[A-Z,a-z.]*$"; //change this regular expression as your requirement
                        NSPredicate *regExPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", validRegEx];
                        BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:string];
                        if (myStringMatchesRegEx)
                            return YES;
                        else
                            return NO;
            
            return YES;
            
            
            
            
            
            
        }
        
        
        
    }
    
    
    
    
    
    else{
        
        
        
        
        
        
        {return YES;}
        
    }
    
}
@end

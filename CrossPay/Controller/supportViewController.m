//
//  supportViewController.m
//  Payment
//
//  Created by WELCOME on 9/4/17.
//  Copyright © 2017 WELCOME. All rights reserved.
//

#import "supportViewController.h"
#import "HomeViewController.h"
#import "HistoryViewController.h"
#import "notificationViewController.h"
#import "SettingsViewController.h"
#import "UpdateProfile.h"
#import "SupportTableViewCell.h"
#import "crs_sharedmethods.h"
//#import <Google/Analytics.h>
#import "Crs_sharedvariable.h"
#import "GlobalUrlsFile.h"
#import "NewHomeViewController.h"
#import "MBProgressHUD.h"
@interface supportViewController ()
{
    NSMutableArray * Ary;
    
     NSMutableArray * contentArray;
    NSString * phoneNumber;
    
    NSString * Crs_expand;
    NSString * COUNTRY;
    int crs_section;
}

@end

@implementation supportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self profileDetails];
    Ary = [[NSMutableArray alloc]initWithObjects:@"What is  Crosspay?",@"Can I have multiple accounts?",@"Is it safe to send money through Crosspay?",@"How is Crosspay regulated?",@"How do I sign up for an account?",@"How do I amend/close my account?",@"How can I process a transaction?",@"How will I know the charges and exchange rates?",@"How long will the transfer take?",@"What happens after I confirm my payment?",@"Why do I need to provide ID??",@"Do I need to provide any other supporting documents?",@"How do I send my ID and supporting documents?",@"How can I Pay For My Transfer",@"Can someone else pay on my behalf?",@"I am a Corporate, how do I sign up and process transactions?",@"Who can receive money?",@" I can’t find the answer to what I am looking for?",nil];
    
    
    contentArray = [[NSMutableArray alloc]initWithObjects:@"Crosspay is a UK based digital payments company that allows individuals and corporates to send payments overseas for personal and business needs using a smartphone, tablet, computer or by calling our dedicated team. We provide extremely competitive rates and our charges are low, and we also provide a personalised service to all our customers! Money can be sent to bank accounts and for cash pick-ups. We are constantly expanding the options through which people can receive money. You can send money to over 100 countries currently and this number is growing!",@"No. You can only sign up once. If we find that there is more than one account for a customer, we may block all the accounts.If you think you may have created more than one account, let us know by contacting us here and we will keep the one you want and close the other(s).",@"Yes. Safety and Security is very important to us. We ensure that our website and mobile app is secure by using industry standard encryption. All the partner companies we use to process payments are also required to comply with strict security and privacy standards. Crosspay is regulated as an Authorised Payment Institution by the Financial Conduct Authority (FCA), and we are legally required to hold all of our customers’ funds in a segregated client account separate from our operational accounts.",@"Crosspay Ltd is authorised by the Financial Conduct Authority under the Payment Services Regulations 2009 (FRN 720157) for the provision of payment services. Crosspay Ltd is licensed and regulated by HMRC as a Money Services Business (MSB), Licence No.12847230.",@"You can sign up for an account by selecting Sign Up on our website homepage or selecting Register on the Mobile App. It is completely free and you will be required to provide some very basic details of yourself. ",@"You can amend details on your account anytime, but for security reasons this can only be authorised by getting in touch with us.If for any reason you would like to close your account, contact us and we will delete your account. Once this is done it cannot be accessed by you or anybody else.",@"Processing a transaction can be done in three simple steps.Choose which country you want to send money to and how you would like the recipient to receive the money.Tell us who you want to send money to by providing their name and other relevant details (If it is the first time you are sending money to a recipient this may need to be authorised by us and then going forward the details will be saved in your account)Tell us the amount of money you want to send, review the details and pay for your transfer.You can do this by logging in to your account on our website or through the mobile app.Alternatively, you can also call or email us here, and we can help with you with it. Make sure you have your customer number ready to quote.",@"Our charges and exchange rate will be clearly displayed at the time of doing the transaction. You can also use our online calculator to get this information",@"Generally, it takes just one working day. However, this can vary depending on which country you are sending to and how you are sending it.The transaction itself will be only be released once we can confirm that the payment has been made and received by us.The time indicated may also vary slightly due to some things such as additional security checks, market conditions in the destination countries which are beyond our control.Any transactions made on Friday evening and weekends and bank holidays will only be processed on the next working day.",@"There is nothing more to do from your side, unless you are contacted by us for additional details.We will verify some information and process the transaction.If you want to ask us anything about the progress of your transaction, please contact us.",@"If we are unable to verify your identity independently or depending on the amount you're sending, we may ask you to provide some of the following documents to verify your identity:Proof of Identity: Scanned copy of your passport/Scanned copy of full UK driving licence (not provisional)/Scanned copy of EU member state ID card with photoProof of Address: Utility bill* (we don’t accept mobile phone bills or payslips)/Bank statement*/Bank letter*/Tenancy Agreement/Credit card statement*/NHS letter/Provisional driving licence/Council Tax bill*/Official letter from any UK Government body*These documents should not be more than three months old.",@"Depending on the amount being sent and for certain types of transactions, we may ask you to provide some of the following documents to verify the source of funds:Payslip/Bank statement/screenshot from online banking/Tax rebate receipt/Completion statement of house sale/Car sale receipt, etc./Bank loan documents (including mortgages)",@"You will be able to upload your IDs and supporting documents directly on to your profile when prompted. If you are unable to do this or we have requested additional information/documentation, please email us at payments@crosspaymt.com",@"You can pay in the following ways:By debit card from:UK - maximum of £1000 over a 30-day periodNorway - maximum of NOK 30,000 over a 30-day period Sweden - maximum of SEK 30,000 over a 30-day period Denmark - maximum of DKK 30,000 over a 30-day period Other EU countries - maximum of € 3,000 over a 30-day period By bank transfer from anywhere - any amount as long as your bank will allow it.Remember, there may be restrictions on how much can be received depending on the country you are sending to and how you are sending the transaction.We do not accept cash or cheques.",@"No. We don’t accept payments from anyone other than yourself (the customer). When making the payment, make sure that the money is either being transferred from your account or made using your debit/credit card.",@"If you are a corporate, contact us and we will help you get going as it is a slightly different process to signing up as an Individual.We will be happy to give you a personalised service.",@"Anyone residing or having bank accounts in any of the recipient countries of Crosspay can receive the money Note: There are a lot of scams that are being run by criminals who try to get victims to send money through services like Crosspay. So we advise you not to send money to anyone you don’t know.",@"If you can’t find the answer to your what you are looking for, contact us and someone will be happy to help you out. ",@"",nil];
    
    
    
    // self.crs_ScrollForContact.contentSize = CGSizeMake(self.view.frame.size.width-30, 500);
    self.crs_FirstName.textColor = [UIColor whiteColor];
    self.crs_emailId.textColor = [UIColor whiteColor];
    self.crs_subject.textColor = [UIColor whiteColor];
    self.crs_Messgae.textColor = [UIColor whiteColor];
    self.crs_PhoneNumber.textColor = [UIColor whiteColor];
    
    Crs_expand=@"expand";
    
    
    _Crs_border_contact.hidden=YES;
    self.Crs_contact_view.hidden=YES;
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [Ary count];
}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    UIView *sectionView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 280,120)];
//    
//    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
//    lbl.textAlignment = UITextAlignmentCenter;
//    lbl.font = [UIFont systemFontOfSize:12];
//    lbl.text=[Ary objectAtIndex:section];
//    
//    
//    [sectionView addSubview:lbl];
//    return sectionView ;
//}




-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    
    
    
    
UIView *Crs_view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.Crs_tablview_expanded.frame.size.width, 50)];
//    Crs_view.backgroundColor=[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0];
     Crs_view.backgroundColor=[UIColor colorWithRed:36.0f/255.0f green:58.0f/255.0f blue:87.0f/255.0f alpha:1.0];
    
    
    
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0,0, self.Crs_tablview_expanded.frame.size.width-50, 50)];
//        lbl.textAlignment = UITextAlignmentCenter;
        lbl.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
        lbl.text = [Ary objectAtIndex:section];
        lbl.textColor = [UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0];

    
    
    UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(0,49, self.Crs_tablview_expanded.frame.size.width, 1)];
    lbl1.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(aMethod:)
     forControlEvents:UIControlEventTouchUpInside];
  
    
    [button setTag:section];
    button.frame = CGRectMake(0, 0, self.Crs_tablview_expanded.frame.size.width,100);
    
    UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake(self.Crs_tablview_expanded.frame.size.width-50,10,15,15)];
    dot.image=[UIImage imageNamed:@"plus.png"];
   
    
    UIImageView *dot1 =[[UIImageView alloc] initWithFrame:CGRectMake(self.Crs_tablview_expanded.frame.size.width-50,10,15,15 )];
    dot1.image=[UIImage imageNamed:@"substract.png"];
   
    
    
    if ([Crs_expand isEqualToString:@"not"]&&(section==crs_section))
    {
         [Crs_view addSubview:dot1];
    }
    else{
        [Crs_view addSubview:dot];
    }
    
    
    [Crs_view addSubview:button];
     [Crs_view addSubview:lbl1];
    
    [Crs_view addSubview:lbl];
    
    return Crs_view;
}

-(void)aMethod:(UIButton *)sender
{
    
    
    if ([Crs_expand isEqualToString:@"expand"]) {
        crs_section=sender.tag;
        Crs_expand=@"not";
    }
    else
    {
       Crs_expand =@"expand";
    }
    
    [self.Crs_tablview_expanded reloadData];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([Crs_expand isEqualToString:@"not"]&&(section==crs_section)) {
        return 1;
    }
    else
    {
        
        
        
        
        return 0;
    }
    
      //Return the number of sections you want in each row
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"supportcell";
   SupportTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.crs_SupportContent.text = [contentArray objectAtIndex:indexPath.section];
    //Configure the cell however you wish
    
    return cell;
}


- (IBAction)crs_Btn_Action_Faq:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    self.crs_contact_btn.backgroundColor = [UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0];
    
    
    self.crs_btn_Faq.backgroundColor = [UIColor colorWithRed:20.0/255.0 green:119.0/255.0 blue:112.0/255.0 alpha:1.0];
    _crs_Faq_view.hidden=NO;
    _crs_border_faq.hidden=NO;
    
    _Crs_border_contact.hidden=YES;
    _Crs_contact_view.hidden=YES;
    
    
    
    
}

- (IBAction)Crs_Btn_Action_contact:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    self.crs_btn_Faq.backgroundColor = [UIColor colorWithRed:37.0/255.0 green:163.0/255.0 blue:179.0/255.0 alpha:1.0];
    
    
    self.crs_contact_btn.backgroundColor = [UIColor colorWithRed:20.0/255.0 green:119.0/255.0 blue:112.0/255.0 alpha:1.0];
    
    _crs_border_faq.hidden=YES;
    _crs_Faq_view.hidden=YES;
    
    _Crs_border_contact.hidden=NO;
    _Crs_contact_view.hidden=NO;

    
    
    
    
    
    
    
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

- (IBAction)crs_Notifications:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
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

- (IBAction)crs_Settings:(id)sender {
    
    
    
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






- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (textField==self.crs_EmailField)
    {
        if (self.self.crs_EmailField.text.length >=10 && range.length == 0)        {
            return NO; // return NO to not change text
        }        else
        {
            
            
            NSString *validRegEx =@"^[0-9.]*$"; //change this regular expression as your requirement
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
- (IBAction)crs_Back:(id)sender {
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self.view endEditing:YES];// this will do the trick
//}


-(BOOL) textFieldShouldReturn: (UITextField *) textField
{
    [textField resignFirstResponder];
    
    return YES;
}


-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == _crs_FirstName) {
        
        
        
        
        
        
        CGPoint scrollPoint = CGPointMake(0,150);
        [  self.crs_ScrollForContact setContentOffset:scrollPoint animated:YES];
        
        
    }
    
    else if (textField == _crs_emailId)
        
        
    {
        
        CGPoint scrollPoint = CGPointMake(0,180);
        [  self.crs_ScrollForContact setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    
    else if (textField == _crs_PhoneNumber)
        
        
    {
        
        CGPoint scrollPoint = CGPointMake(0,210);
        [  self.crs_ScrollForContact setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    
    else if (textField == _crs_subject)
        
        
    {
        
        CGPoint scrollPoint = CGPointMake(0,240);
        [  self.crs_ScrollForContact setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    
    else if (textField == _crs_Messgae)
        
        
    {
        
        CGPoint scrollPoint = CGPointMake(0,270);
        [  self.crs_ScrollForContact setContentOffset:scrollPoint animated:YES];
        
        
        
    }
    
    
    
    
}


- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    NSLog(@"%ld",(long)result);
    NSLog(@"%@",error);
    if (error ==nil) {
        NSString * mail=[NSString stringWithFormat:@"%ld",(long)result];
        if ([mail isEqualToString:@"2"]) {
            //[[TdSharedmethods sharedMySingleton]showMessage:@"Your message has been sent" withTitle:@"Total Driver"];
        }
        else if ([mail isEqualToString:@"1"]) {
            
            
           // [[TdSharedmethods sharedMySingleton]showMessage:@"Your message has been saved in draft" withTitle:@"Total Driver"];
        }
        
        
        else
        {
            //[[TdSharedmethods sharedMySingleton]showMessage:@"Your message has been cancelled" withTitle:@"Total Driver"];
        }
        
        
        
    }else{
        //[[TdSharedmethods sharedMySingleton]showMessage:@"Internal server error" withTitle:@"Total Driver"];
        
    }
    
    
    
    [controller dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)crs_EmailContact:(id)sender {
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    NSString *url = [URLEMail stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
    [[UIApplication sharedApplication]  openURL: [NSURL URLWithString: url]];
    }

- (IBAction)crs_callUs:(id)sender {
    
//    NSString *phoneNumber = [@"tel://" stringByAppendingString:phoneNumber];
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    
    
   //[[UIApplication sharedApplication]:[NSURL URLWithString:@"tel:55698"]];
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",@"4402030962255"]]];

}

//}

-(void)viewWillAppear:(BOOL)animated
{
    
//    
//    
//    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
//    [tracker set:kGAIScreenName value:@"Verify Mobile Screen View controller"];
//    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
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
            //message = [json valueForKey:@"message"];
            if ([[json valueForKey:@"status"]isEqualToString:@"200"])
                
                
            {
                [Crs_sharedvariable sharedMySingleton].crs_EmailId = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"email"];
                [Crs_sharedvariable sharedMySingleton].crs_country = [[[json valueForKey:@"data"] objectAtIndex:0] valueForKey:@"country"];
                
                NSMutableArray * crs_ProfileNameArray = [[json valueForKey:@"data"] objectAtIndex:0];
                
                
                NSString * fullName = [NSString stringWithFormat:@"%@ %@ %@ ",[ crs_ProfileNameArray valueForKey:@"first_name"],[ crs_ProfileNameArray valueForKey:@"middle_name"],[ crs_ProfileNameArray valueForKey:@"last_name"]];
                
                [Crs_sharedvariable sharedMySingleton].crs_Name = fullName;
                
                //                UserCatgory = [ crs_ProfileNameArray valueForKey:@"user_category"];
                //                NSLog(@"My Category&%@",UserCatgory);
                
                
                //
                //                CoustmerId = [crs_ProfileNameArray valueForKey:@"customer_id"];
                //                CoustmerId = [NSString stringWithFormat:@"%@",[crs_ProfileNameArray valueForKey:@"customer_id"]];
                
                COUNTRY = [ crs_ProfileNameArray valueForKey:@"country"];
                
                
                
                if ([COUNTRY isEqualToString:@"UNITED STATES"]||[COUNTRY isEqualToString:@"HONG KONG"]) {
                    self.crs_HistoryLabel.hidden = YES;
                    self.crs_HistoryOutlet.hidden = YES;
                    [self.crs_profileOutlet setFrame:CGRectMake(165,8,25,25)];
                    [self.crs_ProfileLabel setFrame:CGRectMake(162,22,60,50)];
                }
                else{
                    
                    self.crs_HistoryLabel.hidden = NO;
                    self.crs_HistoryOutlet.hidden = NO;
                    
                }
                
                
                
                
            }
            else{
                
                
                
                
            }
            
            
            
        });
        
        
        
        
    }];
    
    [postDataTask resume];
    
    
    
    
}
@end

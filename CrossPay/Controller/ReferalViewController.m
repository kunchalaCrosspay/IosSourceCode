//
//  ReferalViewController.m
//  CrossPay
//
//  Created by sai kiran  on 2/17/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "ReferalViewController.h"
#import "HomeViewController.h"
#import "crs_sharedmethods.h"
#import "ReferalTermsandCondtionsViewController.h"
//#import <Google/Analytics.h>
@interface ReferalViewController ()

@end

@implementation ReferalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    if ([_ReferalCountry isEqualToString:@"UNITED KINGDOM"]) {
        self.crs_HideTheLabel.text = @"Invite your family and friends to join Crosspay with the below referral code and earn £50 for every 3 individuals who transfer over £200";
    }
    
    else if ([_ReferalCountry isEqualToString:@"AUSTRIA"]||[_ReferalCountry isEqualToString:@"BELGIUM"]||[_ReferalCountry isEqualToString:@"FRANCE"]||[_ReferalCountry isEqualToString:@"GERMANY"]||[_ReferalCountry isEqualToString:@"IRELAND"]||[_ReferalCountry isEqualToString:@"ITALY"]||[_ReferalCountry isEqualToString:@"SPAIN"]||[_ReferalCountry isEqualToString:@"NETHERLANDS"]){
        self.crs_HideTheLabel.text = @"Invite your family and friends to join Crosspay with the below referral code and earn €50 for every 3 individuals who transfer over €200";
        
        
        
    }
    else{
        
        
        
        
        self.crs_HideTheLabel.text = @"Invite your family and friends to join Crosspay with the below referral code";
    }
    
    
    
    
    
    NSLog(@"My referal country is %@",_ReferalCountry);
    if ([_referalstatus isEqualToString:@"406"]||[_referalstatus isEqualToString:@"500"]) {
        self.crs_Invitebutton.hidden = YES;
        self.crs_HideTheLabel.hidden = YES;
        self.crs_ReferalDispalyer.hidden = YES;
        self.crs_FreeLabel.hidden = YES;
        self.crs_ReferIamge.hidden = YES;
        self.crs_referLabelHeading.hidden = YES;
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Referral Code coming soon! Invite your family and friends to join Crosspay using the referral code. We will notify you once this offer is available in your location." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        return;
    }
    
    
    else{
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        NSString * crs_referenceId  =    [defaults objectForKey:_referalCode];
        
        NSLog(@"%@",crs_referenceId);
        self.crs_Referencelabel.text = _referalCode;
        
        
        
    }
    
    NSLog(@"My Code is %@",_referalCode);
    
    
    
    
    
    
    
    
    if ([self.crs_Referencelabel.text isEqualToString:@""]) {
        
        
        self.crs_Invitebutton.hidden = YES;
        self.crs_HideTheLabel.hidden = YES;
        self.crs_ReferalDispalyer.hidden = YES;
        self.crs_FreeLabel.hidden = YES;
        self.crs_ReferIamge.hidden = YES;
        self.crs_referLabelHeading.hidden = YES;
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Referral Code coming soon! Invite your family and friends to join Crosspay using the referral code. We will notify you once this offer is available in your location." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    
    else{
        
        
        
    }
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







- (IBAction)crs_ReferBack:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    HomeViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewControllerSID"];;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)crs_invite:(id)sender {
    
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
        
        
        
    }
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSString * crs_referenceId  =    [defaults objectForKey:@"ref_code"];
    
    // NSString *textToShare = crs_referenceId;
    NSString * textToshare1 = [NSString stringWithFormat:@"To Download Crosspay app Click On Below Link    ios Link : https:goo.gl/FmbuwY   Android Link : https: goo.gl/XqukYX  Your Referral Code is   :%@",_referalCode];
    
    
    // NSURL *myWebsite = [NSURL URLWithString:@"http://www.codingexplorer.com/"];
    
    NSArray *objectsToShare = @[textToshare1];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    NSArray *excludeActivities = @[UIActivityTypeAirDrop,
                                   UIActivityTypePrint,
                                   UIActivityTypeAssignToContact,
                                   UIActivityTypeSaveToCameraRoll,
                                   UIActivityTypeAddToReadingList,
                                   UIActivityTypePostToFlickr,
                                   UIActivityTypePostToVimeo];
    
    activityVC.excludedActivityTypes = excludeActivities;
    
    [self presentViewController:activityVC animated:YES completion:nil];
}



-(void)viewWillAppear:(BOOL)animated
{
    //
    //
    //
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"Referal    View controller"];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    //
}








- (IBAction)crs_TermsAndConditionsButton:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ReferalTermsandCondtionsViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"ReferralTermsCondtionsSid"];
    // viewController.crs_ProfileDetails =
    [self.navigationController pushViewController:viewController animated:YES];
    
}
@end





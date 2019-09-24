//
//  webViewController.h
//  CrossPay
//
//  Created by sai kiran  on 10/4/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activity;
- (IBAction)crs_HomeAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *crs_webViewView;
- (IBAction)crs_YesAction:(id)sender;
- (IBAction)crs_NoAction:(id)sender;
@property (strong,nonatomic) NSString * OrderId;
@property (strong,nonatomic) NSMutableDictionary * passingData;
@property (strong,nonatomic) NSMutableDictionary * passingData1;
- (IBAction)Crs_Exit:(id)sender;
- (IBAction)rs_Ok:(id)sender;
- (IBAction)crs_Back:(id)sender;



@property (strong, nonatomic) IBOutlet
UIView *crs_transactionCompletedView;



@property (strong, nonatomic) IBOutlet UILabel *crs_NameChanger;
- (IBAction)crs_ViewHider:(id)sender;

@property(nonatomic,strong)NSString * promoBalance1;
@property(nonatomic,strong)NSString * promoGetter;

@property (strong, nonatomic) IBOutlet UIView *crs_RatingView;
- (IBAction)crs_RateNow:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_RateNowOutlet;
- (IBAction)crs_Skip:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_SkipOut;
- (IBAction)crs_RemindMe:(id)sender;
@property(strong,nonatomic) NSString * MyFirst;

@end

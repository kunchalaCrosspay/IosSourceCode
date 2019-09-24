//
//  CharityWebViewController.h
//  CrossPay
//
//  Created by sai kiran  on 6/11/19.
//  Copyright © 2019 CrossPay. All rights reserved.
//

#import "ViewController.h"


@interface CharityWebViewController : ViewController
@property (strong, nonatomic) IBOutlet UIWebView *crs_CharityWebView;
@property (strong,nonatomic) NSMutableDictionary * passingData;


- (IBAction)crs_Back:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *crs_Loading;
- (IBAction)crs_Back2:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_Back2out;
@property (strong, nonatomic) IBOutlet UIButton *crs_BackOut;


@end



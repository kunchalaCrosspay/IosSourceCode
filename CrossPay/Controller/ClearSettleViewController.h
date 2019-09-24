//
//  ClearSettleViewController.h
//  CrossPay
//
//  Created by sai kiran  on 7/18/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import "ViewController.h"

@interface ClearSettleViewController : ViewController
@property(nonatomic,strong)NSString * promoGetter;
@property (strong, nonatomic) IBOutlet UIWebView *crs_Clearsettle;
@property(nonatomic,strong)NSString *TransactioNumbercl;
- (IBAction)crs_BackClearsEttle:(id)sender;
@property (strong,nonatomic) NSMutableDictionary * passingData;
@property(nonatomic,strong)NSString *crs_orderid;

@property (strong, nonatomic) IBOutlet UIView *crs_TransactionCancelView;

- (IBAction)crs_YesAction:(id)sender;

- (IBAction)crs_NoAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *crs_TransactionDeclinedView;
- (IBAction)Crs_Yes:(id)sender;

- (IBAction)crs_Retry:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_YesOutlet;

@property (strong, nonatomic) IBOutlet UIButton *crs_NoOutlet;
@property (strong, nonatomic) IBOutlet UIView *crs_TransactionView;


@property (strong, nonatomic) IBOutlet UIButton *Crs_MoveToHistoryAction;
- (IBAction)crs_TrsansactionAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *crs_TransactionDeclined;
- (IBAction)crs_TransactionDeclined:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_BackClearSettleOut;

@end



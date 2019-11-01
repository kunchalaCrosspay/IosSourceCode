//
//  Crs_sharedvariable.h
//  Payment
//
//  Created by VInoth on 8/2/17.
//  Copyright © 2017 WELCOME. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Crs_sharedvariable : NSObject
{
    
}
+(Crs_sharedvariable *)sharedMySingleton;

@property(strong,nonatomic)NSString * crs_MobileNumber;
@property(strong,nonatomic)NSString * crs_userId;
@property(strong,nonatomic)NSString * crs_Name;
@property(strong,nonatomic)NSString * crs_EmailId;
@property(strong,nonatomic)NSString * crs_CommisionRate;
@property(strong,nonatomic)NSString * crs_PayInAmount;
@property(strong,nonatomic)NSString * crs_PayOUtAmount;
@property(strong,nonatomic)NSString * crs_MPIN;
@property(nonatomic,assign) int checkMarks;
@property(strong,nonatomic)NSString * crs_CheckMark_SelectList;
@property(strong,nonatomic)NSString * crs_BenificiaryNo;
@property(strong,nonatomic)NSString * crs_OrderReferenceNumber;
@property(strong,nonatomic)NSString * crs_CashPayCommison;

@property(strong,nonatomic)NSString * crs_TotalPayingAmount;
@property(strong,nonatomic)NSString * crs_DispalayingCountryCurrency;
@property(strong,nonatomic)NSString * crs_RateDisplayingMethod;
@property(strong,nonatomic)NSString * crs_selectedCoutryCurrencyCode;
@property(strong,nonatomic)NSString * crs_MainAmount;
@property(strong,nonatomic)NSString * CountryCurrencyDisplayer;
@property(strong,nonatomic)NSString *  crs_version ;
@property(strong,nonatomic)NSString *  crs_AgentCode ;
@property(strong,nonatomic)NSString *  crs_FromCurrency ;
@property(strong,nonatomic)NSString * crs_country;
@property(strong,nonatomic)NSString * crs_FromCountry1;
@property(strong,nonatomic)NSString * crs_ForgotEmailDisplayer;
@property(strong,nonatomic)NSString * crs_Reverse;
@property(strong,nonatomic)NSString * crs_Direct;
@property(strong,nonatomic)NSString * crs_FcmId;
@property(strong,nonatomic)NSString * crs_ChangeMpinEmail;
@property(strong,nonatomic)NSString * crs_BeforeRedisterMobileNumber;
@property(strong,nonatomic)NSString * crs_source1;
@property(strong,nonatomic)NSString * crs_destination1;
@property(strong,nonatomic)NSString * crs_dialPad;
@property(strong,nonatomic)NSString * crs_date2;
@property(strong,nonatomic)NSString * crs_Promo;
@property(strong,nonatomic)NSMutableDictionary * crs_PromoDictionary;
@property(strong,nonatomic)NSMutableDictionary * crs_PromoPassing;
@property(strong,nonatomic)NSString * crs_Promocode;
@property(strong,nonatomic)NSString * crs_TransactionNumber;
@property(strong,nonatomic)NSString * Crs_CashComparsion890;
@property(strong,nonatomic)NSString *Crs_str_BankName890;
@property(strong,nonatomic)NSMutableArray *crs_Ary_CashPayDetails890;
@property(strong,nonatomic)NSMutableDictionary *crs_DictionarybankDetails890;
@property(strong,nonatomic)NSString * crs_SourceofFundLabel;
@property(strong,nonatomic)NSString * crs_RemitanceFundLabel;
@property(strong,nonatomic)NSString * crs_RemitanceFundid;
@property(strong,nonatomic)NSString * crs_SourceofFundid;
@property(strong,nonatomic)NSString * crs_Otp;

@property(strong,nonatomic)NSString * crs_PurposeCodeVariable;
@property(strong,nonatomic)NSString * crs_currencyCodeVariable;
@property(strong,nonatomic)NSString * crs_referenceVarible;
@property(strong,nonatomic)NSString * crs_OrganisationCodeVariable;
@property(strong,nonatomic)NSString * crs_Mobilewallet;
// wallet Commission
@property(strong,nonatomic)NSString * crs_WalletCommision;

@property(strong,nonatomic)NSString * crs_RegisterCountryCode;
@property(strong,nonatomic)NSString * crs_CoustmerNumber;
@property(strong,nonatomic)NSString * crs_CoustmerUserId;
@property(strong,nonatomic)NSString * crs_MyCoustmerUserId;
@property(strong,nonatomic)NSMutableDictionary * crs_UserDetails;
@property(strong,nonatomic)NSString * crs_CharityFavr;
@property(strong,nonatomic)NSString * crs_CharityCoustmerNumber;
@property(strong,nonatomic)NSString * crs_FromIsoCode;
@property(strong,nonatomic)NSString * crs_SourceIsoCode;
@property(strong,nonatomic)NSString * crs_SecondIsoCode;

@end

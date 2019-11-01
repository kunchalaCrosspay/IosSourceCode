//
//  Crs_sharedvariable.m
//  Payment
//
//  Created by VInoth on 8/2/17.
//  Copyright © 2017 WELCOME. All rights reserved.
//

#import "Crs_sharedvariable.h"

@implementation Crs_sharedvariable

@synthesize crs_MobileNumber , crs_userId,crs_Name,crs_EmailId,crs_CommisionRate,crs_PayOUtAmount,crs_PayInAmount,crs_MPIN,checkMarks,crs_CheckMark_SelectList,crs_BenificiaryNo,crs_CashPayCommison,crs_OrderReferenceNumber,crs_TotalPayingAmount,crs_DispalayingCountryCurrency,crs_RateDisplayingMethod,crs_selectedCoutryCurrencyCode,crs_AgentCode,crs_FromCurrency,crs_country,crs_FromCountry1,crs_ForgotEmailDisplayer,crs_Direct,crs_Reverse,crs_FcmId,crs_ChangeMpinEmail,crs_BeforeRedisterMobileNumber,crs_source1,crs_destination1,crs_dialPad,crs_date2,crs_Promo,crs_PromoPassing,crs_PromoDictionary ,crs_Promocode,crs_TransactionNumber,crs_Ary_CashPayDetails890,crs_DictionarybankDetails890,Crs_str_BankName890,Crs_CashComparsion890,crs_RemitanceFundLabel,crs_SourceofFundLabel,crs_SourceofFundid,crs_RemitanceFundid,crs_Otp,crs_Mobilewallet,crs_WalletCommision,crs_RegisterCountryCode,crs_CoustmerNumber,crs_CoustmerUserId,crs_MyCoustmerUserId,crs_UserDetails,crs_CharityFavr,crs_CharityCoustmerNumber,crs_FromIsoCode,crs_SourceIsoCode,crs_SecondIsoCode;


static Crs_sharedvariable * _sharedGeneric = nil;


+(Crs_sharedvariable*)sharedMySingleton
{
@synchronized([Crs_sharedvariable class])
{
if (!_sharedGeneric){
[[self alloc] init];
}
return _sharedGeneric;
}
return nil;
}





+(id)alloc
{
    @synchronized([Crs_sharedvariable class])
    {
        NSAssert(_sharedGeneric == nil, @"Attempted to allocate a second instance of a singleton.");
        _sharedGeneric = [super alloc];
        return _sharedGeneric;
    }
    
    return nil;
}


-(id)init
{
    self = [super init];
    
    if (self != nil)
    {
        //init
        
        //otp_value=@"123456";
        crs_MobileNumber = @"";
        
        crs_userId = @"";
        crs_EmailId = @"";
        crs_Name = @"";
        crs_PayInAmount = @"";
        crs_PayOUtAmount = @"";
        crs_CommisionRate = @"";
        crs_MPIN = @"";
        crs_CheckMark_SelectList = @"";
        crs_BenificiaryNo = @"";
        crs_CashPayCommison = @"";
        crs_OrderReferenceNumber = @"";
        crs_TotalPayingAmount = @"";
        crs_DispalayingCountryCurrency = @"";
        crs_RateDisplayingMethod = @"";
        crs_selectedCoutryCurrencyCode = @"";
        crs_AgentCode = @"";
        crs_FromCurrency = @"";
        crs_country=@"";
        crs_FromCountry1 = @"";
        crs_ForgotEmailDisplayer= @"";
        crs_Reverse = @"";
        crs_Direct = @"";
        crs_FcmId = @"";
        crs_ChangeMpinEmail = @"";
        crs_BeforeRedisterMobileNumber = @"";
        crs_destination1 = @"";
        crs_source1 = @"";
        crs_dialPad = @"";
        crs_date2 = @"";
        crs_Promo = @"";
        crs_Promocode = @"";
        crs_TransactionNumber = @"";
        crs_PromoDictionary = [NSMutableDictionary new];
        crs_PromoPassing = [NSMutableDictionary new];
        crs_DictionarybankDetails890 = [NSMutableDictionary new];
        crs_Ary_CashPayDetails890 = [NSMutableArray new];
        Crs_CashComparsion890 = @"";
        Crs_str_BankName890 = @"";
        crs_RemitanceFundLabel = @"";
        crs_SourceofFundLabel = @"";
        crs_RemitanceFundid = @"";
        crs_SourceofFundid = @"";
         crs_Otp = @"";
        crs_country = @"";
        _crs_PurposeCodeVariable = @"";
        _crs_OrganisationCodeVariable = @"";
        _crs_referenceVarible = @"";
        _crs_currencyCodeVariable = @"";
        self.crs_Mobilewallet = @"";
        crs_WalletCommision = @"";
        crs_RegisterCountryCode = @"";
        crs_CoustmerUserId = @"";
        crs_CoustmerNumber = @"";
        crs_MyCoustmerUserId = @"";
        crs_UserDetails = [NSMutableDictionary new];
        crs_CharityFavr = @"";
        crs_CharityCoustmerNumber = @"";
        crs_FromIsoCode = @"";
        crs_SourceIsoCode = @"";
        crs_SecondIsoCode = @"";
        
           }
    
    return self;
}







@end

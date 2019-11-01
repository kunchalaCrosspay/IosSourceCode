//
//  GlobalUrlsFile.h
//  CrossPay
//
//  Created by sai kiran  on 12/17/17.
//  Copyright © 2017 CrossPay. All rights reserved.

#ifndef GlobalUrlsFile_h
#define GlobalUrlsFile_h

#include <stdio.h>


//Developmentcx

#define Crosspay_Serverpath @"http://54.200.111.119:6099/Crosspaydevelopment/"
//#define Crosspay_Serverpath @"http://54.244.96.209:8080/Crosspaydev/"
//#define Crosspay_Serverpath @"https://ws.crosspaymt.com/Crosspayproduction/"


// Production
//#define Crosspay_Serverpath @"https://ws.crosspaymt.com/Crosspayprod/"

#define Crosspay_register          (Crosspay_Serverpath @"register")

#define Crosspay_login             (Crosspay_Serverpath @"login")

#define Crosspay_ValidateOtp       (Crosspay_Serverpath @"validateOTP")

#define Crosspay_logout            (Crosspay_Serverpath @"logout")

#define Crosspay_getCountry        (Crosspay_Serverpath @"upload/getCountry")

#define Crosspay_AddReciever       (Crosspay_Serverpath @"beneficiary/add")

#define Crosspay_UpdateReciever    (Crosspay_Serverpath @"beneficiary/updateBeneficiary")
#define Crosspay_GetBank           (Crosspay_Serverpath @"upload/getBank")
#define Crosspay_Getnationalities   (Crosspay_Serverpath @"upload/getNationalities")
#define Crosspay_TransactionHistory   (Crosspay_Serverpath @"transactionHistory")
#define Crosspay_ForgotMpin   (Crosspay_Serverpath @"forgotMpinCheck")
#define Crosspay_ValidateForgotMpin   (Crosspay_Serverpath @"validateForgotOTP")
#define Crosspay_UpdateProfile   (Crosspay_Serverpath @"update_register")
#define Crosspay_ViewProfile   (Crosspay_Serverpath @"viewProfile")
#define Crosspay_BenificiaryView   (Crosspay_Serverpath @"beneficiary/view")
#define Crosspay_GetAgent   (Crosspay_Serverpath @"getAgent")
#define Crosspay_BenificiaryViewByCountry   (Crosspay_Serverpath @"beneficiary/viewbycountry")
#define Crosspay_GetPurposeOfTransfer   (Crosspay_Serverpath @"upload/getPurposeofTransfer")
#define Crosspay_GetSurceofFunds   (Crosspay_Serverpath @"upload/getSourceofFunds")
#define Crosspay_ChangeMpin   (Crosspay_Serverpath @"changeMpin")
#define Crosspay_InitiateCashTransaction  (Crosspay_Serverpath @"initiateCashTransaction")
#define Crosspay_InitiateTransaction  (Crosspay_Serverpath @"initiateTransaction")
#define Crosspay_YesBank  (Crosspay_Serverpath @"sbank")
#define Crosspay_CapturePayment  (Crosspay_Serverpath @"capturePayment")
#define Crosspay_GetExchangeRate  (Crosspay_Serverpath @"upload/getExchangeRate")
#define Crosspay_GetExchangeReverese  (Crosspay_Serverpath @"upload/getExchangeRateReverse")
#define Crosspay_GetVersion  (Crosspay_Serverpath @"getIOSVersion")
#define Crosspay_update  (Crosspay_Serverpath @"updateFCMID")
#define Crosspay_idType  (Crosspay_Serverpath @"getIDs")
#define URLEMail @"mailto:info@crosspaymt.com?subject=title&body=content"
#define Crosspay_Promo  (Crosspay_Serverpath @"promocodecheck")
#define Crosspay_ApplyPromo  (Crosspay_Serverpath @"applypromocode")
#define Crosspay_GetDistricts  (Crosspay_Serverpath @"getEwayBenDistricts")
#define Crosspay_GetCitys  (Crosspay_Serverpath @"getEwayBenCities")
#define Crosspay_PostWards  (Crosspay_Serverpath @"getEwayBenWards")
#define Crosspay_ClearSettle  (Crosspay_Serverpath @"clearSettle")
#define Crosspay_CaptureClearSettle  (Crosspay_Serverpath @"capturePaymentClearSettle")
#define Crosspay_GetCharityName  (Crosspay_Serverpath @"getCharityOrgs")
#define Crosspay_GetPurposeOfDonation  (Crosspay_Serverpath @"getCharityPurpose")
#define Crosspay_CatgoryCheck  (Crosspay_Serverpath @"usercategoryCheck")
#define Crosspay_CharityHistory (Crosspay_Serverpath @"getCharityHistory")

#define Crosspay_GetCharityFavourite (Crosspay_Serverpath @"getCharityFavourites")
#define Crosspay_AddFavourite  (Crosspay_Serverpath @"addCharityFavourites")
#define Crosspay_ReferalCode  (Crosspay_Serverpath @"getReferCode")

#define Crosspay_CharityClearsettle (Crosspay_Serverpath @"getCharityFavourites")
#define Crosspay_XharityCapture  (Crosspay_Serverpath @"addCharityFavourites")
#define Crosspay_IdTypeList  (Crosspay_Serverpath @"getIDs")
#define Crosspay_CrosspayPakistanUpadtae  (Crosspay_Serverpath @"update_id")

#define Crosspay_CharityInitateTransaction  (Crosspay_Serverpath @"charitypayinitiate")
#define Crosspay_CharityClearSeetleUrl  (Crosspay_Serverpath @"charityClearSettle")
#define Crosspay_KenyaMobileWallet  (Crosspay_Serverpath @"getWalletAgent")
#define Crosspay_KenyaWalletService  (Crosspay_Serverpath @"initiateWalletTransaction")
#define Crosspay_CharityClearSettleCapture (Crosspay_Serverpath @"charitycapturePaymentClearSettle")

#define Crosspay_CharitysecureTradingCapture  (Crosspay_Serverpath @"charitycapturePayment")

#define Crosspay_NewRegister  (Crosspay_Serverpath @"register")
#define Crosspay_NewRegister1  (Crosspay_Serverpath @"registerdetails")
#define Crosspay_TransactionQuery  (Crosspay_Serverpath @"transactionquery")
#define Crosspay_SecureCall  (Crosspay_Serverpath @"Securecall")
#define Crosspay_NewCapturePayment  (Crosspay_Serverpath @"capturePaymenttransactionreference")

#define Crosspay_BackButton  (Crosspay_Serverpath @"capturePaymentbacktransactionreference")
#define Crosspay_BackButton1  (Crosspay_Serverpath @"charitycapturePaymentbacktransactionreference")
#define Crosspay_CharitySecureCall  (Crosspay_Serverpath @"charitySecurecall")
#define Crosspay_NewCharityCapture  (Crosspay_Serverpath @"charitycapturePaymenttransactionreference")

#define Crosspay_CharityTransactionQuery  (Crosspay_Serverpath @"charitytransactionquery")
#define Crosspay_HistoryView  (Crosspay_Serverpath @"transactionHistoryview")

#define Crosspay_CharityUnFavorites  (Crosspay_Serverpath @"CharityunFavourites")

#define Crosspay_GetBranchCode  (Crosspay_Serverpath @"upload/getBranchByBankCode")
// For Post Code
#define Crosspay_postCodeAdressFinder @"https://ws.postcoder.com/pcw/PCWBD-CB592-Q66XH-3KQ6R/address/uk/E12%206SB?lines=5&format=json"







#endif /* GlobalUrlsFile_h */

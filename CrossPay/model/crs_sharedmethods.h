//
//  crs_sharedmethods.h
//  Payment
//
//  Created by WELCOME on 8/5/17.
//  Copyright © 2017 WELCOME. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>


@interface crs_sharedmethods : NSObject
{
    
}

-(void) Action_Check_DeviceResolution;
+(crs_sharedmethods *)sharedMySingleton;
#pragma mark - Check Internet Connections
@property (strong,nonatomic)UIView *Ary_view_LoadingBg;

@property(nonatomic,readwrite) int internetWorking;


+(BOOL)returnInternetConnectionStatus:(UIViewController *)viewcontroller;

#pragma mark -
#pragma mark - Check Null Values

+(NSString *)IWNL_Check_For_Null:(id)value;

#pragma mark Email Validation
-(UIView *) GetLoadingview;

+(BOOL)isEmailValid:(NSString *)emailString;
@end

//
//  crs_sharedmethods.m
//  Payment
//
//  Created by WELCOME on 8/5/17.
//  Copyright © 2017 WELCOME. All rights reserved.
//

#import "crs_sharedmethods.h"
#import "Reachability.h"

@implementation crs_sharedmethods


@synthesize internetWorking;

static crs_sharedmethods * _sharedGeneric = nil;


+(crs_sharedmethods *)sharedMySingleton
{
    @synchronized([crs_sharedmethods class])
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
    @synchronized([crs_sharedmethods class])
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
        
        
    }
    return self;
}



#pragma mark -
#pragma mark - Check Null Values

+(NSString *)IWNL_Check_For_Null:(id)value
{
    if ([value isKindOfClass:[NSNull class]])
    {
        return @"";
    }
    else
    {
        return value;
    }
}

#pragma mark - Check Device

-(void) Action_Check_DeviceResolution {
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        CGSize result = [[UIScreen mainScreen] bounds].size;
        
        if (result.height == 480) {
           // [ArySharedVariables sharedMySingleton].SHARE_Ary_Str_Device=@"IPHONE4";
        }
        
        else if (result.height == 568) {
            // 4 inch display - iPhone 5
            //[ArySharedVariables sharedMySingleton].SHARE_Ary_Str_Device=@"IPHONE5";
        }
        
        else if (result.height == 667) {
            // 4.7 inch display - iPhone 6
            //[ArySharedVariables sharedMySingleton].SHARE_Ary_Str_Device=@"IPHONE6";
        }
        
        else if (result.height == 736) {
            // 5.5 inch display - iPhone 6 Plus
           // [ArySharedVariables sharedMySingleton].SHARE_Ary_Str_Device=@"IPHONE6PLUS";
        }
    }
    
    else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        // iPad 9.7 or 7.9 inch display.
        NSLog(@"Device is an iPad.");
    }
    
}




#pragma mark Email Validation

+(BOOL)isEmailValid:(NSString *)emailString
{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailString];
    
}

#pragma mark - InternetConnectionStatus check

+(BOOL)returnInternetConnectionStatus:(UIViewController *)viewcontroller{
    
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus internetStatus = [reach currentReachabilityStatus];
    if ((internetStatus != NotReachable)) {
        return YES;
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"CrossPay"
                                                        message:@"Please check your Internet!"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        // [self Show_Alert:self message:@"Please check your Internet!"];
        
        return NO;
    }
}

-(UIView *) GetLoadingview{
    
    
    _Ary_view_LoadingBg =[[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    _Ary_view_LoadingBg.backgroundColor=[UIColor clearColor];
    
    UIButton *ary_btn_Animation=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
    ary_btn_Animation.center=_Ary_view_LoadingBg.center;
    
    [ary_btn_Animation setImage:[UIImage animatedImageWithImages:[NSArray arrayWithObjects:
    [UIImage imageNamed:@"Lg1"],[UIImage imageNamed:@"Lg21.png"],[UIImage imageNamed:@"Lg3.png"],[UIImage imageNamed:@"Lg4.png"],[UIImage imageNamed:@"Lg5.png"],[UIImage imageNamed:@"Lg6.png"],[UIImage imageNamed:@"Lg7.png"],[UIImage imageNamed:@"Lg8.png"],[UIImage imageNamed:@"Lg9.png"],[UIImage imageNamed:@"Lg10.png"],[UIImage imageNamed:@"Lg11.png"] ,[UIImage imageNamed:@"Lg12.png"],[UIImage imageNamed:@"Lg13.png"],nil] duration:1.0] forState:UIControlStateNormal];
    
    
    
    
    [_Ary_view_LoadingBg addSubview:ary_btn_Animation];
    
    return _Ary_view_LoadingBg;
    
}




@end

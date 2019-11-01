//
//  AppDelegate.m
//  CrossPay
//
//  Created by aryvart3 on 28/07/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import "AppDelegate.h"
#import "crs_sharedmethods.h"
#import "loginmpinViewController.h"
#import "InitialViewController.h"
#import "Crs_sharedvariable.h"
#import <StoreKit/StoreKit.h>

@interface AppDelegate ()
{
    NSTimer * timer;
    UINavigationController *  navController ;
    
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
    }
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSString * crs_userId  =    [defaults objectForKey:@"user_id"];
    NSString * crs_mobile = [defaults objectForKey:@"mobile"];
    NSString* crs_emailForgot = [defaults objectForKey:@"email"];
    
    if (crs_mobile  == nil || crs_userId == nil|| [crs_userId  isKindOfClass:[NSNull class]] ) {
        
        
        
        //        UIScrollView *scr=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.window.frame.size.width, self.window.frame.size.height)];
        //        scr.tag = 1;
        //        scr.autoresizingMask=UIViewAutoresizingNone;
        //        [self.window addSubview:scr];
        //        [self setupScrollView:scr];
        //        UIPageControl *pgCtr = [[UIPageControl alloc] initWithFrame: CGRectMake(0, 0, self.window.frame.size.width, self.window.frame.size.height - 30)];
        //
        //        [pgCtr setTag:12];
        //        pgCtr.numberOfPages=3;
        //
        //        pgCtr.autoresizingMask=UIViewAutoresizingNone;
        //        [self.window addSubview:pgCtr];
        
        
        
        
        
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        InitialViewController  * viewController = [storyboard instantiateViewControllerWithIdentifier:@"loginvcSID"];;
        
        
        
        
        navController=[[UINavigationController alloc]initWithRootViewController:viewController];
        
        [navController setNavigationBarHidden:YES animated:YES];
        
        self.window.rootViewController=navController;
        
        
        
        
        
        
        
        
        
        
    }
    else{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        loginmpinViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginmpinViewControllerSID"];;
        
        //        loginmpinViewController* viewController = [storyboard instantiateViewControllerWithIdentifier:@"SelctPaymentModeSid"];;
        //
        //
        
        
        // [self.navigationController pushViewController:viewController animated:YES];
        
        
        navController=[[UINavigationController alloc]initWithRootViewController:viewController];
        
        [Crs_sharedvariable sharedMySingleton].crs_userId = crs_userId  ;
        [Crs_sharedvariable sharedMySingleton].crs_MobileNumber = crs_mobile  ;
        
        
        
        [navController setNavigationBarHidden:YES animated:YES];
        
        self.window.rootViewController=navController;
        
        
        
        // [self.navigationController pushViewController:viewController animated:YES];
        
    }
//
//
//    int shortestTime = 10;
//    int longestTime = 500;
//    int timeInterval = arc4random_uniform(longestTime - shortestTime) + shortestTime;
//
//    [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(requestReview) userInfo:nil repeats:NO];
//
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"CrossPay"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                     */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}
- (void)setupScrollView:(UIScrollView*)scrMain {
    // we have 10 images here.
    // we will add all images into a scrollView &amp; set the appropriate size.
    
    for (int i=1; i<=3; i++) {
        // create image
        UIImage *image;
        if (i==1) {
            image = [UIImage imageNamed:[NSString stringWithFormat:@"intro.png",i]];
        }
        else if (i==2)
        {
            image = [UIImage imageNamed:[NSString stringWithFormat:@"intro1.png",i]];
        }
        else
        {
            image = [UIImage imageNamed:[NSString stringWithFormat:@"intro2.png",i]];
        }
        
        
        // create imageView
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake((i-1)*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height)];
        // set scale to fill
        imgV.contentMode=UIViewContentModeScaleToFill;
        // set image
        [imgV setImage:image];
        // apply tag to access in future
        imgV.tag=i+1;
        // add to scrollView
        [scrMain addSubview:imgV];
    }
    // set the content size to 10 image width
    [scrMain setContentSize:CGSizeMake(scrMain.frame.size.width*10, scrMain.frame.size.height)];
    // enable timer after each 2 seconds for scrolling.
    timer=[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollingTimer) userInfo:nil repeats:YES];
}

- (void)scrollingTimer {
    // access the scroll view with the tag
    UIScrollView *scrMain = (UIScrollView*) [self.window viewWithTag:1];
    // same way, access pagecontroll access
    UIPageControl *pgCtr = (UIPageControl*) [self.window viewWithTag:12];
    // get the current offset ( which page is being displayed )
    CGFloat contentOffset = scrMain.contentOffset.x;
    // calculate next page to display
    int nextPage = (int)(contentOffset/scrMain.frame.size.width) + 1 ;
    // if page is not 10, display it
    if( nextPage!=3 )  {
        [scrMain scrollRectToVisible:CGRectMake(nextPage*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height) animated:YES];
        pgCtr.currentPage=nextPage;
        // else start sliding form 1 :)
    } else {
        //        [scrMain scrollRectToVisible:CGRectMake(0, 0, scrMain.frame.size.width, scrMain.frame.size.height) animated:YES];
        //        pgCtr.currentPage=0;
        
        
        
        [timer invalidate];
        
        
        
        
        
        
    }
}
//- (void)requestReview {
//    [SKStoreReviewController requestReview];
//}
@end

//
//  splashViewController.m
//  CrossPay
//
//  Created by aryvart3 on 31/10/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import "splashViewController.h"
#import "InitialViewController.h"

@interface splashViewController ()
{
    NSTimer * timer;
}

@end

@implementation splashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

            UIScrollView *scr=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            scr.tag = 1;
            scr.autoresizingMask=UIViewAutoresizingNone;
            [self.view addSubview:scr];
            [self setupScrollView:scr];
            UIPageControl *pgCtr = [[UIPageControl alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 30)];

            [pgCtr setTag:12];
            pgCtr.numberOfPages=4;

            pgCtr.autoresizingMask=UIViewAutoresizingNone;
            [self.view addSubview:pgCtr];


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)setupScrollView:(UIScrollView*)scrMain {
    // we have 10 images here.
    // we will add all images into a scrollView &amp; set the appropriate size.
//
    for (int i=1; i<=4; i++) {
        // create image
        UIImage *image;
        if (i==1) {
            image = [UIImage imageNamed:[NSString stringWithFormat:@"sai1.png",i]];
        }
        else if (i==2)
        {
            image = [UIImage imageNamed:[NSString stringWithFormat:@"sai2.png",i]];
        }

        else if (i==3)
        {
            image = [UIImage imageNamed:[NSString stringWithFormat:@"sai3.png",i]];
        }
        else
        {
            image = [UIImage imageNamed:[NSString stringWithFormat:@"sai4.png",i]];
        }
//
//        // create imageView
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
//    // enable timer after each 2 seconds for scrolling.
    timer=[NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(scrollingTimer) userInfo:nil repeats:YES];
}

- (void)scrollingTimer {
//    // access the scroll view with the tag
    UIScrollView *scrMain = (UIScrollView*) [self.view viewWithTag:1];
    // same way, access pagecontroll access
    UIPageControl *pgCtr = (UIPageControl*) [self.view viewWithTag:12];
    // get the current offset ( which page is being displayed )
    CGFloat contentOffset = scrMain.contentOffset.x;
    // calculate next page to display
    int nextPage = (int)(contentOffset/scrMain.frame.size.width) + 1 ;

    if( nextPage!=4 )  {
        [scrMain scrollRectToVisible:CGRectMake(nextPage*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height) animated:YES];
        pgCtr.currentPage=nextPage;

    } else {



        [timer invalidate];

        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        InitialViewController * viewController = [storyboard instantiateViewControllerWithIdentifier:@"loginvcSID"];;

        [self.navigationController pushViewController:viewController animated:YES];


        

    }
}


@end

//
//  UpdateProfile.h
//  CrossPay
//
//  Created by sai kiran  on 7/31/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UpdateProfile : UIViewController
{
    UIImagePickerController *Imagepicker;
}
- (IBAction)Action_back:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *Profile_picture;
- (IBAction)camera_open:(id)sender;

@end

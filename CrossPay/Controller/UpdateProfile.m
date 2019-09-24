//
//  UpdateProfile.m
//  CrossPay
//
//  Created by sai kiran  on 7/31/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import "UpdateProfile.h"
#import "crs_sharedmethods.h"
@interface UpdateProfile ()

@end

@implementation UpdateProfile

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //   InterNet Connection Code For Checking net Connection
    
    if (![crs_sharedmethods returnInternetConnectionStatus:self]) {
        
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"Crosspay" message:@"Please Check Your Internet" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        return ;
    }
    self.Profile_picture.layer.cornerRadius = self.Profile_picture.frame.size.height/2;
    self.Profile_picture.clipsToBounds = YES;
//    self.profileimage.layer.borderColor = [ArySharedMethods colorFromHexString:@"3BD6D3"].CGColor;
//    self.profileimage.layer.borderWidth = 1.0f;
    
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

- (IBAction)Action_back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)camera_open:(id)sender {
    [self.view endEditing:YES];
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Choose Image From:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Camera",
                            @"Photo Library",
                            nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];

    
    
    
    
}

#pragma mark - PickerView _delegate

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    Imagepicker = [[UIImagePickerController alloc] init];
    Imagepicker.delegate = self;
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                {
                    @try {
                        
                        Imagepicker.allowsEditing = YES;
                        Imagepicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                        [self presentViewController:Imagepicker animated:YES completion:NULL];
                    }
                    @catch (NSException *exception) {
                        
                    }
                    break;
                }
                case 1:
                {
                    
                    
                    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
                    imagePickerController.delegate = self;
                    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
                    [self presentViewController:imagePickerController animated:YES completion:nil];
                    
                    
                    
                    break;
                }
                    
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    
    NSData *imgData=UIImagePNGRepresentation(image);
    self.Profile_picture.image = image;
    
    [picker dismissModalViewControllerAnimated:YES];
    
    
}
- (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}
- (NSString *)encodeToBase64String:(UIImage *)image {
    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}



@end

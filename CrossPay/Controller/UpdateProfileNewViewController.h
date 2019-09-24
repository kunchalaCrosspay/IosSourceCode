//
//  UpdateProfileNewViewController.h
//  CrossPay
//
//  Created by sai kiran  on 8/29/18.
//  Copyright © 2018 CrossPay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HoshiTextField.h"

@interface UpdateProfileNewViewController : UIViewController<UIActionSheetDelegate,UIAlertViewDelegate,NSFileManagerDelegate,UIDocumentPickerDelegate, UIDocumentMenuDelegate>


{
    UIDocumentPickerViewController *docPicker;
    UIImagePickerController *imagePicker;
    NSMutableArray *arrimg;
    
    NSString * UploadType;
    NSURL * PDFUrl;
     UIDatePicker *datePicker;
    UIDatePicker *datePicker1;
}
@property (strong, nonatomic) IBOutlet UIScrollView *crs_UpdatrScroll;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_FirstName;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_LastName;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Nationality;



@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Country;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_MiddleName;

@property (strong, nonatomic) IBOutlet UIButton *crs_FemaleOut;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Address2;

- (IBAction)crs_FemaleAction:(id)sender;
- (IBAction)crs_FemaleExtraAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_MaleOut;
- (IBAction)crs_MaleAction:(id)sender;
- (IBAction)crs_MaleExtraAction:(id)sender;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_DateOfBirth;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_IdNumber;
@property (strong, nonatomic) IBOutlet UILabel *crs_IsadCode;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_MobileNumber;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_emailadress;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_PostCode;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_address1;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_City;
- (IBAction)crs_Back:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_UpdateOut;
- (IBAction)crs_upadte:(id)sender;
- (IBAction)crs_NationalityButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *crs_countryView;
@property(nonatomic,strong)NSString * searchTextString;
- (IBAction)crs_nationlaity1:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *crs_CountryTable;
@property (strong, nonatomic) IBOutlet UIButton *crs_Button1;

@property (strong, nonatomic) IBOutlet UIButton *crs_Button1Action;


@property (strong, nonatomic) IBOutlet UIButton *crs_Address1;

- (IBAction)crs_Address1Action:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *crs_Address2Out;

- (IBAction)crs_Address2Action:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_CityOut;


- (IBAction)crs_CityAction:(id)sender;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_address2;
@property (strong, nonatomic) IBOutlet UIImageView *crs_NationImage;
@property (strong, nonatomic) IBOutlet UIImageView *crs_address1Image;
@property (strong, nonatomic) IBOutlet UIImageView *crs_Address2Image;
- (IBAction)crs_TableviewHider:(id)sender;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_SwedenAndDenamrk;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Spain;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_IdProofField;
- (IBAction)crs_IdProofTypebutton:(id)sender;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_ExpiryDate;
- (IBAction)crs_CameraButton:(id)sender;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_AddressProofType;
@property (strong, nonatomic) IBOutlet UILabel *crs_AddressProofTypeLabelPlaceholder;
- (IBAction)crs_AddressproofButton:(id)sender;


- (IBAction)crs_Camera1Action:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *crs_Idprooftype;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_addressProofField;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_ChhosseFile;
@property (strong, nonatomic) IBOutlet UIImageView *crs_AddressProofImagePdf;
@property (strong, nonatomic) IBOutlet UIView *crs_CameraView;

- (IBAction)crs_OpenCamera:(id)sender;

- (IBAction)crs_OpenPhotoGallery:(id)sender;

- (IBAction)crs_CancelForCameraView:(id)sender;

@property (strong,nonatomic) NSString * RecieversCountry;
@property (strong,nonatomic) NSString * sendersCountry;
@property (strong, nonatomic) IBOutlet UIView *crs_Documentsview;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_PakistanIdNumber;
- (IBAction)crs_Update2Action:(id)sender;
- (IBAction)crs_PakistanView:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_Update2Out;
@property (strong, nonatomic) IBOutlet UIButton *crs_IdproofButtonOutlet;
@property (strong, nonatomic) IBOutlet UIImageView *crs_DropImage;
@property (strong, nonatomic) IBOutlet UIImageView *crs_DropImage1;
@property (strong, nonatomic) IBOutlet UIButton *crs_Addressproofbuttonoutlet;
@property (strong, nonatomic) IBOutlet UIImageView *crs_Camera1;
@property (strong, nonatomic) IBOutlet UIButton *crs_Cameraoutlet;
@property (strong, nonatomic) IBOutlet UIImageView *crs_camera1image;

@property (strong, nonatomic) IBOutlet UIButton *crs_Camera1Buttonoutlet;

@property (strong, nonatomic) IBOutlet UILabel *crs_AddressProofPlaceHolderoutlet;

@property (strong, nonatomic) IBOutlet UILabel *crs_IdproofOutlet;

@property (strong, nonatomic) IBOutlet UILabel *crs_UploadDocuments;
@property (strong,nonatomic) NSString * crs_Comparsion;
@property (strong, nonatomic) IBOutlet UIView *crs_CameraView2;
- (IBAction)crs_CameraPak:(id)sender;
- (IBAction)crs_Gallerypak:(id)sender;
- (IBAction)crs_PdfPak:(id)sender;
- (IBAction)crs_PakCancel:(id)sender;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_NewIdnumber;

@property (strong, nonatomic) IBOutlet UIButton *crs_NationalityOut;
- (IBAction)crs_cameraPdf:(id)sender;
- (IBAction)crs_MyPdf:(id)sender;
- (IBAction)PDF:(id)sender;

@end

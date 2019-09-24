

#import <UIKit/UIKit.h>
#import "HoshiTextField.h"

@interface profileViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>

{
    UIDatePicker *datePicker;
    
    
    UIPickerView * banks;
    
    NSMutableArray * typeOfBanks ;
    
    UIImagePickerController *Imagepicker;
    
    
}



@property (strong, nonatomic) NSMutableArray * crs_UpdateRecieverDetails;

@property (strong, nonatomic) NSString * crs_Comparsion;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_BranchName;



@property (strong, nonatomic) IBOutlet UITableView *crs_CountryTableView;




- (IBAction)crs_SelectCountry:(id)sender;



// Scroll bar
@property (strong, nonatomic) IBOutlet UIScrollView *crs_RecieverScrollView;


// Fields for Top View



@property (strong, nonatomic) IBOutlet UILabel *crs_countrylabel;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Adress2;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_ZipCodeField;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_FirstNameField;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_MiddleNameField;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_LastName;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_EmailIdField;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_DateOfBirthField;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_PhoneNumber;
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_StdField;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_CounryField;


@property (strong, nonatomic) IBOutlet UILabel *crs_recieverlabel;


// Fields For Bottom view



@property (strong, nonatomic) IBOutlet HoshiTextField *crs_SelectBranch;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_BankAccount;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Ifsc;



// Radio Buttons Action


- (IBAction)crs_MaleAction:(id)sender;



- (IBAction)crs_FenaleAction:(id)sender;


- (IBAction)crs_IbanAction:(id)sender;

- (IBAction)crs_BankAccountNumber:(id)sender;





// Radio Buttons outlets



@property (strong, nonatomic) IBOutlet UIButton *crs_MaleClick;

@property (strong, nonatomic) IBOutlet UIButton *crs_FemaleClick;

@property (strong, nonatomic) IBOutlet UIButton *crs_IbanClick;

@property (strong, nonatomic) IBOutlet UIButton *crs_BankAcountClick;

// Back sction

- (IBAction)crs_BackAction:(id)sender;


// Saving Reciever

- (IBAction)crs_SaveAction:(id)sender;



// Tab Bar Navigation

- (IBAction)crs_HomeAction:(id)sender;
- (IBAction)crs_History:(id)sender;
- (IBAction)crs_ProfileAction:(id)sender;

- (IBAction)crs_NotificationAction:(id)sender;

- (IBAction)crs_SettingsAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *crs_RecieverImage;




@property (strong, nonatomic) IBOutlet UIView *crs_ProfileView;




@property (strong, nonatomic) IBOutlet UIPickerView *crs_BankPicker;

//


- (IBAction)crs_SelectBankAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *Crs_CashPay_view;


// Cash View
@property (strong, nonatomic) IBOutlet HoshiTextField *crs_CityField;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Mobile;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_State;

- (IBAction)crs_Camera:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *crs_SaveOut;


@property (strong, nonatomic) IBOutlet UIView *crs_CountrySelectorView;
@property (weak, nonatomic) IBOutlet
UIPickerView *crs_pickerview_data;
@property (strong, nonatomic) IBOutlet UILabel *crs_CashPickUp;

@property (strong, nonatomic) IBOutlet UILabel *crs_AccountCredit;






@property (strong, nonatomic) IBOutlet UIButton *crs_Bankbuttonhider;
@property (strong, nonatomic) IBOutlet UIButton *crs_Saveon;

@property (strong, nonatomic) IBOutlet UIImageView *crs_DropImage;



@property (strong, nonatomic) IBOutlet UILabel *crs_NepalBranchNameLabel;




@property (strong, nonatomic) IBOutlet UILabel *crs_NepaliBranch;


@property (strong, nonatomic) IBOutlet UITextField *crs_search;

@property(nonatomic,strong)NSString * searchTextString;

@property (strong, nonatomic) IBOutlet UILabel *crs_Bankname;
@property (strong, nonatomic) IBOutlet UIView *crs_VitenamView;

@property (strong, nonatomic) IBOutlet UIButton *crs_MaleTouch;

@property (strong, nonatomic) IBOutlet UIButton *crs_FemaleTouch;

@property (strong, nonatomic) IBOutlet UILabel *crs_MaleLabel;

@property (strong, nonatomic) IBOutlet UILabel *crs_FeamaleLabel;

// FOR VIETNAM


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_District;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Ward;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_VietnamCity;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_VietnamMobile;
@property (strong, nonatomic) IBOutlet UIButton *crs_MaleOut;

- (IBAction)crs_VietnamMaleAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_Femaleout;


- (IBAction)crs_FemaleVietnma:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_DistrictButtob;

- (IBAction)crs_DistrictAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_WardOut;

- (IBAction)crs_WardAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_VietCity;

- (IBAction)crs_VietCityAction:(id)sender;
//For Jumping View


@property (strong, nonatomic) IBOutlet UIView *crs_BankView;

@property (strong, nonatomic) IBOutlet UIView *crs_CashPayView;

- (IBAction)Vtn_Male:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *Vtn_MaleOut;

- (IBAction)Vtn_Female:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *Vtn_FemaleOut;

// Gender Buttons



@property (strong, nonatomic) IBOutlet UIButton *crs_VtnFemale;

@property (strong, nonatomic) IBOutlet UIButton *crs_VtnMaleclick;


- (IBAction)crs_VtnFemaleAction:(id)sender;

- (IBAction)crs_VtnMlaeAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_VtnMaleout;
@property (strong, nonatomic) IBOutlet UIButton *crs_VtnClick;
@property (strong, nonatomic) IBOutlet UIButton *crs_Vtnclick;

- (IBAction)vtnAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *vietnamMaleoutlet;


- (IBAction)vietnamAction:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *veitnamFemaleoutlet;

- (IBAction)vietnamFemaleActio:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *vietnamMaletouch;

- (IBAction)vietnamMaleActionTouch:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *vietnamFemaleTouch;




- (IBAction)vietnamFemaleActionTouch:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *crs_VietnamDistrictLabel;

@property (strong, nonatomic) IBOutlet UILabel *crs_vietnamWardLabel;

@property (strong, nonatomic) IBOutlet UILabel *crs_VietnamCityLabel;
@property (strong, nonatomic) IBOutlet UILabel *crs_kenyawallet;


@property (strong, nonatomic) IBOutlet HoshiTextField *crs_Std2;

- (IBAction)crs_IndividualAction:(id)sender;
- (IBAction)crs_Individual1Action:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *crs_IndividualOut;
- (IBAction)crs_CorparateAction:(id)sender;
- (IBAction)crs_Coraparate1Action:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *crs_CorparateOut;

@property (strong, nonatomic) IBOutlet HoshiTextField *crs_EntityName;
@property (strong, nonatomic) IBOutlet UIButton *vietnamFemal;
@property (strong, nonatomic) IBOutlet UILabel *crs_Hide;
@property (weak, nonatomic) IBOutlet UIButton *Crs_BranchOutlet;

- (IBAction)crs_BranchAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *crs_BanglaBranchLabel;
@property (weak, nonatomic) IBOutlet UIImageView *crs_banglaDrop;

@end

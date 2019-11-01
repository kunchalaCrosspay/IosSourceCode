//
//  AddreciverTableViewCell.m
//  CrossPay
//
//  Created by aryvart3 on 17/08/17.
//  Copyright © 2017 CrossPay. All rights reserved.
//

#import "AddreciverTableViewCell.h"

@implementation AddreciverTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    
    [self.crs_UpdateAction.layer setBorderWidth:1.0];
    [self.crs_UpdateAction.layer setBorderColor:[[UIColor colorWithRed:30.0f/255.0f green:217.0f/255.0f blue:232.0f/255.0f alpha:1.0] CGColor]];
    
    

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)crs_SelectButton:(id)sender {
    
    
    
    
    
    
    
    
    
}
- (IBAction)Crs_BankNameAction:(id)sender {
}
@end

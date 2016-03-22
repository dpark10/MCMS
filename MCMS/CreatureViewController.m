//
//  CreatureViewController.m
//  MCMS
//
//  Created by dp on 3/22/16.
//  Copyright © 2016 Dan Park. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;


@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *detailTextField;
@property BOOL isEditing;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = self.creature.name;
    self.detailLabel.text = self.creature.detail;
    self.isEditing = NO;
}

- (IBAction)onButtonTapped:(UIBarButtonItem *)sender {
    self.isEditing = !self.isEditing;

    if (self.isEditing) {
        // display text field
        self.nameTextField.hidden = NO;
        self.detailTextField.hidden = NO;
        
        // hide label
        self.nameLabel.hidden = YES;
        self.detailLabel.hidden = YES;
        
        // change button title
        sender.title = @"Done";
        
    } else { // not editing
        // save what was just entered as new creature name
        self.creature.name = self.nameTextField.text;
        self.creature.detail = self.detailTextField.text;
        
        // hide text field
        self.nameTextField.hidden = YES;
        self.detailTextField.hidden = YES;
        
        // show label
        self.nameLabel.hidden = NO;
        self.detailLabel.hidden = NO;
        
        // update the label
        self.nameLabel.text = self.creature.name;
        self.detailLabel.text = self.creature.detail;
        
        // change button title
        sender.title = @"Edit";
    }
}

@end
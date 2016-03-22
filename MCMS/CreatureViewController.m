//
//  CreatureViewController.m
//  MCMS
//
//  Created by dp on 3/22/16.
//  Copyright © 2016 Dan Park. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()
@property (weak, nonatomic) IBOutlet UILabel *creatureLabel;
@property (weak, nonatomic) IBOutlet UITextField *editTextField;
@property BOOL isEditing;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creatureLabel.text = self.creature.name;
    self.isEditing = NO;
    
}

- (IBAction)onButtonTapped:(UIBarButtonItem *)sender {
    self.isEditing = !self.isEditing;

    if (self.isEditing) {
        // display text field
        self.editTextField.hidden = NO;
        
        // hide label
        self.creatureLabel.hidden = YES;
        
        // change button title
        sender.title = @"Done";
        
    } else { // not editing
        // save what was just entered as new creature name
        self.creature.name = self.editTextField.text;
        
        // hide text field
        self.editTextField.hidden = YES;
        
        // show label
        self.creatureLabel.hidden = NO;
        
        // update the label
        self.creatureLabel.text = self.creature.name;
        
        // change button title
        sender.title = @"Edit";
    }
}

@end
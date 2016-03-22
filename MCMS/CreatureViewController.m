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

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.creatureLabel.text = self.creature.name;
}

- (IBAction)onButtonTapped:(UIBarButtonItem *)sender {
//              = if this thing is true                        then    this  else that
   sender.title = [sender.title isEqualToString:@"Edit"] ? @"Done" : @"Edit";
}

@end
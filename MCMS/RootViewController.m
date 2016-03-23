//
//  ViewController.m
//  MCMS
//
//  Created by dp on 3/22/16.
//  Copyright © 2016 Dan Park. All rights reserved.
//

#import "RootViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MagicalCreature *mc1 = [[MagicalCreature alloc] initWithName:@"Allie" withDetail:@"swampy teeth" withImage:[UIImage imageNamed:@"alligator"]];
    MagicalCreature *mc2 = [[MagicalCreature alloc] initWithName:@"Batty" withDetail:@"flappy wings" withImage:[UIImage imageNamed:@"bat"]];
    MagicalCreature *mc3 = [[MagicalCreature alloc] initWithName:@"Baldy" withDetail:@"chrome dome" withImage:[UIImage imageNamed:@"eagle"]];
    MagicalCreature *mc4 = [[MagicalCreature alloc] initWithName:@"Wolfy" withDetail:@"horrifying howl" withImage:[UIImage imageNamed:@"wolf"]];
    MagicalCreature *mc5 = [[MagicalCreature alloc] initWithName:@"Leo" withDetail:@"roary roar" withImage:[UIImage imageNamed:@"lion"]];
    MagicalCreature *mc6 = [[MagicalCreature alloc] initWithName:@"Crabby" withDetail:@"pinchy pinchers" withImage:[UIImage imageNamed:@"crab"]];
    MagicalCreature *mc7 = [[MagicalCreature alloc] initWithName:@"Jake" withDetail:@"rattly rattle" withImage:[UIImage imageNamed:@"snake"]];
    
    self.creatures = [NSMutableArray arrayWithArray:@[mc1, mc2, mc3, mc4, mc5, mc6, mc7]];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"
                                                            forIndexPath:indexPath];

    MagicalCreature *creature = self.creatures[indexPath.row];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.detail;
    cell.imageView.image = creature.image;
    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
}

- (IBAction)onAddButtonTapped:(UIBarButtonItem *)sender {
    NSString *name = self.textField1.text;
    if (![name isEqualToString:@""]) {
        NSString *detail = self.textField2.text;
        MagicalCreature *creature = [[MagicalCreature alloc] initWithName:name withDetail:detail withImage:[UIImage imageNamed:@"bee"]];
        [self.creatures addObject:creature];
        self.textField1.text = nil;
        self.textField2.text = nil;
        [self.tableView reloadData];
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell {
    CreatureViewController *destVC = segue.destinationViewController;

    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    MagicalCreature *creature = self.creatures[indexPath.row];

    destVC.creature = creature;
}


@end

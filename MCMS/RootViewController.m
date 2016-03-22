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
    MagicalCreature *mc1 = [[MagicalCreature alloc] initWithName:@"cookie monster" withDetail:@"from Sesame Street"];
    MagicalCreature *mc2 = [[MagicalCreature alloc] initWithName:@"godzilla" withDetail:@"from Japan"];
    MagicalCreature *mc3 = [[MagicalCreature alloc] initWithName:@"mothra" withDetail:@"origin unknown"];
    
    self.creatures = [NSMutableArray arrayWithArray:@[mc1, mc2, mc3]];
    
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
    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
}

- (IBAction)onAddButtonTapped:(UIBarButtonItem *)sender {
    NSString *name = self.textField1.text;
    if (![name isEqualToString:@""]) {
        NSString *detail = self.textField2.text;
        MagicalCreature *creature = [[MagicalCreature alloc] initWithName:name withDetail:detail];
        [self.creatures addObject:creature];
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

//
//  ViewController.m
//  MCMS
//
//  Created by dp on 3/22/16.
//  Copyright © 2016 Dan Park. All rights reserved.
//

#import "RootViewController.h"
#import "MagicalCreature.h"

@interface RootViewController ()
@property NSMutableArray *creatures;

@end

@implementation RootViewController

-(instancetype) init {
    self = [super init];

    if (self) {
        self.creatures = [NSMutableArray new];
        MagicalCreature *mc1 = [[MagicalCreature alloc] initWithName:@"cookie monster"];
        MagicalCreature *mc2 = [[MagicalCreature alloc] initWithName:@"godzilla"];
        MagicalCreature *mc3 = [[MagicalCreature alloc] initWithName:@"mothra"];

        self.creatures = [NSMutableArray arrayWithArray:@[mc1, mc2, mc3]];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"
                                                            forIndexPath:indexPath];

    MagicalCreature *creature = self.creatures[indexPath.row];
    cell.textLabel.text = creature.name;
    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
}

@end

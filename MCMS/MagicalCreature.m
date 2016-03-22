//
//  MagicalCreature.m
//  MCMS
//
//  Created by id on 3/22/16.
//  Copyright © 2016 Dan Park. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

-(instancetype) initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

@end

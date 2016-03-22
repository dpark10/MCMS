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
    return [self initWithName:name withDetail:@""];
}

-(instancetype) initWithName:(NSString *)name withDetail:(NSString *)detail {
    self = [super init];
    if (self) {
        self.name = name;
        self.detail = detail;
    }
    return self;
}

@end

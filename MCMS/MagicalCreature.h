//
//  MagicalCreature.h
//  MCMS
//
//  Created by id on 3/22/16.
//  Copyright © 2016 Dan Park. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MagicalCreature : NSObject

@property NSString *name;
@property NSString *detail;
@property UIImage *image;
@property NSMutableArray *accessories;

-(instancetype) initWithName:(NSString *)name;
-(instancetype) initWithName:(NSString *)name withDetail:(NSString *)detail;
-(instancetype) initWithName:(NSString *)name withDetail:(NSString *)detail withImage:(UIImage *)image;


@end

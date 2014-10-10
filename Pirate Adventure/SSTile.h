//
//  SSTile.h
//  Pirate Adventure
//
//  Created by Sawant Shah on 24/09/2014.
//  Copyright (c) 2014 Sawant Shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSArmor.h"
#import "SSWeapon.h"

@interface SSTile : NSObject

@property (nonatomic) int healthEffect;
@property (strong, nonatomic) NSString *sceneStory;
@property (strong, nonatomic) UIImage *background;
@property (strong, nonatomic) NSString *actionName;
@property (strong, nonatomic) SSArmor *armor;
@property (strong, nonatomic) SSWeapon *weapon;

@end

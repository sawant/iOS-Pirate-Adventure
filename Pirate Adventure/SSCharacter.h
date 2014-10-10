//
//  SSCharacter.h
//  Pirate Adventure
//
//  Created by Sawant Shah on 24/09/2014.
//  Copyright (c) 2014 Sawant Shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSWeapon.h"
#import "SSArmor.h"

@interface SSCharacter : NSObject

@property (strong, nonatomic) NSString *name;
// @property (strong, nonatomic) NSString *type;
@property (nonatomic) int health;
@property (nonatomic) int damage;
@property (strong, nonatomic) SSArmor *armor;
@property (strong, nonatomic) SSWeapon *weapon;

-(void)prepareHeroWithName:(NSString *)name andHealth:(int)health andDamage:(int)damage;
-(void)updateCharacterStatsForArmor:(SSArmor *)armor withWeapon:(SSWeapon *)weapon withHealthBenefits:(int)healthBenefit;
@end

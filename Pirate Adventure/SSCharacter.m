//
//  SSCharacter.m
//  Pirate Adventure
//
//  Created by Sawant Shah on 24/09/2014.
//  Copyright (c) 2014 Sawant Shah. All rights reserved.
//

#import "SSCharacter.h"

@implementation SSCharacter

-(void)prepareHeroWithName:(NSString *)name andHealth:(int)health andDamage:(int)damage
{
    _name = name;
    _health = health;
    _damage = damage;
    _armor = [[SSArmor alloc] init];
    _armor.name = @"Cloak";
    _armor.healthBonus = 0;
    _weapon = [[SSWeapon alloc] init];
    _weapon.name = @"Fists";
    _weapon.damage = 5;
}

-(void)updateCharacterStatsForArmor:(SSArmor *)armor withWeapon:(SSWeapon *)weapon withHealthBenefits:(int)healthBenefit
{
    if (armor != nil) {
        self.health = self.health - self.armor.healthBonus + armor.healthBonus;
        self.armor = armor;
    }
    if (weapon != nil) {
        self.damage = self.damage - self.weapon.damage + weapon.damage;
        self.weapon = weapon;
    }
    if (healthBenefit != 0) {
        self.health = self.health + healthBenefit;
    }
}
@end

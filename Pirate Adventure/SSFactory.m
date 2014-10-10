//
//  SSFactory.m
//  Pirate Adventure
//
//  Created by Sawant Shah on 24/09/2014.
//  Copyright (c) 2014 Sawant Shah. All rights reserved.
//

#import "SSFactory.h"
#import "SSTile.h"

@implementation SSFactory

-(NSArray *)createTiles
{
    NSMutableArray *rowOne = [[NSMutableArray alloc] init];
    NSMutableArray *rowTwo = [[NSMutableArray alloc] init];
    NSMutableArray *rowThree = [[NSMutableArray alloc] init];
    NSMutableArray *rowFour = [[NSMutableArray alloc] init];
    
//    Armor
    SSArmor *steelArmor = [[SSArmor alloc] init];
    steelArmor.name = @"Steel Armor";
    steelArmor.healthBonus = 10;
    
    SSArmor *parrotArmor = [[SSArmor alloc] init];
    parrotArmor.name = @"Parrot";
    parrotArmor.healthBonus = 5;
    
//    Weapons
    SSWeapon *bluntedSword = [[SSWeapon alloc] init];
    bluntedSword.name = @"Blunted Sword";
    bluntedSword.damage = 10;
    
    SSWeapon *pistolWeapon = [[SSWeapon alloc] init];
    pistolWeapon.name = @"Pistol";
    pistolWeapon.damage = 25;
    
/******** ROW 1 ********/
//  Tile 1
    [rowOne addObject:[self createTile:@"Start of the journey." withBackgroundFile:@"PirateStart.jpg" andArmor:nil andWeapon:bluntedSword andAction:@"Take Sword" andHealthEffect:0]];
//  Tile 2
    [rowOne addObject:[self createTile:@"The first attack." withBackgroundFile:@"PirateAttack.jpg" andArmor:nil andWeapon:nil andAction:@"Defend" andHealthEffect:-20]];
//  Tile 3
    [rowOne addObject:[self createTile:@"Mogu finds some friendly people." withBackgroundFile:@"PirateFriendlyDock.jpg" andArmor:nil andWeapon:nil andAction:@"Make Friends" andHealthEffect:20]];

/******** ROW 2 ********/
//  Tile 1
    [rowTwo addObject:[self createTile:@"Right in the middle of the sea, a giant octopus attacks Mogu." withBackgroundFile:@"PirateOctopusAttack.jpg" andArmor:nil andWeapon:nil andAction:@"Hide from Octopus!" andHealthEffect:-20]];
//  Tile 2
    [rowTwo addObject:[self createTile:@"What is this? A parrot? Squack!" withBackgroundFile:@"PirateParrot.jpg" andArmor:parrotArmor andWeapon:nil andAction:@"Take Parrot" andHealthEffect:10]];
//  Tile 3
    [rowTwo addObject:[self createTile:@"It's a plank!" withBackgroundFile:@"PiratePlank.jpg" andArmor:nil andWeapon:nil andAction:@"Go for a Swim" andHealthEffect:10]];
    
/******** ROW 3 ********/
//  Tile 1
    [rowThree addObject:[self createTile:@"A rival pirate ship attacks. Fight!" withBackgroundFile:@"PirateShipBattle.jpeg" andArmor:nil andWeapon:nil andAction:@"Attack Rival Ship" andHealthEffect:-10]];
//  Tile 2
    [rowThree addObject:[self createTile:@"Mogu comes across a Blacksmith, who promises to join forces." withBackgroundFile:@"PirateBlacksmith.jpeg" andArmor:nil andWeapon:nil andAction:@"Shake Hands" andHealthEffect:10]];
//  Tile 3
    [rowThree addObject:[self createTile:@"Mogu finds weapons!! About time!" withBackgroundFile:@"PirateWeapons.jpeg" andArmor:nil andWeapon:pistolWeapon andAction:@"Take Pistol" andHealthEffect:10]];

/******** ROW 4 ********/
//  Tile 1
    [rowFour addObject:[self createTile:@"Mogi! You are going to die! It's either you or me! Arr..!!" withBackgroundFile:@"PirateBoss.jpeg" andArmor:nil andWeapon:nil andAction:@"Fight Boss" andHealthEffect:-50]];
//  Tile 2
    [rowFour addObject:[self createTile:@"Mogu wins, and he gets hold of all the treasure that Mogi had!" withBackgroundFile:@"PirateTreasure.jpeg" andArmor:nil andWeapon:nil andAction:@"Pick Treasure" andHealthEffect:20]];
//  Tile 3
    [rowFour addObject:[self createTile:@"And more treasure! Hurray!" withBackgroundFile:@"PirateTreasurer2.jpeg" andArmor:nil andWeapon:nil andAction:@"Enjoy Loot!" andHealthEffect:30]];
    
    NSArray *gameTiles = [[NSArray alloc] initWithObjects:rowOne, rowTwo, rowThree, rowFour, nil];
    
    return gameTiles;
}

-(SSTile *)createTile:(NSString *)story withBackgroundFile:(NSString *)background andArmor:(SSArmor *)armor andWeapon:(SSWeapon *)weapon andAction:(NSString *)action andHealthEffect:(int)healthEffect
{
    SSTile *tile = [[SSTile alloc] init];
    
    tile.sceneStory = story;
    tile.background = [UIImage imageNamed:background];
    tile.weapon = weapon;
    tile.armor = armor;
    tile.actionName = action;
    tile.healthEffect = healthEffect;
    
    return tile;
}

+(SSCharacter *)characterWithName:(NSString *) name andHealth:(int)health andDamage:(int)damage
{
    SSCharacter *character = [[SSCharacter alloc] init];
    
    [character prepareHeroWithName:name andHealth:health andDamage:damage];
    
    return character;
}

+(SSBoss *)boss
{
    SSBoss *boss = [[SSBoss alloc] init];
    
    boss.health = 65;
    
    return boss;
}
@end

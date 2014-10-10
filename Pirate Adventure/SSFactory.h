//
//  SSFactory.h
//  Pirate Adventure
//
//  Created by Sawant Shah on 24/09/2014.
//  Copyright (c) 2014 Sawant Shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSCharacter.h"
#import "SSBoss.h"

@interface SSFactory : NSObject

-(NSArray *)createTiles;
+(SSCharacter *)characterWithName:(NSString *) name andHealth:(int)health andDamage:(int)damage;
+(SSBoss *)boss;

@end

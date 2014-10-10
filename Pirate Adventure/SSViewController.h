//
//  SSViewController.h
//  Pirate Adventure
//
//  Created by Sawant Shah on 24/09/2014.
//  Copyright (c) 2014 Sawant Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSCharacter.h"
#import "SSTile.h"
#import "SSBoss.h"

@interface SSViewController : UIViewController

// Instance variables
@property (nonatomic) CGPoint tilePosition;
@property (strong, nonatomic) NSArray *tiles;
@property (strong, nonatomic) SSTile *currentTile;
@property (strong, nonatomic) SSCharacter *hero;
@property (strong, nonatomic) SSBoss *boss;

// IBOutlets
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UILabel *currentWeaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *currentArmorLabel;
@property (strong, nonatomic) IBOutlet UILabel *currentHealthLabel;
@property (strong, nonatomic) IBOutlet UIButton *upButton;
@property (strong, nonatomic) IBOutlet UIButton *leftButton;
@property (strong, nonatomic) IBOutlet UIButton *downButton;
@property (strong, nonatomic) IBOutlet UIButton *rightButton;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;

// IBActions
- (IBAction)moveRight:(UIButton *)sender;
- (IBAction)moveDown:(UIButton *)sender;
- (IBAction)moveLeft:(UIButton *)sender;
- (IBAction)moveUp:(UIButton *)sender;
- (IBAction)actioButton:(UIButton *)sender;
- (IBAction)resetButtonPressed:(UIButton *)sender;

@end

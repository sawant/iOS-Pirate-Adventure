//
//  SSViewController.m
//  Pirate Adventure
//
//  Created by Sawant Shah on 24/09/2014.
//  Copyright (c) 2014 Sawant Shah. All rights reserved.
//

#import "SSViewController.h"
#import "SSFactory.h"

@interface SSViewController ()

@end

@implementation SSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
// Initialize tiles
    self.tiles = [[[SSFactory alloc] init] createTiles];
    self.tilePosition = CGPointMake(0, 0);
    
// Initialize Character
    self.hero = [SSFactory characterWithName:@"Rustam" andHealth:100 andDamage:10];
    
//    Initialize Boss
    self.boss = [SSFactory boss];
    
// Initialize Scene
    [self updateScene];
    
// Initialize default health, armor and weapon
    self.currentArmorLabel.text = self.hero.armor.name;
    self.currentWeaponLabel.text = self.hero.weapon.name;
    self.currentHealthLabel.text = [NSString stringWithFormat:@"%i", self.hero.health];

// Hide N and W buttons as the user can't move up or left when starting
    self.leftButton.enabled = NO;
    self.upButton.enabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helper Methods

-(void)updateScene
{
    // Set current tile based on current position
    self.currentTile = [[self.tiles objectAtIndex:self.tilePosition.x] objectAtIndex:self.tilePosition.y];
    
    // Set background image based on current tile/position
    self.backgroundImage.image = self.currentTile.background;
    
    //    Update Story
    self.storyLabel.text = self.currentTile.sceneStory;
    
    //    Update Action button
    [self.actionButton setTitle:self.currentTile.actionName forState:UIControlStateNormal];
}

#pragma mark - IBActions

- (IBAction)moveRight:(UIButton *)sender
{
//  Update position/move right
    self.tilePosition = CGPointMake(self.tilePosition.x, self.tilePosition.y + 1);
    
//  Update scene based on new position
    [self updateScene];

//  Show left button if the player is not on the left edge
    if (self.tilePosition.y > 0) {
        self.leftButton.enabled = true;
    }
    
//  Hide this button if character has reached edge of the grid
    if (self.tilePosition.y == 2) {
        sender.enabled = false;
    }
}

- (IBAction)moveDown:(UIButton *)sender
{
    //  Update position/move down
    self.tilePosition = CGPointMake(self.tilePosition.x + 1, self.tilePosition.y);
    
    //  Update scene based on new position
    [self updateScene];
    
    //  Show up button if the player is not on the top edge
    if (self.tilePosition.x > 0) {
        self.upButton.enabled = YES;
    }
    
    //  Hide this button if character has reached edge of the grid
    if (self.tilePosition.x == 3) {
        sender.enabled = false;
    }
}

- (IBAction)moveLeft:(UIButton *)sender {
    //  Update position/move left
    self.tilePosition = CGPointMake(self.tilePosition.x, self.tilePosition.y - 1);

    //  Update scene based on new position
    [self updateScene];
    
    //  Show right button if the player is not on the right edge
    if (self.tilePosition.y < 2) {
        self.rightButton.enabled = YES;
    }
    
    //  Hide this button if character has reached edge of the grid
    if (self.tilePosition.y == 0) {
        sender.enabled = false;
    }
}

- (IBAction)moveUp:(UIButton *)sender {
    //  Update position/move up
    self.tilePosition = CGPointMake(self.tilePosition.x - 1, self.tilePosition.y);

    //  Update scene based on new position
    [self updateScene];
    
    //  Show down button if the player is not on the bottom edge
    if (self.tilePosition.x < 2) {
        self.downButton.enabled = YES;
    }
    
    //  Hide this button if character has reached edge of the grid
    if (self.tilePosition.x == 0) {
        sender.enabled = NO;
    }
}

- (IBAction)actioButton:(UIButton *)sender {
    // Set current tile based on current position
    self.currentTile = [[self.tiles objectAtIndex:self.tilePosition.x] objectAtIndex:self.tilePosition.y];
    
//    Check if it's the boss tile
    if ([sender.titleLabel.text isEqual: @"Fight Boss"]) {
        self.boss.health = self.boss.health - self.hero.damage;
    }
    
    NSLog(@"%i", self.boss.health);

    [self.hero updateCharacterStatsForArmor:self.currentTile.armor withWeapon:self.currentTile.weapon withHealthBenefits:self.currentTile.healthEffect];
    
    if (self.hero.health <= 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Death Message" message:@"Game over! Please restart the game." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        
        [alert show];
    }
    else if (self.boss.health <= 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You Win" message:@"You have defeated the evil pirate boss!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [alert show];
    }
    
    self.currentHealthLabel.text = [NSString stringWithFormat:@"%i", self.hero.health];
    self.currentArmorLabel.text = self.hero.armor.name;
    self.currentWeaponLabel.text = self.hero.weapon.name;
}

- (IBAction)resetButtonPressed:(UIButton *)sender {
    self.hero = nil;
    self.boss = nil;
    
    [self viewDidLoad];
}
@end

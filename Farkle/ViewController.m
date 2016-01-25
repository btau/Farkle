//
//  ViewController.m
//  Farkle
//
//  Created by Brett Tau on 1/21/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import "ViewController.h"
#import "GameSetUpViewController.h"
#import "DieLabel.h"
#import "Player.h"

@interface ViewController () <DieLabelDelegate>

@property (weak, nonatomic) IBOutlet DieLabel *dieLabelOne;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabelTwo;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabelThree;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabelFour;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabelFive;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabelSix;
@property (weak, nonatomic) IBOutlet UILabel *bankScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerTotalScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerNameTurnLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerTurnLabel;

@property NSMutableArray *originalDieArray;
@property NSMutableArray *selectedDieArray;
@property NSMutableArray *sortedDieArray;
@property NSMutableArray *occurrenceArray;
@property int bankScore;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.originalDieArray = [[NSMutableArray alloc]initWithObjects:self.dieLabelOne, self.dieLabelTwo, self.dieLabelThree, self.dieLabelFour, self.dieLabelFive, self.dieLabelSix, nil];
    
    self.selectedDieArray = [NSMutableArray new];
    
    self.playerNameTurnLabel.text = [NSString stringWithFormat:@"Player: %@", self.player.playerName];
    self.playerTurnLabel.text = [NSString stringWithFormat:@"Turn: %ld", (long)self.player.playerTurn];
    self.playerTotalScoreLabel.text = [NSString stringWithFormat:@"Total Score: %ld", (long)self.player.playerTotalScore];
}


- (void)dieLabel:(UILabel *)dieLabel
{
    //selecting/deselecting die
    if (![self.selectedDieArray containsObject:dieLabel])
    {
        dieLabel.backgroundColor = [UIColor redColor];
        [self.originalDieArray removeObject:dieLabel];
        [self.selectedDieArray addObject:dieLabel];
    }
    else
    {
        dieLabel.backgroundColor = [UIColor lightGrayColor];
        [self.selectedDieArray removeObject:dieLabel];
        [self.originalDieArray addObject:dieLabel];
    }
    
    NSLog(@"original array %@", self.originalDieArray);
    NSLog(@"sorted die %@", self.selectedDieArray);
    
    if ([dieLabel.text isEqualToString:@"1"])
    {
        self.bankScore += 100;
        self.bankScoreLabel.text = [NSString stringWithFormat:@"%i", self.bankScore];
    }
    else if ([dieLabel.text isEqualToString:@"5"])
    {
        self.bankScore += 50;
        self.bankScoreLabel.text = [NSString stringWithFormat:@"%i", self.bankScore];
    }
}




- (void)checkForOccurrences
{
    NSMutableArray *testArray = [NSMutableArray arrayWithObjects:@"2", @"3", @"3", @"5", @"6", @"1", nil];
    
    self.occurrenceArray = [NSMutableArray arrayWithArray:@[@0,@0,@0,@0,@0,@0]];
    for (int value = 0; value < 6; value++) {
        for(NSNumber *die in testArray){
            self.occurrenceArray[value] = @( [self.occurrenceArray[value] intValue] + (die.intValue == (value+1) ? 1 : 0) );
        }
    }
    NSLog(@"occurance array %@", self.occurrenceArray);
}






- (IBAction)onRolleDiceTapped:(UIButton *)sender
{
    for (DieLabel *die in self.originalDieArray)
    {
        [die rollDie];
        die.delegate = self;
    }
    
//    [self checkForOccurrences];
}

- (IBAction)onBankScoreTapped:(UIButton *)sender {
    
    [self.delegate bankScoreButtonTapped:sender];
    self.playerTotalScoreLabel.text = self.bankScoreLabel.text;
    self.player.playerTurn = self.player.playerTurn + 1;
    self.player.playerTotalScore = self.player.playerTotalScore + self.player.playerTurnScore;
}


@end

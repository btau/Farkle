//
//  ViewController.m
//  Farkle
//
//  Created by Brett Tau on 1/21/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"

@interface ViewController () <DieLabelDelegate>

@property (weak, nonatomic) IBOutlet DieLabel *dieLabelOne;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabelTwo;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabelThree;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabelFour;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabelFive;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabelSix;



@property NSMutableArray *numberOfDie;
@property NSMutableArray *dice;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.numberOfDie = [[NSMutableArray alloc]initWithObjects:self.dieLabelOne, self.dieLabelTwo, self.dieLabelThree, self.dieLabelFour, self.dieLabelFive, self.dieLabelSix, nil];
    
}



-(void)tapHandler:(UITapGestureRecognizer *)gestureRecognizer
{
    for (DieLabel *die in self.numberOfDie) {
        die.delegate = self;
    }
}



- (IBAction)onRolleDiceTapped:(UIButton *)sender
{
    for (DieLabel *die in self.numberOfDie)
    {
        [die rollDie];
    }
    NSLog(@"1 is %@", self.dieLabelOne.text);
    NSLog(@"2 is %@", self.dieLabelTwo.text);
    NSLog(@"3 is %@", self.dieLabelThree.text);
    NSLog(@"4 is %@", self.dieLabelFour.text);
    NSLog(@"5 is %@", self.dieLabelFive.text);
    NSLog(@"6 is %@", self.dieLabelSix.text);
    
}



@end

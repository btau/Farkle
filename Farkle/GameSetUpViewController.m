//
//  GameSetUpViewController.m
//  Farkle
//
//  Created by Brett Tau on 1/23/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import "GameSetUpViewController.h"
#import "Player.h"

@interface GameSetUpViewController () <UITableViewDelegate, UITableViewDataSource>


@property NSMutableArray *playersArray;

@end

@implementation GameSetUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Player *playerOne = [[Player alloc]initWithName:@"Richard" andTotalScore:0 andWithTurnScore:0];
    Player *playerTwo = [[Player alloc]initWithName:@"Brett" andTotalScore:0 andWithTurnScore:0];
    
    self.playersArray = [NSMutableArray arrayWithObjects:playerOne, playerTwo, nil];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.playersArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    Player *player = [self.playersArray objectAtIndex:indexPath.row];
    cell.textLabel.text = player.playerName;
    return cell;
}


@end

//
//  GameSetUpViewController.m
//  Farkle
//
//  Created by Brett Tau on 1/23/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import "GameSetUpViewController.h"
#import "ViewController.h"
#import "Player.h"

@interface GameSetUpViewController () <UITableViewDelegate, UITableViewDataSource, ViewControllerDelegate>

@property NSMutableArray *playersArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSIndexPath *selectedPath;
@property UITableViewCell *selectedCell;

@end

@implementation GameSetUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Player *playerOne = [[Player alloc]initWithName:@"Richard" andPlayerTotalScore:0 andWithPlayerTurnScore:0 andWithPlayerTurn:1];
    Player *playerTwo = [[Player alloc]initWithName:@"Brett" andPlayerTotalScore:0 andWithPlayerTurnScore:0 andWithPlayerTurn:1];
    
    self.playersArray = [NSMutableArray arrayWithObjects:playerOne, playerTwo, nil];
}

#pragma mark VCDelegate Method
-(void)bankScoreButtonTapped:(UIButton *)bankButton
{
    Player *player = [self.playersArray objectAtIndex:self.selectedPath.row];
    self.selectedCell.textLabel.text = [NSString stringWithFormat:@"%li", player.playerTotalScore];
}


#pragma mark UITableViewDelegate Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.playersArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    Player *player = [self.playersArray objectAtIndex:indexPath.row];
    cell.textLabel.text = player.playerName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%li", player.playerTotalScore];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController *dvc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    dvc.player = [self.playersArray objectAtIndex:indexPath.row];
    dvc.delegate = self;
    
}


@end

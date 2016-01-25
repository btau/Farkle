//
//  Player.m
//  Farkle
//
//  Created by Brett Tau on 1/21/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import "Player.h"

@implementation Player

-(instancetype)initWithName:(NSString *)playerName andPlayerTotalScore:(NSInteger)playerTotalScore andWithPlayerTurnScore:(NSInteger)playerTurnScore andWithPlayerTurn:(NSInteger)playerTurn
{
    self = [super init];
    
    if (self)
    {
        self.playerName = playerName;
        self.playerTotalScore = playerTotalScore;
        self.playerTurnScore = playerTurnScore;
        self.playerTurn = playerTurn;
    }
    return self;
}

@end

//
//  Player.m
//  Farkle
//
//  Created by Brett Tau on 1/21/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import "Player.h"

@implementation Player

-(instancetype)initWithName:(NSString *)playerName andTotalScore:(NSInteger)totalScore andWithTurnScore:(NSInteger)turnScore {
    self = [super init];
    
    if (self) {
        self.playerName = playerName;
        self.totalScore = totalScore;
        self.turnScore = turnScore;
    }
    return self;
}

@end

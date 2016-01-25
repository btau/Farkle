//
//  Player.h
//  Farkle
//
//  Created by Brett Tau on 1/21/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property NSString *playerName;
@property NSInteger playerTotalScore;
@property NSInteger playerTurnScore;
@property NSInteger playerTurn;

-(instancetype)initWithName:(NSString *)playerName andPlayerTotalScore:(NSInteger)playerTotalScore andWithPlayerTurnScore:(NSInteger)playerTurnScore andWithPlayerTurn:(NSInteger)playerTurn;

@end

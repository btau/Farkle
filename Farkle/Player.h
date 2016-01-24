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
@property NSInteger totalScore;
@property NSMutableArray *totalScoreArray;
@property NSInteger turnScore;
@property NSMutableArray *totalTurnScoreArray;

-(instancetype)initWithName:(NSString *)playerName andTotalScore:(NSInteger)totalScore andWithTurnScore:(NSInteger)turnScore;

@end

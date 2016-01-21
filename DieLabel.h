//
//  DieLabel.h
//  Farkle
//
//  Created by Brett Tau on 1/21/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DieLabelDelegate <NSObject>

-(void)tapHandler:(UITapGestureRecognizer *)gestureRecognizer;

@end

@interface DieLabel : UILabel

@property (nonatomic, assign) id <DieLabelDelegate> delegate;

-(void)rollDie;

@end

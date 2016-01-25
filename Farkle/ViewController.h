//
//  ViewController.h
//  Farkle
//
//  Created by Brett Tau on 1/21/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@protocol ViewControllerDelegate <NSObject>

- (void)bankScoreButtonTapped:(UIButton *)bankButton;

@end

@interface ViewController : UIViewController

@property Player *player;

@property (nonatomic, assign) id<ViewControllerDelegate> delegate;

@end


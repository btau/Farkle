//
//  DieLabel.m
//  Farkle
//
//  Created by Brett Tau on 1/21/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import "DieLabel.h"

@interface DieLabel () <UIGestureRecognizerDelegate>

@end

@implementation DieLabel


-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        self.userInteractionEnabled = YES;
    
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHandler:)];
    
        self.gestureRecognizers = @[tap];
    
        for (UIGestureRecognizer *recognizer in self.gestureRecognizers)
        {
        recognizer.delegate = self;
        }
    }
    return self;
}



-(void)tapHandler:(UITapGestureRecognizer *)gestureRecognizer
{
    [self.delegate dieLabel:self tappedDie:gestureRecognizer];
    
    NSLog(@"tapped");
}



-(void)rollDie
{
    int randomNumber = (rand() % 6) + 1;
    self.text = [NSString stringWithFormat:@"%i", randomNumber];
}
















@end

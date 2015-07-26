//
//  ImmovableColorPanel.m
//  ColorPanel
//
//  Created by MaohuaLiu on 15/7/26.
//  Copyright (c) 2015年 CaryaLiu. All rights reserved.
//

#import "ImmovableColorPanel.h"
#import "UIView+ColorOfPoint.h"

@implementation ImmovableColorPanel

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint location = [touch locationInView:self];
    self.color = [self colorOfPoint:location];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    return YES;
}

@end

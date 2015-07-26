//
//  RoundColorPanel.m
//  ColorPanel
//
//  Created by MaohuaLiu on 15/7/26.
//  Copyright (c) 2015年 CaryaLiu. All rights reserved.
//

#import "RoundColorPanel.h"

@interface RoundColorPanel ()

@property (nonatomic) CGPoint centerPoint;

@end

@implementation RoundColorPanel

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.centerPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    
    CGPoint previousLocation = [touch previousLocationInView:self];
    CGPoint location = [touch locationInView:self];
    CGFloat previousRadian = [self radianToCenterPoint:self.centerPoint withPoint:previousLocation];
    CGFloat curRadian = [self radianToCenterPoint:self.centerPoint withPoint:location];
    CGFloat changedRadian = curRadian - previousRadian;
    [self rotateByRadian:changedRadian];
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    return YES;
}

- (CGFloat)radianToCenterPoint:(CGPoint)centerPoint withPoint:(CGPoint)point {
    CGVector vector = CGVectorMake(point.x - centerPoint.x, point.y - centerPoint.y);
    return atan2f(vector.dy, vector.dx);
}

- (void)rotateByRadian:(CGFloat)radian {
    CGAffineTransform transform = self.layer.affineTransform;
    transform = CGAffineTransformRotate(transform, radian);
    self.layer.affineTransform = transform;
}
@end

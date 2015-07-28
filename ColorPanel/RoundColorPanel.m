//
//  RoundColorPanel.m
//  ColorPanel
//
//  Created by MaohuaLiu on 15/7/26.
//  Copyright (c) 2015年 CaryaLiu. All rights reserved.
//

#import "RoundColorPanel.h"

@interface RoundColorPanel ()

/**
 *  ColorPanel中心点的坐标值
 */
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

/**
 *  以ColorPanel的anchorPoint为坐标原点建立坐标系，计算坐标点|point|与坐标原点的连线距离x轴正方向的夹角
 *
 *  @param centerPoint 坐标原点坐标
 *  @param point       某坐标点
 *
 *  @return 坐标点|point|与坐标原点的连线距离x轴正方向的夹角
 */
- (CGFloat)radianToCenterPoint:(CGPoint)centerPoint withPoint:(CGPoint)point {
    CGVector vector = CGVectorMake(point.x - centerPoint.x, point.y - centerPoint.y);
    return atan2f(vector.dy, vector.dx);
}

/**
 *  将图层旋转radian弧度
 *
 *  @param radian 旋转的弧度
 */
- (void)rotateByRadian:(CGFloat)radian {
    CGAffineTransform transform = self.layer.affineTransform;
    transform = CGAffineTransformRotate(transform, radian);
    self.layer.affineTransform = transform;
}
@end

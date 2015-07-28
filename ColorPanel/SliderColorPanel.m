//
//  SliderColorPanel.m
//  ColorPanel
//
//  Created by MaohuaLiu on 15/7/27.
//  Copyright (c) 2015年 CaryaLiu. All rights reserved.
//

#import "SliderColorPanel.h"
#import "BarColorPanel.h"
#import "UIView+ColorOfPoint.h"

#define kColorPanelHeight   5
#define kHandleRadius   10

@interface SliderColorPanel ()

@property (strong, nonatomic) BarColorPanel *colorPanel;

@property (strong, nonatomic) CALayer *outerLayer;

@property (strong, nonatomic) CALayer *innerLayer;

@property (nonatomic) CGFloat positionPercent;

@end

@implementation SliderColorPanel

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [ super initWithCoder:aDecoder];
    if (self) {
        self.positionPercent = 0.9;
        
        if (!self.colorPanel) {
            self.colorPanel = [[BarColorPanel alloc] init];
            [self addSubview:self.colorPanel];
        }
        if (!self.outerLayer) {
            self.outerLayer = [CALayer layer];
            self.outerLayer.backgroundColor = [UIColor whiteColor].CGColor;
            self.outerLayer.borderWidth = 1;
            self.outerLayer.borderColor = [UIColor colorWithRed:128/255.0f green:128/255.0f blue:128/255.0f alpha:1].CGColor;
            [self.layer addSublayer:self.outerLayer];
        }
        
        if (!self.innerLayer) {
            self.innerLayer = [CALayer layer];
            self.innerLayer.backgroundColor = [UIColor whiteColor].CGColor;
            self.innerLayer.borderWidth = 1;
            self.innerLayer.borderColor = [UIColor colorWithRed:128/255.0f green:128/255.0f blue:128/255.0f alpha:1].CGColor;
            [self.outerLayer addSublayer:self.innerLayer];
        }
    }
    
    return self;
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    [super layoutSublayersOfLayer:layer];
    
    self.colorPanel.frame = CGRectMake(kHandleRadius, (CGRectGetHeight(self.frame) - kColorPanelHeight)/2, CGRectGetWidth(self.frame) - 2 * kHandleRadius, kColorPanelHeight);
    self.colorPanel.layer.cornerRadius = kColorPanelHeight / 2.0f;
    
    self.outerLayer.bounds = CGRectMake(0, 0, 2 * kHandleRadius, 2 * kHandleRadius);
    self.outerLayer.cornerRadius = kHandleRadius;
    self.outerLayer.position = CGPointMake(kHandleRadius + CGRectGetWidth(self.colorPanel.bounds) * self.positionPercent, CGRectGetHeight(self.frame) / 2);
    
    self.innerLayer.bounds = CGRectMake(0, 0, 9, 9);
    self.innerLayer.cornerRadius = CGRectGetWidth(self.innerLayer.bounds) / 2;
    self.innerLayer.position = CGPointMake(CGRectGetMidX(self.outerLayer.bounds), CGRectGetMidY(self.outerLayer.bounds));
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    
    CGPoint location = [touch locationInView:self];
    CGPoint colorPanelPoint = [self convertPoint:location toView:self.colorPanel];
    colorPanelPoint.y = CGRectGetHeight(self.colorPanel.bounds) / 2;
    CGPoint handlePoint = CGPointMake(location.x, CGRectGetHeight(self.bounds) / 2);
    if (colorPanelPoint.x >= 0 && colorPanelPoint.x <= CGRectGetWidth(self.colorPanel.bounds)) {
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        self.outerLayer.position = handlePoint;
        [CATransaction commit];
        self.positionPercent = handlePoint.x / CGRectGetWidth(self.colorPanel.bounds);
        
        self.color = [self.colorPanel colorOfPoint:colorPanelPoint];
        self.innerLayer.backgroundColor = self.color.CGColor;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
        return YES;
    } else {
        return NO;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGPoint handlePoint = [self.layer convertPoint:point toLayer:self.outerLayer];
    CGRect largerRect = CGRectInset(self.outerLayer.bounds, -7, -7);
    
    if (CGRectContainsPoint(largerRect, handlePoint)) {
        return [super hitTest:point withEvent:event];
    } else {
        return nil;
    }
}

@end

//
//  BarColorPanel.m
//  ColorPanel
//
//  Created by MaohuaLiu on 15/7/27.
//  Copyright (c) 2015年 CaryaLiu. All rights reserved.
//

#import "BarColorPanel.h"

#define SLIDER_HEIGHT   5
#define HANDLE_RADIUS   10

@interface BarColorPanel ()

@property (strong, nonatomic) CAGradientLayer *gradientLayer;

@end

@implementation BarColorPanel

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.gradientLayer = [CAGradientLayer layer];
        self.gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:249/255.0f green:220/255.0f blue:89/255.0f alpha:1].CGColor, (__bridge id)[UIColor colorWithRed:131/255.0f green:194/255.0f blue:254/255.0f alpha:1].CGColor];
        self.gradientLayer.startPoint = CGPointMake(0, 0.5);
        self.gradientLayer.endPoint = CGPointMake(1, 0.5);
        [self.layer addSublayer:self.gradientLayer];
    }
    
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.gradientLayer = [CAGradientLayer layer];
        self.gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:249/255.0f green:220/255.0f blue:89/255.0f alpha:1].CGColor, (__bridge id)[UIColor whiteColor].CGColor, (__bridge id)[UIColor colorWithRed:131/255.0f green:194/255.0f blue:254/255.0f alpha:1].CGColor];
        self.gradientLayer.startPoint = CGPointMake(0, 0.5);
        self.gradientLayer.endPoint = CGPointMake(1, 0.5);
        [self.layer addSublayer:self.gradientLayer];
    }
    
    return self;
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    [super layoutSublayersOfLayer:layer];
    
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:249/255.0f green:220/255.0f blue:89/255.0f alpha:1].CGColor, (__bridge id)[UIColor whiteColor].CGColor, (__bridge id)[UIColor colorWithRed:131/255.0f green:194/255.0f blue:254/255.0f alpha:1].CGColor];
    self.gradientLayer.startPoint = CGPointMake(0, 0.5);
    self.gradientLayer.endPoint = CGPointMake(1, 0.5);
    [self.layer addSublayer:self.gradientLayer];
    self.gradientLayer.frame = self.bounds;
    self.gradientLayer.cornerRadius = CGRectGetHeight(self.bounds) / 2.0f;
}

@end

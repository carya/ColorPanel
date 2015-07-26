//
//  RotaryColorPanel.m
//  ColorPanel
//
//  Created by MaohuaLiu on 15/7/26.
//  Copyright (c) 2015年 CaryaLiu. All rights reserved.
//

#import "RotaryColorPanel.h"
#import "RoundColorPanel.h"
#import "UIView+ColorOfPoint.h"
#import "XXNibBridge.h"

@interface RotaryColorPanel () <XXNibBridge>

@property (weak, nonatomic) IBOutlet RoundColorPanel *roundColorPanel;
@property (weak, nonatomic) IBOutlet UIImageView *indicator;

@property (nonatomic) CGPoint referPoint;

@end

@implementation RotaryColorPanel

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.referPoint = CGPointMake(CGRectGetMidX(self.indicator.frame), CGRectGetMaxY(self.indicator.frame));
    [self.roundColorPanel addTarget:self action:@selector(colorPanelRotated:) forControlEvents:UIControlEventValueChanged];
}

- (void)colorPanelRotated:(id)sender {
    UIColor *color = [self colorOfPoint:self.referPoint];
    if (self.colorChangedHandler) {
        self.colorChangedHandler(color);
    }
}

@end

//
//  RotaryColorPanel.h
//  ColorPanel
//
//  Created by MaohuaLiu on 15/7/26.
//  Copyright (c) 2015年 CaryaLiu. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RotaryColorPanel : UIView

@property (copy, nonatomic) void(^colorChangedHandler)(UIColor *color);

@end

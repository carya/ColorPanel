//
//  SliderColorPanelViewController.m
//  ColorPanel
//
//  Created by MaohuaLiu on 15/7/27.
//  Copyright (c) 2015年 CaryaLiu. All rights reserved.
//

#import "SliderColorPanelViewController.h"
#import "SliderColorPanel.h"

@interface SliderColorPanelViewController ()

@property (weak, nonatomic) IBOutlet SliderColorPanel *sliderColorPanel;

@end

@implementation SliderColorPanelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.sliderColorPanel addTarget:self action:@selector(sliderColorPanelValueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sliderColorPanelValueChanged:(SliderColorPanel *)sender {
    UIColor *color = sender.color;
    self.view.backgroundColor = color;
}


@end

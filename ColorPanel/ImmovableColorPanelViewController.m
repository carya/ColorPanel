//
//  ImmovableColorPanelViewController.m
//  ColorPanel
//
//  Created by MaohuaLiu on 15/7/26.
//  Copyright (c) 2015年 CaryaLiu. All rights reserved.
//

#import "ImmovableColorPanelViewController.h"
#import "ImmovableColorPanel.h"

@interface ImmovableColorPanelViewController ()

@end

@implementation ImmovableColorPanelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchMoved:(id)sender {
    ImmovableColorPanel *colorPanel = (ImmovableColorPanel *)sender;
    UIColor *color = colorPanel.color;
    self.view.backgroundColor = color;
}

@end

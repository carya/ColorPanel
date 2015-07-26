//
//  RotaryColorPanelViewController.m
//  ColorPanel
//
//  Created by MaohuaLiu on 15/7/26.
//  Copyright (c) 2015年 CaryaLiu. All rights reserved.
//

#import "RotaryColorPanelViewController.h"
#import "RotaryColorPanel.h"

@interface RotaryColorPanelViewController ()

@property (weak, nonatomic) IBOutlet RotaryColorPanel *rotaryColorPanel;

@end

@implementation RotaryColorPanelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    self.rotaryColorPanel.colorChangedHandler = ^(UIColor *color) {
        weakSelf.view.backgroundColor = color;
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

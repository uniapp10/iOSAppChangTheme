//
//  ViewController.m
//  iOS 夜间模式最佳方案
//
//  Created by ZD on 2018/10/15.
//  Copyright © 2018 ZD. All rights reserved.
//

#import "ViewController.h"
#import "MTSettingsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor themeColor];
    CGFloat positionX = 10;
    CGFloat positionY = 100;
    CGFloat width_screen = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat width_btn = (width_screen - positionX * 2);
    UIButton *btn_start = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn_start setTitle:@"Settings" forState:(UIControlStateNormal)];
    btn_start.backgroundColor = [UIColor redColor];
    btn_start.frame = CGRectMake(positionX, positionY, width_btn, 50);
    [btn_start addTarget:self action:@selector(btnClick_start) forControlEvents:(UIControlEventTouchUpInside)];

    [self.view addSubview:btn_start];

}

- (void)btnClick_start{
    MTSettingsViewController *settingsVC = [[MTSettingsViewController alloc] init];
    [settingsVC configuePushStyle:(PushStylePush)];
    [settingsVC show:self.navigationController];
}

- (void)btnClick_end{
    
}

@end

//
//  SettingsViewController.m
//  iOS 夜间模式最佳方案
//
//  Created by ZD on 2018/10/15.
//  Copyright © 2018 ZD. All rights reserved.
//

#import "MTSettingsViewController.h"
#import "MTSettingsManager.h"
#import "UIColor+ThemeColor.h"
#import "ZDTabBarController.h"

@interface MTSettingsViewController ()
@property (nonatomic, assign) PushStyle pushStyle;
@property (nonatomic, strong) UINavigationController *nav;
@property (weak, nonatomic) IBOutlet UISwitch *themeSwitch;
@property (nonatomic, strong) UIViewController *vc_parent;
@end

@implementation MTSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = false;
    self.navigationItem.title = @"系统设置";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:(UIBarButtonItemStylePlain) target:self action:@selector(ok)];    
    [self.themeSwitch setOn:([MTSettingsManager currentTheme] == ThemeStyleDark)];
    [self changeColor];
    
}

- (void)ok{
    
    if (self.pushStyle == PushStylePush) {
        CATransition* transition = [CATransition animation];
        transition.duration = 0.25;
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromLeft;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [self.view.window.layer addAnimation:transition forKey:kCATransition];
        [self.nav dismissViewControllerAnimated:false completion:nil];
    }else{
        [self.nav dismissViewControllerAnimated:true completion:nil];
    }
}
- (IBAction)switchChange:(UISwitch *)sender {
    __block typeof(self) blockSelf = self;
    UIStoryboard *storyBoard =  [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ZDTabBarController *tabBarC = [storyBoard instantiateInitialViewController];
    tabBarC.view.backgroundColor = [UIColor themeColor];
    
    if (sender.isOn) {
        [MTSettingsManager configueTheme:(ThemeStyleDark) rootViewController:tabBarC completion:^{
            [blockSelf changeColor];
        }];
    }else{
        [MTSettingsManager configueTheme:(ThemeStyleLight) rootViewController:tabBarC completion:^{
            [blockSelf changeColor];
        }];
    }
}

- (void)changeColor{
    self.view.backgroundColor = [UIColor themeColor];
}

- (void)configuePushStyle: (PushStyle) pushStyle{
    self.pushStyle = pushStyle;
    if (pushStyle == PushStylePush) {
        CATransition* transition = [CATransition animation];
        transition.duration = 0.25;
        transition.type = kCATransitionMoveIn;
        transition.subtype = kCATransitionFromRight;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [[UIApplication sharedApplication].keyWindow.layer addAnimation:transition forKey:kCATransition];
    }
    self.nav = [[UINavigationController alloc] initWithRootViewController:self];
}

- (void)show: (UIViewController *)vc {
    if (self.pushStyle == PushStylePush) {
        [vc presentViewController:self.nav animated:false completion:nil];
    }else{
        [vc presentViewController:self.nav animated:true completion:nil];
    }
}

@end



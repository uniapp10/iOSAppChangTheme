//
//  SettingsManager.m
//  iOS 夜间模式最佳方案
//
//  Created by ZD on 2018/10/15.
//  Copyright © 2018 ZD. All rights reserved.
//

#import "MTSettingsManager.h"
#import "ZDTabBarController.h"
///配置路径
#define PlistName = @"MTSettings.plist"
#define ThemeStyleKey @"ThemeStyleKey"

@implementation MTSettingsManager

+ (instancetype)shareManager{
    static MTSettingsManager *s;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s = [[self alloc] init];
    });
    return s;
}

+ (ThemeStyle)currentTheme{
    NSMutableDictionary *settingData = [[NSMutableDictionary alloc] initWithContentsOfFile: [self shareManager].plistPath];
    NSInteger themeStyle = [[settingData objectForKey:ThemeStyleKey] integerValue];
    return themeStyle;
}

+ (void)configueTheme:(ThemeStyle) themeStyle rootViewController:(UIViewController *)vc completion:(void (^ __nullable)(void))completion{
    NSMutableDictionary *settingData = [[NSMutableDictionary alloc] initWithContentsOfFile:[self shareManager].plistPath];
    [settingData setValue:[NSNumber numberWithInteger:themeStyle] forKey:ThemeStyleKey];
    [settingData writeToFile:[self shareManager].plistPath atomically:true];
    
    UINavigationController *nav = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [nav setViewControllers:@[vc]];
    
    if (completion) {
        completion();
    }
}

- (NSString *)plistPath{
    if (!_plistPath) {
        _plistPath = [[NSBundle mainBundle] pathForResource:@"MTSettings.plist" ofType:nil];
    }
    return _plistPath;
}

+ (NSDictionary *)themeColorData{
    return [NSDictionary dictionaryWithContentsOfFile:[self shareManager].plistPath];
}

@end

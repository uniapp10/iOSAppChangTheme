//
//  SettingsManager.h
//  iOS 夜间模式最佳方案
//
//  Created by ZD on 2018/10/15.
//  Copyright © 2018 ZD. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ThemeStyle) {
    ThemeStyleDark,  //
    ThemeStyleLight, //
};

@interface MTSettingsManager : NSObject

@property (nonatomic, copy) NSString *plistPath;

+ (MTSettingsManager *)shareManager;

+ (ThemeStyle)currentTheme; 

/**
 * @brief 要求工程根控制器为 UINavigationController
 * @param themeStyle 主题样式
 * @param vc 工程根控制器 UINavigationController 的 rootController
 * @param completion 更换主题成功后的动作
 */

+ (void)configueTheme:(ThemeStyle) themeStyle rootViewController:(UIViewController *)vc completion:(void (^ __nullable)(void))completion;

/// 获取配置颜色库
+ (NSDictionary *)themeColorData;

@end

//
//  SettingsViewController.h
//  iOS 夜间模式最佳方案
//
//  Created by ZD on 2018/10/15.
//  Copyright © 2018 ZD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PushStyle) {
    PushStylePush, /// 从右侧推出
    PushStylePop,  /// 从底部弹出
};

/**
 * @brief 使用方式
 * 1 创建 SettingsViewController
 * 2 配置弹出方式
 * 3 调用 show 方法
 */

@interface MTSettingsViewController : UIViewController

/** brief 控制 SettingsViewController 推出方式, 默认为 pop 方式;
 */
- (void)configuePushStyle: (PushStyle) pushStyle;

/**
 * @param vc 当前 nav 控制器
 */
- (void)show: (UIViewController *)vc;

@end

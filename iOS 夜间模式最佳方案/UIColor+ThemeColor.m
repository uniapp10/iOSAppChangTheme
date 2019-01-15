//
//  UIColor+ThemeColor.m
//  iOS 夜间模式最佳方案
//
//  Created by ZD on 2018/10/15.
//  Copyright © 2018 ZD. All rights reserved.
//

#import "UIColor+ThemeColor.h"
#import "MTSettingsManager.h"

@implementation UIColor (ThemeColor)

+ (UIColor *)themeColor{
    
    NSArray *colorsArray = [[MTSettingsManager themeColorData] objectForKey:@"themeColors"];
    NSDictionary *colorsDict = [colorsArray objectAtIndex:[MTSettingsManager currentTheme]];
    NSString *colorStr = [colorsDict objectForKey:@"color1_blue"];

    return [self colorWithHexString:colorStr alpha:1.0];;
}

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    hexString = [hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    hexString = [hexString stringByReplacingOccurrencesOfString:@"0x" withString:@""];
    NSRegularExpression *RegEx = [NSRegularExpression regularExpressionWithPattern:@"^[a-fA-F|0-9]{6}$" options:0 error:nil];
    NSUInteger match = [RegEx numberOfMatchesInString:hexString options:NSMatchingReportCompletion range:NSMakeRange(0, hexString.length)];
    
    if (match == 0) {return [UIColor clearColor];}
    
    NSString *rString = [hexString substringWithRange:NSMakeRange(0, 2)];
    NSString *gString = [hexString substringWithRange:NSMakeRange(2, 2)];
    NSString *bString = [hexString substringWithRange:NSMakeRange(4, 2)];
    unsigned int r, g, b;
    BOOL rValue = [[NSScanner scannerWithString:rString] scanHexInt:&r];
    BOOL gValue = [[NSScanner scannerWithString:gString] scanHexInt:&g];
    BOOL bValue = [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    if (rValue && gValue && bValue) {
        return [UIColor colorWithRed:((float)r/255.0f) green:((float)g/255.0f) blue:((float)b/255.0f) alpha:alpha];
    } else {
        return [UIColor clearColor];
    }
}

@end

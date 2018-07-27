//
//  QSMacro.h
//  QSSearchDemo
//
//  Created by Qson on 2018/5/23.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QSSearchBar.h"
#import "UIView+Extension.h"
#import "NSString+AttributedString.h"

#import "QSSearchBarSearchItem+Extension.h"
#import "QSSearchBarButtonItem+Extension.h"
#import "UIImage+Extension.h"

#ifndef QSMacro_h
#define QSMacro_h

#ifdef DEBUG // 调试状态, 打开LOG功能
#define QSLog(...) NSLog(__VA_ARGS__)
#else // 发布状态, 关闭LOG功能
#define QSLog(...)
#endif

#define kSearchBarH (44)
#define kSearchBarTextH (31)
#define kMargin (10)

// iphoneX适配用
#define IS_IPHONE_X (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)812)<DBL_EPSILON)

#define kScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define kStatusBarHeight ((statusBarH == kStatusBarDefHeight) ? kStatusBarDefHeight : (([[UIApplication sharedApplication] statusBarFrame].size.height == kStatusBarMaxHeight) ? kStatusBarDefHeight : 0.0f))

#define kScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define kScreenHeight    ((statusBarH > kStatusBarDefHeight) ? [UIScreen mainScreen].bounds.size.height - kStatusBarDefHeight : [UIScreen mainScreen].bounds.size.height)

#define kSafeAreaBottom (IS_IPHONE_X ? 34 : 0)
#define kSafeAreaTop (IS_IPHONE_X ? kStatusBarHeight : 0)
#define kNavigationBarHeight (kStatusBarHeight + 44)

// kStatusBar
// 状态栏默认高度
#define kStatusBarDefHeight IS_IPHONE_X ? 44.0f : 20.0f
// 状态栏最大高度
#define kStatusBarMaxHeight IS_IPHONE_X ? 44.0f : 40.0f

#define statusBarH (IS_IPHONE_X ? 44.0 : [[UIApplication sharedApplication] statusBarFrame].size.height)

#define QSColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define NUM         @"0123456789"
#define ALPHA       @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
#define ALPHANUM @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

#endif /* QSMacro_h */

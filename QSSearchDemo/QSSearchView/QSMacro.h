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
#define kScreenHeight ([[UIScreen mainScreen] bounds].size.height)

#define kStatusBarHeight CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)
#define kSafeAreaBottom (IS_IPHONE_X ? 34 : 0)
#define kSafeAreaTop (IS_IPHONE_X ? kStatusBarHeight : 0)
#define kNavigationBarHeight (kStatusBarHeight + 44)

#define QSColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#endif /* QSMacro_h */

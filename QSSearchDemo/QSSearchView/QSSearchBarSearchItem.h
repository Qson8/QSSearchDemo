//
//  QSSearchBarSearchItem.h
//  QSSearchDemo
//
//  Created by Qson on 2018/7/2.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, QSSearchTextCharacterType) {
    QSSearchTextCharacterTypeNone = 0,          // 无限制
    QSSearchTextCharacterTypeNumber,            // 纯数字
    QSSearchTextCharacterTypeAlphabet,          // 纯字母
    QSSearchTextCharacterTypeAlphabetAndNumber, // 字母+数字
};

@interface QSSearchBarSearchItem : NSObject
/// 占位文字
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;
@property (nonatomic, strong) UIFont *placeholderFont;
/// 传入内部的搜索关键字
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIFont *titlerFont;

@property (nonatomic, strong) UIColor *backgroundColor;

/// 边框宽度
@property (nonatomic, assign) CGFloat borderWidth;
/// 边框颜色
@property (nonatomic, strong) UIColor *borderColor;
/// 圆角
@property (nonatomic, assign) CGFloat cornerRadius;
/// 支持输入的最多字符串长度
@property (nonatomic, assign) NSInteger lengthMax;
/// 允许输入的字符类型
@property (nonatomic, assign) QSSearchTextCharacterType charType;
/// 搜索框左边视图
@property (nonatomic, strong) UIImage *leftImage;

/// 搜索框外边距 (左右有效)默认10
@property (nonatomic, assign) UIEdgeInsets searchBarMarginEdge;
/// 放大镜内边距 (左右有效)默认10
@property (nonatomic, assign) UIEdgeInsets leftImageViewEdge;

/// 搜索框的点击事件(搜索框不输入，只提供事件接受)
@property (nonatomic)           SEL     action;         // default is NULL
@property (nonatomic,weak)      id      target;         // default is nil

@end


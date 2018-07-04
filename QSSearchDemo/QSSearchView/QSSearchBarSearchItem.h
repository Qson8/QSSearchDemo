//
//  QSSearchBarSearchItem.h
//  QSSearchDemo
//
//  Created by Qson on 2018/7/2.
//  Copyright © 2018年 Qson. All rights reserved.
//

#import <UIKit/UIKit.h>

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

@property (nonatomic, assign) CGFloat cornerRadius;
/// 支持输入的最多字符串长度
@property (nonatomic, assign) NSInteger lengthMax;
/// 搜索框左边视图
@property (nonatomic, strong) UIImage *leftImage;

/// 搜索框外边距 (左右有效)默认10
@property (nonatomic, assign) UIEdgeInsets searchBarMarginEdge;
/// 放大镜内边距 (左右有效)默认10
@property (nonatomic, assign) UIEdgeInsets leftImageViewEdge;

@end

